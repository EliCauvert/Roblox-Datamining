local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local JoinGameModule = require(Modules.LuaApp.Util.joinGame)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local _ = require(CorePackages.Workspace.Packages.PlayerContextualMenu)

return function(p1)
	-- upvalues: SetCentralOverlayModule (copy), OverlayTypeModule (copy), CryoModule (copy), JoinGameModule (copy)
	return function(p2)
		-- upvalues: SetCentralOverlayModule (upval), OverlayTypeModule (upval), CryoModule (upval), JoinGameModule (upval), p1 (copy)
		p2:dispatch(SetCentralOverlayModule(OverlayTypeModule.PlayerContextualMenu, CryoModule.Dictionary.join({
			joinExperience = function(Id, p3)
				-- upvalues: JoinGameModule (upval)
				JoinGameModule:ByUser({ id = Id }, p3)
			end
		}, p1)))
	end
end