local Parent = script.Parent
local Parent1 = Parent.Parent
local LoggingProtocolModule = require(Parent1.LoggingProtocol)
local ReactTreeCrashedConfigModule = require(Parent.ReactTreeCrashedConfig)
local ReportCaughtErrorModule = require(Parent.reportCaughtError)
local CoreScriptsErrorBoundary = require(Parent1.React).Component:extend("CoreScriptsErrorBoundary")

function CoreScriptsErrorBoundary:getDerivedStateFromError() --[[ Line: 23 ]]
	return { hasError = true }
end

function CoreScriptsErrorBoundary.init(p1) --[[ Line: 27 ]]
	p1.state = { hasError = false }
end

function CoreScriptsErrorBoundary.componentDidCatch(p1, p2, p3) --[[ Line: 31 ]]
	-- upvalues: LoggingProtocolModule (copy), ReactTreeCrashedConfigModule (copy), ReportCaughtErrorModule (copy)
	local Props = p1.props
	LoggingProtocolModule.default:logRobloxTelemetryCounter(ReactTreeCrashedConfigModule, 1, { surface = Props.surface })
	ReportCaughtErrorModule(p2, {
		surface = Props.surface,
		componentStack = p3 and p3.componentStack or nil
	})
end

function CoreScriptsErrorBoundary.render(p1) --[[ Line: 43 ]]
	return if p1.state.hasError then nil else p1.props.children
end

return CoreScriptsErrorBoundary