local Modules = game:GetService("CoreGui").RobloxGui.Modules
local OpenCentralOverlayForPeopleListModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForPeopleList)
local OpenProfilePeekViewModule = require(Modules.LuaApp.Thunks.OpenProfilePeekView)
local UserModel = require(game:GetService("CorePackages").Workspace.Packages.UserLib).Models.UserModel

local function v4(p1, p2)
	-- upvalues: UserModel (copy)
	local User = p1 and p1.Users[p2] or {}
	
	return User.presence == UserModel.PresenceType.IN_GAME and User.lastLocation
end

return function(p1, p2)
	-- upvalues: v4 (copy), OpenCentralOverlayForPeopleListModule (copy), OpenProfilePeekViewModule (copy)
	return function(p3)
		-- upvalues: p2 (copy), v4 (upval), p1 (copy), OpenCentralOverlayForPeopleListModule (upval), OpenProfilePeekViewModule (upval)
		local State = p3:getState()
		local UserInGame = p2.userInGame or v4
		
		if p2.openJoinable and p2.contextualMenuProps and UserInGame(State, p1) then
			p3:dispatch(OpenCentralOverlayForPeopleListModule(p2.contextualMenuProps))
			
			return
		else
			p3:dispatch(OpenProfilePeekViewModule(p1, p2.profilePeekViewProps))
		end
	end
end