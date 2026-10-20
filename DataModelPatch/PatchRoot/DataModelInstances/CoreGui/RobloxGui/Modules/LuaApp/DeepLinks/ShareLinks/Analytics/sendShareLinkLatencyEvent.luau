local SocialStopwatchModule = require(game:GetService("CorePackages").Workspace.Packages.SocialStopwatch)
local EventNamesModule = require(script.Parent.EventNames)
local FireTelemetryModule = require(script.Parent.fireTelemetry)
local _ = require(script.Parent.Parent.LinkStatus)
local _ = require(script.Parent.Parent.ShareLinkTypes)

return function(LinkType, LinkStatus)
	-- upvalues: SocialStopwatchModule (copy), FireTelemetryModule (copy), EventNamesModule (copy)
	local StopResult = SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.ShareLinkOpened)
	FireTelemetryModule(EventNamesModule.ShareLinkLatency, {
		linkStatus = LinkStatus,
		linkType = LinkType,
		statValue = if StopResult then StopResult.timeElapsed else nil
	})
end