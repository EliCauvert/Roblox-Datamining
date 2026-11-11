local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)

return function(p1)
	-- upvalues: NavigateDownModule (copy), AppPageModule (copy)
	return NavigateDownModule({
		extraProps = { postId = p1.postId, userId = p1.userId },
		name = AppPageModule.ContentFeed
	})
end