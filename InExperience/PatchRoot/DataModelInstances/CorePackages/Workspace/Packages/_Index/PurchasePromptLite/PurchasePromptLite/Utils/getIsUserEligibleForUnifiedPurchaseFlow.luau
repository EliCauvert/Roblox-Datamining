local AppStorageService = game:GetService("AppStorageService")
local Parent = script:FindFirstAncestor("PurchasePromptLite").Parent
local Url = require(Parent.Http).Url
local PromiseModule = require(Parent.Promise)

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
	-- upvalues: PromiseModule (copy), AppStorageService (copy), APIGetRobloxSubscriptionMetadata (copy)
	if p2 == "DeveloperSubscription" then
		return PromiseModule.resolve(true)
	else
		local Timestamp = os.time(os.date("!*t"))
		local Number: number = tonumber((AppStorageService:GetItem("UnifiedPurchaseFlowExpirationTimeSecondsUTC"))) or -1
		
		return if Number == -1 or Timestamp >= Number then APIGetRobloxSubscriptionMetadata(p1):andThen(function(Result)
			-- upvalues: Timestamp (copy), AppStorageService (upval), PromiseModule (upval)
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
		end):catch(function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve(false)
		end) else PromiseModule.resolve(AppStorageService:GetItem("UnifiedPurchaseFlowIsUserEligible") == "true")
	end
end