local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local Provider = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local Parent = script.Parent.Parent
local ColorsModule = require(Parent.Colors)
local OverlayComponentsModule = require(Parent.Components.OverlayComponents)

local function selectOverlayComponent(p1)
	-- upvalues: OverlayComponentsModule (copy)
	return OverlayComponentsModule[p1.overlay.overlay]
end

local function selectOverlayProps(p1)
	return p1.overlay.overlayProps
end

return function(_)
	-- upvalues: UseSelectorFunction (copy), selectOverlayComponent (copy), selectOverlayProps (copy), UseStyleFunction (copy), ReactModule (copy), ReactFocusNavigationModule (copy), NewResult (copy), Provider (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), ColorsModule (copy)
	local UseSelectorResult = UseSelectorFunction(selectOverlayComponent)
	local UseSelectorResult1 = UseSelectorFunction(selectOverlayProps)
	
	return ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
		FocusNavigationRegistryProvider = ReactModule.createElement(Provider, nil, {
			FocusNavigationCoreScriptsWrapper = ReactModule.createElement(FocusRoot, {
				isIsolated = true,
				isAutoFocusRoot = true,
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
			}, {
				OverlayContainer = ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = UseStyleFunction().Tokens.Color.Common.Scrim.Transparency,
					BackgroundColor3 = ColorsModule.Black,
					Size = UDim2.fromScale(1, 1),
					Visible = UseSelectorResult ~= nil
				}, {
					Overlay = UseSelectorResult and ReactModule.createElement(UseSelectorResult, UseSelectorResult1) or nil
				})
			})
		})
	})
end