local appStorageService = game:GetService("AppStorageService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local promiseModule = require(purchasePrompt.Promise)
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local fFlagUnifiedPurchaseFlowShouldCacheExperimentResult = require(parent.PurchasePromptLite).FFlagUnifiedPurchaseFlowShouldCacheExperimentResult
local getFFlagDevSubsEligibleForUnifiedPurchaseFlow = require(parent.PurchasePromptLite).GetFFlagDevSubsEligibleForUnifiedPurchaseFlow
local fFlagShipUnifiedPurchaseInExperience = require(parent.SharedFlags).FFlagShipUnifiedPurchaseInExperience

local function _() --[[ line: 18 | named "getUnifiedPurchaseFlowIsUserEligibleFromStorage" ]]
	-- upvalues: appStorageService (ref)
	return appStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true"
end

local _ = function() --[[ line: 23 | named "getUnifiedPurchaseFlowExpirationTimeSecondsUTCFromStorage" ]]
	-- upvalues: appStorageService (ref)
	return tonumber(appStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC")) or -1
end

local _ = function(p0, p1) --[[ line: 28 | named "persistUnifiedPurchaseFlowMetadata" ]]
	-- upvalues: appStorageService (ref)
	if p0 then
		appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "true")
	else
		appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "false")
	end
	appStorageService:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", tostring(p1))
	appStorageService:Flush()
end

return function(p2, p3) --[[ line: 40 | named "getUnifiedPurchaseFlowEligibility" ]]
	-- upvalues: getFFlagDevSubsEligibleForUnifiedPurchaseFlow (ref), productTypeEnum (ref), promiseModule (ref), fFlagShipUnifiedPurchaseInExperience (ref), fFlagUnifiedPurchaseFlowShouldCacheExperimentResult (ref), appStorageService (ref)
	if getFFlagDevSubsEligibleForUnifiedPurchaseFlow() and p3 == productTypeEnum.DeveloperSubscription then
		return promiseModule.resolve(true)
	elseif fFlagShipUnifiedPurchaseInExperience then
		return promiseModule.resolve(true)
	end
	local timestamp = os.time(os.date("!*t"))
	
	if fFlagUnifiedPurchaseFlowShouldCacheExperimentResult then
		local unifiedPurchaseFlowExpirationTimeSecondsUTC = tonumber(appStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC")) or -1
		
		return if unifiedPurchaseFlowExpirationTimeSecondsUTC == -1 or timestamp >= unifiedPurchaseFlowExpirationTimeSecondsUTC then p2.getUnifiedPurchaseFlowUserEligibility():andThen(function(p4) --[[ line: 60 ]]
			-- upvalues: promiseModule (copy), fFlagUnifiedPurchaseFlowShouldCacheExperimentResult (copy), timestamp (ref), appStorageService (copy)
			if not p4 then
				return promiseModule.reject(false)
			end
			local unifiedPurchaseFlowMetadata = p4.unifiedPurchaseFlowMetadata
			local isUserEligibleForUnifiedPurchaseFlow = unifiedPurchaseFlowMetadata.isUserEligibleForUnifiedPurchaseFlow
			local expiresInSeconds = unifiedPurchaseFlowMetadata.expiresInSeconds or 0
			
			if fFlagUnifiedPurchaseFlowShouldCacheExperimentResult then
				local var6 = timestamp + expiresInSeconds
				
				if isUserEligibleForUnifiedPurchaseFlow then
					appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "true")
				else
					appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "false")
				end
				appStorageService:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", tostring(var6))
				appStorageService:Flush()
			end
			return promiseModule.resolve(isUserEligibleForUnifiedPurchaseFlow)
		end, function(_) --[[ line: 75 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve(false)
		end):catch(function(_) --[[ line: 79 ]]
			-- upvalues: promiseModule (copy)
			return promiseModule.resolve(false)
		end) else promiseModule.resolve(appStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true")
	end
end