local BuyRobuxRouting = script:FindFirstAncestor("BuyRobuxRouting")
local Parent = BuyRobuxRouting.Parent
local HttpService = game:GetService("HttpService")
local SharedFlagsModule = require(Parent.SharedFlags)
local IXPServiceWrapper = require(Parent.IxpServiceWrapper).IXPServiceWrapper
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local IsSduiBuyRobuxSupportedModule = require(BuyRobuxRouting.isSduiBuyRobuxSupported)
local FFlagBuyRobuxRoutingAppendWebContextModule = require(BuyRobuxRouting.Flags.FFlagBuyRobuxRoutingAppendWebContext)
local FFlagEnableBuyRobuxNextJS = SharedFlagsModule.FFlagEnableBuyRobuxNextJS
local FFlagBuyRobuxLatencyIxpEnabled = SharedFlagsModule.FFlagBuyRobuxLatencyIxpEnabled
local FFlagEnableBuyRobuxSdui = SharedFlagsModule.FFlagEnableBuyRobuxSdui
local FStringPaymentsBuyRobuxLayer = SharedFlagsModule.FStringPaymentsBuyRobuxLayer
local FFlagBypassBuyRobuxSduiSupportForWebRouting = SharedFlagsModule.FFlagBypassBuyRobuxSduiSupportForWebRouting
local LogBuyRobuxRoutingDecisionModule = require(script.Parent.logBuyRobuxRoutingDecision)
local Replaced = string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "/m.", "/www.")

local function _()
	-- upvalues: GetAppFeaturePoliciesFunction (copy)
	local AppFeaturePolicies = GetAppFeaturePoliciesFunction()
	
	return AppFeaturePolicies.useLuobuAuthentication() or (AppFeaturePolicies.getUseVNGUserAgreementPopup() or (AppFeaturePolicies.getRedirectBuyRobuxToVNG() or AppFeaturePolicies.getShowVNGTosForRobuxUpsell()))
end

