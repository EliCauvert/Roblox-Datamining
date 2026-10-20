local Parent = script:FindFirstAncestor("BugReporting").Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local _ = require(Parent.SystemInfoProtocol)
local _ = require(Parent.AppCommonLib)
local BugReporterModalModule = require(script.Parent.BugReporterModal)
local UseBugReporterModalPropsModule = require(script.Parent.useBugReporterModalProps)
local _ = require(script.Parent.BugReporterTypes)
local InAppBugReporterMinCommentLength = game:DefineFastInt("InAppBugReporterMinCommentLength", 15)

return function(p1)
	-- upvalues: UseBugReporterModalPropsModule (copy), DashModule (copy), InAppBugReporterMinCommentLength (copy), ReactModule (copy), BugReporterModalModule (copy)
	return ReactModule.createElement(BugReporterModalModule, (UseBugReporterModalPropsModule(DashModule.assign(p1, { minCommentLength = InAppBugReporterMinCommentLength }))))
end