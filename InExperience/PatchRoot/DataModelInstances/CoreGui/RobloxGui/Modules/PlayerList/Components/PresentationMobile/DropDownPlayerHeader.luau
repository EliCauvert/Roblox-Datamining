local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local UseLayoutValuesFunction = PlayerListModule.Common.useLayoutValues
local WithStyleFunction = UIBloxModule.Style.withStyle
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local WithLayoutValuesFunction = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues
local UserProfilesModule = require(CorePackages.Workspace.Packages.UserProfiles)
local UseVerifiedBadgeFunction = UserProfilesModule.Hooks.useVerifiedBadge
local EmojiTextLabel = UIBloxModule.Core.Text.EmojiTextLabel
local Emoji = UIBloxModule.App.Emoji.Enum.Emoji
local FFlagEnableMobilePlayerListOnConsole = PlayerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local FFlagEnableVerifiedBadgeStore = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore
local FFlagPlayerListDropDownShowPlatformName = PlayerListModule.Flags.FFlagPlayerListDropDownShowPlatformName
local _, Result = pcall(function()
	return game:GetService("PlatformFriendsService")
end)
local DropDownPlayerHeader = RoactModule.PureComponent:extend("DropDownPlayerHeader")
DropDownPlayerHeader.validateProps = TModule.strictInterface({
	player = TModule.instanceIsA("Player"),
	transparency = TModule.any,
	contentVisible = TModule.boolean,
	layoutValues = TModule.optional(TModule.table),
	tokens = TModule.optional(TModule.table),
	showVerifiedBadge = TModule.optional(TModule.boolean),
	platformName = TModule.optional(TModule.string),
	platformProfileId = TModule.optional(TModule.string),
	canShowPlatformProfile = TModule.optional(TModule.boolean)
})

