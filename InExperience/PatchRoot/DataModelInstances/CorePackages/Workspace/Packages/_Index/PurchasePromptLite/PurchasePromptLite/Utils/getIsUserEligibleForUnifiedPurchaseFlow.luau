local appStorageService = game:GetService("AppStorageService")
local parent = script:FindFirstAncestor("PurchasePromptLite").Parent
local url = require(parent.Http).Url
local promiseModule = require(parent.Promise)

local function APIGetRobloxSubscriptionMetadata(p0)
	-- upvalues: promiseModule (ref), url (ref)
	return if p0 == nil then promiseModule.reject() else p0(string.format("%sroblox-subscriptions/v1/metadata", url.APIS_URL), "GET"):andThen(function(p1)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p1.responseBody)
	end, function(p2)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p2)
	end)
end

local function _()
	-- upvalues: appStorageService (ref)
	return appStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true"
end

local _ = function()
	-- upvalues: appStorageService (ref)
	return tonumber(appStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC")) or -1
end

local _ = function(p3, p4)
	-- upvalues: appStorageService (ref)
	if p3 then
		appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "true")
	else
		appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "false")
	end
	appStorageService:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", tostring(p4))
	appStorageService:Flush()
end

return function(p5, p6)
	-- upvalues: promiseModule (ref), appStorageService (ref), APIGetRobloxSubscriptionMetadata (ref)
	if p6 == "DeveloperSubscription" then
		return promiseModule.resolve(true)
	end
	local timestamp = os.time(os.date("!*t"))
	local unifiedPurchaseFlowExpirationTimeSecondsUTC = tonumber(appStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC")) or -1
	
	return if unifiedPurchaseFlowExpirationTimeSecondsUTC == -1 or timestamp >= unifiedPurchaseFlowExpirationTimeSecondsUTC then APIGetRobloxSubscriptionMetadata(p5):andThen(function(p7)
		-- upvalues: timestamp (ref), appStorageService (copy), promiseModule (copy)
		local unifiedPurchaseFlowMetadata = p7.unifiedPurchaseFlowMetadata
		local isUserEligibleForUnifiedPurchaseFlow = unifiedPurchaseFlowMetadata.isUserEligibleForUnifiedPurchaseFlow
		local var5 = timestamp + (unifiedPurchaseFlowMetadata.expiresInSeconds or 0)
		
		if isUserEligibleForUnifiedPurchaseFlow then
			appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "true")
		else
			appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "false")
		end
		appStorageService:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", tostring(var5))
		appStorageService:Flush()
		
		return promiseModule.resolve(isUserEligibleForUnifiedPurchaseFlow)
	end):catch(function(_)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(false)
	end) else promiseModule.resolve(appStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true")
end