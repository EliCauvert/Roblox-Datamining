local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local FriendsLandingUniversalAppWrapperModule = require(script.Parent.FriendsLandingUniversalAppWrapper)
local FriendsLandingNavigatorModule = require(CorePackages.Workspace.Packages.FriendsLanding.FriendsLandingNavigator)
local FFlagSignalsNavP3hMisc = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3hMisc
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local v1: (any) -> any = require(CorePackages.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).RoduxTools.compose(require(CorePackages.Packages.RoactRodux).connect(require(script.Parent.mapStateToProps), (require(script.Parent.mapDispatchToProps))), require(CorePackages.Workspace.Packages.RoactServices).RoactServices.connect({
	notificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
}))(function(p1)
	-- upvalues: RoactModule (copy), FriendsLandingUniversalAppWrapperModule (copy)
	return RoactModule.createElement(FriendsLandingUniversalAppWrapperModule, p1)
end)

if FFlagSignalsNavP3hMisc then
	local v2 = v1
	
	v1 = function(p1)
		-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), ReactModule (copy), v2 (copy), CryoModule (copy)
		local v3 = UseSignalState(GetLegacyNavigationStore(false).getCurrentPage)
		
		return ReactModule.createElement(v2, CryoModule.Dictionary.union(p1, { currentAppPage = v3 and v3.name }))
	end
end
local ClassWrapper = RoactModule.PureComponent:extend("ClassWrapper")

function ClassWrapper.render(p1)
	-- upvalues: RoactModule (copy), v1 (ref)
	return RoactModule.createElement(v1, p1.props)
end

ClassWrapper.router = FriendsLandingNavigatorModule.router

return ClassWrapper