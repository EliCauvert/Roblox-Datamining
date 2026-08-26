local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local argCheckModule = require(parent.ArgCheck)
local navigateDownModule = require(navigationRodux.Thunks.NavigateDown)
local appPage = require(parent.RobloxAppEnums).AppPage
local urlBuilder = require(parent.UrlBuilder).UrlBuilder

return function(p1)
	-- upvalues: argCheckModule (ref), navigateDownModule (ref), appPage (ref), urlBuilder (ref)
	argCheckModule.isTypeOrNil(p1, "function", "onClose")
	
	return navigateDownModule({
		name = appPage.SettingsSubPage,
		detail = urlBuilder.static.settings.privacy(),
		extraProps = {
			titleKey = "Feature.AccountSettings.Heading.Tab.Privacy",
			onClose = p1
		}
	})
end