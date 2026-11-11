local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local DependenciesModule = require(FriendsLanding.dependencies)
local Roact = DependenciesModule.Roact
local WithLocalizationFunction = DependenciesModule.withLocalization
local Actions = DependenciesModule.RoactNavigation.Actions
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local FriendsLandingHeaderBarPresentationalModule = require(script.FriendsLandingHeaderBarPresentational)
local AppHeaderBar = DependenciesModule.AppHeaderBar
local GetActiveChildNavigationOptionsSafelyModule = require(FriendsLanding.Navigator.getActiveChildNavigationOptionsSafely)
local FFlagEnableLeftNavOnConsole = DependenciesModule.FFlagEnableLeftNavOnConsole
local GuiService = DependenciesModule.GuiService
local FriendsLandingHeaderBar = Roact.PureComponent:extend("FriendsLandingHeaderBar")

function FriendsLandingHeaderBar.init(p1)
	-- upvalues: AppHeaderBar (copy), FFlagEnableLeftNavOnConsole (copy), GuiService (copy), Actions (copy)
	function p1.renderLeft(Navigation, _, _)
		-- upvalues: AppHeaderBar (upval), FFlagEnableLeftNavOnConsole (upval), GuiService (upval), Actions (upval)
		local MakeBackButtonFunction = AppHeaderBar.makeBackButton
		
		return if FFlagEnableLeftNavOnConsole and GuiService:IsTenFootInterface() then nil else MakeBackButtonFunction(function()
			-- upvalues: Navigation (copy), Actions (upval)
			Navigation.dispatch(Actions.back())
		end)
	end
end

function FriendsLandingHeaderBar.render(p1)
	-- upvalues: FriendsLandingContextModule (copy), GetActiveChildNavigationOptionsSafelyModule (copy), WithLocalizationFunction (copy), Roact (copy), FriendsLandingHeaderBarPresentationalModule (copy)
	return FriendsLandingContextModule.with(function(p2)
		-- upvalues: p1 (copy), GetActiveChildNavigationOptionsSafelyModule (upval), WithLocalizationFunction (upval), Roact (upval), FriendsLandingHeaderBarPresentationalModule (upval)
		local Navigation = p1.props.navigation
		local ActiveChildNavigationOptionsSafelyModule = GetActiveChildNavigationOptionsSafelyModule(Navigation)
		
		return WithLocalizationFunction({
			titleText = ActiveChildNavigationOptionsSafelyModule.headerText.raw
		})(function(p3)
			-- upvalues: p2 (copy), Roact (upval), FriendsLandingHeaderBarPresentationalModule (upval), ActiveChildNavigationOptionsSafelyModule (copy), p1 (upval), Navigation (copy)
			local TitleText = p3.titleText
			
			return if p2.addFriendsPageSearchbarEnabled then Roact.createElement(FriendsLandingHeaderBarPresentationalModule, {
				title = TitleText,
				renderLeft = ActiveChildNavigationOptionsSafelyModule.renderLeft or p1.renderLeft(Navigation),
				renderCenter = ActiveChildNavigationOptionsSafelyModule.renderCenter,
				renderRight = ActiveChildNavigationOptionsSafelyModule.renderRight,
				isSecondary = ActiveChildNavigationOptionsSafelyModule.useSecondaryHeader
			}) else Roact.createElement(FriendsLandingHeaderBarPresentationalModule, {
				title = TitleText,
				renderLeft = ActiveChildNavigationOptionsSafelyModule.renderLeft or p1.renderLeft(Navigation),
				renderCenter = ActiveChildNavigationOptionsSafelyModule.renderCenter,
				renderRight = ActiveChildNavigationOptionsSafelyModule.renderRight
			})
		end)
	end)
end

return FriendsLandingHeaderBar