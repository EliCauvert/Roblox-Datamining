local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local VrCompatibilityModule = require(CorePackages.Workspace.Packages.VrCompatibility)
local VRConstants = VrCompatibilityModule.VRConstants
local VRPanelWidthIXP = VrCompatibilityModule.VRPanelWidthIXP
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local StyleModule = require(CorePackages.Workspace.Packages.Style)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local FullPageModal = require(CorePackages.Packages.UIBlox).App.Dialog.Modal.FullPageModal
local UseDesignTokensFunction = StyleModule.useDesignTokens
local MapTypographyVariantToFontEnumFunction = StyleModule.mapTypographyVariantToFontEnum
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagVRPanelWidthIXPEnabledFunction = SharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local FFlagLuaAppForceVrAppPanelWidthRollout = SharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), ArgCheckModule (copy), FFlagLuaAppForceVrAppPanelWidthRollout (copy), GetFFlagVRPanelWidthIXPEnabledFunction (copy), IxpUtilsModule (copy), VRPanelWidthIXP (copy), ReactModule (copy), FullPageModal (copy), VRConstants (copy), MapTypographyVariantToFontEnumFunction (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	ArgCheckModule.assert(false, "Report Dialog's title and body text have not been localized. This needs to be addressed before this feature is released.")
	local UseTestVariablesResult = if FFlagLuaAppForceVrAppPanelWidthRollout or not GetFFlagVRPanelWidthIXPEnabledFunction() then nil else IxpUtilsModule.useTestVariables(VRPanelWidthIXP.VrAppPanelWidthMultiplier)
	
	return ReactModule.createElement(FullPageModal, {
		title = "Reporting Coming Soon",
		onCloseClicked = p1.onClose,
		screenSize = if FFlagLuaAppForceVrAppPanelWidthRollout or not UseTestVariablesResult then VRConstants.MainScreenResolution else Vector2.new(VRConstants.MainScreenResolution.X * UseTestVariablesResult, VRConstants.MainScreenResolution.Y)
	}, {
		Texts = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			Layout = ReactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Padding = ReactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 15) }),
			PrimaryText = ReactModule.createElement("TextLabel", {
				Text = "Reporting is coming soon to this platform.",
				LayoutOrder = 1,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Font = MapTypographyVariantToFontEnumFunction(UseDesignTokensResult.Typography.TitleLarge),
				TextColor3 = UseDesignTokensResult.Color.Content.Emphasis.Color3,
				TextTransparency = UseDesignTokensResult.Color.Content.Emphasis.Transparency,
				TextSize = UseDesignTokensResult.Typography.TitleLarge.FontSize,
				TextXAlignment = Enum.TextXAlignment.Center,
				Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Typography.TitleLarge.FontSize)
			})
		})
	})
end