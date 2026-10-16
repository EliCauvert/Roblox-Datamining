local UserLib = script:FindFirstAncestor("UserLib")
local UserModule = require(UserLib.Models.User)
local WebPresenceMapModule = require(UserLib.Enum.WebPresenceMap)
local ConvertUniverseIdToStringFunction = require(UserLib.Parent.SharedFlags).ConvertUniverseIdToString
game:DefineFastFlag("LuaAppFixActiveGameLoadingCheck", false)

return function(List, p1) --[[ Line: 10 ]]
	-- upvalues: ConvertUniverseIdToStringFunction (copy), WebPresenceMapModule (copy), UserModule (copy)
	local List1 = {}
	
	if game:GetFastFlag("LuaAppFixActiveGameLoadingCheck") and not p1:getState().UniversePlaceInfos then
		return List1
	end
	for _, value in pairs(List) do
		local ConvertUniverseIdToStringResult = ConvertUniverseIdToStringFunction(value.universeId)
		
		if WebPresenceMapModule[value.userPresenceType] == UserModule.PresenceType.IN_GAME and not p1:getState().UniversePlaceInfos[ConvertUniverseIdToStringResult] then
			table.insert(List1, value.placeId)
		end
	end
	return List1
end