local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local screenshotFlowStepHandlerModule = require(script.Parent.ScreenshotFlowStepHandler)
local screenshotFlowStepHandlerContainer = reactModule.PureComponent:extend("ScreenshotFlowStepHandlerContainer")
local coreScriptsRootProvider = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum

function screenshotFlowStepHandlerContainer.render(p1)
	-- upvalues: reactModule (ref), coreScriptsRootProvider (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), screenshotFlowStepHandlerModule (ref)
	return reactModule.createElement(coreScriptsRootProvider, {}, {
		FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, {
			ScreenshotFlowStepHandlerContainer = reactModule.createElement(screenshotFlowStepHandlerModule, p1.props)
		})
	})
end

return screenshotFlowStepHandlerContainer