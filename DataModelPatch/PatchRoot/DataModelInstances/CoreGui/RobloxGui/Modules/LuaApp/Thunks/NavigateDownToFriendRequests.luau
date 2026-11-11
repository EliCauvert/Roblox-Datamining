local TModule = require(game:GetService("CorePackages").Packages.t)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UrlModule = require(Modules.LuaApp.Http.Url)
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)

return function(OnClose)
	-- upvalues: TModule (copy), NavigateDownModule (copy), AppPageModule (copy), UrlModule (copy)
	assert(TModule.callback(OnClose) or TModule.none(OnClose))
	
	return NavigateDownModule({
		name = AppPageModule.GenericWebPage,
		detail = string.format("%susers/friends#!/friend-requests", UrlModule.BASE_URL),
		extraProps = {
			titleKey = "CommonUI.Features.Label.Friends",
			onClose = OnClose,
			searchParams = { searchType = "Players" }
		}
	})
end