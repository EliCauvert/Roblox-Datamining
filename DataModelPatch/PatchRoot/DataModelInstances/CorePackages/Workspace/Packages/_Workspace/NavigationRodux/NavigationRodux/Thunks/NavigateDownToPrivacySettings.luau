local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local NavigateDownModule = require(NavigationRodux.Thunks.NavigateDown)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder

return function(OnClose)
	-- upvalues: ArgCheckModule (copy), NavigateDownModule (copy), AppPage (copy), UrlBuilder (copy)
	ArgCheckModule.isTypeOrNil(OnClose, "function", "onClose")
	
	return NavigateDownModule({
		name = AppPage.SettingsSubPage,
		detail = UrlBuilder.static.settings.privacy(),
		extraProps = {
			titleKey = "Feature.AccountSettings.Heading.Tab.Privacy",
			onClose = OnClose
		}
	})
end