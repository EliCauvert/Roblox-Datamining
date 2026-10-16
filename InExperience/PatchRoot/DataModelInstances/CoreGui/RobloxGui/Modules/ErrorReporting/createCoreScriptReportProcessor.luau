local ContentProvider = game:GetService("ContentProvider")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local function getStaticAttributes() --[[ Line: 8 ]]
	-- upvalues: RunService (copy), ContentProvider (copy), UserInputService (copy), HttpService (copy)
	return {
		LocalVersion = RunService:GetRobloxVersion(),
		BaseUrl = ContentProvider.BaseUrl,
		PlaceId = game.PlaceId,
		Platform = UserInputService:GetPlatform().Name,
		UserAgent = HttpService:GetUserAgent(),
		CoreScriptVersion = RunService:GetCoreScriptVersion()
	}
end

return function(p1) --[[ Line: 22 | Named "createCoreScriptReportProcessor" ]]
	-- upvalues: getStaticAttributes (copy), Players (copy), RunService (copy)
	local P0 = p1 or getStaticAttributes()
	
	return function(p2) --[[ Line: 25 | Named "processReport" ]]
		-- upvalues: P0 (copy), Players (upval), RunService (upval)
		p2:addAttributes(P0)
		p2:addAttributes({ PlayerCount = #Players:GetPlayers() })
		p2:addAttributes({ RobloxChannel = RunService:GetRobloxClientChannel() })
		
		return p2
	end, P0
end