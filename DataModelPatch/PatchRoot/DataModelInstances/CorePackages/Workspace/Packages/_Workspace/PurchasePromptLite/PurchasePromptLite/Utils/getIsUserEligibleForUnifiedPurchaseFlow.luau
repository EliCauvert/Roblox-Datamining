local AppStorageService = game:GetService("AppStorageService")
local PurchasePromptLite = script:FindFirstAncestor("PurchasePromptLite")
local Parent = PurchasePromptLite.Parent
local Url = require(Parent.Http).Url
local PromiseModule = require(Parent.Promise)
local FFlagUnifiedPurchaseFlowShouldCacheExperimentResultModule = require(PurchasePromptLite.Flags.FFlagUnifiedPurchaseFlowShouldCacheExperimentResult)
local GetFFlagDevSubsEligibleForUnifiedPurchaseFlowModule = require(PurchasePromptLite.Flags.GetFFlagDevSubsEligibleForUnifiedPurchaseFlow)

local function APIGetRobloxSubscriptionMetadata(Callback)
	-- upvalues: PromiseModule (copy), Url (copy)
	return if Callback == nil then PromiseModule.reject() else Callback(string.format("%sroblox-subscriptions/v1/metadata", Url.APIS_URL), "GET"):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Result.responseBody)
	end, function(p1)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(p1)
	end)
end

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

return function(p1, p2)
	-- upvalues: GetFFlagDevSubsEligibleForUnifiedPurchaseFlowModule (copy), PromiseModule (copy), FFlagUnifiedPurchaseFlowShouldCacheExperimentResultModule (copy), AppStorageService (copy), APIGetRobloxSubscriptionMetadata (copy)
	if p2 == "DeveloperSubscription" then
		return PromiseModule.resolve((GetFFlagDevSubsEligibleForUnifiedPurchaseFlowModule()))
	end
	local Timestamp = os.time(os.date("!*t"))
	
	if FFlagUnifiedPurchaseFlowShouldCacheExperimentResultModule then
		local Number: number = tonumber((AppStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC"))) or -1
		
		if Number ~= -1 and Timestamp < Number then
			return PromiseModule.resolve(AppStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true")
		end
	end
	return APIGetRobloxSubscriptionMetadata(p1):andThen(function(Result)
		-- upvalues: FFlagUnifiedPurchaseFlowShouldCacheExperimentResultModule (upval), Timestamp (copy), AppStorageService (upval), PromiseModule (upval)
		local UnifiedPurchaseFlowMetadata = Result.unifiedPurchaseFlowMetadata
		local IsUserEligibleForUnifiedPurchaseFlow = UnifiedPurchaseFlowMetadata.isUserEligibleForUnifiedPurchaseFlow
		local ExpiresInSeconds = UnifiedPurchaseFlowMetadata.expiresInSeconds or 0
		
		if FFlagUnifiedPurchaseFlowShouldCacheExperimentResultModule then
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
	end):catch(function(_)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(false)
	end)
end