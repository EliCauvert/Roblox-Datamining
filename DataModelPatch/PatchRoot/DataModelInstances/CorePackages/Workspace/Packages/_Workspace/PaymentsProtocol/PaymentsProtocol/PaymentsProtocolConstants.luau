local MessageBusService = game:GetService("MessageBusService")

return {
	NAME = "Payments",
	METHOD_LIST_NATIVE_PRODUCTS = "listNativeProducts",
	METHOD_IS_AVAILABLE = "isAvailable",
	MESSAGE_PROCESS_PENDING_PURCHASE = MessageBusService:GetMessageId("Payments", "processPendingPurchase"),
	MESSAGE_SEND_IAP_EVENT = MessageBusService:GetMessageId("Payments", "sendIAPEvent"),
	MESSAGE_ON_PURCHASE_PROCESSED_EVENT = MessageBusService:GetMessageId("Payments", "onPurchaseProcessed")
}