local playersService = game:GetService("Players")
local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local argCheckModule = require(parent.ArgCheck)
local fFlagLuaAppEdpBottomSheetPeekViewEvents = require(parent.SharedFlags).FFlagLuaAppEdpBottomSheetPeekViewEvents

return function(p0, p1, p2, p3, p4, p5)
	-- upvalues: argCheckModule (ref), fFlagLuaAppEdpBottomSheetPeekViewEvents (ref), playersService (ref), localizationService (ref)
	argCheckModule.isType(p1, "string", "eventName")
	argCheckModule.isType(p2, "string", "universeId")
	argCheckModule.isType(p3, "string", "source")
	argCheckModule.isType(p4, "number", "index")
	
	if fFlagLuaAppEdpBottomSheetPeekViewEvents and p5 ~= nil then
		argCheckModule.isType(p5, "string", "surface")
	end
	if playersService.LocalPlayer then
		p0:setRBXEventStream("GameDetailsPeekView", p1, {
			uid = tostring(playersService.LocalPlayer.UserId),
			locale = localizationService.RobloxLocaleId,
			universeId = p2,
			source = p3,
			index = p4,
			surface = if fFlagLuaAppEdpBottomSheetPeekViewEvents then p5 else nil
		})
	end
end