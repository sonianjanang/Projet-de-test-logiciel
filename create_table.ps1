# Attendre que LocalStack soit prêt
# do {
#     $health = Invoke-RestMethod -Uri "http://localhost:4566/health" -ErrorAction SilentlyContinue
#     Start-Sleep -Seconds 2
# } until ($health.services.dynamodb -eq "running")


# Script PowerShell pour créer des tables DynamoDB dans LocalStack
# Créer la table Articles --endpoint-url=http://localhost:4566 `
aws dynamodb create-table `
    --endpoint-url=http://localhost:4566 `
    --table-name Articles `
    --attribute-definitions AttributeName=articleId,AttributeType=S `
    --key-schema AttributeName=articleId,KeyType=HASH `
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5

# Créer la table Comments --endpoint-url=http://localhost:4566 `
aws dynamodb create-table `
    --endpoint-url=http://localhost:4566 `
    --table-name Comments `
    --attribute-definitions AttributeName=commentId,AttributeType=S `
    --key-schema AttributeName=commentId,KeyType=HASH `
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5

#  echo "Tables created successfully."
Write-Host "Tables créées avec succès."
# Afficher la liste des tables créées