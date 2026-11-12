local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local CryoModule = require(CorePackages.Packages.Cryo)
local NormalizeFontFaceFunction = require(CorePackages.Packages.Foundation).Utility.normalizeFontFace
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local Parent = script.Parent.Parent
local WithLayoutValuesFunction = require(Parent.Connection.LayoutValues).WithLayoutValues
local FFlagPlayerListFixDropDownVerifiedBadgeSizeModule = require(Parent.Parent.Flags.FFlagPlayerListFixDropDownVerifiedBadgeSize)
local UseVerifiedBadgeFunction = require(CorePackages.Workspace.Packages.UserProfiles).Hooks.useVerifiedBadge
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableVerifiedBadgeStore = SharedFlagsModule.FFlagEnableVerifiedBadgeStore
local FFlagCoreUiMigrateUIBloxToFoundation = SharedFlagsModule.FFlagCoreUiMigrateUIBloxToFoundation
local EmojiTextLabel = UIBloxModule.Core.Text.EmojiTextLabel
local Emoji = UIBloxModule.App.Emoji.Enum.Emoji
local DropDownPlayerHeader = RoactModule.PureComponent:extend("DropDownPlayerHeader")
DropDownPlayerHeader.validateProps = TModule.strictInterface({
	player = TModule.instanceIsA("Player"),
	showVerifiedBadge = TModule.optional(TModule.boolean)
})

function DropDownPlayerHeader.render(p1)
	-- upvalues: WithLayoutValuesFunction (copy), WithFoundationOrUIBloxStyleFunction (copy), FFlagEnableVerifiedBadgeStore (copy), UserLibModule (copy), CryoModule (copy), FFlagPlayerListFixDropDownVerifiedBadgeSizeModule (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), RoactModule (copy), EmojiTextLabel (copy), Emoji (copy), NormalizeFontFaceFunction (copy)
	return WithLayoutValuesFunction(function(p2)
		-- upvalues: WithFoundationOrUIBloxStyleFunction (upval), p1 (copy), FFlagEnableVerifiedBadgeStore (upval), UserLibModule (upval), CryoModule (upval), FFlagPlayerListFixDropDownVerifiedBadgeSizeModule (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), RoactModule (upval), EmojiTextLabel (upval), Emoji (upval), NormalizeFontFaceFunction (upval)
		return WithFoundationOrUIBloxStyleFunction(function(Tokens)
			return {
				Tokens = Tokens,
				Theme = {
					Divider = {
						Color = Tokens.Color.Stroke.Emphasis.Color3,
						Transparency = Tokens.Color.Stroke.Emphasis.Transparency
					},
					TextEmphasis = {
						Color = Tokens.Color.Content.Emphasis.Color3,
						Transparency = Tokens.Color.Content.Emphasis.Transparency
					},
					TextMuted = {
						Color = Tokens.Color.Content.Muted.Color3,
						Transparency = Tokens.Color.Content.Muted.Transparency
					}
				},
				Font = {
					BaseSize = 1,
					CaptionHeader = {
						Font = Tokens.Typography.CaptionLarge.Font,
						RelativeSize = Tokens.Typography.CaptionLarge.FontSize
					},
					Footer = {
						Font = Tokens.Typography.CaptionSmall.Font,
						RelativeSize = Tokens.Typography.CaptionSmall.FontSize
					},
					Header2 = {
						Font = Tokens.Typography.TitleLarge.Font,
						RelativeSize = Tokens.Typography.TitleLarge.FontSize,
						FontSize = Tokens.Typography.TitleLarge.FontSize,
						LineHeight = Tokens.Typography.TitleLarge.LineHeight,
						LetterSpacing = Tokens.Typography.TitleLarge.LetterSpacing
					}
				}
			}
		end, function(p3)
			-- upvalues: p1 (upval), FFlagEnableVerifiedBadgeStore (upval), UserLibModule (upval), CryoModule (upval), FFlagPlayerListFixDropDownVerifiedBadgeSizeModule (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), RoactModule (upval), p2 (copy), EmojiTextLabel (upval), Emoji (upval), NormalizeFontFaceFunction (upval)
			local Player = p1.props.player
			local JoinResult = CryoModule.Dictionary.join(p3.Font.Header2, {
				Font = p3.Tokens.Typography.TitleLarge.Font,
				RelativeSize = if FFlagPlayerListFixDropDownVerifiedBadgeSizeModule and FFlagCoreUiMigrateUIBloxToFoundation then CryoModule.None else nil
			})
			
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
					ImageTransparency = 0,
					Size = UDim2.new(1, 0, 0, p2.DropDownHeaderBackgroundSize),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1)
				}, {
					TextContainerFrame = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, -124, 1, 0),
						Position = UDim2.new(0, 107, 0, 0)
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
							TextScaled = true,
							fontStyle = JoinResult,
							colorStyle = p3.Theme.TextEmphasis,
							emoji = Emoji.Verified,
							maxSize = Vector2.new(p2.PlayerDropDownSizeX - 124, 22),
							Text = Player.DisplayName,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd
						}) or RoactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextScaled = true,
							Size = UDim2.new(1, 0, 0, 22),
							Text = Player.DisplayName,
							FontFace = NormalizeFontFaceFunction(p3.Tokens.Typography.TitleLarge.Font),
							TextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
							TextColor3 = p3.Theme.TextEmphasis.Color,
							TextTransparency = p3.Theme.TextEmphasis.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd
						}, {
							SizeConstraint = RoactModule.createElement("UITextSizeConstraint", {
								MaxTextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
								MinTextSize = p3.Font.BaseSize * p3.Font.Footer.RelativeSize
							})
						}),
						PlayerName = RoactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextScaled = true,
							Size = UDim2.new(1, 0, 0, 22),
							Text = "@" .. Player.Name,
							FontFace = NormalizeFontFaceFunction(p3.Tokens.Typography.CaptionLarge.Font),
							TextSize = p3.Font.BaseSize * p3.Font.CaptionHeader.RelativeSize,
							TextColor3 = p3.Theme.TextMuted.Color,
							TextTransparency = p3.Theme.TextMuted.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextTruncate = Enum.TextTruncate.AtEnd
						}, {
							SizeConstraint = RoactModule.createElement("UITextSizeConstraint", {
								MaxTextSize = p3.Font.BaseSize * p3.Font.CaptionHeader.RelativeSize,
								MinTextSize = p3.Font.BaseSize * p3.Font.Footer.RelativeSize
							})
						})
					})
				}),
				AvatarImage = RoactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Position = UDim2.new(0, 56, 0, 0),
					Size = UDim2.new(0, p2.DropDownHeaderSizeY, 0, p2.DropDownHeaderSizeY),
					AnchorPoint = Vector2.new(0.5, 0),
					Image = "rbxthumb://type=AvatarHeadShot&id=" .. Player.UserId .. "&w=150&h=150"
				}),
				Divider = not p1.props.lastButton and RoactModule.createElement("Frame", {
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

local function v14(p1)
	-- upvalues: UseVerifiedBadgeFunction (copy), RoactModule (copy), DropDownPlayerHeader (copy), CryoModule (copy)
	return RoactModule.createElement(DropDownPlayerHeader, CryoModule.Dictionary.join(p1, { showVerifiedBadge = UseVerifiedBadgeFunction(p1.player) }))
end

return if FFlagEnableVerifiedBadgeStore then v14 else DropDownPlayerHeader