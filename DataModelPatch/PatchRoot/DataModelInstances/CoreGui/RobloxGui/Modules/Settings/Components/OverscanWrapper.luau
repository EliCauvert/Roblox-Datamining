local CorePackages = game:GetService("CorePackages")
local CoreScriptsRootProvider = require(CorePackages.Workspace.Packages.CoreScriptsRoactCommon).CoreScriptsRootProvider
local FocusRoot = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusRoot
local ReactModule = require(CorePackages.Packages.React)
local FocusNavigableSurfaceIdentifierEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local DeviceType = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceType

function OverscanWrapper(p1)
	-- upvalues: DeviceType (copy), ReactModule (copy), CoreScriptsRootProvider (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	return function(p2)
		-- upvalues: DeviceType (upval), ReactModule (upval), CoreScriptsRootProvider (upval), FocusRoot (upval), FocusNavigableSurfaceIdentifierEnum (upval), p1 (copy)
		return ReactModule.createElement(CoreScriptsRootProvider, { styleOverride = { deviceType = DeviceType.Console } }, {
			FocusNavigationCoreScriptsWrapper = ReactModule.createElement(FocusRoot, {
				isIsolated = true,
				isAutoFocusRoot = true,
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
			}, { Overscan = ReactModule.createElement(p1, p2) })
		})
	end
end

return OverscanWrapper