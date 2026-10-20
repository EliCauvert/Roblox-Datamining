local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local Birthday = require(game:GetService("CorePackages").Workspace.Packages.AuthCommon).Models.Birthday

return function(p1)
	-- upvalues: ArgCheckModule (copy), Birthday (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return function(p2)
		-- upvalues: ArgCheckModule (upval), p1 (copy), Birthday (upval), SetCentralOverlayModule (upval), OverlayTypeModule (upval)
		ArgCheckModule.isType(p1.onClose, "function", "props.onClose passed down to OpenCentralOverlayForSignUpBirthdayPicker")
		
		if p1.initialBirthday then
			ArgCheckModule.assert(Birthday.is(p1.initialBirthday), "props.initialBirthday passed down to OpenCentralOverlayForSignUpBirthdayPicker")
		end
		p2:dispatch(SetCentralOverlayModule(OverlayTypeModule.SignUpBirthdayPickerOverlay, p1))
	end
end