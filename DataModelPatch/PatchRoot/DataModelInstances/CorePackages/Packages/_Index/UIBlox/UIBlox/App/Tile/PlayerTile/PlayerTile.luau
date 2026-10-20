local App = script:FindFirstAncestor("App")
local Parent = App.Parent
local Core = Parent.Core
local Parent1 = Parent.Parent
local TModule = require(Parent1.t)
local RoactModule = require(Parent1.Roact)
local Object = require(Parent1.LuauPolyfill).Object
local CryoModule = require(Parent1.Cryo)
local Dictionary = CryoModule.Dictionary
local List = CryoModule.List
local ImagesModule = require(App.ImageSet.Images)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local WithStyleModule = require(Core.Style.withStyle)
local GetContentStyleModule = require(Core.Button.getContentStyle)
local PlayerTileButtonModule = require(App.Tile.PlayerTile.PlayerTileButton)
local PlayerContextModule = require(App.Indicator.PlayerContext)
local SpringAnimatedItemModule = require(Parent.Utility.SpringAnimatedItem)
local ValidateFontInfoModule = require(Core.Style.Validator.validateFontInfo)
local ValidateTypographyInfoModule = require(Parent.Core.Style.Validator.validateTypographyInfo)
local TileModule = require(App.Tile.BaseTile.Tile)
local PlayerTile = RoactModule.PureComponent:extend("PlayerTile")
PlayerTile.validateProps = TModule.strictInterface({
	title = TModule.optional(TModule.string),
	subtitle = TModule.optional(TModule.string),
	subtitleFontStyle = TModule.optional(TModule.union(ValidateFontInfoModule, ValidateTypographyInfoModule)),
	hasVerifiedBadge = TModule.optional(TModule.boolean),
	Selectable = TModule.optional(TModule.boolean),
	thumbnail = TModule.optional(TModule.union(TModule.string, TModule.table)),
	buttons = TModule.optional(TModule.array(TModule.strictInterface({
		icon = TModule.optional((TModule.union(TModule.string, (require(Core.ImageSet.Validator.validateImageSetData))))),
		onActivated = TModule.optional(TModule.callback),
		isSecondary = TModule.optional(TModule.boolean),
		isDisabled = TModule.optional(TModule.boolean)
	}))),
	relevancyInfo = TModule.strictInterface({
		text = TModule.optional(TModule.string),
		icon = TModule.optional(TModule.union(TModule.string, TModule.table)),
		iconSize = TModule.optional(TModule.UDim2),
		iconColor = TModule.optional(TModule.Color3),
		iconTransparency = TModule.optional(TModule.number),
		onActivated = TModule.optional(TModule.callback),
		fontStyle = TModule.optional(TModule.union(ValidateFontInfoModule, ValidateTypographyInfoModule)),
		horizontalAlignment = TModule.optional(TModule.EnumItem),
		textXAlignment = TModule.optional(TModule.EnumItem)
	}),
	tileSize = TModule.optional(TModule.UDim2),
	thumbnailFrameSize = TModule.optional(TModule.UDim2),
	isCircular = TModule.optional(TModule.boolean),
	horizontalAlignment = TModule.optional(TModule.EnumItem),
	footerTopPadding = TModule.optional(TModule.integer),
	onActivated = TModule.optional(TModule.callback),
	forwardedRef = TModule.optional(TModule.table),
	openTypeFeatures = TModule.optional(TModule.string),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean),
	buttonRef = TModule.optional(TModule.table)
})
PlayerTile.defaultProps = {
	Selectable = false,
	isCircular = false,
	openTypeFeatures = nil,
	isRoactGamepadEnabled = true,
	buttons = {},
	relevancyInfo = {},
	tileSize = UDim2.new(0, 150, 0, 150),
	onActivated = function() end
}
local SpringOptions = { dampingRatio = 1, frequency = 4 }
local config = { [ControlStateModule.Default] = "SystemPrimaryContent" }
local ComponentAssetsVignette246 = ImagesModule["component_assets/vignette_246"]

local function _(p1)
	-- upvalues: WithStyleModule (copy), Object (copy), RoactModule (copy), PlayerContextModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: Object (upval), p1 (copy), RoactModule (upval), PlayerContextModule (upval)
		local Tokens = p2.Tokens
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			PlayerContext = RoactModule.createElement(PlayerContextModule, (Object.assign({}, {
				iconPadding = 0,
				fontStyle = if p1.playerContext.onActivated then Tokens.Semantic.Typography.CaptionHeader else Tokens.Semantic.Typography.CaptionBody,
				iconTextSpacing = Tokens.Global.Space_50,
				iconSize = UDim2.fromOffset(Tokens.Global.Size_150, Tokens.Global.Size_150),
				textHeight = Tokens.Global.Size_350,
				horizontalAlignment = p1.horizontalAlignment,
				textXAlignment = p1.textXAlignment
			}, p1.playerContext)))
		})
	end)
