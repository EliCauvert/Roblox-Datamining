local appStorageService = game:GetService("AppStorageService")
local parent = script:FindFirstAncestor("PurchasePromptLite").Parent
local url = require(parent.Http).Url
local promiseModule = require(parent.Promise)

local function APIGetRobloxSubscriptionMetadata(p1)
	-- upvalues: promiseModule (ref), url (ref)
	return if p1 == nil then promiseModule.reject() else p1(string.format("%sroblox-subscriptions/v1/metadata", url.APIS_URL), "GET"):andThen(function(p2)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p2.responseBody)
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

local _ = function(p1, p2)
	-- upvalues: appStorageService (ref)
	if p1 then
		appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "true")
	else
		appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "false")
	end
	appStorageService:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", tostring(p2))
	appStorageService:Flush()
end

return function(p1, p2)
	-- upvalues: promiseModule (ref), appStorageService (ref), APIGetRobloxSubscriptionMetadata (ref)
	if p2 == "DeveloperSubscription" then
		return promiseModule.resolve(true)
	end
	local timestamp = os.time(os.date("!*t"))
	local unifiedPurchaseFlowExpirationTimeSecondsUTC = tonumber(appStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC")) or -1
	
	return if unifiedPurchaseFlowExpirationTimeSecondsUTC == -1 or timestamp >= unifiedPurchaseFlowExpirationTimeSecondsUTC then APIGetRobloxSubscriptionMetadata(p1):andThen(function(p3)
		-- upvalues: timestamp (ref), appStorageService (copy), promiseModule (copy)
		local unifiedPurchaseFlowMetadata = p3.unifiedPurchaseFlowMetadata
		local isUserEligibleForUnifiedPurchaseFlow = unifiedPurchaseFlowMetadata.isUserEligibleForUnifiedPurchaseFlow
		local var1 = timestamp + (unifiedPurchaseFlowMetadata.expiresInSeconds or 0)
		
		if isUserEligibleForUnifiedPurchaseFlow then
			appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "true")
		else
			appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "false")
		end
		appStorageService:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", tostring(var1))
		appStorageService:Flush()
		
		return promiseModule.resolve(isUserEligibleForUnifiedPurchaseFlow)
	end):catch(function(_)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(false)
	end) else promiseModule.resolve(appStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true")
end