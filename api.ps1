# # créer une api gateways pour articles: 
# $api = aws --endpoint-url=http://localhost:4566 apigateway create-rest-api --name "ArticlesAPI"

# # recuperer l'id de l'api  c'est à dire de la ressource racine
# $root = aws --endpoint-url=http://localhost:4566 apigateway get-resources --rest-api-id $api.id

# # créer une ressource pour la table Articles
# $resource = aws --endpoint-url=http://localhost:4566 apigateway create-resource --rest-api-id $api.id --parent-id $root.items[0].id --path-part "articles"

# # créer une méthode GET pour la ressource Articles
# $method = aws --endpoint-url=http://localhost:4566 apigateway put-method --rest-api-id $api.id --resource-id $resource.id --http-method GET --authorization-type NONE
# # créer une méthode POST pour la ressource Articles
# $method = aws --endpoint-url=http://localhost:4566 apigateway put-method --rest-api-id $api.id --resource-id $resource.id --http-method POST --authorization-type NONE
# # créer une méthode PUT pour la ressource Articles
# $method = aws --endpoint-url=http://localhost:4566 apigateway put-method --rest-api-id $api.id --resource-id $resource.id --http-method PUT --authorization-type NONE
# # créer une méthode DELETE pour la ressource Articles
# $method = aws --endpoint-url=http://localhost:4566 apigateway put-method --rest-api-id $api.id --resource-id $resource.id --http-method DELETE --authorization-type NONE

# # intégration de la méthode GET avec la fonction Lambda
# $lambda = aws --endpoint-url=http://localhost:4566 apigateway put-integration --rest-api-id $api.id --resource-id $resource.id --http-method GET --type AWS_PROXY --integration-http-method POST --uri "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:000000000000:function:BlogFunction-get_article/invocations" --request-templates '{"application/json": "$input.json(\'$\')"}'
# # intégration de la méthode POST avec la fonction Lambda
# $lambda = aws --endpoint-url=http://localhost:4566 apigateway put-integration --rest-api-id $api.id --resource-id $resource.id --http-method POST --type AWS_PROXY --integration-http-method POST --uri "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:000000000000:function:BlogFunction-create_article/invocations"
# # intégration de la méthode PUT avec la fonction Lambda
# $lambda = aws --endpoint-url=http://localhost:4566 apigateway put-integration --rest-api-id $api.id --resource-id $resource.id --http-method PUT --type AWS_PROXY --integration-http-method POST --uri "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:000000000000:function:BlogFunction-update_article/invocations"
# # intégration de la méthode DELETE avec la fonction Lambda
# $lambda = aws --endpoint-url=http://localhost:4566 apigateway put-integration --rest-api-id $api.id --resource-id $resource.id --http-method DELETE --type AWS_PROXY --integration-http-method POST --uri "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:000000000000:function:BlogFunction-delete_article/invocations"
# # déployer l'API
# $deployment = aws --endpoint-url=http://localhost:4566 apigateway create-deployment --rest-api-id $api.id --stage-name prod
# # afficher l'URL de l'API
# $api_url = "http://localhost:4566/restapis/$($api.id)/prod/_user_request_/articles"
# Write-Host "API URL: $api_url"
# # afficher la liste des API créées
# aws --endpoint-url=http://localhost:4566 apigateway get-rest-apis



# # créer une api gateways pour commentaires:
# $api = aws --endpoint-url=http://localhost:4566 apigateway create-rest-api --name "CommentsAPI"
# # recuperer l'id de l'api  c'est à dire de la ressource racine
# $root = aws --endpoint-url=http://localhost:4566 apigateway get-resources --rest-api-id $api.id
# # créer une ressource pour la table Comments
# $resource = aws --endpoint-url=http://localhost:4566 apigateway create-resource --rest-api-id $api.id --parent-id $root.items[0].id --path-part "comments"
# # créer une méthode GET pour la ressource Comments
# $method = aws --endpoint-url=http://localhost:4566 apigateway put-method --rest-api-id $api.id --resource-id $resource.id --http-method GET --authorization-type NONE
# # créer une méthode POST pour la ressource Comments
# $method = aws --endpoint-url=http://localhost:4566 apigateway put-method --rest-api-id $api.id --resource-id $resource.id --http-method POST --authorization-type NONE
# # créer une méthode PUT pour la ressource Comments
# $method = aws --endpoint-url=http://localhost:4566 apigateway put-method --rest-api-id $api.id --resource-id $resource.id --http-method PUT --authorization-type NONE
# # créer une méthode DELETE pour la ressource Comments
# $method = aws --endpoint-url=http://localhost:4566 apigateway put-method --rest-api-id $api.id --resource-id $resource.id --http-method DELETE --authorization-type NONE

