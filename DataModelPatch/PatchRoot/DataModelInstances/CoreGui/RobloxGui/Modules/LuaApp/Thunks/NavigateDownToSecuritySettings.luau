local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)

return function(OnClose)
	-- upvalues: ArgCheckModule (copy), NavigateDownModule (copy), AppPageModule (copy), UrlBuilderModule (copy)
	ArgCheckModule.isTypeOrNil(OnClose, "function", "onClose")
	
	return NavigateDownModule({
		name = AppPageModule.SettingsSubPage,
		detail = UrlBuilderModule.static.settings.security(),
		extraProps = {
			titleKey = "Feature.AccountSettings.Heading.Tab.Security",
			onClose = OnClose
		}
	})
end