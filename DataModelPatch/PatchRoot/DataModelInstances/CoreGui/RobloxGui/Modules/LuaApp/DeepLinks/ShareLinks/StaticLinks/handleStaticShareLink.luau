local CorePackages = game:GetService("CorePackages")
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local CryoModule = require(CorePackages.Packages.Cryo)
local SocialStopwatchModule = require(CorePackages.Workspace.Packages.SocialStopwatch)
local _ = require(CorePackages.Workspace.Packages.NavigationRodux)
local Parent = script.Parent
local Parent1 = Parent.Parent
local EventNamesModule = require(Parent1.Analytics.EventNames)
local FireTelemetryModule = require(Parent1.Analytics.fireTelemetry)
local StaticLinkTypeToHandlerMapModule = require(Parent.StaticLinkTypeToHandlerMap)
local StaticShareLinkTypesModule = require(Parent.StaticShareLinkTypes)
local _ = require(Parent1.Types)
local config = {
	c = StaticShareLinkTypesModule.Asset,
	b = StaticShareLinkTypesModule.Bundle,
	e = StaticShareLinkTypesModule.ExperienceDetails,
	g = StaticShareLinkTypesModule.Group,
	l = StaticShareLinkTypesModule.Look,
	s = StaticShareLinkTypesModule.Server,
	u = StaticShareLinkTypesModule.UserProfile
}
local list = {
	{
		{ name = AppPage.Home },
		{ name = AppPage.ShareLinkInvalidModal }
	}
}

return function(p1, LinkId, ExtraProps, p2)
	-- upvalues: SocialStopwatchModule (copy), config (copy), StaticShareLinkTypesModule (copy), StaticLinkTypeToHandlerMapModule (copy), list (copy), FireTelemetryModule (copy), EventNamesModule (copy), CryoModule (copy)
	SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.StaticShareLinkOpened)
	local Entry = config[p1] or StaticShareLinkTypesModule.Unknown
	local config1 = {
		didSucceed = true,
		extraProps = ExtraProps,
		linkId = LinkId,
		staticLinkType = Entry
	}
	local v1 = StaticLinkTypeToHandlerMapModule[Entry](LinkId, ExtraProps, p2)
	
	if not v1 then
		config1.didSucceed = false
		v1 = list
	end
	FireTelemetryModule(EventNamesModule.StaticShareLinkResolveLink, config1)
	local StopResult = SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.StaticShareLinkOpened)
	
	if StopResult then
		FireTelemetryModule(EventNamesModule.StaticShareLinkLatency, CryoModule.Dictionary.union(config1, { statValue = StopResult.timeElapsed }))
	end
	return v1
end