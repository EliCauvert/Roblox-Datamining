local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local NavigationRoduxModule = require(Parent.NavigationRodux)
local RoactNavigationModule = require(Parent.RoactNavigation)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagSignalsNavP2NavigationPrimitives = require(Parent.SharedFlags).FFlagSignalsNavP2NavigationPrimitives
local NavigationCommands = if FFlagSignalsNavP2NavigationPrimitives then require(Parent.RobloxAppNavigation).NavigationCommands else nil

local function homeAction()
	-- upvalues: NavigationRoduxModule (copy), RoactNavigationModule (copy), AppPage (copy)
	local TempRnSwitchNavigatorName = NavigationRoduxModule.Constants.TempRnSwitchNavigatorName
	
	return RoactNavigationModule.Actions.navigate({
		routeName = TempRnSwitchNavigatorName,
		key = TempRnSwitchNavigatorName,
		action = RoactNavigationModule.Actions.navigate({ routeName = AppPage.Home, key = AppPage.Home })
	})
end

return function(Params, Callback: (any) -> ())
	-- upvalues: FFlagSignalsNavP2NavigationPrimitives (copy), NavigationCommands (copy), AppPage (copy), homeAction (copy), NavigationRoduxModule (copy), RoactNavigationModule (copy)
	if FFlagSignalsNavP2NavigationPrimitives then
		NavigationCommands.resetStack({
			{ routeName = AppPage.Home, key = AppPage.Home },
			NavigationCommands.fromLegacyPage(Params)
		}, {
			wrapAction = function(_, p1)
				-- upvalues: AppPage (upval), homeAction (upval)
				return if p1.routeName == AppPage.Home then homeAction() else nil
			end
		})
		
		return
	else
		Callback(NavigationRoduxModule.Thunks.RNAdapterThunk.new("NavigateToCommunityPage", function(p1, Callback: (any) -> ())
			-- upvalues: Params (copy), NavigationRoduxModule (upval), RoactNavigationModule (upval), homeAction (upval), AppPage (upval)
			if not p1:getState().Navigation.lockNavigationActions then
				local Params1 = { detail = Params.detail, extraProps = Params.extraProps }
				p1:dispatch(NavigationRoduxModule.Thunks.SetNavigationLocked(true))
				Callback(RoactNavigationModule.StackActions.reset({
					index = 2,
					actions = {
						homeAction(),
						RoactNavigationModule.Actions.navigate({ routeName = AppPage.Groups, params = Params1 })
					}
				}))
				
				return
			end
		end))
	end
end