# # intégration de la méthode GET avec la fonction Lambda
# $lambda = aws --endpoint-url=http://localhost:4566 apigateway put-integration --rest-api-id $api.id --resource-id $resource.id --http-method GET --type AWS_PROXY --integration-http-method POST --uri "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:000000000000:function:BlogFunction-get_comments/invocations"
# # intégration de la méthode POST avec la fonction Lambda
# $lambda = aws --endpoint-url=http://localhost:4566 apigateway put-integration --rest-api-id $api.id --resource-id $resource.id --http-method POST --type AWS_PROXY --integration-http-method POST --uri "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:000000000000:function:BlogFunction-create_comment/invocations"
# # intégration de la méthode PUT avec la fonction Lambda
# $lambda = aws --endpoint-url=http://localhost:4566 apigateway put-integration --rest-api-id $api.id --resource-id $resource.id --http-method PUT --type AWS_PROXY --integration-http-method POST --uri "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:000000000000:function:BlogFunction-update_comment/invocations"
# # intégration de la méthode DELETE avec la fonction Lambda
# $lambda = aws --endpoint-url=http://localhost:4566 apigateway put-integration --rest-api-id $api.id --resource-id $resource.id --http-method DELETE --type AWS_PROXY --integration-http-method POST --uri "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:000000000000:function:BlogFunction-delete_comment/invocations"
# # déployer l'API
# $deployment = aws --endpoint-url=http://localhost:4566 apigateway create-deployment --rest-api-id $api.id --stage-name prod
# # afficher l'URL de l'API
# $api_url = "http://localhost:4566/restapis/$($api.id)/prod/_user_request_/comments"
# Write-Host "API URL: $api_url"

# # afficher la liste des API créées
# aws --endpoint-url=http://localhost:4566 apigateway get-rest-apis
# # afficher la liste des ressources de l'API
# aws --endpoint-url=http://localhost:4566 apigateway get-resources --rest-api-id $api.id
# # afficher la liste des méthodes de l'API
# aws --endpoint-url=http://localhost:4566 apigateway get-methods --rest-api-id $api.id --resource-id $resource.id
# # afficher la liste des intégrations de l'API
# aws --endpoint-url=http://localhost:4566 apigateway get-integration --rest-api-id $api.id --resource-id $resource.id --http-method GET
# # afficher la liste des déploiements de l'API
# aws --endpoint-url=http://localhost:4566 apigateway get-deployments --rest-api-id $api.id

# # Ajout d'un article à la table Articles
# $article = @{
#     articleId = "1"
#     title = "Titre de l'article"
#     content = "Contenu de l'article"
# }
# $article_json = $article | ConvertTo-Json
# # vérification de l'ajout de l'article
# $response = aws --endpoint-url=http://localhost:4566 dynamodb put-item --table-name Articles --item $article_json
# # Afficher la réponse de l'ajout de l'article
# $response
# # Ajout d'un commentaire à la table Comments
# $comment = @{
#     commentId = "1"
#     articleId = "1"
#     content = "Contenu du commentaire"
# }   
# $comment_json = $comment | ConvertTo-Json
# # vérification de l'ajout du commentaire
# $response = aws --endpoint-url=http://localhost:4566 dynamodb put-item --table-name Comments --item $comment_json
# # Afficher la réponse de l'ajout du commentaire
# $response
# # Afficher la liste des articles
# $response = aws --endpoint-url=http://localhost:4566 dynamodb scan --table-name Articles
# $response.Items
# # Afficher la liste des commentaires
# $response = aws --endpoint-url=http://localhost:4566 dynamodb scan --table-name Comments
# $response.Items

# Créer une API Gateway pour articles
$api = aws --endpoint-url=http://localhost:4566 apigateway create-rest-api --name "ArticlesAPI" | ConvertFrom-Json

# Récupérer l'ID de la ressource racine
$root = aws --endpoint-url=http://localhost:4566 apigateway get-resources --rest-api-id $api.id | ConvertFrom-Json

# Créer une ressource pour la table Articles
$resource = aws --endpoint-url=http://localhost:4566 apigateway create-resource `
    --rest-api-id $api.id `
    --parent-id $root.items[0].id `
    --path-part "articles" | ConvertFrom-Json

