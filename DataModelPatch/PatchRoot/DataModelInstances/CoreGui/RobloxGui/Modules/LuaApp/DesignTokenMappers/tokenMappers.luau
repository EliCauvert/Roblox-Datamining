local CorePackages = game:GetService("CorePackages")
local EngagementScreenTokenMapper = require(CorePackages.Workspace.Packages.EngagementScreen).engagementScreenTokenMapper
local AbuseReportingTokenMapper = if require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAbuseReport10ft() then require(CorePackages.Workspace.Packages.AbuseReporting).abuseReportingTokenMapper else nil
local ExperienceDetailsTokenMapper = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.DesignTokenMappers.experienceDetailsTokenMapper
local MultiPageSignupTokenMapper = nil
local ActivationFrameworkTokenMapper = nil

if require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableMultiPageSignup() then
	MultiPageSignupTokenMapper = require(CorePackages.Workspace.Packages.MultiPageSignup).Components.MultiPageSignupTokenMapper
	ActivationFrameworkTokenMapper = require(CorePackages.Workspace.Packages.UserActivationFramework).Components.ActivationFrameworkTokenMapper
end
return {
	App = require(script.Parent.appTokenMapper),
	HomeOmniFeed = require(script.Parent.homeOmniFeedTokenMapper),
	Search = require(script.Parent.searchTokenMapper),
	SeeAll = require(script.Parent.seeAllTokenMapper),
	ExperienceDetails = ExperienceDetailsTokenMapper,
	EngagementScreen = EngagementScreenTokenMapper,
	LoginView = require(script.Parent.loginViewTokenMapper),
	SignUpView = require(script.Parent.signUpPageViewTokenMapper),
	AuthCompliance = require(script.Parent.complianceTokenMapper),
	LandingPage = require(script.Parent.landingPageTokenMapper),
	Layout = require(script.Parent.layoutTokenMapper),
	AbuseReporting = AbuseReportingTokenMapper,
	More = require(script.Parent.moreTokenMappers),
	CrossDeviceLogin = require(script.Parent.crossDeviceLoginTokenMapper),
	FriendsLanding = require(script.Parent.friendsLandingTokenMapper),
	GamepadDisconnect = require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadDisconnectTokenMapper,
	Banner = require(script.Parent.bannerTokenMapper),
	MultiPageSignup = MultiPageSignupTokenMapper,
	ActivationFramework = ActivationFrameworkTokenMapper
}