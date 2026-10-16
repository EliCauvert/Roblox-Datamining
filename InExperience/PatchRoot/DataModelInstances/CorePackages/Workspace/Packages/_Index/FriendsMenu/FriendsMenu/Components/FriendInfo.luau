local FriendsMenu = script:FindFirstAncestor("FriendsMenu")
local Parent = FriendsMenu.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UserModel = require(Parent.UserLib).Models.UserModel
local _ = require(Parent.NotificationsCommon)
local _ = require(FriendsMenu.friendsMenuModalType)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local OpenTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local GetLocalizedStringsFunction = require(Parent.NotificationsCommon).LocalizationHelper.getLocalizedStrings
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local config = {
	online = "Common.Presence.Label.Online",
	inStudio = "Common.Presence.Label.RobloxStudio"
}
local IconsLogoStudiologoSmall = UIBloxModule.App.ImageSet.Images["icons/logo/studiologo_small"]

local function _(p1, p2) --[[ Line: 38 ]]
	-- upvalues: UserModel (copy)
	return if p1.presence == UserModel.PresenceType.IN_GAME then p1.lastLocation elseif p1.presence == UserModel.PresenceType.ONLINE then p2.online elseif p1.presence == UserModel.PresenceType.IN_STUDIO then p2.inStudio else "@" .. p1.name
end

return function(p1) --[[ Line: 59 ]]
	-- upvalues: UseStyleFunction (copy), GetLocalizedStringsFunction (copy), config (copy), UserModel (copy), UseIsRobloxSubscriberFunction (copy), FFlagEnableBlackbirdCheck (copy), ReactModule (copy), Skeleton (copy), Radius (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), FoundationModule (copy), ImageSetLabel (copy), IconsLogoStudiologoSmall (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), OpenTypeSupport (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize
	local ScaledBaseSize1 = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize
	local LocalizedStrings = GetLocalizedStringsFunction(config)
	local Friend = p1.friend
	assert(Friend, "friend should be non-nil. Silence type checker.")
	local IsPresenceMatch = Friend.presence == UserModel.PresenceType.IN_STUDIO
	local UseIsRobloxSubscriberResult = UseIsRobloxSubscriberFunction(if FFlagEnableBlackbirdCheck and Friend.id then Friend.id else nil)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Position = p1.position,
		Size = p1.size,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink }),
		Padding = ReactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 12) }),
		ListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 4)
		}),
		DisplayName = if p1.isFetchingFriendsNames then ReactModule.createElement(Skeleton, {
			LayoutOrder = 1,
			Size = UDim2.new(0, 120, 0, 10),
			radius = Radius.Small
		}) elseif FFlagEnableBlackbirdCheck and UseIsRobloxSubscriberResult then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, ScaledBaseSize),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			DisplayName = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = false,
				LayoutOrder = 1,
				Size = UDim2.new(0, 0, 0, ScaledBaseSize),
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = Friend.displayName,
				TextSize = ScaledBaseSize,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency,
				Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.Header2.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.TitleLarge.Font) else nil,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd
			}, {
				UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink })
			}),
			SubscriptionBadge = ReactModule.createElement(FoundationModule.Icon, {
				LayoutOrder = 2,
				name = FoundationModule.Enums.IconName.RobloxPlus,
				size = FoundationModule.Enums.IconSize.Small,
				style = {
					Color3 = Theme.TextEmphasis.Color,
					Transparency = Theme.TextEmphasis.Transparency
				}
			})
		}) else ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, ScaledBaseSize),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = Friend.displayName,
			TextSize = ScaledBaseSize,
			TextColor3 = Theme.TextEmphasis.Color,
			TextTransparency = Theme.TextEmphasis.Transparency,
			Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.Header2.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.TitleLarge.Font) else nil,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		UserContextContainer = p1.isFetchingFriendsNames and ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			Size = UDim2.new(0, 80, 0, 10),
			radius = Radius.Small
		}) or ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, ScaledBaseSize1)
		}, {
			ListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 4)
			}),
			StudioImage = IsPresenceMatch and ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Image = IconsLogoStudiologoSmall,
				ImageColor3 = Theme.TextDefault.Color,
				ImageTransparency = Theme.TextDefault.Transparency,
				Size = UDim2.new(0, ScaledBaseSize1, 0, ScaledBaseSize1)
			}),
			UserContext = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 2,
				Size = UDim2.new(1, -ScaledBaseSize1, 0, ScaledBaseSize1),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = if Friend.presence == UserModel.PresenceType.IN_GAME then Friend.lastLocation elseif Friend.presence == UserModel.PresenceType.ONLINE then LocalizedStrings.online elseif Friend.presence == UserModel.PresenceType.IN_STUDIO then LocalizedStrings.inStudio else "@" .. Friend.name,
				TextSize = ScaledBaseSize1,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency,
				Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.CaptionBody.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodySmall.Font) else nil,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				OpenTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil
			})
		})
	})
end