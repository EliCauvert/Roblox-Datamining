local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local FFlagEnablePlusReferralTelemetryModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnablePlusReferralTelemetry)
local FFlagEnablePlusReferralEntrypointTelemetry = require(RobloxSubscriptionPurchaseApp.Parent.SharedFlags).FFlagEnablePlusReferralEntrypointTelemetry
local IsRobloxSubscriptionProductFreeTrialModule = require(RobloxSubscriptionPurchaseApp.Utils.isRobloxSubscriptionProductFreeTrial)
local _ = require(RobloxSubscriptionPurchaseApp.Models.GetRobloxSubscriptionProductsModel)

return function(Event_name)
	-- upvalues: RobloxSubscriptionStoreModule (copy), IsRobloxSubscriptionProductFreeTrialModule (copy), FFlagEnablePlusReferralTelemetryModule (copy), FFlagEnablePlusReferralEntrypointTelemetry (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	local EntryContext = GetResult.getEntryContext()
	local RobloxSubscriptionProduct = GetResult.getRobloxSubscriptionProduct()
	local PaymentSessionId = GetResult.getPaymentSessionId()
	local Id = ""
	local Type = ""
	
	if RobloxSubscriptionProduct and RobloxSubscriptionProduct.ProductKey then
		Id = RobloxSubscriptionProduct.ProductKey.Id or ""
		Type = RobloxSubscriptionProduct.ProductKey.Type or ""
	end
	local LocalizedPriceDisplayString = RobloxSubscriptionProduct and RobloxSubscriptionProduct.LocalizedPriceDisplayString or ""
	local UniverseId = (EntryContext.metadata or {}).universeId
	
	if UniverseId == nil then
		local GameId: number = game.GameId
		
		if GameId > 0 then
			UniverseId = GameId
		end
	end
	local SurfaceName = EntryContext.surfaceName
	local Context = EntryContext.context
	local ClientSessionId = EntryContext.clientSessionId
	local ClientSessionIdType = if ClientSessionId then ClientSessionId.clientSessionIdType else nil
	local ClientSessionId1 = if ClientSessionId then ClientSessionId.clientSessionId else ""
	local config = {
		event_name = Event_name,
		client_session_id_type = if ClientSessionIdType == nil then "" else ClientSessionIdType,
		client_session_id = ClientSessionId1,
		purchase_flow_uuid = ClientSessionId1,
		product_id = Id,
		product_type = Type,
		surface_name = if SurfaceName == nil then "" else tostring(SurfaceName),
		surface_context = if Context == nil then "" else tostring(Context),
		trial_status = IsRobloxSubscriptionProductFreeTrialModule(RobloxSubscriptionProduct),
		display_price = LocalizedPriceDisplayString,
		ingest_timestamp_milliseconds = DateTime.now().UnixTimestampMillis
	}
	
	if PaymentSessionId ~= "" then
		config.payment_session_id = PaymentSessionId
	end
	if UniverseId ~= nil then
		config.universe_id = UniverseId
	end
	if FFlagEnablePlusReferralTelemetryModule then
		local ReferrerId: number = GetResult.getReferrerId()
		
		if ReferrerId and ReferrerId > 0 then
			config.referrer_id = tostring(ReferrerId)
		end
	end
	if FFlagEnablePlusReferralEntrypointTelemetry and EntryContext.entrypoint then
		config.entrypoint = EntryContext.entrypoint
	end
	return config
end