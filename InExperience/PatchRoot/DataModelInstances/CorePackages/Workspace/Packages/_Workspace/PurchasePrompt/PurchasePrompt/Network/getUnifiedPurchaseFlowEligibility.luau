local appStorageService = game:GetService("AppStorageService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local promiseModule = require(purchasePrompt.Promise)
local productTypeEnum = require(purchasePrompt.types).ProductTypeEnum
local fFlagShipUnifiedPurchaseInExperience = require(parent.SharedFlags).FFlagShipUnifiedPurchaseInExperience

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
	-- upvalues: productTypeEnum (ref), promiseModule (ref), fFlagShipUnifiedPurchaseInExperience (ref), appStorageService (ref)
	if p2 == productTypeEnum.DeveloperSubscription then
		return promiseModule.resolve(true)
	elseif fFlagShipUnifiedPurchaseInExperience then
		return promiseModule.resolve(true)
	end
	local timestamp = os.time(os.date("!*t"))
	local unifiedPurchaseFlowExpirationTimeSecondsUTC = tonumber(appStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC")) or -1
	
	return if unifiedPurchaseFlowExpirationTimeSecondsUTC == -1 or timestamp >= unifiedPurchaseFlowExpirationTimeSecondsUTC then p1.getUnifiedPurchaseFlowUserEligibility():andThen(function(p3)
		-- upvalues: promiseModule (copy), timestamp (ref), appStorageService (copy)
		if not p3 then
			return promiseModule.reject(false)
		end
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
	end, function(_)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(false)
	end):catch(function(_)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(false)
	end) else promiseModule.resolve(appStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true")
end