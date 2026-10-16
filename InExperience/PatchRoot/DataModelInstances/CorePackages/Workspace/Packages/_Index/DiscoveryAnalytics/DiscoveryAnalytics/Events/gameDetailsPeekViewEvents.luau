local Players = game:GetService("Players")
local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local FFlagLuaAppEdpBottomSheetPeekViewEvents = require(Parent.SharedFlags).FFlagLuaAppEdpBottomSheetPeekViewEvents

return function(p1, p2, UniverseId, Source, Index, p3) --[[ Line: 8 ]]
	-- upvalues: ArgCheckModule (copy), FFlagLuaAppEdpBottomSheetPeekViewEvents (copy), Players (copy), LocalizationService (copy)
	ArgCheckModule.isType(p2, "string", "eventName")
	ArgCheckModule.isType(UniverseId, "string", "universeId")
	ArgCheckModule.isType(Source, "string", "source")
	ArgCheckModule.isType(Index, "number", "index")
	
	if FFlagLuaAppEdpBottomSheetPeekViewEvents and p3 ~= nil then
		ArgCheckModule.isType(p3, "string", "surface")
	end
	if Players.LocalPlayer then
		p1:setRBXEventStream("GameDetailsPeekView", p2, {
			uid = tostring(Players.LocalPlayer.UserId),
			locale = LocalizationService.RobloxLocaleId,
			universeId = UniverseId,
			source = Source,
			index = Index,
			surface = if FFlagLuaAppEdpBottomSheetPeekViewEvents then p3 else nil
		})
	end
end