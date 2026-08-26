local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local roact = dependenciesModule.Roact
local withLocalization = dependenciesModule.withLocalization
local actions = dependenciesModule.RoactNavigation.Actions
local friendsLandingContextModule = require(friendsLanding.FriendsLandingContext)
local friendsLandingHeaderBarPresentationalModule = require(script.FriendsLandingHeaderBarPresentational)
local appHeaderBar = dependenciesModule.AppHeaderBar
local getActiveChildNavigationOptionsSafelyModule = require(friendsLanding.Navigator.getActiveChildNavigationOptionsSafely)
local fFlagEnableLeftNavOnConsole = dependenciesModule.FFlagEnableLeftNavOnConsole
local guiService = dependenciesModule.GuiService
local friendsLandingHeaderBar = roact.PureComponent:extend("FriendsLandingHeaderBar")

function friendsLandingHeaderBar.init(p1)
	-- upvalues: appHeaderBar (ref), fFlagEnableLeftNavOnConsole (ref), guiService (ref), actions (ref)
	function p0.renderLeft(p2, _, _)
		-- upvalues: appHeaderBar (copy), fFlagEnableLeftNavOnConsole (copy), guiService (copy), actions (copy)
		return if fFlagEnableLeftNavOnConsole and guiService:IsTenFootInterface() then nil else appHeaderBar.makeBackButton(function()
			-- upvalues: p2 (ref), actions (copy)
			p2.dispatch(actions.back())
		end)
	end
end

function friendsLandingHeaderBar.render(p1)
	-- upvalues: friendsLandingContextModule (ref), getActiveChildNavigationOptionsSafelyModule (ref), withLocalization (ref), roact (ref), friendsLandingHeaderBarPresentationalModule (ref)
	return friendsLandingContextModule.with(function(p2)
		-- upvalues: p1 (ref), getActiveChildNavigationOptionsSafelyModule (copy), withLocalization (copy), roact (copy), friendsLandingHeaderBarPresentationalModule (copy)
		local navigation = p1.props.navigation
		local var1 = getActiveChildNavigationOptionsSafelyModule(navigation)
		
		return withLocalization({ titleText = var1.headerText.raw })(function(p3)
			-- upvalues: p2 (ref), roact (copy), friendsLandingHeaderBarPresentationalModule (copy), var1 (ref), p1 (copy), navigation (ref)
			local titleText = p3.titleText
			
			return if p2.addFriendsPageSearchbarEnabled then roact.createElement(friendsLandingHeaderBarPresentationalModule, {
				title = titleText,
				renderLeft = var1.renderLeft or p1.renderLeft(navigation),
				renderCenter = var1.renderCenter,
				renderRight = var1.renderRight,
				isSecondary = var1.useSecondaryHeader
			}) else roact.createElement(friendsLandingHeaderBarPresentationalModule, {
				title = titleText,
				renderLeft = var1.renderLeft or p1.renderLeft(navigation),
				renderCenter = var1.renderCenter,
				renderRight = var1.renderRight
			})
		end)
	end)
end

return friendsLandingHeaderBar