# Méthodes pour Articles
$methods = @("GET", "POST", "PUT", "DELETE")
foreach ($method in $methods) {
    aws --endpoint-url=http://localhost:4566 apigateway put-method `
        --rest-api-id $api.id `
        --resource-id $resource.id `
        --http-method $method `
        --authorization-type "NONE"
}

# Intégrations Lambda pour Articles
$integrations = @{
    "GET"    = "BlogFunction-get_article"
    "POST"   = "BlogFunction-create_article"
    "PUT"    = "BlogFunction-update_article"
    "DELETE" = "BlogFunction-delete_article"
}

foreach ($integration in $integrations.GetEnumerator()) {
    aws --endpoint-url=http://localhost:4566 apigateway put-integration `
        --rest-api-id $api.id `
        --resource-id $resource.id `
        --http-method $integration.Key `
        --type "AWS_PROXY" `
        --integration-http-method "POST" `
        --uri "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:000000000000:function:$($integration.Value)/invocations"
}

# Déployer l'API
aws --endpoint-url=http://localhost:4566 apigateway create-deployment `
    --rest-api-id $api.id `
    --stage-name "prod"

# API pour commentaires (même structure)
$api_comments = aws --endpoint-url=http://localhost:4566 apigateway create-rest-api --name "CommentsAPI" | ConvertFrom-Json
$root_comments = aws --endpoint-url=http://localhost:4566 apigateway get-resources --rest-api-id $api_comments.id | ConvertFrom-Json
$resource_comments = aws --endpoint-url=http://localhost:4566 apigateway create-resource `
    --rest-api-id $api_comments.id `
    --parent-id $root_comments.items[0].id `
    --path-part "comments" | ConvertFrom-Json

# Méthodes pour Comments
foreach ($method in $methods) {
    aws --endpoint-url=http://localhost:4566 apigateway put-method `
        --rest-api-id $api_comments.id `
        --resource-id $resource_comments.id `
        --http-method $method `
        --authorization-type "NONE"
}

# Intégrations Lambda pour Comments
$integrations_comments = @{
    "GET"    = "BlogFunction-get_comments"
    "POST"   = "BlogFunction-create_comment"
    "PUT"    = "BlogFunction-update_comment"
    "DELETE" = "BlogFunction-delete_comment"
}

foreach ($integration in $integrations_comments.GetEnumerator()) {
    aws --endpoint-url=http://localhost:4566 apigateway put-integration `
        --rest-api-id $api_comments.id `
        --resource-id $resource_comments.id `
        --http-method $integration.Key `
        --type "AWS_PROXY" `
        --integration-http-method "POST" `
        --uri "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:000000000000:function:$($integration.Value)/invocations"
}

# Déployer l'API Comments
aws --endpoint-url=http://localhost:4566 apigateway create-deployment `
    --rest-api-id $api_comments.id `
    --stage-name "prod"

# Ajout de données de test
$article = @{
    "articleId" = @{S = "1"}
    "title" = @{S = "Premier article"}
    "content" = @{S = "Contenu de test"}
    "tags" = @{L = @(@{S = "tech"}, @{S = "aws"})}
} |  ConvertTo-Json -Depth 5 -Compress

aws --endpoint-url=http://localhost:4566 dynamodb put-item `
    --table-name Articles `
    --item $article 
Write-Host "Ajouté à Articles : $($article)" -ForegroundColor Green

$comment = @{
    "commentId" = @{S = "1"}
    "articleId" = @{S = "1"}
    "content" = @{S = "Premier commentaire"}
    "author" = @{S = "Utilisateur1"}
} |  ConvertTo-Json -Depth 5 -Compress

aws --endpoint-url=http://localhost:4566 dynamodb put-item `
    --table-name Comments `
    --item $comment *>$null
 Write-Host "Ajouté à Comments : $($comment)" -ForegroundColor Green

# Affichage des résultats
Write-Host "API Articles URL: http://localhost:4566/restapis/$($api.id)/prod/_user_request_/articles"
Write-Host "API Comments URL: http://localhost:4566/restapis/$($api_comments.id)/prod/_user_request_/comments"

aws --endpoint-url=http://localhost:4566 dynamodb scan --table-name Articles --query "Items[*].{articleId: articleId.S, title: title.S, content: content.S, tags: tags.L[*].S}" --output table
Write-Host "Articles :"
aws --endpoint-url=http://localhost:4566 dynamodb scan --table-name Comments --query "Items[*].{commentId: commentId.S, articleId: articleId.S, content: content.S, author: author.S}" --output table
Write-Host "Commentaires :"

Read-Host "Appuyez sur Entrée pour continuer..."