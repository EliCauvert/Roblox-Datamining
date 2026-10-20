local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)

return function()
	-- upvalues: NavigateDownModule (copy), AppPageModule (copy)
	return NavigateDownModule({
		name = AppPageModule.AddFriendsPage,
		extraProps = {
			titleKey = "Feature.Friends.Feature.Friends.Heading.AddFriends"
		}
	})
end