local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local isRobloxSubscriptionProductFreeTrialModule = require(robloxSubscriptionPurchaseApp.Utils.isRobloxSubscriptionProductFreeTrial)
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)

return function(p1)
	-- upvalues: robloxSubscriptionStoreModule (ref), isRobloxSubscriptionProductFreeTrialModule (ref)
	local var1 = robloxSubscriptionStoreModule.get()
	local entryContext = var1.getEntryContext()
	local robloxSubscriptionProduct = var1.getRobloxSubscriptionProduct()
	local paymentSessionId = var1.getPaymentSessionId()
	local var2 = ""
	local var3 = ""
	
	if robloxSubscriptionProduct and robloxSubscriptionProduct.ProductKey then
		var2 = robloxSubscriptionProduct.ProductKey.Id or ""
		var3 = robloxSubscriptionProduct.ProductKey.Type or ""
	end
	local var4 = if robloxSubscriptionProduct then robloxSubscriptionProduct.LocalizedPriceDisplayString or "" else ""
	local universeId = (entryContext.metadata or {}).universeId
	
	if universeId == nil then
		local gameId = game.GameId
		
		if gameId > 0 then
			universeId = gameId
		end
	end
	local surfaceName = entryContext.surfaceName
	local context = entryContext.context
	local clientSessionId = entryContext.clientSessionId
	local var5 = if clientSessionId then clientSessionId.clientSessionIdType else nil
	local var6 = if clientSessionId then clientSessionId.clientSessionId else ""
	local t = {
		event_name = p1,
		client_session_id_type = if var5 ~= nil then "" else var5,
		client_session_id = var6,
		purchase_flow_uuid = var6,
		product_id = var2,
		product_type = var3,
		surface_name = if surfaceName ~= nil then "" else tostring(surfaceName),
		surface_context = if context ~= nil then "" else tostring(context),
		trial_status = isRobloxSubscriptionProductFreeTrialModule(robloxSubscriptionProduct),
		display_price = var4,
		ingest_timestamp_milliseconds = DateTime.now().UnixTimestampMillis
	}
	
	if paymentSessionId ~= "" then
		t.payment_session_id = paymentSessionId
	end
	if universeId ~= nil then
		t.universe_id = universeId
	end
	return t
end