end

local _ = function(DefaultProps)
	-- upvalues: WithStyleModule (copy), GetContentStyleModule (copy), config (copy), RoactModule (copy), CryoModule (copy), SpringAnimatedItemModule (copy), SpringOptions (copy), ComponentAssetsVignette246 (copy), List (copy), PlayerTileButtonModule (copy)
	return WithStyleModule(function(p1)
		-- upvalues: GetContentStyleModule (upval), config (upval), DefaultProps (copy), RoactModule (upval), CryoModule (upval), SpringAnimatedItemModule (upval), SpringOptions (upval), ComponentAssetsVignette246 (upval), List (upval), PlayerTileButtonModule (upval)
		local Tokens = p1.Tokens
		local Space100: number = Tokens.Global.Space_100
		local Size450 = Tokens.Global.Size_450
		
		return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			ButtonBackgroundGradient = not DefaultProps.isCircular and (not CryoModule.isEmpty(DefaultProps.buttons) and RoactModule.createElement("Frame", {
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, Size450 + Space100 * 2),
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0)
			}, {
				UIGradient = RoactModule.createElement("UIGradient", {
					Rotation = 90,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, p1.Theme.BackgroundUIContrast.Color),
						ColorSequenceKeypoint.new(1, p1.Theme.BackgroundUIContrast.Color)
					}),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(1, p1.Theme.BackgroundUIContrast.Transparency)
					})
				}),
				UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
			})),
			HoverTransparency = RoactModule.createElement(SpringAnimatedItemModule.AnimatedImageLabel, {
				springOptions = SpringOptions,
				animatedValues = {
					imageTransparency = if DefaultProps.mouseEntered then 0.6 else 1
				},
				mapValuesToProps = function(p2)
					return { ImageTransparency = p2.imageTransparency }
				end,
				regularProps = {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Image = ComponentAssetsVignette246.Image,
					ImageRectSize = ComponentAssetsVignette246.ImageRectSize,
					ImageRectOffset = ComponentAssetsVignette246.ImageRectOffset,
					ImageColor3 = GetContentStyleModule(config, DefaultProps.controlState, p1).Color,
					ImageTransparency = 0,
					LayoutOrder = 2,
					[RoactModule.Event.MouseEnter] = DefaultProps.hoverMouseEnter,
					[RoactModule.Event.MouseLeave] = DefaultProps.hoverMouseLeave
				}
			}, {
				corner = RoactModule.createElement("UICorner", {
					CornerRadius = if DefaultProps.isCircular then UDim.new(0.5, 0) else UDim.new(0, 8)
				})
			}),
			ButtonContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				PlayerTileButtons = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					ZIndex = 2,
					Position = UDim2.new(1, 0, 1, 0),
					Size = UDim2.new(0, DefaultProps.tileSize.X.Offset - Space100 * 2, 0, Size450),
					AnchorPoint = Vector2.new(1, 1)
				}, List.join(List.map(DefaultProps.buttons, function(p2)
					-- upvalues: RoactModule (upval), PlayerTileButtonModule (upval), Size450 (copy), Space100 (copy), DefaultProps (upval)
					return RoactModule.createElement(PlayerTileButtonModule, {
						buttonHeight = Size450,
						outerButtonPadding = Space100,
						tileSize = DefaultProps.tileSize,
						icon = p2.icon,
						isSecondary = p2.isSecondary,
						isDisabled = p2.isDisabled,
						onActivated = p2.onActivated,
						mouseEnter = DefaultProps.hoverMouseEnter,
						mouseLeave = DefaultProps.hoverMouseLeave,
						isRoactGamepadEnabled = DefaultProps.isRoactGamepadEnabled
					})
				end), {
					RoactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = UDim.new(0, Tokens.Global.Space_100),
						FillDirection = Enum.FillDirection.Horizontal
					})
				})),
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, Space100),
					PaddingRight = UDim.new(0, Space100)
				})
			})
		})
	end)
end

