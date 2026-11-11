local Players = game:GetService("Players")
local LocalizationService = game:GetService("LocalizationService")
local ArgCheckModule = require(script:FindFirstAncestor("DiscoveryAnalytics").Parent.ArgCheck)

return function(p1, p2, UniverseId, Source, Index)
	-- upvalues: ArgCheckModule (copy), Players (copy), LocalizationService (copy)
	ArgCheckModule.isType(p2, "string", "eventName")
	ArgCheckModule.isType(UniverseId, "string", "universeId")
	ArgCheckModule.isType(Source, "string", "source")
	ArgCheckModule.isType(Index, "number", "index")
	
	if Players.LocalPlayer then
		p1:setRBXEventStream("GameDetailsPeekView", p2, {
			uid = tostring(Players.LocalPlayer.UserId),
			locale = LocalizationService.RobloxLocaleId,
			universeId = UniverseId,
			source = Source,
			index = Index
		})
	end
end