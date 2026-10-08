local parent = script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent
local httpService = game:GetService("HttpService")
local memStorageService = game:GetService("MemStorageService")
local messageBusService = game:GetService("MessageBusService")
local logger = require(parent.Loggers).Logger
local launchExperienceModule = require(script.Parent.launchExperience)
local buildExperiencePlaytestRejoinDelayMs = game:DefineFastInt("BuildExperiencePlaytestRejoinDelayMs", 250)
local buildExperiencePlaytestRejoinExpiryMs = game:DefineFastInt("BuildExperiencePlaytestRejoinExpiryMs", 60000)
local gameMessageId = messageBusService:GetMessageId("Game", "onGameLeave")

local function _()
	return DateTime.now().UnixTimestampMillis
end

local function takeIntent()
	-- upvalues: memStorageService (ref), httpService (ref), buildExperiencePlaytestRejoinExpiryMs (ref), logger (ref)
	local buildExperiencePlaytestRejoinItem = memStorageService:GetItem("BuildExperiencePlaytestRejoin")
	
	if buildExperiencePlaytestRejoinItem == nil or buildExperiencePlaytestRejoinItem == "" then
		return nil
	end
	memStorageService:SetItem("BuildExperiencePlaytestRejoin", "")
	local ok, status = pcall(httpService.JSONDecode, httpService, buildExperiencePlaytestRejoinItem)
	
	if not ok or type(status) ~= "table" or (type(status.placeId) ~= "number" or type(status.source) ~= "string") or type(status.createdAt) ~= "number" then
		return nil
	end
	local var1 = DateTime.now().UnixTimestampMillis - status.createdAt
	
	if var1 < 0 or buildExperiencePlaytestRejoinExpiryMs < var1 then
		logger:warning("PlaytestRejoin: dropped a Playtest request that expired after {} ms", var1)
		
		return nil
	end
	return status
end

local t = {
	request = function(p1, p2, p3)
		-- upvalues: memStorageService (ref), httpService (ref)
		memStorageService:SetItem("BuildExperiencePlaytestRejoin", httpService:JSONEncode({
			placeId = p1,
			source = p2,
			isTeamTest = p3,
			createdAt = DateTime.now().UnixTimestampMillis
		}))
	end,
	resume = function(p1)
		-- upvalues: takeIntent (ref), buildExperiencePlaytestRejoinDelayMs (ref), launchExperienceModule (ref)
		local var1 = takeIntent()
		
		if var1 == nil then
			return false
		end
		p1 = p1 or buildExperiencePlaytestRejoinDelayMs
		
		if p1 > 0 then
			task.delay(p1 / 1000, function()
				-- upvalues: launchExperienceModule (copy), var1 (ref)
				launchExperienceModule(var1.placeId, var1.source, var1.isTeamTest)
			end)
		else
			launchExperienceModule(var1.placeId, var1.source, var1.isTeamTest)
		end
		return true
	end
}

function t.listen()
	-- upvalues: t (ref), messageBusService (ref), gameMessageId (ref)
	t.resume()
	local var1 = messageBusService:Subscribe(gameMessageId, function()
		-- upvalues: t (copy)
		t.resume()
	end, false, false)
	
	return function()
		-- upvalues: var1 (ref)
		var1:Disconnect()
	end
end

return t