local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local forwardErrorToScriptContextModule = require(genericAbuseReporting.BeduiV2.Analytics.forwardErrorToScriptContext)
local abuseReportErrorBoundary = require(genericAbuseReporting.Parent.React).Component:extend("AbuseReportErrorBoundary")

function abuseReportErrorBoundary.getDerivedStateFromError(_)
	return { hasError = true }
end

function abuseReportErrorBoundary.init(p1)
	p1.state = { hasError = false }
end

function abuseReportErrorBoundary.componentDidCatch(p1, p2, p3)
	-- upvalues: forwardErrorToScriptContextModule (ref)
	local onError = p1.props.onError
	
	if onError then
		onError(p2, p3)
	end
	forwardErrorToScriptContextModule(p2, if p3 then p3.componentStack else nil)
end

function abuseReportErrorBoundary.render(p1)
	local props = p1.props
	
	return if p1.state.hasError then props.fallback else props.children
end

return abuseReportErrorBoundary