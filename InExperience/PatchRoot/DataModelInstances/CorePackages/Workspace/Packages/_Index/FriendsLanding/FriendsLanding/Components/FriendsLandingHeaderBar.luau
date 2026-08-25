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

function friendsLandingHeaderBar.init(p0)
	-- upvalues: appHeaderBar (ref), fFlagEnableLeftNavOnConsole (ref), guiService (ref), actions (ref)
	function p0.renderLeft(p1, _, _)
		-- upvalues: appHeaderBar (copy), fFlagEnableLeftNavOnConsole (copy), guiService (copy), actions (copy)
		return if fFlagEnableLeftNavOnConsole and guiService:IsTenFootInterface() then nil else appHeaderBar.makeBackButton(function()
			-- upvalues: p1 (ref), actions (copy)
			p1.dispatch(actions.back())
		end)
	end
end

function friendsLandingHeaderBar.render(p2)
	-- upvalues: friendsLandingContextModule (ref), getActiveChildNavigationOptionsSafelyModule (ref), withLocalization (ref), roact (ref), friendsLandingHeaderBarPresentationalModule (ref)
	return friendsLandingContextModule.with(function(p3)
		-- upvalues: p2 (ref), getActiveChildNavigationOptionsSafelyModule (copy), withLocalization (copy), roact (copy), friendsLandingHeaderBarPresentationalModule (copy)
		local navigation = p2.props.navigation
		local var6 = getActiveChildNavigationOptionsSafelyModule(navigation)
		
		return withLocalization({ titleText = var6.headerText.raw })(function(p4)
			-- upvalues: p3 (ref), roact (copy), friendsLandingHeaderBarPresentationalModule (copy), var6 (ref), p2 (copy), navigation (ref)
			local titleText = p4.titleText
			
			return if p3.addFriendsPageSearchbarEnabled then roact.createElement(friendsLandingHeaderBarPresentationalModule, {
				title = titleText,
				renderLeft = var6.renderLeft or p2.renderLeft(navigation),
				renderCenter = var6.renderCenter,
				renderRight = var6.renderRight,
				isSecondary = var6.useSecondaryHeader
			}) else roact.createElement(friendsLandingHeaderBarPresentationalModule, {
				title = titleText,
				renderLeft = var6.renderLeft or p2.renderLeft(navigation),
				renderCenter = var6.renderCenter,
				renderRight = var6.renderRight
			})
		end)
	end)
end

return friendsLandingHeaderBar