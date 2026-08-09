local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local userLibModule = require(corePackagesService.Workspace.Packages.UserLib)
local cryoModule = require(corePackagesService.Packages.Cryo)
local withStyle = UIBloxModule.Style.withStyle
local withLayoutValues = require(script.Parent.Parent.Connection.LayoutValues).WithLayoutValues
local useVerifiedBadge = require(corePackagesService.Workspace.Packages.UserProfiles).Hooks.useVerifiedBadge
local fFlagEnableVerifiedBadgeStore = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore
local emojiTextLabel = UIBloxModule.Core.Text.EmojiTextLabel
local emoji = UIBloxModule.App.Emoji.Enum.Emoji
local dropDownPlayerHeader = roactModule.PureComponent:extend("DropDownPlayerHeader")
dropDownPlayerHeader.validateProps = tModule.strictInterface({
	player = tModule.instanceIsA("Player"),
	showVerifiedBadge = tModule.optional(tModule.boolean)
})

function dropDownPlayerHeader.render(p0) --[[ line: 37 ]]
	-- upvalues: withLayoutValues (ref), withStyle (ref), fFlagEnableVerifiedBadgeStore (ref), userLibModule (ref), roactModule (ref), emojiTextLabel (ref), emoji (ref)
	return withLayoutValues(function(p1) --[[ line: 38 ]]
		-- upvalues: withStyle (copy), p0 (ref), fFlagEnableVerifiedBadgeStore (copy), userLibModule (copy), roactModule (copy), emojiTextLabel (copy), emoji (copy)
		return withStyle(function(p2) --[[ line: 39 ]]
			-- upvalues: p0 (copy), fFlagEnableVerifiedBadgeStore (copy), userLibModule (copy), roactModule (copy), p1 (ref), emojiTextLabel (copy), emoji (copy)
			local player = p0.props.player
			
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
					ImageTransparency = 0,
					Size = UDim2.new(1, 0, 0, p1.DropDownHeaderBackgroundSize),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1)
				}, {
					TextContainerFrame = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, -124, 1, 0),
						Position = UDim2.new(0, 107, 0, 0)
					}, {
						Layout = roactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							FillDirection = Enum.FillDirection.Vertical,
							Padding = UDim.new(0, 0),
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						DisplayName = (if fFlagEnableVerifiedBadgeStore then p0.props.showVerifiedBadge else userLibModule.Utils.isPlayerVerified(player)) and roactModule.createElement(emojiTextLabel, {
							fluidSizing = false,
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextScaled = true,
							fontStyle = p2.Font.Header2,
							colorStyle = p2.Theme.TextEmphasis,
							emoji = emoji.Verified,
							maxSize = Vector2.new(p1.PlayerDropDownSizeX - 124, 22),
							Text = player.DisplayName,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd
						}) or roactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextScaled = true,
							Size = UDim2.new(1, 0, 0, 22),
							Text = player.DisplayName,
							Font = p2.Font.Header2.Font,
							TextSize = p2.Font.BaseSize * p2.Font.Header2.RelativeSize,
							TextColor3 = p2.Theme.TextEmphasis.Color,
							TextTransparency = p2.Theme.TextEmphasis.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd
						}, {
							SizeConstraint = roactModule.createElement("UITextSizeConstraint", {
								MaxTextSize = p2.Font.BaseSize * p2.Font.Header2.RelativeSize,
								MinTextSize = p2.Font.BaseSize * p2.Font.Footer.RelativeSize
							})
						}),
						PlayerName = roactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextScaled = true,
							Size = UDim2.new(1, 0, 0, 22),
							Text = "@" .. player.Name,
							Font = p2.Font.CaptionHeader.Font,
							TextSize = p2.Font.BaseSize * p2.Font.CaptionHeader.RelativeSize,
							TextColor3 = p2.Theme.TextMuted.Color,
							TextTransparency = p2.Theme.TextMuted.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd
						}, {
							SizeConstraint = roactModule.createElement("UITextSizeConstraint", {
								MaxTextSize = p2.Font.BaseSize * p2.Font.CaptionHeader.RelativeSize,
								MinTextSize = p2.Font.BaseSize * p2.Font.Footer.RelativeSize
							})
						})
					})
				}),
				AvatarImage = roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Position = UDim2.new(0, 56, 0, 0),
					Size = UDim2.new(0, p1.DropDownHeaderSizeY, 0, p1.DropDownHeaderSizeY),
					AnchorPoint = Vector2.new(0.5, 0),
					Image = "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&w=150&h=150"
				}),
				Divider = not p0.props.lastButton and roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 3,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = p2.Theme.Divider.Transparency,
					BackgroundColor3 = p2.Theme.Divider.Color
				})
			})
		end)
	end)
end

return if fFlagEnableVerifiedBadgeStore then function(p3) --[[ line: 147 ]]
	-- upvalues: useVerifiedBadge (ref), roactModule (ref), dropDownPlayerHeader (ref), cryoModule (ref)
	return roactModule.createElement(dropDownPlayerHeader, cryoModule.Dictionary.join(p3, { showVerifiedBadge = useVerifiedBadge(p3.player) }))
end else dropDownPlayerHeader