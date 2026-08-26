local corePackagesService = game:GetService("CorePackages")
local coreScriptsRootProvider = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local focusRoot = require(corePackagesService.Workspace.Packages.FocusNavigationUtils).FocusRoot
local reactModule = require(corePackagesService.Packages.React)
local focusNavigableSurfaceIdentifierEnum = require(corePackagesService.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local deviceType = require(corePackagesService.Workspace.Packages.RobloxAppEnums).DeviceType

function OverscanWrapper(p1)
	-- upvalues: deviceType (ref), reactModule (ref), coreScriptsRootProvider (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	return function(p2)
		-- upvalues: deviceType (copy), reactModule (copy), coreScriptsRootProvider (copy), focusRoot (copy), focusNavigableSurfaceIdentifierEnum (copy), p1 (ref)
		return reactModule.createElement(coreScriptsRootProvider, { styleOverride = { deviceType = deviceType.Console } }, {
			FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
				isIsolated = true,
				isAutoFocusRoot = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
			}, { Overscan = reactModule.createElement(p1, p2) })
		})
	end
end

return OverscanWrapper