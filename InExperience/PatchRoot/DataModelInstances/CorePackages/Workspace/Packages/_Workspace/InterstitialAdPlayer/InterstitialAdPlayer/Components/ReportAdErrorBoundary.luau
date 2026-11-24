local ReportAdErrorBoundary = require(script:FindFirstAncestor("InterstitialAdPlayer").Parent.React).Component:extend("ReportAdErrorBoundary")

function ReportAdErrorBoundary:getDerivedStateFromError()
	return { hasError = true }
end

function ReportAdErrorBoundary.init(p1)
	p1.state = { hasError = false }
end

function ReportAdErrorBoundary.componentDidCatch(p1)
	p1.props.onError()
end

function ReportAdErrorBoundary.render(p1)
	return if p1.state.hasError then nil else p1.props.children
end

return ReportAdErrorBoundary