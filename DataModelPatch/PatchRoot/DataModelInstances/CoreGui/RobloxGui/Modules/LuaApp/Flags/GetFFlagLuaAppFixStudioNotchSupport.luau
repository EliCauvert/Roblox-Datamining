local FFlagLuaAppSupportDeviceSafeInsets = require(game:GetService("CorePackages").Workspace.Packages.SharedFlags).FFlagLuaAppSupportDeviceSafeInsets
game:DefineFastFlag("LuaAppFixStudioNotchSupport3", false)

return function()
	-- upvalues: FFlagLuaAppSupportDeviceSafeInsets (copy)
	return game:GetFastFlag("LuaAppFixStudioNotchSupport3") or FFlagLuaAppSupportDeviceSafeInsets
end