local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local ItemCardFooter = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardFooter
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(script.Parent.useSettingsTileProps)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

local function selectDeviceOrientation(p1)
	return p1.DeviceOrientation
end

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensFunction (copy), UseSelectorFunction (copy), selectDeviceOrientation (copy), ResponsiveModule (copy), UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), ConstantsModule (copy), ItemCardFooter (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseSelectorResultMatch = UseSelectorFunction(selectDeviceOrientation) == ResponsiveModule.Keys.Portrait
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col align-x-left gap-small auto-xy clip",
		Size = if p1.squareAspectRatio then UDim2.fromOffset(p1.itemWidth, p1.itemWidth) else UDim2.fromOffset(p1.itemWidth, p1.itemWidth * 2),
		aspectRatio = {
			AspectRatio = if p1.squareAspectRatio then ConstantsModule.ItemTileSquareAspectRatio else ConstantsModule.ItemTileTallAspectRatio,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}
	}, {
		SettingsTileContent = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-full auto-xy radius-medium clip",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(p1.itemWidth, p1.itemWidth),
			onActivated = p1.onTileActivated,
			backgroundStyle = UseTokensResult.Color.Common.Shimmer,
			ref = Ref
		}, {
			SettingsTileIcon = ReactModule.createElement(FoundationModule.Icon, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				name = FoundationModule.Enums.IconName.PlusLarge,
				style = UseTokensResult.Color.Content.Muted,
				size = if IsUseSelectorResultMatch then FoundationModule.Enums.IconSize.Medium else FoundationModule.Enums.IconSize.Large
			}),
			Menu = ReactModule.createElement(FoundationModule.Menu, {
				isOpen = p1.isOpen,
				items = p1.items,
				size = if IsUseSelectorResultMatch then FoundationModule.Enums.InputSize.Medium else FoundationModule.Enums.InputSize.Large,
				onPressedOutside = p1.onPressedOutside,
				onActivated = p1.onMenuItemActivated,
				side = FoundationModule.Enums.PopoverSide.Right,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.3)
			})
		}),
		FooterSlot = ReactModule.createElement(ItemCardFooter, {
			LayoutOrder = 2,
			title = UseLocalizationFunction({ label = "Feature.Avatar.Label.AddEdit" }).label,
			titleTextSize = if IsUseSelectorResultMatch then UseTokensResult.Typography.BodySmall else nil
		})
	})
end)