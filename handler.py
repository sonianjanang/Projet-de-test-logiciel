import json
import boto3
from uuid import uuid4
from boto3.dynamodb.conditions import Attr

dynamodb = boto3.resource('dynamodb', endpoint_url='http://localhost:4566')
articles_table = dynamodb.Table('Articles')
comments_table = dynamodb.Table('Comments')

def create_article(event, context):
    body = json.loads(event['body'])
    article_id = str(uuid4())
    article = {
        'articleId': article_id,
        'title': body['title'],
        'content': body['content'],
        'tags': body.get('tags', [])
    }
    articles_table.put_item(Item=article)
    
    print(f"Article created: {article}")  # Ajoutez un log pour vérifier l'article

    return {
        'statusCode': 201,
        'body': json.dumps(article)
    }

def get_articles(event, context):
    response = articles_table.scan()
    return {   
        'statusCode': 200,
        'body': json.dumps(response['Items'])
    }

def update_article(event, context):
    body = json.loads(event['body'])
    article_id = event['pathParameters']['articleId']
    articles_table.update_item(
        Key={'articleId': article_id},
        UpdateExpression="set title=:t, content=:c, tags=:tg",
        ExpressionAttributeValues={
            ':t': body['title'],
            ':c': body['content'],
            ':tg': body.get('tags', [])
        }
    )
    return {
        'statusCode': 204
    }

def delete_article(event, context):
    article_id = event['pathParameters']['articleId']
    articles_table.delete_item(Key={'articleId': article_id})
    return {
        'statusCode': 204
    }

def create_comment(event, context):
    body = json.loads(event['body'])
    comment_id = str(uuid4())
    comment = {
        'commentId': comment_id,
        'articleId': body['articleId'],
        'content': body['content']
    }
    comments_table.put_item(Item=comment)
    return {
        'statusCode': 201,
        'body': json.dumps(comment)
    }

def get_comments(event, context):
    article_id = event['pathParameters']['articleId']
    response = comments_table.scan(
        FilterExpression=Attr("articleId").eq(article_id)
    )
    return {
        'statusCode': 200,
        'body': json.dumps(response['Items'])
    }

if __name__ == "__main__":
    # Simuler un événement pour ajouter un article
    event = {
        'body': json.dumps({
            'title': 'La Passion du Christ',
            'content': 'Le Christ a trop souffert',
            'tags': ['religion', 'histoire']
        })
    }
    context = {}  # Contexte vide pour le test
    response = create_article(event, context)
    print(response)
