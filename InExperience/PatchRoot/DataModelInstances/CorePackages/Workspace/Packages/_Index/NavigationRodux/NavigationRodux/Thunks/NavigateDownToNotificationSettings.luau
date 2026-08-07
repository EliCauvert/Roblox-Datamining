local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local argCheckModule = require(parent.ArgCheck)
local navigateDownModule = require(navigationRodux.Thunks.NavigateDown)
local appPage = require(parent.RobloxAppEnums).AppPage
local urlBuilder = require(parent.UrlBuilder).UrlBuilder

return function(p0) --[[ line: 12 ]]
	-- upvalues: argCheckModule (ref), navigateDownModule (ref), appPage (ref), urlBuilder (ref)
	argCheckModule.isTypeOrNil(p0, "function", "onClose")
	
	return navigateDownModule({
		name = appPage.SettingsSubPage,
		detail = urlBuilder.static.settings.notifications(),
		extraProps = {
			titleKey = "Feature.AccountSettings.Heading.Tab.Notifications",
			onClose = p0
		}
	})
end