local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local ForwardErrorToScriptContextModule = require(GenericAbuseReporting.BeduiV2.Analytics.forwardErrorToScriptContext)
local AbuseReportErrorBoundary = require(GenericAbuseReporting.Parent.React).Component:extend("AbuseReportErrorBoundary")

function AbuseReportErrorBoundary:getDerivedStateFromError() --[[ Line: 36 ]]
	return { hasError = true }
end

function AbuseReportErrorBoundary.init(p1) --[[ Line: 40 ]]
	p1.state = { hasError = false }
end

function AbuseReportErrorBoundary.componentDidCatch(p1, p2, p3) --[[ Line: 44 ]]
	-- upvalues: ForwardErrorToScriptContextModule (copy)
	local OnErrorFunction: (any, any) -> () = p1.props.onError
	
	if OnErrorFunction then
		OnErrorFunction(p2, p3)
	end
	ForwardErrorToScriptContextModule(p2, p3 and p3.componentStack or nil)
end

function AbuseReportErrorBoundary.render(p1) --[[ Line: 53 ]]
	local Props = p1.props
	
	return if p1.state.hasError then Props.fallback else Props.children
end

return AbuseReportErrorBoundary