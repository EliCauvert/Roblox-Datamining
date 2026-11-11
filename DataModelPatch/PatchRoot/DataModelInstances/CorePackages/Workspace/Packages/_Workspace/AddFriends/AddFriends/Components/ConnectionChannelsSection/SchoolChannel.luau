local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local SchoolEntryTooltipContainer = require(Parent.Schools).Components.SchoolEntryTooltipContainer
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Contexts = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts
local EventNames = require(AddFriends.Analytics).EventNames

return function(p1)
	-- upvalues: ReactModule (copy), UseNavigationFunction (copy), EventNames (copy), AppPage (copy), Contexts (copy), UseLocalizationFunction (copy), SchoolEntryTooltipContainer (copy)
	local Component = p1.component
	local ComponentUIProps = p1.componentUIProps
	local FireAnalyticsEventFunction = p1.fireAnalyticsEvent
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, {})
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Tile = ReactModule.createElement(Component, {
			icon = "icons/menu/education",
			title = UseLocalizationFunction({ schoolTitle = "Feature.AddFriends.Label.SchoolTile" }).schoolTitle,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), UseRefResult (copy), UseNavigationResult (copy), AppPage (upval), Contexts (upval)
				FireAnalyticsEventFunction(EventNames.SchoolBtnClick)
				local CurrentFunction: () -> () = UseRefResult.current
				
				if CurrentFunction then
					CurrentFunction()
				end
				UseNavigationResult.navigate(AppPage.Schools, { extraProps = { source = Contexts.AddFriends } })
			end, { FireAnalyticsEventFunction, UseNavigationResult }),
			onMounted = ReactModule.useCallback(function()
				-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval)
				FireAnalyticsEventFunction(EventNames.SchoolBtnImpression)
			end, { FireAnalyticsEventFunction }),
			ref = UseResult,
			componentUIProps = ComponentUIProps
		}),
		Tooltip = ReactModule.createElement(SchoolEntryTooltipContainer, {
			anchorRef = ReactModule.useMemo(function()
				-- upvalues: UseStateResult (copy)
				return { current = UseStateResult }
			end, { UseStateResult }),
			dismissTooltipRef = UseRefResult
		})
	})
end