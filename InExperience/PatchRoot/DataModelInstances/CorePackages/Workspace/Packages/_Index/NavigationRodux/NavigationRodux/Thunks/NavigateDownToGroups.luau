local navigationRodux = script:FindFirstAncestor("NavigationRodux")
local parent = navigationRodux.Parent
local getFFlagUseCommunitiesTranslation = require(parent.SharedFlags).GetFFlagUseCommunitiesTranslation
local navigateDownModule = require(navigationRodux.Thunks.NavigateDown)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local urlBuilderModule = require(parent.UrlBuilder)
local tModule = require(parent.t)
local appPage = robloxAppEnumsModule.AppPage
local urlBuilder = urlBuilderModule.UrlBuilder

return function(p1)
	-- upvalues: tModule (ref), navigateDownModule (ref), appPage (ref), urlBuilder (ref), getFFlagUseCommunitiesTranslation (ref)
	assert(tModule.callback(p1) or tModule.none(p1), "")
	
	return navigateDownModule({
		name = appPage.GenericWebPage,
		detail = urlBuilder.static.groups(),
		extraProps = {
			titleKey = if getFFlagUseCommunitiesTranslation() then "CommonUI.Features.Label.Groups" else "CommonUI.Features.Label.sGroups",
			onClose = p1
		}
	})
end