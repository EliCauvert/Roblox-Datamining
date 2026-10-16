local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local PromiseModule = require(Parent.Promise)
local SurfaceContextModule = require(RobloxSubscriptionPurchaseApp.Enums.SurfaceContext)
local SurfaceNameModule = require(RobloxSubscriptionPurchaseApp.Enums.SurfaceName)
local _ = require(RobloxSubscriptionPurchaseApp.types)
local _ = require(script.Parent.CreatePaymentSessionTypes)
local HttpRequestModule = require(script.Parent.HttpRequest)
local LogRobloxSubscriptionUpsellCounterModule = require(RobloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local LogRobloxSubscriptionUpsellTelemetryEventModule = require(RobloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellTelemetryEvent)
local RobloxSubscriptionUpsellTelemetryModule = require(RobloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local FFlagSubscriptionUpsellCounterWithErrorReasonModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagSubscriptionUpsellCounterWithErrorReason)
local HttpService = game:GetService("HttpService")
local Text = require(Parent.Http).Url.APIS_URL .. "payments-gateway/v1/payment-sessions"

return function(p1) --[[ Line: 25 ]]
	-- upvalues: SurfaceContextModule (copy), SurfaceNameModule (copy), HttpRequestModule (copy), Text (copy), LogRobloxSubscriptionUpsellCounterModule (copy), RobloxSubscriptionUpsellTelemetryModule (copy), FFlagSubscriptionUpsellCounterWithErrorReasonModule (copy), LogRobloxSubscriptionUpsellTelemetryEventModule (copy), HttpService (copy), PromiseModule (copy)
	local P0 = p1 or {
		context = SurfaceContextModule.Unspecified,
		surfaceName = SurfaceNameModule.Unspecified,
		metadata = {}
	}
	local config = { entryPoint = P0.surfaceName }
	local UniverseId = P0.metadata.universeId
	
	if UniverseId ~= nil then
		config.universeId = UniverseId
	end
	return HttpRequestModule.new():post(Text, config):andThen(function(Result) --[[ Line: 44 ]]
		local PaymentSession = Result.paymentSession
		local Id = PaymentSession and PaymentSession.id
		
		return if type(Id) == "string" then Id else ""
	end):catch(function(Err) --[[ Line: 50 ]]
		-- upvalues: LogRobloxSubscriptionUpsellCounterModule (upval), RobloxSubscriptionUpsellTelemetryModule (upval), FFlagSubscriptionUpsellCounterWithErrorReasonModule (upval), LogRobloxSubscriptionUpsellTelemetryEventModule (upval), HttpService (upval), PromiseModule (upval)
		LogRobloxSubscriptionUpsellCounterModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionCreatePaymentSessionFailedCounter)
		
		if FFlagSubscriptionUpsellCounterWithErrorReasonModule then
			LogRobloxSubscriptionUpsellTelemetryEventModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionCreatePaymentSessionFailedEvent, {
				errorReason = if type(Err) == "table" then HttpService:JSONEncode(Err) else tostring(Err)
			})
		end
		return PromiseModule.resolve("")
	end)
end