local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local VerifiedBadgesModule = require(CorePackages.Workspace.Packages.VerifiedBadges)
local IsPlayerVerifiedFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.isPlayerVerified
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local Text = require(CorePackages.Workspace.Packages.AppCommonLib).Text
local FoundationModule = require(CorePackages.Packages.Foundation)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UseTokens = FoundationModule.Hooks.useTokens
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagLuaAppMoveProfileIntoTopBar = SharedFlagsModule.FFlagLuaAppMoveProfileIntoTopBar
local FFlagEnableNonFlyoutUncheckedBadge = SharedFlagsModule.FFlagEnableNonFlyoutUncheckedBadge
local FixUsernameSelectionStuck = FFlagEnableNonFlyoutUncheckedBadge and game:DefineFastFlag("FixUsernameSelectionStuck", false)
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local FFlagHidePremiumIconography = SharedFlagsModule.FFlagHidePremiumIconography
local GetFFlagFixUserInfoWidgetPlusBadgeFunction = SharedFlagsModule.GetFFlagFixUserInfoWidgetPlusBadge
local GetFFlagFixUserInfoSelectionModule = require(Modules.LuaApp.Flags.GetFFlagFixUserInfoSelection)
local UncheckedBadgeModule = require(Modules.LuaApp.Components.Common.UncheckedBadge)
local UserWidget: (any) -> any = RoactModule.PureComponent:extend("UserWidget")
local config = {
	[Enum.MembershipType.None] = 0,
	[Enum.MembershipType.BuildersClub] = 24,
	[Enum.MembershipType.TurboBuildersClub] = 24,
	[Enum.MembershipType.OutrageousBuildersClub] = 24,
	[Enum.MembershipType.Premium] = 36
}

function UserWidget:renderUserAvatar(XOffset, Color, Transparency, LocalUserModel)
	-- upvalues: GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), RoactModule (copy), LoadableImage (copy)
	return RoactModule.createElement(LoadableImage, {
		LayoutOrder = 1,
		useShimmerAnimationWhileLoading = true,
		shouldHandleReloads = true,
		Size = UDim2.new(0, XOffset, 0, XOffset),
		BackgroundColor3 = Color,
		BackgroundTransparency = Transparency,
		Image = GetStandardSizeAvatarHeadShotRbxthumbFunction(LocalUserModel.id),
		cornerRadius = UDim.new(0.5, 0)
	})
end

