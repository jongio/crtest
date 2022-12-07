#find ./infra/core -name '*.bicep' | xargs -0 $(az bicep publish --file storage.bicep --target br:exampleregistry.azurecr.io/bicep/modules/storage:v1)
dir=./infra/core
for i in $(find $dir -type f);
do
    echo $i;
    path=${i:13}
    path=${path::-6}
    echo $path
    az bicep publish --file $i --target br:azdtestcr.azurecr.io/$path:v1
done;