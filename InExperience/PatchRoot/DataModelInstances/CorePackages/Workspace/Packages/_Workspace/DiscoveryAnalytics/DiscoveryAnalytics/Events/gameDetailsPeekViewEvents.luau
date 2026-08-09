local playersService = game:GetService("Players")
local localizationService = game:GetService("LocalizationService")
local argCheckModule = require(script:FindFirstAncestor("DiscoveryAnalytics").Parent.ArgCheck)

return function(p0, p1, p2, p3, p4) --[[ line: 7 ]]
	-- upvalues: argCheckModule (ref), playersService (ref), localizationService (ref)
	argCheckModule.isType(p1, "string", "eventName")
	argCheckModule.isType(p2, "string", "universeId")
	argCheckModule.isType(p3, "string", "source")
	argCheckModule.isType(p4, "number", "index")
	
	if playersService.LocalPlayer then
		p0:setRBXEventStream("GameDetailsPeekView", p1, {
			uid = tostring(playersService.LocalPlayer.UserId),
			locale = localizationService.RobloxLocaleId,
			universeId = p2,
			source = p3,
			index = p4
		})
	end
end