function UserWidget.render(p1)
	-- upvalues: FFlagLuaAppMoveProfileIntoTopBar (copy), GetFFlagFixUserInfoWidgetPlusBadgeFunction (copy), FFlagEnableBlackbirdCheck (copy), FFlagHidePremiumIconography (copy), config (copy), Text (copy), RoactModule (copy), VerifiedBadgesModule (copy), IsPlayerVerifiedFunction (copy), Players (copy), FixUsernameSelectionStuck (copy), Icon (copy), IconName (copy), IconSize (copy), FFlagEnableNonFlyoutUncheckedBadge (copy), GetFFlagFixUserInfoSelectionModule (copy), View (copy), UncheckedBadgeModule (copy), WithStyleFunction (copy)
	local LocalUserModel = p1.props.localUserModel
	local OnActivated = p1.props.onActivated
	local LayoutOrder = p1.props.layoutOrder
	local SideMargin = p1.props.sideMargin
	local ShouldOnlyDisplayAvatarIcon = if FFlagLuaAppMoveProfileIntoTopBar then p1.props.shouldOnlyDisplayAvatarIcon else nil
	local OnlyAvatarButtonRef = if FFlagLuaAppMoveProfileIntoTopBar then p1.props.onlyAvatarButtonRef else nil
	
	if LocalUserModel == nil then
		return nil
	else
		local ThumbnailSize = if p1.props.thumbnailSize then p1.props.thumbnailSize else 36
		local DisplayName = if p1.props.enableDisplayNamePolicy then LocalUserModel.displayName else LocalUserModel.name
		local Membership = LocalUserModel.membership
		local IsHasRobloxSubscription = if GetFFlagFixUserInfoWidgetPlusBadgeFunction() and FFlagEnableBlackbirdCheck then LocalUserModel.hasRobloxSubscription == true else nil
		local NoIsHasRobloxSubscription: boolean = if GetFFlagFixUserInfoWidgetPlusBadgeFunction() then not FFlagHidePremiumIconography and (Membership == Enum.MembershipType.Premium and not IsHasRobloxSubscription) else Membership == Enum.MembershipType.Premium
		
		return WithStyleFunction(function(p2)
			-- upvalues: p1 (copy), GetFFlagFixUserInfoWidgetPlusBadgeFunction (upval), NoIsHasRobloxSubscription (copy), IsHasRobloxSubscription (copy), config (upval), Membership (copy), Text (upval), DisplayName (ref), RoactModule (upval), VerifiedBadgesModule (upval), IsPlayerVerifiedFunction (upval), Players (upval), OnActivated (copy), FixUsernameSelectionStuck (upval), Icon (upval), IconName (upval), IconSize (upval), ThumbnailSize (copy), FFlagEnableNonFlyoutUncheckedBadge (upval), FFlagLuaAppMoveProfileIntoTopBar (upval), OnlyAvatarButtonRef (copy), GetFFlagFixUserInfoSelectionModule (upval), ShouldOnlyDisplayAvatarIcon (copy), LocalUserModel (copy), View (upval), LayoutOrder (copy), SideMargin (copy), UncheckedBadgeModule (upval)
			local _Font = p2.Font
			local Theme = p2.Theme
			local UsernameTextFont = if p1.props.usernameTextFont then p1.props.usernameTextFont else _Font.Header1
			local UsernameTextStyle = if p1.props.usernameTextStyle then p1.props.usernameTextStyle else Theme.TextEmphasis
			local UsernameTextFontFont = UsernameTextFont.Font
			local FontSize = if UsernameTextFont.FontSize then UsernameTextFont.FontSize else _Font.BaseSize * UsernameTextFont.RelativeSize
			local Entry = if GetFFlagFixUserInfoWidgetPlusBadgeFunction() then (NoIsHasRobloxSubscription or IsHasRobloxSubscription) and config[Enum.MembershipType.Premium] or 0 elseif Membership == nil then 0 else config[Membership] or 0
			local Color = Theme.PlaceHolder.Color
			local Transparency = Theme.PlaceHolder.Transparency
			local TextBounds = Text.GetTextBounds(DisplayName, UsernameTextFontFont, FontSize, Vector2.new(10000, 10000))
			local Element = RoactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
				layoutOrder = 2,
				size = UDim2.fromScale(0, 0),
				emoji = if IsPlayerVerifiedFunction(Players.LocalPlayer) then VerifiedBadgesModule.emoji.verified elseif NoIsHasRobloxSubscription then VerifiedBadgesModule.emoji.premium else "",
				color = if NoIsHasRobloxSubscription then Theme.TextEmphasis.Color else nil,
				onActivated = OnActivated
			}, {
				UsernameText = RoactModule.createElement("TextButton", {
					Size = UDim2.new(0, TextBounds.X, 0, TextBounds.Y),
					BackgroundTransparency = 1,
					TextSize = FontSize,
					TextColor3 = UsernameTextStyle.Color,
					TextTransparency = UsernameTextStyle.Transparency,
					TextTruncate = Enum.TextTruncate.None,
					Font = UsernameTextFontFont,
					Text = DisplayName,
					TextXAlignment = Enum.TextXAlignment.Left,
					[RoactModule.Event.Activated] = if FixUsernameSelectionStuck then nil else OnActivated,
					Selectable = not FixUsernameSelectionStuck and OnActivated ~= nil
				})
			})
			local Element1 = if GetFFlagFixUserInfoWidgetPlusBadgeFunction() and IsHasRobloxSubscription then RoactModule.createElement(Icon, {
				LayoutOrder = 3,
				name = IconName.RobloxPlus,
				size = IconSize.Small,
				style = p1.props.foundationTokens.Color.Content.Emphasis
			}) else nil
			local TextButton = RoactModule.createElement("TextButton", {
				Size = UDim2.new(0, ThumbnailSize, 0, ThumbnailSize),
				AutomaticSize = if FFlagEnableNonFlyoutUncheckedBadge then Enum.AutomaticSize.X else nil,
				BackgroundTransparency = 1,
				Text = "",
				LayoutOrder = 1,
				[RoactModule.Event.Activated] = OnActivated,
				[RoactModule.Ref] = if FFlagLuaAppMoveProfileIntoTopBar then OnlyAvatarButtonRef else nil,
				Selectable = if GetFFlagFixUserInfoSelectionModule() then p1.props.selectable else nil
			}, if FFlagLuaAppMoveProfileIntoTopBar and ShouldOnlyDisplayAvatarIcon then {
				UserAvatar = p1:renderUserAvatar(ThumbnailSize, Color, Transparency, LocalUserModel)
			} else {
				HorizontalLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 12)
				}),
				UserAvatar = p1:renderUserAvatar(ThumbnailSize, Color, Transparency, LocalUserModel),
				if FFlagEnableNonFlyoutUncheckedBadge then RoactModule.createElement(View, {
					tag = "row align-y-center gap-xsmall auto-xy",
					LayoutOrder = 2
				}, {
					Username = Element,
					MembershipIcon = if GetFFlagFixUserInfoWidgetPlusBadgeFunction() then Element1 else nil
				}) else RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(0, TextBounds.X + Entry + 4, 0, TextBounds.Y),
					AutomaticSize = Enum.AutomaticSize.None
				}, {
					HorizontalLayout = RoactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, 4)
					}),
					Username = Element,
					MembershipIcon = if GetFFlagFixUserInfoWidgetPlusBadgeFunction() then Element1 else nil
				})
			})
			
			return if FFlagEnableNonFlyoutUncheckedBadge then RoactModule.createElement(View, {
				tag = "row align-y-center gap-small size-full-0 auto-y",
				LayoutOrder = LayoutOrder,
				padding = {
					left = UDim.new(0, SideMargin),
					right = UDim.new(0, SideMargin)
				}
			}, {
				UsernameAvatarFrame = TextButton,
				UncheckedBadge = RoactModule.createElement(UncheckedBadgeModule, { layoutOrder = 2 })
			}) else RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = LayoutOrder,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, SideMargin),
					PaddingRight = UDim.new(0, SideMargin)
				}),
				UsernameAvatarFrame = TextButton
			})
		end)
	end
end

if GetFFlagFixUserInfoWidgetPlusBadgeFunction() then
	UserWidget = function(p1)
		-- upvalues: UseTokens (copy), RoactModule (copy), UserWidget (copy), CryoModule (copy)
		return RoactModule.createElement(UserWidget, CryoModule.Dictionary.join(p1, { foundationTokens = UseTokens() }))
	end
end
return RoactAppPolicy.connect(function(p1, _)
	return { enableDisplayNamePolicy = p1.getShowDisplayName() }
end)(UserWidget)