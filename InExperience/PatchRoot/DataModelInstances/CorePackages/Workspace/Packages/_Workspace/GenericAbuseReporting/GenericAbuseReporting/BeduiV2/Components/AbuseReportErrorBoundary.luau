local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local forwardErrorToScriptContextModule = require(genericAbuseReporting.BeduiV2.Analytics.forwardErrorToScriptContext)
local abuseReportErrorBoundary = require(genericAbuseReporting.Parent.React).Component:extend("AbuseReportErrorBoundary")

function abuseReportErrorBoundary.getDerivedStateFromError(_) --[[ line: 36 ]]
	return { hasError = true }
end

function abuseReportErrorBoundary.init(p0) --[[ line: 40 ]]
	p0.state = { hasError = false }
end

function abuseReportErrorBoundary.componentDidCatch(p1, p2, p3) --[[ line: 44 ]]
	-- upvalues: forwardErrorToScriptContextModule (ref)
	local onError = p1.props.onError
	
	if onError then
		onError(p2, p3)
	end
	forwardErrorToScriptContextModule(p2, if p3 then p3.componentStack else nil)
end

function abuseReportErrorBoundary.render(p4) --[[ line: 53 ]]
	local props = p4.props
	
	return if p4.state.hasError then props.fallback else props.children
end

return abuseReportErrorBoundary