local function buildUrl(Text, p1): string
	-- upvalues: HttpService (copy), Replaced (copy)
	local List = {}
	
	if p1.analyticId ~= nil then
		table.insert(List, "analyticId=" .. HttpService:UrlEncode(p1.analyticId))
	end
	if p1.productId ~= nil then
		table.insert(List, "product_id=" .. HttpService:UrlEncode(p1.productId))
	end
	return Replaced .. Text .. (if #List > 0 then "?" .. table.concat(List, "&") else "")
end

local function appendRoutingContext(Text: string, Input): string
	-- upvalues: HttpService (copy)
	local List = {}
	
	if Input ~= nil then
		table.insert(List, "variant=" .. HttpService:UrlEncode(Input))
	end
	table.insert(List, "startMs=" .. tostring(DateTime.now().UnixTimestampMillis))
	
	return Text .. (if string.find(Text, "?", 1, true) then "&" else "?") .. table.concat(List, "&")
end

local _ = function(Url, ShouldExpose)
	return { kind = "web", url = Url, shouldExpose = ShouldExpose }
end

local function resolveDestinationWithWebContext(p1)
	-- upvalues: GetAppFeaturePoliciesFunction (copy), LogBuyRobuxRoutingDecisionModule (copy), appendRoutingContext (copy), buildUrl (copy), FFlagBypassBuyRobuxSduiSupportForWebRouting (copy), IsSduiBuyRobuxSupportedModule (copy), FFlagEnableBuyRobuxSdui (copy), FFlagBuyRobuxLatencyIxpEnabled (copy), FFlagEnableBuyRobuxNextJS (copy)
	local AppFeaturePolicies = GetAppFeaturePoliciesFunction()
	
	if AppFeaturePolicies.useLuobuAuthentication() or (AppFeaturePolicies.getUseVNGUserAgreementPopup() or (AppFeaturePolicies.getRedirectBuyRobuxToVNG() or AppFeaturePolicies.getShowVNGTosForRobuxUpsell())) then
		LogBuyRobuxRoutingDecisionModule("controlWeb", "excludedRegion")
		
		return {
			kind = "web",
			shouldExpose = false,
			url = appendRoutingContext(buildUrl("upgrades/robux", p1), nil)
		}
	elseif not FFlagBypassBuyRobuxSduiSupportForWebRouting and not IsSduiBuyRobuxSupportedModule() then
		LogBuyRobuxRoutingDecisionModule("controlWeb", "sduiNotSupported")
		
		return {
			kind = "web",
			shouldExpose = false,
			url = appendRoutingContext(buildUrl("upgrades/robux", p1), nil)
		}
	elseif FFlagEnableBuyRobuxSdui then
		LogBuyRobuxRoutingDecisionModule("nativeSdui", "experimentArm")
		
		return {
			kind = "native",
			shouldExpose = FFlagBuyRobuxLatencyIxpEnabled
		}
	elseif FFlagEnableBuyRobuxNextJS then
		LogBuyRobuxRoutingDecisionModule("nextJsWeb", "experimentArm")
		
		return {
			kind = "web",
			url = appendRoutingContext(buildUrl("upgrades/robux/v2", p1), "nextjs"),
			shouldExpose = FFlagBuyRobuxLatencyIxpEnabled
		}
	else
		LogBuyRobuxRoutingDecisionModule("controlWeb", "experimentArm")
		
		return {
			kind = "web",
			url = appendRoutingContext(buildUrl("upgrades/robux", p1), "control"),
			shouldExpose = FFlagBuyRobuxLatencyIxpEnabled
		}
	end
end

local function resolveDestination(p1)
	-- upvalues: buildUrl (copy), GetAppFeaturePoliciesFunction (copy), LogBuyRobuxRoutingDecisionModule (copy), FFlagBypassBuyRobuxSduiSupportForWebRouting (copy), IsSduiBuyRobuxSupportedModule (copy), FFlagEnableBuyRobuxSdui (copy), FFlagBuyRobuxLatencyIxpEnabled (copy), FFlagEnableBuyRobuxNextJS (copy)
	local Robux = buildUrl("upgrades/robux", p1)
	local AppFeaturePolicies = GetAppFeaturePoliciesFunction()
	
	if AppFeaturePolicies.useLuobuAuthentication() or (AppFeaturePolicies.getUseVNGUserAgreementPopup() or (AppFeaturePolicies.getRedirectBuyRobuxToVNG() or AppFeaturePolicies.getShowVNGTosForRobuxUpsell())) then
		LogBuyRobuxRoutingDecisionModule("controlWeb", "excludedRegion")
		
		return { kind = "web", shouldExpose = false, url = Robux }
	elseif not FFlagBypassBuyRobuxSduiSupportForWebRouting and not IsSduiBuyRobuxSupportedModule() then
		LogBuyRobuxRoutingDecisionModule("controlWeb", "sduiNotSupported")
		
		return { kind = "web", shouldExpose = false, url = Robux }
	elseif FFlagEnableBuyRobuxSdui then
		LogBuyRobuxRoutingDecisionModule("nativeSdui", "experimentArm")
		
		return {
			kind = "native",
			shouldExpose = FFlagBuyRobuxLatencyIxpEnabled
		}
	elseif FFlagEnableBuyRobuxNextJS then
		LogBuyRobuxRoutingDecisionModule("nextJsWeb", "experimentArm")
		
		return {
			kind = "web",
			url = buildUrl("upgrades/robux/v2", p1),
			shouldExpose = FFlagBuyRobuxLatencyIxpEnabled
		}
	else
		LogBuyRobuxRoutingDecisionModule("controlWeb", "experimentArm")
		
		return {
			kind = "web",
			url = Robux,
			shouldExpose = FFlagBuyRobuxLatencyIxpEnabled
		}
	end
end

local Callback = if FFlagBuyRobuxRoutingAppendWebContextModule then resolveDestinationWithWebContext else resolveDestination

return {
	fallbackWebUrl = function(p1)
		-- upvalues: buildUrl (copy)
		return (buildUrl("upgrades/robux", p1))
	end,
	resolveDestination = Callback,
	logExposure = function(p1)
		-- upvalues: FStringPaymentsBuyRobuxLayer (copy), IXPServiceWrapper (copy)
		if p1.shouldExpose and FStringPaymentsBuyRobuxLayer ~= "" then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringPaymentsBuyRobuxLayer)
		end
	end,
	resolveAndLogDestination = function(p1)
		-- upvalues: FFlagBuyRobuxRoutingAppendWebContextModule (copy), Callback (copy), resolveDestination (copy), FStringPaymentsBuyRobuxLayer (copy), IXPServiceWrapper (copy)
		local CallbackResult = if FFlagBuyRobuxRoutingAppendWebContextModule then Callback(p1) else resolveDestination(p1)
		
		if CallbackResult.shouldExpose and FStringPaymentsBuyRobuxLayer ~= "" then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringPaymentsBuyRobuxLayer)
		end
		return CallbackResult
	end
}