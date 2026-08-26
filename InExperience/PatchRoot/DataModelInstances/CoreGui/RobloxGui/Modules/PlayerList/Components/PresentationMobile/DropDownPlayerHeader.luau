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
local _, status = pcall(function()
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

function dropDownPlayerHeader.render(p1)
	-- upvalues: withLayoutValues (ref), withStyle (ref), fFlagEnableVerifiedBadgeStore (ref), userLibModule (ref), fFlagPlayerListDropDownShowPlatformName (ref), roactModule (ref), emojiTextLabel (ref), emoji (ref), fFlagEnableMobilePlayerListOnConsole (ref), view (ref), status (ref), image (ref), text (ref)
	return withLayoutValues(function(p2)
		-- upvalues: withStyle (copy), p1 (ref), fFlagEnableVerifiedBadgeStore (copy), userLibModule (copy), fFlagPlayerListDropDownShowPlatformName (copy), roactModule (copy), emojiTextLabel (copy), emoji (copy), fFlagEnableMobilePlayerListOnConsole (copy), view (copy), status (copy), image (copy), text (copy)
		return withStyle(function(p3)
			-- upvalues: p2 (write), p1 (copy), fFlagEnableVerifiedBadgeStore (copy), userLibModule (copy), fFlagPlayerListDropDownShowPlatformName (copy), roactModule (copy), emojiTextLabel (copy), emoji (copy), fFlagEnableMobilePlayerListOnConsole (copy), view (copy), status (copy), image (copy), text (copy)
			local var1
			p2 = p1.props.layoutValues
			local tokens = p1.props.tokens
			local size3000 = tokens.Size.Size_3000
			local size500 = tokens.Size.Size_500
			local player = p1.props.player
			local var2 = if fFlagEnableVerifiedBadgeStore then p1.props.showVerifiedBadge else userLibModule.Utils.isPlayerVerified(player)
			
			if fFlagPlayerListDropDownShowPlatformName then
				var1 = p1.props.platformName
				
				if var1 then
					var1 = p1.props.platformName ~= ""
					var1 = nil
				end
			else
				var1 = nil
			end
			local var3 = if fFlagPlayerListDropDownShowPlatformName then p1.props.canShowPlatformProfile else nil
			
			return roactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				Text = "",
				LayoutOrder = 0,
				Selectable = false,
				Size = UDim2.new(1, 0, 0, p2.DropDownHeaderSizeY)
			}, {
				Background = roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Image = "rbxasset://textures/ui/PlayerList/NewAvatarBackground.png",
					ImageTransparency = p1.props.transparency,
					Size = UDim2.new(1, 0, 0, p2.DropDownHeaderBackgroundSize),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1)
				}, {
					TextContainerFrame = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Visible = p1.props.contentVisible,
						Size = UDim2.new(1, -size3000, 1, 0),
						Position = UDim2.new(0, tokens.Size.Size_2700, 0, 0)
					}, {
						Layout = roactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Vertical,
							Padding = UDim.new(0, 0),
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						DisplayName = var2 and roactModule.createElement(emojiTextLabel, {
							fluidSizing = false,
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							fontStyle = p3.Font.Header2,
							colorStyle = p3.Theme.TextEmphasis,
							emoji = emoji.Verified,
							maxSize = Vector2.new(p2.PlayerDropDownSizeXMobile - size3000, size500),
							TextSize = if fFlagEnableMobilePlayerListOnConsole then p2.DropDownHeaderDisplayNameTextSize else p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
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
							Font = p3.Font.Header2.Font,
							TextSize = if fFlagEnableMobilePlayerListOnConsole then p2.DropDownHeaderDisplayNameTextSize else p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
							TextColor3 = p3.Theme.TextEmphasis.Color,
							TextTransparency = p3.Theme.TextEmphasis.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd,
							TextScaled = if fFlagEnableMobilePlayerListOnConsole then nil else true
						}, {
							SizeConstraint = if fFlagEnableMobilePlayerListOnConsole then nil else roactModule.createElement("UITextSizeConstraint", {
								MaxTextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
								MinTextSize = p3.Font.BaseSize * p3.Font.Footer.RelativeSize
							})
						}),
						PlayerName = roactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, size500),
							Text = "@" .. player.Name,
							Font = p3.Font.CaptionHeader.Font,
							TextSize = if fFlagEnableMobilePlayerListOnConsole then p2.DropDownHeaderPlayerNameTextSize else p3.Font.BaseSize * p3.Font.CaptionHeader.RelativeSize,
							TextColor3 = p3.Theme.TextMuted.Color,
							TextTransparency = p3.Theme.TextMuted.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd,
							TextScaled = if fFlagEnableMobilePlayerListOnConsole then nil else true
						}, {
							SizeConstraint = if fFlagEnableMobilePlayerListOnConsole then nil else roactModule.createElement("UITextSizeConstraint", {
								MaxTextSize = p3.Font.BaseSize * p3.Font.CaptionHeader.RelativeSize,
								MinTextSize = p3.Font.BaseSize * p3.Font.Footer.RelativeSize
							})
						}),
						PlatformName = fFlagPlayerListDropDownShowPlatformName and (var1 and roactModule.createElement(view, {
							LayoutOrder = 3,
							tag = "row align-y-center gap-xsmall radius-small",
							Size = UDim2.new(1, 0, 0, size500),
							onActivated = if var3 then function()
								-- upvalues: p1 (copy), status (copy)
								local platformProfileId = p1.props.platformProfileId
								
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
									Color3 = p3.Theme.TextMuted.Color,
									Transparency = if var3 then 0 else 0.4
								}
							}),
							PlatformNameButton = roactModule.createElement(text, {
								LayoutOrder = 2,
								tag = "auto-y fill text-align-x-left text-truncate-end",
								Text = p1.props.platformName,
								fontStyle = {
									Font = p3.Font.CaptionHeader.Font,
									FontSize = p2.DropDownHeaderPlayerNameTextSize
								},
								textStyle = {
									Color3 = p3.Theme.TextMuted.Color,
									Transparency = if var3 then p3.Theme.TextMuted.Transparency else math.clamp(p3.Theme.TextMuted.Transparency + 0.3, 0, 1)
								}
							})
						}))
					})
				}),
				AvatarImage = roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Position = UDim2.new(0, tokens.Size.Size_1400, 0, 0),
					Size = UDim2.new(0, p2.DropDownHeaderSizeY, 0, p2.DropDownHeaderSizeY),
					AnchorPoint = Vector2.new(0.5, 0),
					ImageTransparency = p1.props.transparency,
					Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150"):format(player.UserId)
				}),
				Divider = not p1.props.lastButton and roactModule.createElement("Frame", {
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
	-- upvalues: useLayoutValues (ref), useTokens (ref), fFlagEnableVerifiedBadgeStore (ref), useVerifiedBadge (ref), fFlagPlayerListDropDownShowPlatformName (ref), userProfilesModule (ref), status (ref), roactModule (ref), dropDownPlayerHeader (ref), cryoModule (ref)
	local var1 = useLayoutValues()
	local var2 = useTokens()
	local var3 = if fFlagEnableVerifiedBadgeStore then useVerifiedBadge(p1.player) else nil
	local platformNameFromId = nil
	local platformProfileIdFromId = nil
	local var4 = nil
	
	if fFlagPlayerListDropDownShowPlatformName then
		local var5 = tostring(p1.player.UserId)
		local var6 = userProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { var5 },
			query = userProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds
		})
		
		if var6.data then
			platformNameFromId = userProfilesModule.Selectors.getPlatformNameFromId(var6.data, var5)
			platformProfileIdFromId = userProfilesModule.Selectors.getPlatformProfileIdFromId(var6.data, var5)
		end
		var4 = game:GetEngineFeature("PlatformFriendsService") and (game:GetEngineFeature("PlatformFriendsProfile") and (status and (status:IsProfileEnabled() and (platformProfileIdFromId and platformProfileIdFromId ~= ""))))
	end
	return roactModule.createElement(dropDownPlayerHeader, cryoModule.Dictionary.join(p1, {
		layoutValues = var1,
		tokens = var2,
		showVerifiedBadge = if fFlagEnableVerifiedBadgeStore then var3 else nil,
		platformName = if fFlagPlayerListDropDownShowPlatformName then platformNameFromId else nil,
		platformProfileId = if fFlagPlayerListDropDownShowPlatformName then platformProfileIdFromId else nil,
		canShowPlatformProfile = if fFlagPlayerListDropDownShowPlatformName then var4 else nil
	}))
end