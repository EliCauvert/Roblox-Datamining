local NavigationRodux = script:FindFirstAncestor("NavigationRodux")
local Parent = NavigationRodux.Parent
local GetFFlagUseCommunitiesTranslationFunction = require(Parent.SharedFlags).GetFFlagUseCommunitiesTranslation
local NavigateDownModule = require(NavigationRodux.Thunks.NavigateDown)
local TModule = require(Parent.t)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder

return function(OnClose) --[[ Line: 14 ]]
	-- upvalues: TModule (copy), NavigateDownModule (copy), AppPage (copy), UrlBuilder (copy), GetFFlagUseCommunitiesTranslationFunction (copy)
	assert(TModule.callback(OnClose) or TModule.none(OnClose), "")
	
	return NavigateDownModule({
		name = AppPage.GenericWebPage,
		detail = UrlBuilder.static.groups(),
		extraProps = {
			titleKey = if GetFFlagUseCommunitiesTranslationFunction() then "CommonUI.Features.Label.Groups" else "CommonUI.Features.Label.sGroups",
			onClose = OnClose
		}
	})
end