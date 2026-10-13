local contentProviderService = game:GetService("ContentProvider")
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")

local function getStaticAttributes()
	-- upvalues: runService (ref), contentProviderService (ref), userInputService (ref), httpService (ref)
	return {
		LocalVersion = runService:GetRobloxVersion(),
		BaseUrl = contentProviderService.BaseUrl,
		PlaceId = game.PlaceId,
		Platform = userInputService:GetPlatform().Name,
		UserAgent = httpService:GetUserAgent(),
		CoreScriptVersion = runService:GetCoreScriptVersion()
	}
end

return function(p1)
	-- upvalues: getStaticAttributes (ref), playersService (ref), runService (ref)
	p1 = p1 or getStaticAttributes()
	
	return function(p2)
		-- upvalues: p1 (ref), playersService (copy), runService (copy)
		p2:addAttributes(p1)
		p2:addAttributes({ PlayerCount = #playersService:GetPlayers() })
		p2:addAttributes({ RobloxChannel = runService:GetRobloxClientChannel() })
		
		return p2
	end, p1
end