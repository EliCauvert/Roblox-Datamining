local Parent = script:FindFirstAncestor("GameInvite").Parent
local UserModel = require(Parent.UserLib).Models.UserModel
local IsInThisServerModule = require(script.Parent.isInThisServer)
local InGame = require(Parent.DataHydration).Presence.PresenceEnums.PresenceType.InGame

return function(p1, p2, p3): boolean --[[ Line: 15 | Named "isJoinExpected" ]]
	-- upvalues: InGame (copy), IsInThisServerModule (copy), UserModel (copy)
	return if p1 == nil then p2 == nil or p2.presence == UserModel.PresenceType.IN_GAME else p1.userPresenceType == InGame and not IsInThisServerModule(p1, p3)
end