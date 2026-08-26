local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local useSelector = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle
local reactFocusNavigationModule = require(corePackagesService.Packages.ReactFocusNavigation)
local var1 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
local focusNavigationUtilsModule = require(corePackagesService.Workspace.Packages.FocusNavigationUtils)
local provider = focusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local parent = script.Parent.Parent
local colorsModule = require(parent.Colors)
local overlayComponentsModule = require(parent.Components.OverlayComponents)

local function selectOverlayComponent(p1)
	-- upvalues: overlayComponentsModule (ref)
	return overlayComponentsModule[p1.overlay.overlay]
end

local function selectOverlayProps(p1)
	return p1.overlay.overlayProps
end

return function(_)
	-- upvalues: useSelector (ref), selectOverlayComponent (ref), selectOverlayProps (ref), useStyle (ref), reactModule (ref), reactFocusNavigationModule (ref), var1 (ref), provider (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), colorsModule (ref)
	local var2 = useSelector(selectOverlayComponent)
	
	return reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var1 }, {
		FocusNavigationRegistryProvider = reactModule.createElement(provider, nil, {
			FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
				isIsolated = true,
				isAutoFocusRoot = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
			}, {
				OverlayContainer = reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = useStyle().Tokens.Color.Common.Scrim.Transparency,
					BackgroundColor3 = colorsModule.Black,
					Size = UDim2.fromScale(1, 1),
					Visible = var2 ~= nil
				}, {
					Overlay = var2 and reactModule.createElement(var2, useSelector(selectOverlayProps)) or nil
				})
			})
		})
	})
end