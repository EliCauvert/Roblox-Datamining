local appStorageService = game:GetService("AppStorageService")
local purchasePromptLite = script:FindFirstAncestor("PurchasePromptLite")
local parent = purchasePromptLite.Parent
local url = require(parent.Http).Url
local promiseModule = require(parent.Promise)
local fFlagUnifiedPurchaseFlowShouldCacheExperimentResultModule = require(purchasePromptLite.Flags.FFlagUnifiedPurchaseFlowShouldCacheExperimentResult)
local getFFlagDevSubsEligibleForUnifiedPurchaseFlowModule = require(purchasePromptLite.Flags.GetFFlagDevSubsEligibleForUnifiedPurchaseFlow)

local function APIGetRobloxSubscriptionMetadata(p0) --[[ line: 21 ]]
	-- upvalues: promiseModule (ref), url (ref)
	return if p0 == nil then promiseModule.reject() else p0(string.format("%sroblox-subscriptions/v1/metadata", url.APIS_URL), "GET"):andThen(function(p1) --[[ line: 28 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(p1.responseBody)
	end, function(p2) --[[ line: 30 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p2)
	end)
end

local function _() --[[ line: 35 | named "getUnifiedPurchaseFlowIsUserEligibleFromStorage" ]]
	-- upvalues: appStorageService (ref)
	return appStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true"
end

local _ = function() --[[ line: 40 | named "getUnifiedPurchaseFlowExpirationTimeSecondsUTCFromStorage" ]]
	-- upvalues: appStorageService (ref)
	return tonumber(appStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC")) or -1
end

local _ = function(p3, p4) --[[ line: 45 | named "persistUnifiedPurchaseFlowMetadata" ]]
	-- upvalues: appStorageService (ref)
	if p3 then
		appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "true")
	else
		appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "false")
	end
	appStorageService:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", tostring(p4))
	appStorageService:Flush()
end

return function(p5, p6) --[[ line: 57 | named "getIsUserEligibleForUnifiedPurchaseFlow" ]]
	-- upvalues: getFFlagDevSubsEligibleForUnifiedPurchaseFlowModule (ref), promiseModule (ref), fFlagUnifiedPurchaseFlowShouldCacheExperimentResultModule (ref), appStorageService (ref), APIGetRobloxSubscriptionMetadata (ref)
	if p6 == "DeveloperSubscription" then
		return promiseModule.resolve(getFFlagDevSubsEligibleForUnifiedPurchaseFlowModule())
	end
	local timestamp = os.time(os.date("!*t"))
	
	if fFlagUnifiedPurchaseFlowShouldCacheExperimentResultModule then
		local unifiedPurchaseFlowExpirationTimeSecondsUTC = tonumber(appStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC")) or -1
		
		return if unifiedPurchaseFlowExpirationTimeSecondsUTC == -1 or timestamp >= unifiedPurchaseFlowExpirationTimeSecondsUTC then APIGetRobloxSubscriptionMetadata(p5):andThen(function(p7) --[[ line: 75 ]]
			-- upvalues: fFlagUnifiedPurchaseFlowShouldCacheExperimentResultModule (copy), timestamp (ref), appStorageService (copy), promiseModule (copy)
			local unifiedPurchaseFlowMetadata = p7.unifiedPurchaseFlowMetadata
			local isUserEligibleForUnifiedPurchaseFlow = unifiedPurchaseFlowMetadata.isUserEligibleForUnifiedPurchaseFlow
			local expiresInSeconds = unifiedPurchaseFlowMetadata.expiresInSeconds or 0
			
			if fFlagUnifiedPurchaseFlowShouldCacheExperimentResultModule then
				local var9 = timestamp + expiresInSeconds
				
				if isUserEligibleForUnifiedPurchaseFlow then
					appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "true")
				else
					appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "false")
				end
				appStorageService:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", tostring(var9))
				appStorageService:Flush()
			end
			return promiseModule.resolve(isUserEligibleForUnifiedPurchaseFlow)
		end):catch(function(_) --[[ line: 86 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve(false)
		end) else promiseModule.resolve(appStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true")
	end
end