local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ScreenshotFlowStepHandlerModule = require(script.Parent.ScreenshotFlowStepHandler)
local RenderWithCoreScriptsStyleProviderModule = require(script.Parent.Parent.Parent.Parent.Common.renderWithCoreScriptsStyleProvider)
local ScreenshotFlowStepHandlerContainer = RoactModule.PureComponent:extend("ScreenshotFlowStepHandlerContainer")

function ScreenshotFlowStepHandlerContainer.render(p1)
	-- upvalues: RenderWithCoreScriptsStyleProviderModule (copy), RoactModule (copy), ScreenshotFlowStepHandlerModule (copy)
	return RenderWithCoreScriptsStyleProviderModule({
		ScreenshotFlowStepHandlerContainer = RoactModule.createElement(ScreenshotFlowStepHandlerModule, p1.props)
	})
end

return ScreenshotFlowStepHandlerContainer