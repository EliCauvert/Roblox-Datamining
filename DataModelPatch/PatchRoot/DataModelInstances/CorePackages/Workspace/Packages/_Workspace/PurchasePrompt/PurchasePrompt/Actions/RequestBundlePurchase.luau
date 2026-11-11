local _ = script.Parent.Parent

return require(script.Parent.makeActionCreator)(script.Name, "id", "idempotencyKey", "purchaseAuthToken", "collectibleItemId", "collectibleItemInstanceId", "collectibleProductId", "expectedPrice")