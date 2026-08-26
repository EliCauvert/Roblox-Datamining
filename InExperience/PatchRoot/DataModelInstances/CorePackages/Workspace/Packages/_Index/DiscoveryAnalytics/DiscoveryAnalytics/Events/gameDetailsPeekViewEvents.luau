local playersService = game:GetService("Players")
local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local argCheckModule = require(parent.ArgCheck)
local fFlagLuaAppEdpBottomSheetPeekViewEvents = require(parent.SharedFlags).FFlagLuaAppEdpBottomSheetPeekViewEvents

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: argCheckModule (ref), fFlagLuaAppEdpBottomSheetPeekViewEvents (ref), playersService (ref), localizationService (ref)
	argCheckModule.isType(p2, "string", "eventName")
	argCheckModule.isType(p3, "string", "universeId")
	argCheckModule.isType(p4, "string", "source")
	argCheckModule.isType(p5, "number", "index")
	
	if fFlagLuaAppEdpBottomSheetPeekViewEvents and p6 ~= nil then
		argCheckModule.isType(p6, "string", "surface")
	end
	if playersService.LocalPlayer then
		p1:setRBXEventStream("GameDetailsPeekView", p2, {
			uid = tostring(playersService.LocalPlayer.UserId),
			locale = localizationService.RobloxLocaleId,
			universeId = p3,
			source = p4,
			index = p5,
			surface = if fFlagLuaAppEdpBottomSheetPeekViewEvents then p6 else nil
		})
	end
end