local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ScreenshotFlowStepHandlerModule = require(script.Parent.ScreenshotFlowStepHandler)
local ScreenshotFlowStepHandlerContainer = ReactModule.PureComponent:extend("ScreenshotFlowStepHandlerContainer")
local CoreScriptsRootProvider = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum

function ScreenshotFlowStepHandlerContainer.render(p1)
	-- upvalues: ReactModule (copy), CoreScriptsRootProvider (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), ScreenshotFlowStepHandlerModule (copy)
	return ReactModule.createElement(CoreScriptsRootProvider, {}, {
		FocusNavigationCoreScriptsWrapper = ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, {
			ScreenshotFlowStepHandlerContainer = ReactModule.createElement(ScreenshotFlowStepHandlerModule, p1.props)
		})
	})
end

return ScreenshotFlowStepHandlerContainer