function PlayerTile.init(p1)
	-- upvalues: RoactModule (copy), ControlStateModule (copy)
	p1.firstButtonIcon = RoactModule.createRef()
	p1.secondButtonIcon = RoactModule.createRef()
	p1.mouseEntered = false
	p1.state = {
		mouseEntered = false,
		controlState = ControlStateModule.Initialize
	}
	
	function p1.onStateChanged(p2, ControlState)
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, ControlState)
		end
	end
	
	function p1.hoverMouseEnter()
		-- upvalues: p1 (copy)
		p1:setState({ mouseEntered = true })
	end
	
	function p1.hoverMouseLeave()
		-- upvalues: p1 (copy)
		p1:setState({ mouseEntered = false })
	end
end

function PlayerTile.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), TileModule (copy), Dictionary (copy), Object (copy), PlayerContextModule (copy), ImagesModule (copy), GetContentStyleModule (copy), config (copy), CryoModule (copy), SpringAnimatedItemModule (copy), SpringOptions (copy), ComponentAssetsVignette246 (copy), List (copy), PlayerTileButtonModule (copy)
	local TileSize = p1.props.tileSize
	local Title = p1.props.title
	local OnActivated = p1.props.onActivated
	local Thumbnail = p1.props.thumbnail
	
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), TileSize (copy), TileModule (upval), Dictionary (upval), WithStyleModule (upval), Object (upval), PlayerContextModule (upval), Title (copy), OnActivated (copy), Thumbnail (copy), ImagesModule (upval), GetContentStyleModule (upval), config (upval), CryoModule (upval), SpringAnimatedItemModule (upval), SpringOptions (upval), ComponentAssetsVignette246 (upval), List (upval), PlayerTileButtonModule (upval)
		local Tokens = p2.Tokens
		local config1 = {
			playerContext = if p1.props.Selectable then Dictionary.join(p1.props.relevancyInfo, { Selectable = false }) else p1.props.relevancyInfo,
			controlState = p1.state.controlState
		}
		local JoinResult = Dictionary.join(p1.props, {
			hoverMouseEnter = p1.hoverMouseEnter,
			hoverMouseLeave = p1.hoverMouseLeave,
			mouseEntered = p1.state.mouseEntered
		})
		
		return RoactModule.createElement("Frame", {
			Size = TileSize,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			[RoactModule.Ref] = p1.props.forwardedRef
		}, {
			Tile = RoactModule.createElement(TileModule, {
				hasRoundedCorners = true,
				innerPadding = 0,
				titleRichText = true,
				titleTextLineCount = 1,
				textButtonRef = p1.props.buttonRef,
				footer = WithStyleModule(function(p3)
					-- upvalues: Object (upval), config1 (copy), RoactModule (upval), PlayerContextModule (upval)
					local Tokens = p3.Tokens
					
					return RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						PlayerContext = RoactModule.createElement(PlayerContextModule, (Object.assign({}, {
							iconPadding = 0,
							fontStyle = if config1.playerContext.onActivated then Tokens.Semantic.Typography.CaptionHeader else Tokens.Semantic.Typography.CaptionBody,
							iconTextSpacing = Tokens.Global.Space_50,
							iconSize = UDim2.fromOffset(Tokens.Global.Size_150, Tokens.Global.Size_150),
							textHeight = Tokens.Global.Size_350,
							horizontalAlignment = config1.horizontalAlignment,
							textXAlignment = config1.textXAlignment
						}, config1.playerContext)))
					})
				end),
				Selectable = p1.props.Selectable,
				titleTopPadding = Tokens.Global.Space_100,
				subtitleTopPadding = Tokens.Global.Space_25,
				footerTopPadding = p1.props.footerTopPadding or Tokens.Global.Space_50,
				name = Title,
				nameTextColor = Tokens.Semantic.Color.Text.Emphasis.Color3,
				titleFontStyle = Tokens.Semantic.Typography.Subheader,
				hasVerifiedBadge = p1.props.hasVerifiedBadge,
				subtitle = p1.props.subtitle,
				subtitleFontStyle = p1.props.subtitleFontStyle or Tokens.Semantic.Typography.CaptionHeader,
				onActivated = OnActivated,
				thumbnail = Thumbnail,
				backgroundImage = ImagesModule[p2.Theme.PlayerBackgroundDefault.Image],
				thumbnailOverlayComponents = WithStyleModule(function(p3)
					-- upvalues: GetContentStyleModule (upval), config (upval), JoinResult (copy), RoactModule (upval), CryoModule (upval), SpringAnimatedItemModule (upval), SpringOptions (upval), ComponentAssetsVignette246 (upval), List (upval), PlayerTileButtonModule (upval)
					local Tokens = p3.Tokens
					local Space100: number = Tokens.Global.Space_100
					local Size450 = Tokens.Global.Size_450
					
					return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
						ButtonBackgroundGradient = not JoinResult.isCircular and (not CryoModule.isEmpty(JoinResult.buttons) and RoactModule.createElement("Frame", {
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, Size450 + Space100 * 2),
							AnchorPoint = Vector2.new(0, 1),
							Position = UDim2.new(0, 0, 1, 0)
						}, {
							UIGradient = RoactModule.createElement("UIGradient", {
								Rotation = 90,
								Color = ColorSequence.new({
									ColorSequenceKeypoint.new(0, p3.Theme.BackgroundUIContrast.Color),
									ColorSequenceKeypoint.new(1, p3.Theme.BackgroundUIContrast.Color)
								}),
								Transparency = NumberSequence.new({
									NumberSequenceKeypoint.new(0, 1),
									NumberSequenceKeypoint.new(1, p3.Theme.BackgroundUIContrast.Transparency)
								})
							}),
							UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
						})),
						HoverTransparency = RoactModule.createElement(SpringAnimatedItemModule.AnimatedImageLabel, {
							springOptions = SpringOptions,
							animatedValues = {
								imageTransparency = if JoinResult.mouseEntered then 0.6 else 1
							},
							mapValuesToProps = function(p4)
								return { ImageTransparency = p4.imageTransparency }
							end,
							regularProps = {
								Size = UDim2.new(1, 0, 1, 0),
								BackgroundTransparency = 1,
								Image = ComponentAssetsVignette246.Image,
								ImageRectSize = ComponentAssetsVignette246.ImageRectSize,
								ImageRectOffset = ComponentAssetsVignette246.ImageRectOffset,
								ImageColor3 = GetContentStyleModule(config, JoinResult.controlState, p3).Color,
								ImageTransparency = 0,
								LayoutOrder = 2,
								[RoactModule.Event.MouseEnter] = JoinResult.hoverMouseEnter,
								[RoactModule.Event.MouseLeave] = JoinResult.hoverMouseLeave
							}
						}, {
							corner = RoactModule.createElement("UICorner", {
								CornerRadius = if JoinResult.isCircular then UDim.new(0.5, 0) else UDim.new(0, 8)
							})
						}),
						ButtonContainer = RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							ZIndex = 2,
							Size = UDim2.new(1, 0, 1, 0)
						}, {
							PlayerTileButtons = RoactModule.createElement("Frame", {
								BackgroundTransparency = 1,
								LayoutOrder = 3,
								ZIndex = 2,
								Position = UDim2.new(1, 0, 1, 0),
								Size = UDim2.new(0, JoinResult.tileSize.X.Offset - Space100 * 2, 0, Size450),
								AnchorPoint = Vector2.new(1, 1)
							}, List.join(List.map(JoinResult.buttons, function(p4)
								-- upvalues: RoactModule (upval), PlayerTileButtonModule (upval), Size450 (copy), Space100 (copy), JoinResult (upval)
								return RoactModule.createElement(PlayerTileButtonModule, {
									buttonHeight = Size450,
									outerButtonPadding = Space100,
									tileSize = JoinResult.tileSize,
									icon = p4.icon,
									isSecondary = p4.isSecondary,
									isDisabled = p4.isDisabled,
									onActivated = p4.onActivated,
									mouseEnter = JoinResult.hoverMouseEnter,
									mouseLeave = JoinResult.hoverMouseLeave,
									isRoactGamepadEnabled = JoinResult.isRoactGamepadEnabled
								})
							end), {
								RoactModule.createElement("UIListLayout", {
									HorizontalAlignment = Enum.HorizontalAlignment.Right,
									Padding = UDim.new(0, Tokens.Global.Space_100),
									FillDirection = Enum.FillDirection.Horizontal
								})
							})),
							UIPadding = RoactModule.createElement("UIPadding", {
								PaddingBottom = UDim.new(0, Space100),
								PaddingRight = UDim.new(0, Space100)
							})
						})
					})
				end),
				addSubtitleSpace = Title == nil,
				isCircular = p1.props.isCircular,
				horizontalAlignment = p1.props.horizontalAlignment,
				thumbnailFrameSize = p1.props.thumbnailFrameSize,
				openTypeFeatures = p1.props.openTypeFeatures
			})
		})
	end)
end

return RoactModule.forwardRef(function(p1, ForwardedRef)
	-- upvalues: RoactModule (copy), PlayerTile (copy), Dictionary (copy)
	return RoactModule.createElement(PlayerTile, Dictionary.join(p1, { forwardedRef = ForwardedRef }))
end)