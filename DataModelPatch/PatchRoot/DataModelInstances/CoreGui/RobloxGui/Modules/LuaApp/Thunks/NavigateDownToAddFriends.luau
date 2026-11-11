local TModule = require(game:GetService("CorePackages").Packages.t)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)

return function(OnClose)
	-- upvalues: TModule (copy), NavigateDownModule (copy), AppPageModule (copy), UrlBuilderModule (copy)
	assert(TModule.callback(OnClose) or TModule.none(OnClose))
	
	return NavigateDownModule({
		name = AppPageModule.GenericWebPage,
		detail = UrlBuilderModule.static.friends(),
		extraProps = {
			titleKey = "CommonUI.Features.Label.Friends",
			onClose = OnClose,
			searchParams = { searchType = "Players" }
		}
	})
end