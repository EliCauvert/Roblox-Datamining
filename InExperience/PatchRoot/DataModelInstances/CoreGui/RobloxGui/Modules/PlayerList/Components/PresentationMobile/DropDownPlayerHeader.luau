local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local userLibModule = require(corePackagesService.Workspace.Packages.UserLib)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local useLayoutValues = playerListModule.Common.useLayoutValues
local withStyle = UIBloxModule.Style.withStyle
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local image = foundationModule.Image
local text = foundationModule.Text
local withLayoutValues = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues
local userProfilesModule = require(corePackagesService.Workspace.Packages.UserProfiles)
local useVerifiedBadge = userProfilesModule.Hooks.useVerifiedBadge
local emojiTextLabel = UIBloxModule.Core.Text.EmojiTextLabel
local emoji = UIBloxModule.App.Emoji.Enum.Emoji
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local fFlagEnableVerifiedBadgeStore = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore
local fFlagPlayerListDropDownShowPlatformName = playerListModule.Flags.FFlagPlayerListDropDownShowPlatformName
local _, status = pcall(function() --[[ line: 35 ]]
	return game:GetService("PlatformFriendsService")
end)
local dropDownPlayerHeader = roactModule.PureComponent:extend("DropDownPlayerHeader")
dropDownPlayerHeader.validateProps = tModule.strictInterface({
	player = tModule.instanceIsA("Player"),
	transparency = tModule.any,
	contentVisible = tModule.boolean,
	layoutValues = tModule.optional(tModule.table),
	tokens = tModule.optional(tModule.table),
	showVerifiedBadge = tModule.optional(tModule.boolean),
	platformName = tModule.optional(tModule.string),
	platformProfileId = tModule.optional(tModule.string),
	canShowPlatformProfile = tModule.optional(tModule.boolean)
})

function dropDownPlayerHeader.render(p0) --[[ line: 54 ]]
	-- upvalues: withLayoutValues (ref), withStyle (ref), fFlagEnableVerifiedBadgeStore (ref), userLibModule (ref), fFlagPlayerListDropDownShowPlatformName (ref), roactModule (ref), emojiTextLabel (ref), emoji (ref), fFlagEnableMobilePlayerListOnConsole (ref), view (ref), status (ref), image (ref), text (ref)
	return withLayoutValues(function(p1) --[[ line: 55 ]]
		-- upvalues: withStyle (copy), p0 (ref), fFlagEnableVerifiedBadgeStore (copy), userLibModule (copy), fFlagPlayerListDropDownShowPlatformName (copy), roactModule (copy), emojiTextLabel (copy), emoji (copy), fFlagEnableMobilePlayerListOnConsole (copy), view (copy), status (copy), image (copy), text (copy)
		return withStyle(function(p2) --[[ line: 56 ]]
			-- upvalues: p1 (write), p0 (copy), fFlagEnableVerifiedBadgeStore (copy), userLibModule (copy), fFlagPlayerListDropDownShowPlatformName (copy), roactModule (copy), emojiTextLabel (copy), emoji (copy), fFlagEnableMobilePlayerListOnConsole (copy), view (copy), status (copy), image (copy), text (copy)
			local var11
			p1 = p0.props.layoutValues
			local tokens = p0.props.tokens
			local size3000 = tokens.Size.Size_3000
			local size500 = tokens.Size.Size_500
			local player = p0.props.player
			local var10 = if fFlagEnableVerifiedBadgeStore then p0.props.showVerifiedBadge else userLibModule.Utils.isPlayerVerified(player)
			
			if fFlagPlayerListDropDownShowPlatformName then
				var11 = p0.props.platformName
				
				if var11 then
					var11 = p0.props.platformName ~= ""
					var11 = nil
				end
			else
				var11 = nil
			end
			local var12 = if fFlagPlayerListDropDownShowPlatformName then p0.props.canShowPlatformProfile else nil
			
			return roactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				Text = "",
				LayoutOrder = 0,
				Selectable = false,
				Size = UDim2.new(1, 0, 0, p1.DropDownHeaderSizeY)
			}, {
				Background = roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Image = "rbxasset://textures/ui/PlayerList/NewAvatarBackground.png",
					ImageTransparency = p0.props.transparency,
					Size = UDim2.new(1, 0, 0, p1.DropDownHeaderBackgroundSize),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1)
				}, {
					TextContainerFrame = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Visible = p0.props.contentVisible,
						Size = UDim2.new(1, -size3000, 1, 0),
						Position = UDim2.new(0, tokens.Size.Size_2700, 0, 0)
					}, {
						Layout = roactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Vertical,
							Padding = UDim.new(0, 0),
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						DisplayName = var10 and roactModule.createElement(emojiTextLabel, {
							fluidSizing = false,
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							fontStyle = p2.Font.Header2,
							colorStyle = p2.Theme.TextEmphasis,
							emoji = emoji.Verified,
							maxSize = Vector2.new(p1.PlayerDropDownSizeXMobile - size3000, size500),
							TextSize = if fFlagEnableMobilePlayerListOnConsole then p1.DropDownHeaderDisplayNameTextSize else p2.Font.BaseSize * p2.Font.Header2.RelativeSize,
							AutomaticSize = if fFlagEnableMobilePlayerListOnConsole then Enum.AutomaticSize.X else nil,
							Text = player.DisplayName,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd,
							TextScaled = if fFlagEnableMobilePlayerListOnConsole then nil else true
						}) or roactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, size500),
							Text = player.DisplayName,
							Font = p2.Font.Header2.Font,
							TextSize = if fFlagEnableMobilePlayerListOnConsole then p1.DropDownHeaderDisplayNameTextSize else p2.Font.BaseSize * p2.Font.Header2.RelativeSize,
							TextColor3 = p2.Theme.TextEmphasis.Color,
							TextTransparency = p2.Theme.TextEmphasis.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd,
							TextScaled = if fFlagEnableMobilePlayerListOnConsole then nil else true
						}, {
							SizeConstraint = if fFlagEnableMobilePlayerListOnConsole then nil else roactModule.createElement("UITextSizeConstraint", {
								MaxTextSize = p2.Font.BaseSize * p2.Font.Header2.RelativeSize,
								MinTextSize = p2.Font.BaseSize * p2.Font.Footer.RelativeSize
							})
						}),
						PlayerName = roactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, size500),
							Text = "@" .. player.Name,
							Font = p2.Font.CaptionHeader.Font,
							TextSize = if fFlagEnableMobilePlayerListOnConsole then p1.DropDownHeaderPlayerNameTextSize else p2.Font.BaseSize * p2.Font.CaptionHeader.RelativeSize,
							TextColor3 = p2.Theme.TextMuted.Color,
							TextTransparency = p2.Theme.TextMuted.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd,
							TextScaled = if fFlagEnableMobilePlayerListOnConsole then nil else true
						}, {
							SizeConstraint = if fFlagEnableMobilePlayerListOnConsole then nil else roactModule.createElement("UITextSizeConstraint", {
								MaxTextSize = p2.Font.BaseSize * p2.Font.CaptionHeader.RelativeSize,
								MinTextSize = p2.Font.BaseSize * p2.Font.Footer.RelativeSize
							})
						}),
						PlatformName = fFlagPlayerListDropDownShowPlatformName and (var11 and roactModule.createElement(view, {
							LayoutOrder = 3,
							tag = "row align-y-center gap-xsmall radius-small",
							Size = UDim2.new(1, 0, 0, size500),
							onActivated = if var12 then function() --[[ line: 163 ]]
								-- upvalues: p0 (copy), status (copy)
								local platformProfileId = p0.props.platformProfileId
								
								if status and platformProfileId and platformProfileId ~= "" then
									status:ShowProfile(platformProfileId)
								end
							end else nil
						}, {
							PlatformIcon = roactModule.createElement(image, {
								LayoutOrder = 1,
								Image = "rbxasset://textures/ui/Shell/Icons/PlatformLogo@3x.png",
								tag = "size-400",
								imageStyle = {
									Color3 = p2.Theme.TextMuted.Color,
									Transparency = if var12 then 0 else 0.4
								}
							}),
							PlatformNameButton = roactModule.createElement(text, {
								LayoutOrder = 2,
								tag = "auto-y fill text-align-x-left text-truncate-end",
								Text = p0.props.platformName,
								fontStyle = {
									Font = p2.Font.CaptionHeader.Font,
									FontSize = p1.DropDownHeaderPlayerNameTextSize
								},
								textStyle = {
									Color3 = p2.Theme.TextMuted.Color,
									Transparency = if var12 then p2.Theme.TextMuted.Transparency else math.clamp(p2.Theme.TextMuted.Transparency + 0.3, 0, 1)
								}
							})
						}))
					})
				}),
				AvatarImage = roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Position = UDim2.new(0, tokens.Size.Size_1400, 0, 0),
					Size = UDim2.new(0, p1.DropDownHeaderSizeY, 0, p1.DropDownHeaderSizeY),
					AnchorPoint = Vector2.new(0.5, 0),
					ImageTransparency = p0.props.transparency,
					Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(player.UserId)
				}),
				Divider = not p0.props.lastButton and roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 3,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					Visible = p0.props.contentVisible,
					BackgroundTransparency = p2.Theme.Divider.Transparency,
					BackgroundColor3 = p2.Theme.Divider.Color
				})
			})
		end)
	end)
