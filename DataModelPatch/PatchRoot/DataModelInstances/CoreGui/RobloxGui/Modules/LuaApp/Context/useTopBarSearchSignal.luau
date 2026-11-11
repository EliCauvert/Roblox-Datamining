local ReactModule = require(game:GetService("CorePackages").Packages.React)
local TopBarSearchSignalContextModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Context.TopBarSearchSignalContext)

return function()
	-- upvalues: ReactModule (copy), TopBarSearchSignalContextModule (copy)
	local UseContextResult = ReactModule.useContext(TopBarSearchSignalContextModule.Context)
	
	return if UseContextResult then UseContextResult else nil
end