local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local IconName = FoundationModule.Enums.IconName
local Emoji = UIBloxModule.App.Emoji.Enum.Emoji
local EmojiTextLabel = UIBloxModule.Core.Text.EmojiTextLabel
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local UncheckedBadgeModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.Common.UncheckedBadge)
local GetTextSizeFunction = require(CorePackages.Workspace.Packages.Style).GetTextSize
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagLuaAppEnableChartsPageProfileLink = SharedFlagsModule.FFlagLuaAppEnableChartsPageProfileLink
local FFlagLuaAppEnableMorePageProfileLink = SharedFlagsModule.FFlagLuaAppEnableMorePageProfileLink
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local FFlagHidePremiumIconography = SharedFlagsModule.FFlagHidePremiumIconography
local FFlagEnableLeftNavOnConsole = SharedFlagsModule.FFlagEnableLeftNavOnConsole
local FFlagEnableNonFlyoutUncheckedBadge = SharedFlagsModule.FFlagEnableNonFlyoutUncheckedBadge
local IconSize1 = UIBloxModule.App.ImageSet.getIconSize(UIBloxModule.App.ImageSet.Enum.IconSize.Small)
local IconsStatusPremiumSmall = UIBloxModule.App.ImageSet.Images["icons/status/premium_small"]

local function _(p1, p2)
	return p1 * p2.Config.UI.Scale
end

