local AppStorageService = game:GetService("AppStorageService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PromiseModule = require(PurchasePrompt.Promise)
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local FFlagShipUnifiedPurchaseInExperience = require(PurchasePrompt.Parent.SharedFlags).FFlagShipUnifiedPurchaseInExperience

local function _(): boolean
	-- upvalues: AppStorageService (copy)
	return AppStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true"
end

local _ = function(): number
	-- upvalues: AppStorageService (copy)
	return tonumber((AppStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC"))) or -1
end

local _ = function(p1, p2)
	-- upvalues: AppStorageService (copy)
	if p1 then
		AppStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "true")
	else
		AppStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "false")
	end
	AppStorageService:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", (tostring(p2)))
	AppStorageService:Flush()
end

return function(p1, DeveloperSubscription)
	-- upvalues: ProductTypeEnum (copy), PromiseModule (copy), FFlagShipUnifiedPurchaseInExperience (copy), AppStorageService (copy)
	if DeveloperSubscription == ProductTypeEnum.DeveloperSubscription then
		return PromiseModule.resolve(true)
	elseif DeveloperSubscription == ProductTypeEnum.VIPServer then
		return PromiseModule.resolve(true)
	elseif FFlagShipUnifiedPurchaseInExperience then
		return PromiseModule.resolve(true)
	else
		local Timestamp = os.time(os.date("!*t"))
		local Number: number = tonumber((AppStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC"))) or -1
		
		return if Number == -1 or Timestamp >= Number then p1.getUnifiedPurchaseFlowUserEligibility():andThen(function(Result)
			-- upvalues: PromiseModule (upval), Timestamp (copy), AppStorageService (upval)
			if not Result then
				return PromiseModule.reject(false)
			end
			local UnifiedPurchaseFlowMetadata = Result.unifiedPurchaseFlowMetadata
			local IsUserEligibleForUnifiedPurchaseFlow = UnifiedPurchaseFlowMetadata.isUserEligibleForUnifiedPurchaseFlow
			local NewTimestamp = Timestamp + (UnifiedPurchaseFlowMetadata.expiresInSeconds or 0)
			
			if IsUserEligibleForUnifiedPurchaseFlow then
				AppStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "true")
			else
				AppStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "false")
			end
			AppStorageService:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", (tostring(NewTimestamp)))
			AppStorageService:Flush()
			
			return PromiseModule.resolve(IsUserEligibleForUnifiedPurchaseFlow)
		end, function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve(false)
		end):catch(function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve(false)
		end) else PromiseModule.resolve(AppStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true")
	end
end