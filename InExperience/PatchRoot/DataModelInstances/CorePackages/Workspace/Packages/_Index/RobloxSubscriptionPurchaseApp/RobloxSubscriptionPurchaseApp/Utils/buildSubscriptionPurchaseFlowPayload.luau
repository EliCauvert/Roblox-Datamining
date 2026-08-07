local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local isRobloxSubscriptionProductFreeTrialModule = require(robloxSubscriptionPurchaseApp.Utils.isRobloxSubscriptionProductFreeTrial)
local _ = require(robloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)

return function(p0) --[[ line: 13 | named "buildSubscriptionPurchaseFlowPayload" ]]
	-- upvalues: robloxSubscriptionStoreModule (ref), isRobloxSubscriptionProductFreeTrialModule (ref)
	local var3 = robloxSubscriptionStoreModule.get()
	local entryContext = var3.getEntryContext()
	local robloxSubscriptionProduct = var3.getRobloxSubscriptionProduct()
	local paymentSessionId = var3.getPaymentSessionId()
	local var7 = ""
	local var8 = ""
	
	if robloxSubscriptionProduct and robloxSubscriptionProduct.ProductKey then
		var7 = robloxSubscriptionProduct.ProductKey.Id or ""
		var8 = robloxSubscriptionProduct.ProductKey.Type or ""
	end
	local var9 = if robloxSubscriptionProduct then robloxSubscriptionProduct.LocalizedPriceDisplayString or "" else ""
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
	local var10 = if clientSessionId then clientSessionId.clientSessionIdType else nil
	local var11 = if clientSessionId then clientSessionId.clientSessionId else ""
	local t = {
		event_name = p0,
		client_session_id_type = if var10 ~= nil then "" else var10,
		client_session_id = var11,
		purchase_flow_uuid = var11,
		product_id = var7,
		product_type = var8,
		surface_name = if surfaceName ~= nil then "" else tostring(surfaceName),
		surface_context = if context ~= nil then "" else tostring(context),
		trial_status = isRobloxSubscriptionProductFreeTrialModule(robloxSubscriptionProduct),
		display_price = var9,
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