local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local ItemCardFooter = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardFooter
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(script.Parent.useSettingsTileProps)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)
local FFlagAXRootSlotBasedEditorFlag = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag

local function selectDeviceOrientation(p1)
	return p1.DeviceOrientation
end

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensFunction (copy), UseSelectorFunction (copy), selectDeviceOrientation (copy), ResponsiveModule (copy), FFlagAXRootSlotBasedEditorFlag (copy), UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), ConstantsModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ItemCardFooter (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseSelectorResultMatch = UseSelectorFunction(selectDeviceOrientation) == ResponsiveModule.Keys.Portrait
	local UseLocalizationResult = if FFlagAXRootSlotBasedEditorFlag then UseLocalizationFunction({ label = "Feature.Avatar.Label.AddEdit" }) else nil
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy clip",
		Size = if p1.squareAspectRatio then UDim2.fromOffset(p1.itemWidth, p1.itemWidth) else UDim2.fromOffset(p1.itemWidth, p1.itemWidth * 2)
	}, {
		AspectRatio = ReactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = if p1.squareAspectRatio then ConstantsModule.ItemTileSquareAspectRatio else ConstantsModule.ItemTileTallAspectRatio,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}),
		ItemCardFooterLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, UseTokensResult.Gap.Small)
		}),
		SettingsTileContent = ReactModule.createElement(FoundationModule.View, {
			tag = "clip auto-xy size-full-full",
			Size = UDim2.fromOffset(p1.itemWidth, p1.itemWidth),
			cornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Radius.Medium else UseTokensResult.Semantic.Radius.Medium),
			onActivated = p1.onActivated,
			backgroundStyle = if FFlagRenameDeprecatedUIBloxTokens then UseTokensResult.Color.Common.Shimmer else UseTokensResult.Semantic.Color.Common.Placeholder,
			ref = Ref,
			LayoutOrder = if FFlagAXRootSlotBasedEditorFlag then 1 else nil
		}, {
			SettingsTileIcon = ReactModule.createElement(FoundationModule.Icon, {
				name = "icons/common/plus",
				style = UseTokensResult.Color.Content.Muted,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			})
		}),
		FooterSlot = if FFlagAXRootSlotBasedEditorFlag then ReactModule.createElement(ItemCardFooter, {
			LayoutOrder = 2,
			title = UseLocalizationResult.label,
			titleTextSize = if IsUseSelectorResultMatch then UseTokensResult.Typography.BodySmall else nil
		}) else nil
	})
end)