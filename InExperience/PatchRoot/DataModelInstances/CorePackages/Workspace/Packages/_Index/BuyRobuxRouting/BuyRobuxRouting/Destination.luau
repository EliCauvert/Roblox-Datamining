local BuyRobuxRouting = script:FindFirstAncestor("BuyRobuxRouting")
local Parent = BuyRobuxRouting.Parent
local HttpService = game:GetService("HttpService")
local SharedFlagsModule = require(Parent.SharedFlags)
local IXPServiceWrapper = require(Parent.IxpServiceWrapper).IXPServiceWrapper
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local IsSduiBuyRobuxSupportedModule = require(BuyRobuxRouting.isSduiBuyRobuxSupported)
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

local _ = function(Url, ShouldExpose)
	return { kind = "web", url = Url, shouldExpose = ShouldExpose }
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

return {
	fallbackWebUrl = function(p1)
		-- upvalues: buildUrl (copy)
		return (buildUrl("upgrades/robux", p1))
	end,
	resolveDestination = resolveDestination,
	logExposure = function(p1)
		-- upvalues: FStringPaymentsBuyRobuxLayer (copy), IXPServiceWrapper (copy)
		if p1.shouldExpose and FStringPaymentsBuyRobuxLayer ~= "" then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringPaymentsBuyRobuxLayer)
		end
	end,
	resolveAndLogDestination = function(p1)
		-- upvalues: resolveDestination (copy), FStringPaymentsBuyRobuxLayer (copy), IXPServiceWrapper (copy)
		local ResolveDestinationResult = resolveDestination(p1)
		
		if ResolveDestinationResult.shouldExpose and FStringPaymentsBuyRobuxLayer ~= "" then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringPaymentsBuyRobuxLayer)
		end
		return ResolveDestinationResult
	end
}