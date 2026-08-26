local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local surfaceContextModule = require(robloxSubscriptionPurchaseApp.Enums.SurfaceContext)
local surfaceNameModule = require(robloxSubscriptionPurchaseApp.Enums.SurfaceName)
local _ = require(robloxSubscriptionPurchaseApp.types)
local _ = require(script.Parent.CreatePaymentSessionTypes)
local httpRequestModule = require(script.Parent.HttpRequest)
local logRobloxSubscriptionUpsellCounterModule = require(robloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local logRobloxSubscriptionUpsellTelemetryEventModule = require(robloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellTelemetryEvent)
local robloxSubscriptionUpsellTelemetryModule = require(robloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local fFlagSubscriptionUpsellCounterWithErrorReasonModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagSubscriptionUpsellCounterWithErrorReason)
local httpService = game:GetService("HttpService")
local text = url.APIS_URL .. "payments-gateway/v1/payment-sessions"

return function(p1)
	-- upvalues: surfaceContextModule (ref), surfaceNameModule (ref), httpRequestModule (ref), text (ref), logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref), fFlagSubscriptionUpsellCounterWithErrorReasonModule (ref), logRobloxSubscriptionUpsellTelemetryEventModule (ref), httpService (ref), promiseModule (ref)
	p1 = p1 or {
		context = surfaceContextModule.Unspecified,
		surfaceName = surfaceNameModule.Unspecified,
		metadata = {}
	}
	local t = { entryPoint = p1.surfaceName }
	local universeId = p1.metadata.universeId
	
	if universeId ~= nil then
		t.universeId = universeId
	end
	return httpRequestModule.new():post(text, t):andThen(function(p2)
		local paymentSession = p2.paymentSession
		local id = paymentSession and paymentSession.id
		
		return if type(id) == "string" then id else ""
	end):catch(function(p2)
		-- upvalues: logRobloxSubscriptionUpsellCounterModule (copy), robloxSubscriptionUpsellTelemetryModule (copy), fFlagSubscriptionUpsellCounterWithErrorReasonModule (copy), logRobloxSubscriptionUpsellTelemetryEventModule (copy), httpService (copy), promiseModule (copy)
		logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionCreatePaymentSessionFailedCounter)
		
		if fFlagSubscriptionUpsellCounterWithErrorReasonModule then
			logRobloxSubscriptionUpsellTelemetryEventModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionCreatePaymentSessionFailedEvent, {
				errorReason = if type(p2) == "table" then httpService:JSONEncode(p2) else tostring(p2)
			})
		end
		return promiseModule.resolve("")
	end)
end