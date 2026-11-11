local AppStorageService = game:GetService("AppStorageService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local PromiseModule = require(PurchasePrompt.Promise)
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local FFlagUnifiedPurchaseFlowShouldCacheExperimentResult = require(Parent.PurchasePromptLite).FFlagUnifiedPurchaseFlowShouldCacheExperimentResult
local GetFFlagDevSubsEligibleForUnifiedPurchaseFlowFunction = require(Parent.PurchasePromptLite).GetFFlagDevSubsEligibleForUnifiedPurchaseFlow
local FFlagShipUnifiedPurchaseInExperience = require(Parent.SharedFlags).FFlagShipUnifiedPurchaseInExperience

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
	-- upvalues: GetFFlagDevSubsEligibleForUnifiedPurchaseFlowFunction (copy), ProductTypeEnum (copy), PromiseModule (copy), FFlagShipUnifiedPurchaseInExperience (copy), FFlagUnifiedPurchaseFlowShouldCacheExperimentResult (copy), AppStorageService (copy)
	if GetFFlagDevSubsEligibleForUnifiedPurchaseFlowFunction() and DeveloperSubscription == ProductTypeEnum.DeveloperSubscription then
		return PromiseModule.resolve(true)
	end
	if FFlagShipUnifiedPurchaseInExperience then
		return PromiseModule.resolve(true)
	end
	local Timestamp = os.time(os.date("!*t"))
	
	if FFlagUnifiedPurchaseFlowShouldCacheExperimentResult then
		local Number: number = tonumber((AppStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC"))) or -1
		
		if Number ~= -1 and Timestamp < Number then
			return PromiseModule.resolve(AppStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true")
		end
	end
	return p1.getUnifiedPurchaseFlowUserEligibility():andThen(function(Result)
		-- upvalues: PromiseModule (upval), FFlagUnifiedPurchaseFlowShouldCacheExperimentResult (upval), Timestamp (copy), AppStorageService (upval)
		if not Result then
			return PromiseModule.reject(false)
		end
		local UnifiedPurchaseFlowMetadata = Result.unifiedPurchaseFlowMetadata
		local IsUserEligibleForUnifiedPurchaseFlow = UnifiedPurchaseFlowMetadata.isUserEligibleForUnifiedPurchaseFlow
		local ExpiresInSeconds = UnifiedPurchaseFlowMetadata.expiresInSeconds or 0
		
		if FFlagUnifiedPurchaseFlowShouldCacheExperimentResult then
			local NewTimestamp = Timestamp + ExpiresInSeconds
			
			if IsUserEligibleForUnifiedPurchaseFlow then
				AppStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "true")
			else
				AppStorageService:SetItem("UnifiedPurchaseFlowIsUserEligible", "false")
			end
			AppStorageService:SetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC", (tostring(NewTimestamp)))
			AppStorageService:Flush()
		end
		return PromiseModule.resolve(IsUserEligibleForUnifiedPurchaseFlow)
	end, function(_)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(false)
	end):catch(function(_)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(false)
	end)
end