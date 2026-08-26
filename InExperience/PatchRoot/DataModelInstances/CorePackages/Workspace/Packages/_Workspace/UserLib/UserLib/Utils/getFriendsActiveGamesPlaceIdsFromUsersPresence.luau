local userLib = script:FindFirstAncestor("UserLib")
local parent = userLib.Parent
local userModule = require(userLib.Models.User)
local webPresenceMapModule = require(userLib.Enum.WebPresenceMap)
local convertUniverseIdToString = require(parent.SharedFlags).ConvertUniverseIdToString
game:DefineFastFlag("LuaAppFixActiveGameLoadingCheck", false)

return function(p1, p2)
	-- upvalues: convertUniverseIdToString (ref), webPresenceMapModule (ref), userModule (ref)
	local t = {}
	
	if game:GetFastFlag("LuaAppFixActiveGameLoadingCheck") and not p2:getState().UniversePlaceInfos then
		return t
	end
	for i, v in pairs(p1) do
		if webPresenceMapModule[v.userPresenceType] == userModule.PresenceType.IN_GAME and not p2:getState().UniversePlaceInfos[convertUniverseIdToString(v.universeId)] then
			table.insert(t, v.placeId)
		end
	end
	return t
end