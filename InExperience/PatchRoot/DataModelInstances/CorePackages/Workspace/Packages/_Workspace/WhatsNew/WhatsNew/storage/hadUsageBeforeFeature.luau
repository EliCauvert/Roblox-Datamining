local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local constantsModule = require(script:FindFirstAncestor("WhatsNew").Constants)

local function readAppRatingPromptStats(p0) --[[ line: 19 ]]
	-- upvalues: httpService (ref)
	local ok, status = pcall(function() --[[ line: 20 ]]
		-- upvalues: p0 (ref)
		return p0:GetItem("AppRatingPromptStats")
	end)
	
	if not ok or type(status) ~= "string" or status == "" then
		return {}
	end
	local ok_1, status_1 = pcall(function() --[[ line: 27 ]]
		-- upvalues: httpService (copy), status (ref)
		return httpService:JSONDecode(status)
	end)
	
	return if ok_1 and type(status_1) == "table" then status_1 else {}
end

local function _(p1, p2) --[[ line: 37 | named "hadUsageFromStats" ]]
	local numLaunches = p1.numLaunches
	
	if type(numLaunches) == "number" and numLaunches > 1 then
		return true
	end
	local numGamesPlayed = p1.numGamesPlayed
	
	if type(numGamesPlayed) == "number" and numGamesPlayed > 0 then
		return true
	end
	local firstUseDay = p1.firstUseDay
	
	return type(firstUseDay) == "number" and firstUseDay < p2
end

return function() --[[ line: 56 | named "hadUsageBeforeFeature" ]]
	-- upvalues: readAppRatingPromptStats (ref), appStorageService (ref), constantsModule (ref)
	local var4 = readAppRatingPromptStats(appStorageService)
	local WHATS_NEW_SHIP_UNIX = constantsModule.WHATS_NEW_SHIP_UNIX
	local numLaunches = var4.numLaunches
	
	if type(numLaunches) == "number" and numLaunches > 1 then
		return true
	end
	local numGamesPlayed = var4.numGamesPlayed
	
	if type(numGamesPlayed) == "number" and numGamesPlayed > 0 then
		return true
	end
	local firstUseDay = var4.firstUseDay
	
	return type(firstUseDay) == "number" and firstUseDay < WHATS_NEW_SHIP_UNIX
end