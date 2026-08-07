local corePackagesService = game:GetService("CorePackages")
local coreScriptsRootProvider = require(corePackagesService.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local focusRoot = require(corePackagesService.Workspace.Packages.FocusNavigationUtils).FocusRoot
local reactModule = require(corePackagesService.Packages.React)
local focusNavigableSurfaceIdentifierEnum = require(corePackagesService.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local deviceType = require(corePackagesService.Workspace.Packages.RobloxAppEnums).DeviceType

function OverscanWrapper(p0) --[[ line: 15 ]]
	-- upvalues: deviceType (ref), reactModule (ref), coreScriptsRootProvider (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	return function(p1) --[[ line: 16 ]]
		-- upvalues: deviceType (copy), reactModule (copy), coreScriptsRootProvider (copy), focusRoot (copy), focusNavigableSurfaceIdentifierEnum (copy), p0 (ref)
		return reactModule.createElement(coreScriptsRootProvider, { styleOverride = { deviceType = deviceType.Console } }, {
			FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
				isIsolated = true,
				isAutoFocusRoot = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
			}, { Overscan = reactModule.createElement(p0, p1) })
		})
	end
end

return OverscanWrapper