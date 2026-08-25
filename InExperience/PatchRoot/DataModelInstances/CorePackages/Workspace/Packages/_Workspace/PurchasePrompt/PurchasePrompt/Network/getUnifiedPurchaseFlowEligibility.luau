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

local _ = function(p0, p1)
	-- upvalues: appStorageService (ref)
	if p0 then
		appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "true")
	else
		appStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "false")
	end
	appStorageService:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", tostring(p1))
	appStorageService:Flush()
end

return function(p2, p3)
	-- upvalues: productTypeEnum (ref), promiseModule (ref), fFlagShipUnifiedPurchaseInExperience (ref), appStorageService (ref)
	if p3 == productTypeEnum.DeveloperSubscription then
		return promiseModule.resolve(true)
	elseif fFlagShipUnifiedPurchaseInExperience then
		return promiseModule.resolve(true)
	end
	local timestamp = os.time(os.date("!*t"))
	local unifiedPurchaseFlowExpirationTimeSecondsUTC = tonumber(appStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC")) or -1
	
	return if unifiedPurchaseFlowExpirationTimeSecondsUTC == -1 or timestamp >= unifiedPurchaseFlowExpirationTimeSecondsUTC then p2.getUnifiedPurchaseFlowUserEligibility():andThen(function(p4)
		-- upvalues: promiseModule (copy), timestamp (ref), appStorageService (copy)
		if not p4 then
			return promiseModule.reject(false)
		end
		local unifiedPurchaseFlowMetadata = p4.unifiedPurchaseFlowMetadata
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
	end, function(_)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(false)
	end):catch(function(_)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(false)
	end) else promiseModule.resolve(appStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true")
end