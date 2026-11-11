local TModule = require(game:GetService("CorePackages").Packages.t)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)

return function(OnClose)
	-- upvalues: TModule (copy), NavigateDownModule (copy), AppPageModule (copy)
	assert(TModule.callback(OnClose) or TModule.none(OnClose))
	
	return NavigateDownModule({
		name = AppPageModule.Chat,
		extraProps = { onClose = OnClose }
	})
end