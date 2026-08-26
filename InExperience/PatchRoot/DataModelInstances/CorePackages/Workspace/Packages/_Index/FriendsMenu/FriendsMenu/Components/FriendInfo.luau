local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local parent = friendsMenu.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local userModel = require(parent.UserLib).Models.UserModel
local localizationHelper = require(parent.NotificationsCommon).LocalizationHelper
local _ = require(parent.NotificationsCommon)
local _ = require(friendsMenu.friendsMenuModalType)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local openTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local useStyle = UIBloxModule.Core.Style.useStyle
local getLocalizedStrings = localizationHelper.getLocalizedStrings
local getFFlagLuaAppEnableOpenTypeSupport = require(parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local t = {
	online = "Common.Presence.Label.Online",
	inStudio = "Common.Presence.Label.RobloxStudio"
}
local studiologoSmall = images["icons/logo/studiologo_small"]

local _ = function(p1, p2)
	-- upvalues: userModel (ref)
	return if p1.presence == userModel.PresenceType.IN_GAME then p1.lastLocation elseif p1.presence == userModel.PresenceType.ONLINE then p2.online elseif p1.presence == userModel.PresenceType.IN_STUDIO then p2.inStudio else "@" .. p0.name
end

return function(p1)
	-- upvalues: useStyle (ref), getLocalizedStrings (ref), t (ref), userModel (ref), useIsRobloxSubscriber (ref), fFlagEnableBlackbirdCheck (ref), reactModule (ref), skeleton (ref), radius (ref), foundationModule (ref), imageSetLabel (ref), studiologoSmall (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), openTypeSupport (ref)
	local var1 = useStyle()
	local theme = var1.Theme
	local font = var1.Font
	local var2 = font.BaseSize * font.Header2.RelativeSize
	local var3 = font.BaseSize * font.CaptionBody.RelativeSize
	local var4 = getLocalizedStrings(t)
	local friend = p1.friend
	assert(friend, "friend should be non-nil. Silence type checker.")
	local _ = nil
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Position = p1.position,
		Size = p1.size,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink }),
		Padding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 12) }),
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 4)
		}),
		DisplayName = if p1.isFetchingFriendsNames then reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.new(0, 120, 0, 10),
			radius = radius.Small
		}) elseif fFlagEnableBlackbirdCheck and useIsRobloxSubscriber(if fFlagEnableBlackbirdCheck and friend.id then friend.id else nil) then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var2),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			DisplayName = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = false,
				LayoutOrder = 1,
				Size = UDim2.new(0, 0, 0, var2),
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = friend.displayName,
				TextSize = var2,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font.Header2.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd
			}, {
				UIFlexItem = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink })
			}),
			SubscriptionBadge = reactModule.createElement(foundationModule.Icon, {
				LayoutOrder = 2,
				name = foundationModule.Enums.IconName.RobloxPlus,
				size = foundationModule.Enums.IconSize.Small,
				style = {
					Color3 = theme.TextEmphasis.Color,
					Transparency = theme.TextEmphasis.Transparency
				}
			})
		}) else reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var2),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = friend.displayName,
			TextSize = var2,
			TextColor3 = theme.TextEmphasis.Color,
			TextTransparency = theme.TextEmphasis.Transparency,
			Font = font.Header2.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd
		}),
		UserContextContainer = p1.isFetchingFriendsNames and reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			Size = UDim2.new(0, 80, 0, 10),
			radius = radius.Small
		}) or reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, var3)
		}, {
			ListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 4)
			}),
			StudioImage = friend.presence == userModel.PresenceType.IN_STUDIO and reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Image = studiologoSmall,
				ImageColor3 = theme.TextDefault.Color,
				ImageTransparency = theme.TextDefault.Transparency,
				Size = UDim2.new(0, var3, 0, var3)
			}),
			UserContext = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 2,
				Size = UDim2.new(1, -var3, 0, var3),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = if friend.presence == userModel.PresenceType.IN_GAME then friend.lastLocation elseif friend.presence == userModel.PresenceType.ONLINE then var4.online elseif friend.presence == userModel.PresenceType.IN_STUDIO then var4.inStudio else "@" .. friend.name,
				TextSize = var3,
				TextColor3 = theme.TextEmphasis.Color,
				TextTransparency = theme.TextEmphasis.Transparency,
				Font = font.CaptionBody.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
				OpenTypeFeatures = if getFFlagLuaAppEnableOpenTypeSupport() then openTypeSupport:getUserNameStylisticAlternative() else nil
			})
		})
	})
end