function DropDownPlayerHeader.render(p1)
	-- upvalues: WithLayoutValuesFunction (copy), WithStyleFunction (copy), FFlagEnableVerifiedBadgeStore (copy), UserLibModule (copy), FFlagPlayerListDropDownShowPlatformName (copy), RoactModule (copy), EmojiTextLabel (copy), FoundationFontFaceMigration (copy), CryoModule (copy), Emoji (copy), FFlagEnableMobilePlayerListOnConsole (copy), NormalizeFontFaceFunction (copy), View (copy), Result (copy), Image (copy), Text (copy)
	return WithLayoutValuesFunction(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy), FFlagEnableVerifiedBadgeStore (upval), UserLibModule (upval), FFlagPlayerListDropDownShowPlatformName (upval), RoactModule (upval), EmojiTextLabel (upval), FoundationFontFaceMigration (upval), CryoModule (upval), Emoji (upval), FFlagEnableMobilePlayerListOnConsole (upval), NormalizeFontFaceFunction (upval), View (upval), Result (upval), Image (upval), Text (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: p2 (ref), p1 (upval), FFlagEnableVerifiedBadgeStore (upval), UserLibModule (upval), FFlagPlayerListDropDownShowPlatformName (upval), RoactModule (upval), EmojiTextLabel (upval), FoundationFontFaceMigration (upval), CryoModule (upval), Emoji (upval), FFlagEnableMobilePlayerListOnConsole (upval), NormalizeFontFaceFunction (upval), View (upval), Result (upval), Image (upval), Text (upval)
			p2 = p1.props.layoutValues
			local Tokens = p1.props.tokens
			local Size3000 = Tokens.Size.Size_3000
			local Size500 = Tokens.Size.Size_500
			local Player = p1.props.player
			local IsNotPlatformNameMatch = if FFlagPlayerListDropDownShowPlatformName then p1.props.platformName and p1.props.platformName ~= "" else nil
			local CanShowPlatformProfile = if FFlagPlayerListDropDownShowPlatformName then p1.props.canShowPlatformProfile else nil
			
			return RoactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				Text = "",
				LayoutOrder = 0,
				Selectable = false,
				Size = UDim2.new(1, 0, 0, p2.DropDownHeaderSizeY)
			}, {
				Background = RoactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Image = "rbxasset://textures/ui/PlayerList/NewAvatarBackground.png",
					ImageTransparency = p1.props.transparency,
					Size = UDim2.new(1, 0, 0, p2.DropDownHeaderBackgroundSize),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1)
				}, {
					TextContainerFrame = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Visible = p1.props.contentVisible,
						Size = UDim2.new(1, -Size3000, 1, 0),
						Position = UDim2.new(0, Tokens.Size.Size_2700, 0, 0)
					}, {
						Layout = RoactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Vertical,
							Padding = UDim.new(0, 0),
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						DisplayName = (if FFlagEnableVerifiedBadgeStore then p1.props.showVerifiedBadge else UserLibModule.Utils.isPlayerVerified(Player)) and RoactModule.createElement(EmojiTextLabel, {
							fluidSizing = false,
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							fontStyle = if FoundationFontFaceMigration then CryoModule.Dictionary.join(p3.Font.Header2, { Font = p3.Tokens.Typography.TitleLarge.Font }) else p3.Font.Header2,
							colorStyle = p3.Theme.TextEmphasis,
							emoji = Emoji.Verified,
							maxSize = Vector2.new(p2.PlayerDropDownSizeXMobile - Size3000, Size500),
							TextSize = if FFlagEnableMobilePlayerListOnConsole then p2.DropDownHeaderDisplayNameTextSize else p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
							AutomaticSize = if FFlagEnableMobilePlayerListOnConsole then Enum.AutomaticSize.X else nil,
							Text = Player.DisplayName,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd,
							TextScaled = not FFlagEnableMobilePlayerListOnConsole or nil
						}) or RoactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, Size500),
							Text = Player.DisplayName,
							Font = if FoundationFontFaceMigration then nil else p3.Font.Header2.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.TitleLarge.Font) else nil,
							TextSize = if FFlagEnableMobilePlayerListOnConsole then p2.DropDownHeaderDisplayNameTextSize else p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
							TextColor3 = p3.Theme.TextEmphasis.Color,
							TextTransparency = p3.Theme.TextEmphasis.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd,
							TextScaled = not FFlagEnableMobilePlayerListOnConsole or nil
						}, {
							SizeConstraint = if FFlagEnableMobilePlayerListOnConsole then nil else RoactModule.createElement("UITextSizeConstraint", {
								MaxTextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
								MinTextSize = p3.Font.BaseSize * p3.Font.Footer.RelativeSize
							})
						}),
						PlayerName = RoactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, Size500),
							Text = "@" .. Player.Name,
							Font = if FoundationFontFaceMigration then nil else p3.Font.CaptionHeader.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.CaptionLarge.Font) else nil,
							TextSize = if FFlagEnableMobilePlayerListOnConsole then p2.DropDownHeaderPlayerNameTextSize else p3.Font.BaseSize * p3.Font.CaptionHeader.RelativeSize,
							TextColor3 = p3.Theme.TextMuted.Color,
							TextTransparency = p3.Theme.TextMuted.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd,
							TextScaled = not FFlagEnableMobilePlayerListOnConsole or nil
						}, {
							SizeConstraint = if FFlagEnableMobilePlayerListOnConsole then nil else RoactModule.createElement("UITextSizeConstraint", {
								MaxTextSize = p3.Font.BaseSize * p3.Font.CaptionHeader.RelativeSize,
								MinTextSize = p3.Font.BaseSize * p3.Font.Footer.RelativeSize
							})
						}),
						PlatformName = FFlagPlayerListDropDownShowPlatformName and (IsNotPlatformNameMatch and RoactModule.createElement(View, {
							LayoutOrder = 3,
							tag = "row align-y-center gap-xsmall radius-small",
							Size = UDim2.new(1, 0, 0, Size500),
							onActivated = if CanShowPlatformProfile then function()
								-- upvalues: p1 (upval), Result (upval)
								local PlatformProfileId = p1.props.platformProfileId
								
								if Result and PlatformProfileId and PlatformProfileId ~= "" then
									Result:ShowProfile(PlatformProfileId)
								end
							end else nil
						}, {
							PlatformIcon = RoactModule.createElement(Image, {
								LayoutOrder = 1,
								Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png",
								tag = "size-400",
								imageStyle = {
									Color3 = p3.Theme.TextMuted.Color,
									Transparency = if CanShowPlatformProfile then 0 else 0.4
								}
							}),
							PlatformNameButton = RoactModule.createElement(Text, {
								LayoutOrder = 2,
								tag = "auto-y fill text-align-x-left text-truncate-end",
								Text = p1.props.platformName,
								fontStyle = {
									Font = p3.Font.CaptionHeader.Font,
									FontSize = p2.DropDownHeaderPlayerNameTextSize
								},
								textStyle = {
									Color3 = p3.Theme.TextMuted.Color,
									Transparency = if CanShowPlatformProfile then p3.Theme.TextMuted.Transparency else math.clamp(p3.Theme.TextMuted.Transparency + 0.3, 0, 1)
								}
							})
						}))
					})
				}),
				AvatarImage = RoactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Position = UDim2.new(0, Tokens.Size.Size_1400, 0, 0),
					Size = UDim2.new(0, p2.DropDownHeaderSizeY, 0, p2.DropDownHeaderSizeY),
					AnchorPoint = Vector2.new(0.5, 0),
					ImageTransparency = p1.props.transparency,
					Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(Player.UserId)
				}),
				Divider = not p1.props.lastButton and RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 3,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					Visible = p1.props.contentVisible,
					BackgroundTransparency = p3.Theme.Divider.Transparency,
					BackgroundColor3 = p3.Theme.Divider.Color
				})
			})
		end)
	end)
