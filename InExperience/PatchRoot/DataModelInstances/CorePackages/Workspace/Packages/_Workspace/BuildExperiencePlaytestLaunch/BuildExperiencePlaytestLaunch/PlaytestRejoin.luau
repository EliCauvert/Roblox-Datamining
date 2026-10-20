local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local MessageBusService = game:GetService("MessageBusService")
local Logger = require(script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent.Loggers).Logger
local LaunchExperienceModule = require(script.Parent.launchExperience)
local BuildExperiencePlaytestRejoinDelayMs = game:DefineFastInt("BuildExperiencePlaytestRejoinDelayMs", 250)
local BuildExperiencePlaytestRejoinExpiryMs = game:DefineFastInt("BuildExperiencePlaytestRejoinExpiryMs", 60000)
local GameMessageId = MessageBusService:GetMessageId("Game", "onGameLeave")

local function _()
	return DateTime.now().UnixTimestampMillis
end

local function takeIntent()
	-- upvalues: MemStorageService (copy), HttpService (copy), BuildExperiencePlaytestRejoinExpiryMs (copy), Logger (copy)
	local BuildExperiencePlaytestRejoinItem = MemStorageService:GetItem("BuildExperiencePlaytestRejoin")
	
	if BuildExperiencePlaytestRejoinItem == nil or BuildExperiencePlaytestRejoinItem == "" then
		return nil
	end
	MemStorageService:SetItem("BuildExperiencePlaytestRejoin", "")
	local Success, Result = pcall(HttpService.JSONDecode, HttpService, BuildExperiencePlaytestRejoinItem)
	
	if not Success or type(Result) ~= "table" or type(Result.placeId) ~= "number" or type(Result.source) ~= "string" or type(Result.createdAt) ~= "number" then
		return nil
	end
	local UnixTimestampMillisDelta = DateTime.now().UnixTimestampMillis - Result.createdAt
	
	if UnixTimestampMillisDelta < 0 or BuildExperiencePlaytestRejoinExpiryMs < UnixTimestampMillisDelta then
		Logger:warning("PlaytestRejoin: dropped a Playtest request that expired after {} ms", UnixTimestampMillisDelta)
		
		return nil
	else
		return Result
	end
end

local PlaytestRejoinModule = {
	request = function(PlaceId, Source, IsTeamTest)
		-- upvalues: MemStorageService (copy), HttpService (copy)
		MemStorageService:SetItem("BuildExperiencePlaytestRejoin", HttpService:JSONEncode({
			placeId = PlaceId,
			source = Source,
			isTeamTest = IsTeamTest,
			createdAt = DateTime.now().UnixTimestampMillis
		}))
	end,
	resume = function(p1): boolean
		-- upvalues: takeIntent (copy), BuildExperiencePlaytestRejoinDelayMs (copy), LaunchExperienceModule (copy)
		local TakeIntentResult = takeIntent()
		
		if TakeIntentResult == nil then
			return false
		end
		local P3 = p1 or BuildExperiencePlaytestRejoinDelayMs
		
		if P3 > 0 then
			task.delay(P3 / 1000, function()
				-- upvalues: LaunchExperienceModule (upval), TakeIntentResult (copy)
				LaunchExperienceModule(TakeIntentResult.placeId, TakeIntentResult.source, TakeIntentResult.isTeamTest)
			end)
		else
			LaunchExperienceModule(TakeIntentResult.placeId, TakeIntentResult.source, TakeIntentResult.isTeamTest)
		end
		return true
	end
}

function PlaytestRejoinModule.listen()
	-- upvalues: PlaytestRejoinModule (copy), MessageBusService (copy), GameMessageId (copy)
	PlaytestRejoinModule.resume()
	local SubscribeResult = MessageBusService:Subscribe(GameMessageId, function()
		-- upvalues: PlaytestRejoinModule (upval)
		PlaytestRejoinModule.resume()
	end, false, false)
	
	return function()
		-- upvalues: SubscribeResult (copy)
		SubscribeResult:Disconnect()
	end
end

return PlaytestRejoinModule