end

return function(p3) --[[ line: 226 ]]
	-- upvalues: useLayoutValues (ref), useTokens (ref), fFlagEnableVerifiedBadgeStore (ref), useVerifiedBadge (ref), fFlagPlayerListDropDownShowPlatformName (ref), userProfilesModule (ref), status (ref), roactModule (ref), dropDownPlayerHeader (ref), cryoModule (ref)
	local var13 = useLayoutValues()
	local var14 = useTokens()
	local var15 = if fFlagEnableVerifiedBadgeStore then useVerifiedBadge(p3.player) else nil
	local platformNameFromId = nil
	local platformProfileIdFromId = nil
	local var18 = nil
	
	if fFlagPlayerListDropDownShowPlatformName then
		local var19 = tostring(p3.player.UserId)
		local var20 = userProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { var19 },
			query = userProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds
		})
		
		if var20.data then
			platformNameFromId = userProfilesModule.Selectors.getPlatformNameFromId(var20.data, var19)
			platformProfileIdFromId = userProfilesModule.Selectors.getPlatformProfileIdFromId(var20.data, var19)
		end
		var18 = game:GetEngineFeature("PlatformFriendsService") and (game:GetEngineFeature("PlatformFriendsProfile") and (status and (status:IsProfileEnabled() and (platformProfileIdFromId and platformProfileIdFromId ~= ""))))
	end
	return roactModule.createElement(dropDownPlayerHeader, cryoModule.Dictionary.join(p3, {
		layoutValues = var13,
		tokens = var14,
		showVerifiedBadge = if fFlagEnableVerifiedBadgeStore then var15 else nil,
		platformName = if fFlagPlayerListDropDownShowPlatformName then platformNameFromId else nil,
		platformProfileId = if fFlagPlayerListDropDownShowPlatformName then platformProfileIdFromId else nil,
		canShowPlatformProfile = if fFlagPlayerListDropDownShowPlatformName then var18 else nil
	}))
end