local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local CompactInlineBannerPlacementModule = require(Modules.AvatarExperience.Common.Enum.CompactInlineBannerPlacement)
local CompactInlineBannerVariantModule = require(Modules.AvatarExperience.Common.Enum.CompactInlineBannerVariant)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), CompactInlineBannerPlacementModule (copy), CompactInlineBannerVariantModule (copy), CryoModule (copy), Icon (copy), IconSize (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UnionResult = CryoModule.Dictionary.union(ReactModule.useMemo(function()
		-- upvalues: CompactInlineBannerPlacementModule (upval), CompactInlineBannerVariantModule (upval), UseTokensResult (copy)
		return {
			visible = true,
			placement = CompactInlineBannerPlacementModule.Bleed,
			variant = CompactInlineBannerVariantModule.Default,
			margin = UseTokensResult.Margin.Small
		}
	end, { UseTokensResult }), p1)
	local Variant = UnionResult.variant
	local Margin: number = UnionResult.margin
	local IsPlacementMatch = UnionResult.placement == CompactInlineBannerPlacementModule.Inline
	local config = {
		[CompactInlineBannerVariantModule.Default] = UseTokensResult.Color.Shift.Shift_100,
		[CompactInlineBannerVariantModule.Success] = UseTokensResult.Color.System.Success,
		[CompactInlineBannerVariantModule.Alert] = UseTokensResult.Color.System.Alert
	}
	local config1 = {
		[CompactInlineBannerVariantModule.Default] = "icons/actions/info_small",
		[CompactInlineBannerVariantModule.Success] = "icons/status/success_small",
		[CompactInlineBannerVariantModule.Alert] = "icons/status/alert_small"
	}
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = ({
			[CompactInlineBannerVariantModule.Default] = config[CompactInlineBannerVariantModule.Default].Transparency,
			[CompactInlineBannerVariantModule.Success] = 0.8,
			[CompactInlineBannerVariantModule.Alert] = 0.8
		})[Variant],
		BackgroundColor3 = config[Variant].Color3,
		Visible = UnionResult.visible,
		Size = UDim2.new(1, if IsPlacementMatch then -2 * Margin else 0, 0, 0),
		Position = UDim2.new(0, if IsPlacementMatch then Margin else 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UILayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseTokensResult.Gap.Medium)
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, if IsPlacementMatch then UseTokensResult.Padding.Medium else Margin),
			PaddingRight = UDim.new(0, if IsPlacementMatch then UseTokensResult.Padding.Small else Margin),
			PaddingTop = UDim.new(0, UseTokensResult.Padding.Small),
			PaddingBottom = UDim.new(0, UseTokensResult.Padding.Small)
		}),
		UICorner = if IsPlacementMatch then ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
		}) else nil,
		Icon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			style = ({
				[CompactInlineBannerVariantModule.Default] = UseTokensResult.Color.Content.Default,
				[CompactInlineBannerVariantModule.Success] = UseTokensResult.Color.System.Success,
				[CompactInlineBannerVariantModule.Alert] = UseTokensResult.Color.System.Alert
			})[Variant],
			name = UnionResult.iconImage or config1[Variant],
			size = IconSize.Small
		}),
		TextView = ReactModule.createElement(View, {
			tag = "auto-y grow padding-right-xsmall",
			LayoutOrder = 2,
			Size = UDim2.fromScale(0, 0)
		}, {
			ContentText = ReactModule.createElement(Text, {
				TextWrapped = true,
				textStyle = UseTokensResult.Color.Content.Emphasis,
				fontStyle = UseTokensResult.Typography.CaptionLarge,
				Text = UnionResult.contentText,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_800)
			})
		}),
		Button = UnionResult.actionText ~= nil and UnionResult.onActivated ~= nil and ReactModule.createElement(Button, {
			LayoutOrder = 3,
			text = UnionResult.actionText,
			onActivated = UnionResult.onActivated,
			variant = ButtonVariant.Link,
			size = ButtonSize.XSmall
		})
	})
end