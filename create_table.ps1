

                aws --endpoint-url=http://localhost:4566 dynamodb create-table `
            --table-name Articles `
            --attribute-definitions `
                AttributeName=articleId,AttributeType=S `
            --key-schema `
                AttributeName=articleId,KeyType=HASH `
            --provisioned-throughput `
                ReadCapacityUnits=5,WriteCapacityUnits=5
        
        aws --endpoint-url=http://localhost:4566 dynamodb create-table `
            --table-name Comments `
            --attribute-definitions `
                AttributeName=commentId,AttributeType=S `
            --key-schema `
                AttributeName=commentId,KeyType=HASH `
            --provisioned-throughput `
                ReadCapacityUnits=5,WriteCapacityUnits=5