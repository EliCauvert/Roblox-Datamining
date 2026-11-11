local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local SetIsLocalUserSoothsayerModule = require(Modules.LuaApp.Actions.SetIsLocalUserSoothsayer)
local UsersGetRolesModule = require(Modules.LuaApp.Http.Requests.UsersGetRoles)

return function(p1)
	-- upvalues: UsersGetRolesModule (copy), CryoModule (copy), SetIsLocalUserSoothsayerModule (copy)
	return function(p2)
		-- upvalues: UsersGetRolesModule (upval), p1 (copy), CryoModule (upval), SetIsLocalUserSoothsayerModule (upval)
		return UsersGetRolesModule(p1):andThen(function(Result)
			-- upvalues: CryoModule (upval), p2 (copy), SetIsLocalUserSoothsayerModule (upval)
			p2:dispatch(SetIsLocalUserSoothsayerModule(CryoModule.List.find(Result.responseBody.roles or {}, "Soothsayer") ~= nil))
		end)
	end
end