end

return function(p1)
	-- upvalues: UseLayoutValuesFunction (copy), UseTokensFunction (copy), FFlagEnableVerifiedBadgeStore (copy), UseVerifiedBadgeFunction (copy), FFlagPlayerListDropDownShowPlatformName (copy), UserProfilesModule (copy), Result (copy), RoactModule (copy), DropDownPlayerHeader (copy), CryoModule (copy)
	local UseLayoutValuesResult = UseLayoutValuesFunction()
	local UseTokensResult = UseTokensFunction()
	local UseVerifiedBadgeResult = if FFlagEnableVerifiedBadgeStore then UseVerifiedBadgeFunction(p1.player) else nil
	local PlatformNameFromId = nil
	local PlatformProfileIdFromId = nil
	local v1: boolean? = nil
	
	if FFlagPlayerListDropDownShowPlatformName then
		local Text = tostring(p1.player.UserId)
		local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { Text },
			query = UserProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds
		})
		
		if UseUserProfilesFetchResult.data then
			PlatformNameFromId = UserProfilesModule.Selectors.getPlatformNameFromId(UseUserProfilesFetchResult.data, Text)
			PlatformProfileIdFromId = UserProfilesModule.Selectors.getPlatformProfileIdFromId(UseUserProfilesFetchResult.data, Text)
		end
		v1 = game:GetEngineFeature("PlatformFriendsService") and (game:GetEngineFeature("PlatformFriendsProfile") and (Result and (Result:IsProfileEnabled() and (PlatformProfileIdFromId and PlatformProfileIdFromId ~= ""))))
	end
	return RoactModule.createElement(DropDownPlayerHeader, CryoModule.Dictionary.join(p1, {
		layoutValues = UseLayoutValuesResult,
		tokens = UseTokensResult,
		showVerifiedBadge = if FFlagEnableVerifiedBadgeStore then UseVerifiedBadgeResult else nil,
		platformName = if FFlagPlayerListDropDownShowPlatformName then PlatformNameFromId else nil,
		platformProfileId = if FFlagPlayerListDropDownShowPlatformName then PlatformProfileIdFromId else nil,
		canShowPlatformProfile = if FFlagPlayerListDropDownShowPlatformName then v1 else nil
	}))
end