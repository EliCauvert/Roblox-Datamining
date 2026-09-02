local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local userLibModule = require(corePackagesService.Workspace.Packages.UserLib)
local cryoModule = require(corePackagesService.Packages.Cryo)
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
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

function dropDownPlayerHeader.render(p1)
	-- upvalues: withLayoutValues (ref), withFoundationOrUIBloxStyle (ref), fFlagEnableVerifiedBadgeStore (ref), userLibModule (ref), roactModule (ref), emojiTextLabel (ref), emoji (ref)
	return withLayoutValues(function(p2)
		-- upvalues: withFoundationOrUIBloxStyle (copy), p1 (ref), fFlagEnableVerifiedBadgeStore (copy), userLibModule (copy), roactModule (copy), emojiTextLabel (copy), emoji (copy)
		return withFoundationOrUIBloxStyle(function(p3)
			return {
				Theme = {
					Divider = {
						Color = p3.Color.Stroke.Emphasis.Color3,
						Transparency = p3.Color.Stroke.Emphasis.Transparency
					},
					TextEmphasis = {
						Color = p3.Color.Content.Emphasis.Color3,
						Transparency = p3.Color.Content.Emphasis.Transparency
					},
					TextMuted = {
						Color = p3.Color.Content.Muted.Color3,
						Transparency = p3.Color.Content.Muted.Transparency
					}
				},
				Font = {
					BaseSize = 1,
					CaptionHeader = {
						Font = p3.Typography.CaptionLarge.Font,
						RelativeSize = p3.Typography.CaptionLarge.FontSize
					},
					Footer = {
						Font = p3.Typography.CaptionSmall.Font,
						RelativeSize = p3.Typography.CaptionSmall.FontSize
					},
					Header2 = {
						Font = p3.Typography.TitleLarge.Font,
						RelativeSize = p3.Typography.TitleLarge.FontSize
					}
				}
			}
		end, function(p3)
			-- upvalues: p1 (copy), fFlagEnableVerifiedBadgeStore (copy), userLibModule (copy), roactModule (copy), p2 (ref), emojiTextLabel (copy), emoji (copy)
			local player = p1.props.player
			
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
					ImageTransparency = 0,
					Size = UDim2.new(1, 0, 0, p2.DropDownHeaderBackgroundSize),
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
						DisplayName = (if fFlagEnableVerifiedBadgeStore then p1.props.showVerifiedBadge else userLibModule.Utils.isPlayerVerified(player)) and roactModule.createElement(emojiTextLabel, {
							fluidSizing = false,
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextScaled = true,
							fontStyle = p3.Font.Header2,
							colorStyle = p3.Theme.TextEmphasis,
							emoji = emoji.Verified,
							maxSize = Vector2.new(p2.PlayerDropDownSizeX - 124, 22),
							Text = player.DisplayName,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd
						}) or roactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextScaled = true,
							Size = UDim2.new(1, 0, 0, 22),
							Text = player.DisplayName,
							Font = p3.Font.Header2.Font,
							TextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
							TextColor3 = p3.Theme.TextEmphasis.Color,
							TextTransparency = p3.Theme.TextEmphasis.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd
						}, {
							SizeConstraint = roactModule.createElement("UITextSizeConstraint", {
								MaxTextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
								MinTextSize = p3.Font.BaseSize * p3.Font.Footer.RelativeSize
							})
						}),
						PlayerName = roactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextScaled = true,
							Size = UDim2.new(1, 0, 0, 22),
							Text = "@" .. player.Name,
							Font = p3.Font.CaptionHeader.Font,
							TextSize = p3.Font.BaseSize * p3.Font.CaptionHeader.RelativeSize,
							TextColor3 = p3.Theme.TextMuted.Color,
							TextTransparency = p3.Theme.TextMuted.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd
						}, {
							SizeConstraint = roactModule.createElement("UITextSizeConstraint", {
								MaxTextSize = p3.Font.BaseSize * p3.Font.CaptionHeader.RelativeSize,
								MinTextSize = p3.Font.BaseSize * p3.Font.Footer.RelativeSize
							})
						})
					})
				}),
				AvatarImage = roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Position = UDim2.new(0, 56, 0, 0),
					Size = UDim2.new(0, p2.DropDownHeaderSizeY, 0, p2.DropDownHeaderSizeY),
					AnchorPoint = Vector2.new(0.5, 0),
					Image = "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&w=150&h=150"
				}),
				Divider = not p1.props.lastButton and roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 3,
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = p3.Theme.Divider.Transparency,
					BackgroundColor3 = p3.Theme.Divider.Color
				})
			})
		end)
	end)
end

return if fFlagEnableVerifiedBadgeStore then function(p1)
	-- upvalues: useVerifiedBadge (ref), roactModule (ref), dropDownPlayerHeader (ref), cryoModule (ref)
	return roactModule.createElement(dropDownPlayerHeader, cryoModule.Dictionary.join(p1, { showVerifiedBadge = useVerifiedBadge(p1.player) }))
end else dropDownPlayerHeader