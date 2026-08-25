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

return function(p0)
	-- upvalues: surfaceContextModule (ref), surfaceNameModule (ref), httpRequestModule (ref), text (ref), logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref), fFlagSubscriptionUpsellCounterWithErrorReasonModule (ref), logRobloxSubscriptionUpsellTelemetryEventModule (ref), httpService (ref), promiseModule (ref)
	p0 = p0 or {
		context = surfaceContextModule.Unspecified,
		surfaceName = surfaceNameModule.Unspecified,
		metadata = {}
	}
	local t = { entryPoint = p0.surfaceName }
	local universeId = p0.metadata.universeId
	
	if universeId ~= nil then
		t.universeId = universeId
	end
	return httpRequestModule.new():post(text, t):andThen(function(p2)
		local paymentSession = p2.paymentSession
		local id = paymentSession and paymentSession.id
		
		return if type(id) == "string" then id else ""
	end):catch(function(p1)
		-- upvalues: logRobloxSubscriptionUpsellCounterModule (copy), robloxSubscriptionUpsellTelemetryModule (copy), fFlagSubscriptionUpsellCounterWithErrorReasonModule (copy), logRobloxSubscriptionUpsellTelemetryEventModule (copy), httpService (copy), promiseModule (copy)
		logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionCreatePaymentSessionFailedCounter)
		
		if fFlagSubscriptionUpsellCounterWithErrorReasonModule then
			logRobloxSubscriptionUpsellTelemetryEventModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionCreatePaymentSessionFailedEvent, {
				errorReason = if type(p1) == "table" then httpService:JSONEncode(p1) else tostring(p1)
			})
		end
		return promiseModule.resolve("")
	end)
end