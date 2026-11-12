local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TelemetryService = game:GetService("TelemetryService")
local Url = require(script.Parent.Parent.CoreScriptsCommon).Url
local ValidateRewardAndPlacementName: string = `{Url.APIS_URL}ads-reward-service/v1/validateRewardAndPlacement`
local ValidateRewardAndPlacementStudioName: string = `{Url.APIS_URL}ads-reward-service/v1/validateRewardAndPlacementStudio`
local GrantAdRewardName: string = `{Url.APIS_URL}ads-reward-service/v1/grantAdReward`
local config = {
	eventName = "AdsRewardServiceHttpValidateCounter",
	description = "Counter for ValidateReward http calls",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 10, 27 }
}
local config1 = {
	eventName = "AdsRewardServiceHttpGrantAdCounter",
	description = "Counter for GrantAd http calls",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2026, 10, 27 }
}
local config2 = {
	eventName = "AdsRewardServiceHttpError",
	description = "This event is sent whenever a ads-reward-service error occurs",
	backends = { "Points" },
	throttlingPercentage = game:DefineFastInt("AdsRewardServiceHttpErrorThrottleHundredthsPercent", 0),
	lastUpdated = { 2026, 10, 27 }
}

local function reportHttpError(Endpoint, UnixTimestampMillis, Message)
	-- upvalues: TelemetryService (copy), config2 (copy)
	TelemetryService:LogEvent(config2, {
		standardizedFields = { "addUniverseId", "addPlaceId" },
		customFields = {
			endpoint = Endpoint,
			latency = DateTime.now().UnixTimestampMillis - UnixTimestampMillis,
			errorMessage = Message
		}
	})
end

local function reportHttpStatusCounter(Config, Status)
	-- upvalues: TelemetryService (copy)
	TelemetryService:LogCounter(Config, { customFields = { status = Status } }, 1)
end

return {
	validateRewardAndPlacement = function(ProductId, PlacementId)
		-- upvalues: RunService (copy), ValidateRewardAndPlacementStudioName (copy), ValidateRewardAndPlacementName (copy), reportHttpStatusCounter (copy), config (copy), HttpService (copy), HttpRbxApiService (copy), reportHttpError (copy)
		local ValidateRewardAndPlacementStudioName1 = if RunService:IsStudio() then ValidateRewardAndPlacementStudioName else ValidateRewardAndPlacementName
		local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
		reportHttpStatusCounter(config, "called")
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), ProductId (copy), PlacementId (copy), HttpRbxApiService (upval), ValidateRewardAndPlacementStudioName1 (copy)
			return HttpRbxApiService:PostAsyncFullUrl(ValidateRewardAndPlacementStudioName1, HttpService:JSONEncode({
				universeId = game.GameId,
				productId = ProductId,
				placementId = PlacementId
			}), Enum.ThrottlingPriority.Extreme, Enum.HttpContentType.ApplicationJson)
		end)
		
		if not Success then
			reportHttpStatusCounter(config, "failed")
			reportHttpError(ValidateRewardAndPlacementStudioName1, UnixTimestampMillis, `Validate Ad Reward failed: {Result}`)
			
			return nil, `Validate Ad Reward failed: {Result}`
		end
		local Success1, Result1 = pcall(function()
			-- upvalues: HttpService (upval), Result (copy)
			local Data = HttpService:JSONDecode(Result)
			
			if type(Data) == "table" and type(Data.rewardDetails) == "table" then
				return Data
			else
				error("Failed to parse rewardDetails")
			end
		end)
		
		if Success1 and type(Result1) == "table" then
			reportHttpStatusCounter(config, "success")
			local RewardDetails = Result1.rewardDetails
			
			return {
				isValidReward = Result1.isValidReward == true,
				isValidPlacement = Result1.isValidPlacement == true,
				defaultPlacementId = Result1.defaultPlacement,
				productName = if type(RewardDetails.productName) == "string" then RewardDetails.productName else "",
				imageAssetIdString = RewardDetails.imageAssetIdString
			}, nil
		else
			reportHttpStatusCounter(config, "failed")
			reportHttpError(ValidateRewardAndPlacementStudioName1, UnixTimestampMillis, `Validate Ad Reward failed to parse response: {Result}`)
			
			return nil, `Validate Ad Reward failed to parse response: {Result}`
		end
	end,
	grantAdReward = function(UserId, ProductId, EncryptedAdTrackingData, EncryptionMetadata)
		-- upvalues: reportHttpStatusCounter (copy), config1 (copy), HttpService (copy), HttpRbxApiService (copy), GrantAdRewardName (copy), reportHttpError (copy)
		local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
		reportHttpStatusCounter(config1, "called")
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), EncryptionMetadata (copy), EncryptedAdTrackingData (copy), ProductId (copy), UserId (copy), HttpRbxApiService (upval), GrantAdRewardName (upval)
			return HttpRbxApiService:PostAsyncFullUrl(GrantAdRewardName, HttpService:JSONEncode({
				encryptionMetadata = EncryptionMetadata,
				encryptedAdTrackingData = EncryptedAdTrackingData,
				productId = ProductId,
				userId = UserId
			}), Enum.ThrottlingPriority.Extreme, Enum.HttpContentType.ApplicationJson)
		end)
		
		if Success then
			reportHttpStatusCounter(config1, "success")
			
			return true, nil
		else
			reportHttpStatusCounter(config1, "failed")
			reportHttpError(GrantAdRewardName, UnixTimestampMillis, `Grant Ad Reward failed: {Result}`)
			
			return false, `Grant Ad Reward failed: {Result}`
		end
	end
}