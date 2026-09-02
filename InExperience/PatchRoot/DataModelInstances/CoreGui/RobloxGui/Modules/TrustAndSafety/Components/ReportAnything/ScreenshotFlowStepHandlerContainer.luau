local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local screenshotFlowStepHandlerModule = require(script.Parent.ScreenshotFlowStepHandler)
local renderWithCoreScriptsStyleProviderModule = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local screenshotFlowStepHandlerContainer = roactModule.PureComponent:extend("ScreenshotFlowStepHandlerContainer")

function screenshotFlowStepHandlerContainer.render(p1)
	-- upvalues: renderWithCoreScriptsStyleProviderModule (ref), roactModule (ref), screenshotFlowStepHandlerModule (ref)
	return renderWithCoreScriptsStyleProviderModule({
		ScreenshotFlowStepHandlerContainer = roactModule.createElement(screenshotFlowStepHandlerModule, p1.props)
	})
end

return screenshotFlowStepHandlerContainer