return function(p1)
	-- upvalues: FFlagLuaAppEnableChartsPageProfileLink (copy), FFlagLuaAppEnableMorePageProfileLink (copy), FFlagEnableLeftNavOnConsole (copy), GuiService (copy), UseTokensFunction (copy), IconSize1 (copy), FFlagEnableBlackbirdCheck (copy), FFlagHidePremiumIconography (copy), WithStyleFunction (copy), GetTextSizeFunction (copy), RoactModule (copy), FFlagEnableNonFlyoutUncheckedBadge (copy), LoadableImage (copy), EmojiTextLabel (copy), Emoji (copy), ImageSetLabel (copy), IconsStatusPremiumSmall (copy), Icon (copy), IconName (copy), IconSize (copy), View (copy), UncheckedBadgeModule (copy)
	local DisplayName = p1.displayName or "..."
	local Thumbnail = p1.thumbnail
	local IsPremium = p1.isPremium
	local IsVerified = p1.isVerified
	local LocalUserId = p1.localUserId
	
	local function v29()
		-- upvalues: p1 (copy), LocalUserId (copy), FFlagLuaAppEnableChartsPageProfileLink (upval), FFlagLuaAppEnableMorePageProfileLink (upval)
		p1.openLuaProfile(LocalUserId, {
			profilePeekViewProps = {
				resetPeekView = true,
				source = if FFlagLuaAppEnableChartsPageProfileLink or FFlagLuaAppEnableMorePageProfileLink then p1.source else nil
			}
		})
	end
	
	local Inverted: boolean = FFlagEnableLeftNavOnConsole and not GuiService:IsTenFootInterface()
	local UseTokensResult = UseTokensFunction()
	local ScaledScale = 36 * UseTokensResult.Config.UI.Scale
	local ScaledIconSize = IconSize1 * UseTokensResult.Config.UI.Scale
	local ScaledScale1 = 4 * UseTokensResult.Config.UI.Scale
	local Scale = UseTokensResult.Config.UI.Scale
	local Largest = math.max(240, 288 / (if Scale == 0 then 1 else Scale))
	local IsIsRobloxSubscriber = if FFlagEnableBlackbirdCheck then p1.isRobloxSubscriber == true else nil
	local NoIsIsRobloxSubscriber = not FFlagHidePremiumIconography and (if FFlagEnableBlackbirdCheck then IsPremium and not IsIsRobloxSubscriber else IsPremium)
	local NewScaledScale = ScaledScale + 8 * UseTokensResult.Config.UI.Scale
	local NewScaledIconSize = if NoIsIsRobloxSubscriber or FFlagEnableBlackbirdCheck and IsIsRobloxSubscriber then ScaledIconSize + ScaledScale1 else 0
	
	return WithStyleFunction(function(p2)
		-- upvalues: Largest (copy), NewScaledScale (copy), NewScaledIconSize (copy), GetTextSizeFunction (upval), DisplayName (copy), ScaledScale (copy), IsVerified (copy), RoactModule (upval), FFlagEnableNonFlyoutUncheckedBadge (upval), FFlagEnableLeftNavOnConsole (upval), Inverted (copy), v29 (copy), LoadableImage (upval), Thumbnail (copy), EmojiTextLabel (upval), NewScaledScale (copy), Emoji (upval), NoIsIsRobloxSubscriber (copy), ImageSetLabel (upval), IconsStatusPremiumSmall (upval), ScaledIconSize (copy), FFlagEnableBlackbirdCheck (upval), IsIsRobloxSubscriber (copy), Icon (upval), IconName (upval), IconSize (upval), UseTokensResult (copy), View (upval), UncheckedBadgeModule (upval)
		local HeaderFont = p2.Font.Header2.Font
		local ScaledBaseSize = p2.Font.BaseSize * p2.Font.Header2.RelativeSize
		local Color = p2.Theme.TextEmphasis.Color
		local Transparency = p2.Theme.TextEmphasis.Transparency
		local Color1 = p2.Theme.PlaceHolder.Color
		local Transparency1 = p2.Theme.PlaceHolder.Transparency
		local TextSize = GetTextSizeFunction(DisplayName, ScaledBaseSize, HeaderFont, Vector2.new(Largest - NewScaledScale - NewScaledIconSize, ScaledScale))
		local TextButton = RoactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Text = "",
			Size = UDim2.new(0, NewScaledScale + TextSize.X + NewScaledIconSize + (if IsVerified then ScaledBaseSize else 0), 0, ScaledScale),
			LayoutOrder = if FFlagEnableNonFlyoutUncheckedBadge then 1 else nil,
			[RoactModule.Event.Activated] = if FFlagEnableLeftNavOnConsole then if Inverted then v29 else nil else v29
		}, {
			Thumbnail = RoactModule.createElement(LoadableImage, {
				showFailedStateWhenLoadingFailed = true,
				useShimmerAnimationWhileLoading = true,
				BackgroundColor3 = Color1,
				BackgroundTransparency = Transparency1,
				Image = Thumbnail,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.fromScale(0, 0.5),
				Size = UDim2.fromOffset(ScaledScale, ScaledScale),
				cornerRadius = UDim.new(0.5, 0)
			}),
			DisplayName = IsVerified and RoactModule.createElement(EmojiTextLabel, {
				BackgroundTransparency = 1,
				fluidSizing = false,
				Text = DisplayName,
				TextTransparency = Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, NewScaledScale, 0.5, 0),
				fontStyle = p2.Font.Header2,
				colorStyle = p2.Theme.TextEmphasis,
				emoji = Emoji.Verified,
				maxSize = Vector2.new(TextSize.X + ScaledBaseSize, TextSize.Y)
			}) or RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Text = DisplayName,
				Font = HeaderFont,
				TextSize = ScaledBaseSize,
				TextColor3 = Color,
				TextTransparency = Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, NewScaledScale, 0.5, 0),
				Size = UDim2.fromOffset(TextSize.X, TextSize.Y)
			}),
			MembershipIcon = if NoIsIsRobloxSubscriber then RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Image = IconsStatusPremiumSmall,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.fromScale(1, 0.5),
				Size = UDim2.fromOffset(ScaledIconSize, ScaledIconSize),
				ImageColor3 = Color,
				ImageTransparency = Transparency
			}) elseif FFlagEnableBlackbirdCheck and IsIsRobloxSubscriber then RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.fromScale(1, 0.5),
				Size = UDim2.fromOffset(ScaledIconSize, ScaledIconSize)
			}, {
				Icon = RoactModule.createElement(Icon, {
					name = IconName.RobloxPlus,
					size = IconSize.Small,
					style = UseTokensResult.Color.Content.Emphasis
				})
			}) else nil
		})
		
		return if FFlagEnableNonFlyoutUncheckedBadge then RoactModule.createElement(View, { tag = "row align-y-center gap-small auto-xy" }, {
			NameButton = TextButton,
			UncheckedBadge = RoactModule.createElement(UncheckedBadgeModule, { layoutOrder = 2 })
		}) else TextButton
	end)
end