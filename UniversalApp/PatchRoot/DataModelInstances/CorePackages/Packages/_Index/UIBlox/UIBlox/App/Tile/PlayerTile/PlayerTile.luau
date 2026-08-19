local app = script:FindFirstAncestor("App")
local parent = app.Parent
local core = parent.Core
local parent_1 = parent.Parent
local UIBloxConfigModule = require(parent.UIBloxConfig)
local tModule = require(parent_1.t)
local roactModule = require(parent_1.Roact)
local object = require(parent_1.LuauPolyfill).Object
local cryoModule = require(parent_1.Cryo)
local dictionary = cryoModule.Dictionary
local list = cryoModule.List
local imagesModule = require(app.ImageSet.Images)
local validateImageSetDataModule = require(core.ImageSet.Validator.validateImageSetData)
local controlStateModule = require(core.Control.Enum.ControlState)
local withStyleModule = require(core.Style.withStyle)
local getContentStyleModule = require(core.Button.getContentStyle)
local playerTileButtonModule = require(app.Tile.PlayerTile.PlayerTileButton)
local playerContextModule = require(app.Indicator.PlayerContext)
local springAnimatedItemModule = require(parent.Utility.SpringAnimatedItem)
local validateFontInfoModule = require(core.Style.Validator.validateFontInfo)
local validateTypographyInfoModule = require(parent.Core.Style.Validator.validateTypographyInfo)
local tileModule = require(app.Tile.BaseTile.Tile)
local playerTile = roactModule.PureComponent:extend("PlayerTile")
playerTile.validateProps = tModule.strictInterface({
	title = tModule.optional(tModule.string),
	subtitle = tModule.optional(tModule.string),
	subtitleFontStyle = tModule.optional(tModule.union(validateFontInfoModule, validateTypographyInfoModule)),
	hasVerifiedBadge = tModule.optional(tModule.boolean),
	Selectable = tModule.optional(tModule.boolean),
	thumbnail = tModule.optional(tModule.union(tModule.string, tModule.table)),
	buttons = tModule.optional(tModule.array(tModule.strictInterface({
		icon = tModule.optional(tModule.union(tModule.string, validateImageSetDataModule)),
		onActivated = tModule.optional(tModule.callback),
		isSecondary = tModule.optional(tModule.boolean),
		isDisabled = tModule.optional(tModule.boolean)
	}))),
	relevancyInfo = tModule.strictInterface({
		text = tModule.optional(tModule.string),
		icon = tModule.optional(tModule.union(tModule.string, tModule.table)),
		iconSize = tModule.optional(tModule.UDim2),
		iconColor = tModule.optional(tModule.Color3),
		iconTransparency = tModule.optional(tModule.number),
		onActivated = tModule.optional(tModule.callback),
		fontStyle = tModule.optional(tModule.union(validateFontInfoModule, validateTypographyInfoModule)),
		horizontalAlignment = tModule.optional(tModule.EnumItem),
		textXAlignment = tModule.optional(tModule.EnumItem)
	}),
	tileSize = tModule.optional(tModule.UDim2),
	thumbnailFrameSize = tModule.optional(tModule.UDim2),
	isCircular = tModule.optional(tModule.boolean),
	horizontalAlignment = tModule.optional(tModule.EnumItem),
	footerTopPadding = tModule.optional(tModule.integer),
	onActivated = tModule.optional(tModule.callback),
	forwardedRef = tModule.optional(tModule.table),
	openTypeFeatures = tModule.optional(tModule.string),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean),
	buttonRef = tModule.optional(tModule.table)
})
playerTile.defaultProps = {
	Selectable = false,
	isCircular = false,
	openTypeFeatures = nil,
	isRoactGamepadEnabled = true,
	buttons = {},
	relevancyInfo = {},
	tileSize = UDim2.new(0, 150, 0, 150),
	onActivated = function() --[[ line: 89 ]] end
}
local t = { dampingRatio = 1, frequency = 4 }
local t_1 = { [controlStateModule.Default] = "SystemPrimaryContent" }
local vignette246 = imagesModule["component_assets/vignette_246"]

local function _(p0) --[[ line: 108 | named "footer" ]]
	-- upvalues: withStyleModule (ref), object (ref), UIBloxConfigModule (ref), roactModule (ref), playerContextModule (ref)
	return withStyleModule(function(p1) --[[ line: 109 ]]
		-- upvalues: object (copy), p0 (ref), UIBloxConfigModule (copy), roactModule (copy), playerContextModule (copy)
		local tokens = p1.Tokens
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			PlayerContext = roactModule.createElement(playerContextModule, object.assign({}, {
				iconPadding = 0,
				fontStyle = if p0.playerContext.onActivated then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.CaptionMedium else tokens.Semantic.Typography.CaptionHeader elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.BodySmall else tokens.Semantic.Typography.CaptionBody,
				iconTextSpacing = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Space_50,
				iconSize = UDim2.fromOffset(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Size_150, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Size_150),
				textHeight = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_700 else tokens.Global.Size_350,
				horizontalAlignment = p0.horizontalAlignment,
				textXAlignment = p0.textXAlignment
			}, p0.playerContext))
		})
	end)
end

local _ = function(p2) --[[ line: 153 | named "thumbnailOverlayComponents" ]]
	-- upvalues: withStyleModule (ref), UIBloxConfigModule (ref), getContentStyleModule (ref), t_1 (ref), roactModule (ref), cryoModule (ref), springAnimatedItemModule (ref), t (ref), vignette246 (ref), list (ref), playerTileButtonModule (ref)
	return withStyleModule(function(p3) --[[ line: 154 ]]
		-- upvalues: UIBloxConfigModule (copy), getContentStyleModule (copy), t_1 (copy), p2 (ref), roactModule (copy), cryoModule (copy), springAnimatedItemModule (copy), t (copy), vignette246 (copy), list (copy), playerTileButtonModule (copy)
		local tokens = p3.Tokens
		local var19 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100
		local var20 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_900 else tokens.Global.Size_450
		
		return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			ButtonBackgroundGradient = not p2.isCircular and (not cryoModule.isEmpty(p2.buttons) and roactModule.createElement("Frame", {
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var20 + var19 * 2),
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0)
			}, {
				UIGradient = roactModule.createElement("UIGradient", {
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
				UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
			})),
			HoverTransparency = roactModule.createElement(springAnimatedItemModule.AnimatedImageLabel, {
				springOptions = t,
				animatedValues = { imageTransparency = if p2.mouseEntered then 0.6 else 1 },
				mapValuesToProps = function(p4) --[[ line: 199 ]]
					return { ImageTransparency = p4.imageTransparency }
				end,
				regularProps = {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Image = vignette246.Image,
					ImageRectSize = vignette246.ImageRectSize,
					ImageRectOffset = vignette246.ImageRectOffset,
					ImageColor3 = getContentStyleModule(t_1, p2.controlState, p3).Color,
					ImageTransparency = 0,
					LayoutOrder = 2,
					[roactModule.Event.MouseEnter] = p2.hoverMouseEnter,
					[roactModule.Event.MouseLeave] = p2.hoverMouseLeave
				}
			}, {
				corner = roactModule.createElement("UICorner", {
					CornerRadius = if p2.isCircular then UDim.new(0.5, 0) else UDim.new(0, 8)
				})
			}),
			ButtonContainer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				PlayerTileButtons = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					ZIndex = 2,
					Position = UDim2.new(1, 0, 1, 0),
					Size = UDim2.new(0, p2.tileSize.X.Offset - var19 * 2, 0, var20),
					AnchorPoint = Vector2.new(1, 1)
				}, list.join(list.map(p2.buttons, function(p5) --[[ line: 237 ]]
					-- upvalues: roactModule (copy), playerTileButtonModule (copy), var20 (ref), var19 (ref), p2 (copy)
					return roactModule.createElement(playerTileButtonModule, {
						buttonHeight = var20,
						outerButtonPadding = var19,
						tileSize = p2.tileSize,
						icon = p5.icon,
						isSecondary = p5.isSecondary,
						isDisabled = p5.isDisabled,
						onActivated = p5.onActivated,
						mouseEnter = p2.hoverMouseEnter,
						mouseLeave = p2.hoverMouseLeave,
						isRoactGamepadEnabled = p2.isRoactGamepadEnabled
					})
				end), {
					roactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100),
						FillDirection = Enum.FillDirection.Horizontal
					})
				})),
				UIPadding = roactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, var19),
					PaddingRight = UDim.new(0, var19)
				})
			})
		})
	end)
end

function playerTile.init(p6) --[[ line: 269 ]]
	-- upvalues: roactModule (ref), controlStateModule (ref)
	p6.firstButtonIcon = roactModule.createRef()
	p6.secondButtonIcon = roactModule.createRef()
	p6.mouseEntered = false
	p6.state = {
		mouseEntered = false,
		controlState = controlStateModule.Initialize
	}
	
	function p6.onStateChanged(p7, p8) --[[ line: 278 ]]
		-- upvalues: p6 (ref)
		p6:setState({ controlState = p8 })
		
		if p6.props.onStateChanged then
			p6.props.onStateChanged(p7, p8)
		end
	end
	
	function p6.hoverMouseEnter() --[[ line: 287 ]]
		-- upvalues: p6 (ref)
		p6:setState({ mouseEntered = true })
	end
	
	function p6.hoverMouseLeave() --[[ line: 293 ]]
		-- upvalues: p6 (ref)
		p6:setState({ mouseEntered = false })
	end
end

function playerTile.render(p9) --[[ line: 300 ]]
	-- upvalues: withStyleModule (ref), UIBloxConfigModule (ref), roactModule (ref), tileModule (ref), dictionary (ref), object (ref), playerContextModule (ref), imagesModule (ref), getContentStyleModule (ref), t_1 (ref), cryoModule (ref), springAnimatedItemModule (ref), t (ref), vignette246 (ref), list (ref), playerTileButtonModule (ref)
	local tileSize = p9.props.tileSize
	local title = p9.props.title
	local onActivated = p9.props.onActivated
	local thumbnail = p9.props.thumbnail
	
	return withStyleModule(function(p10) --[[ line: 306 ]]
		-- upvalues: p9 (ref), UIBloxConfigModule (copy), roactModule (copy), tileSize (ref), tileModule (copy), dictionary (copy), withStyleModule (copy), object (copy), playerContextModule (copy), title (ref), onActivated (ref), thumbnail (ref), imagesModule (copy), getContentStyleModule (copy), t_1 (copy), cryoModule (copy), springAnimatedItemModule (copy), t (copy), vignette246 (copy), list (copy), playerTileButtonModule (copy)
		local tokens = p10.Tokens
		local subtitleFontStyle = p9.props.subtitleFontStyle or (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.CaptionMedium else tokens.Semantic.Typography.CaptionHeader)
		local footerTopPadding = p9.props.footerTopPadding or (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Space_50)
		local createElement = roactModule.createElement
		local var23 = "Frame"
		local t_2 = {
			Size = tileSize,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			[roactModule.Ref] = p9.props.forwardedRef
		}
		local t_3 = {}
		local createElement_1 = roactModule.createElement
		local t_4 = {
			hasRoundedCorners = true,
			innerPadding = 0,
			titleRichText = true,
			titleTextLineCount = 1,
			textButtonRef = p9.props.buttonRef
		}
		local t_5 = {
			playerContext = if p9.props.Selectable then dictionary.join(p9.props.relevancyInfo, { Selectable = false }) else p9.props.relevancyInfo,
			controlState = p9.state.controlState
		}
		t_4.footer = withStyleModule(function(p11) --[[ line: 109 ]]
			-- upvalues: object (copy), t_5 (ref), UIBloxConfigModule (copy), roactModule (copy), playerContextModule (copy)
			local tokens = p11.Tokens
			
			return roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				PlayerContext = roactModule.createElement(playerContextModule, object.assign({}, {
					iconPadding = 0,
					fontStyle = if t_5.playerContext.onActivated then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.CaptionMedium else tokens.Semantic.Typography.CaptionHeader elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.BodySmall else tokens.Semantic.Typography.CaptionBody,
					iconTextSpacing = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Space_50,
					iconSize = UDim2.fromOffset(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Size_150, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Size_150),
					textHeight = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_700 else tokens.Global.Size_350,
					horizontalAlignment = t_5.horizontalAlignment,
					textXAlignment = t_5.textXAlignment
				}, t_5.playerContext))
			})
		end)
		t_4.Selectable = p9.props.Selectable
		t_4.titleTopPadding = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100
		t_4.subtitleTopPadding = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25
		t_4.footerTopPadding = footerTopPadding
		t_4.name = title
		t_4.nameTextColor = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis.Color3 else tokens.Semantic.Color.Text.Emphasis.Color3
		t_4.titleFontStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.TitleLarge else tokens.Semantic.Typography.Subheader
		t_4.hasVerifiedBadge = p9.props.hasVerifiedBadge
		t_4.subtitle = p9.props.subtitle
		t_4.subtitleFontStyle = subtitleFontStyle
		t_4.onActivated = onActivated
		t_4.thumbnail = thumbnail
		t_4.backgroundImage = imagesModule[p10.Theme.PlayerBackgroundDefault.Image]
		local var28 = dictionary.join(p9.props, {
			hoverMouseEnter = p9.hoverMouseEnter,
			hoverMouseLeave = p9.hoverMouseLeave,
			mouseEntered = p9.state.mouseEntered
		})
		t_4.thumbnailOverlayComponents = withStyleModule(function(p12) --[[ line: 154 ]]
			-- upvalues: UIBloxConfigModule (copy), getContentStyleModule (copy), t_1 (copy), var28 (ref), roactModule (copy), cryoModule (copy), springAnimatedItemModule (copy), t (copy), vignette246 (copy), list (copy), playerTileButtonModule (copy)
			local tokens = p12.Tokens
			local var19 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100
			local var20 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_900 else tokens.Global.Size_450
			
			return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				ButtonBackgroundGradient = not var28.isCircular and (not cryoModule.isEmpty(var28.buttons) and roactModule.createElement("Frame", {
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, var20 + var19 * 2),
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 0, 1, 0)
				}, {
					UIGradient = roactModule.createElement("UIGradient", {
						Rotation = 90,
						Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0, p12.Theme.BackgroundUIContrast.Color),
							ColorSequenceKeypoint.new(1, p12.Theme.BackgroundUIContrast.Color)
						}),
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 1),
							NumberSequenceKeypoint.new(1, p12.Theme.BackgroundUIContrast.Transparency)
						})
					}),
					UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
				})),
				HoverTransparency = roactModule.createElement(springAnimatedItemModule.AnimatedImageLabel, {
					springOptions = t,
					animatedValues = {
						imageTransparency = if var28.mouseEntered then 0.6 else 1
					},
					mapValuesToProps = function(p13) --[[ line: 199 ]]
						return { ImageTransparency = p13.imageTransparency }
					end,
					regularProps = {
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1,
						Image = vignette246.Image,
						ImageRectSize = vignette246.ImageRectSize,
						ImageRectOffset = vignette246.ImageRectOffset,
						ImageColor3 = getContentStyleModule(t_1, var28.controlState, p12).Color,
						ImageTransparency = 0,
						LayoutOrder = 2,
						[roactModule.Event.MouseEnter] = var28.hoverMouseEnter,
						[roactModule.Event.MouseLeave] = var28.hoverMouseLeave
					}
				}, {
					corner = roactModule.createElement("UICorner", {
						CornerRadius = if var28.isCircular then UDim.new(0.5, 0) else UDim.new(0, 8)
					})
				}),
				ButtonContainer = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					PlayerTileButtons = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						ZIndex = 2,
						Position = UDim2.new(1, 0, 1, 0),
						Size = UDim2.new(0, var28.tileSize.X.Offset - var19 * 2, 0, var20),
						AnchorPoint = Vector2.new(1, 1)
					}, list.join(list.map(var28.buttons, function(p14) --[[ line: 237 ]]
						-- upvalues: roactModule (copy), playerTileButtonModule (copy), var20 (ref), var19 (ref), var28 (copy)
						return roactModule.createElement(playerTileButtonModule, {
							buttonHeight = var20,
							outerButtonPadding = var19,
							tileSize = var28.tileSize,
							icon = p14.icon,
							isSecondary = p14.isSecondary,
							isDisabled = p14.isDisabled,
							onActivated = p14.onActivated,
							mouseEnter = var28.hoverMouseEnter,
							mouseLeave = var28.hoverMouseLeave,
							isRoactGamepadEnabled = var28.isRoactGamepadEnabled
						})
					end), {
						roactModule.createElement("UIListLayout", {
							HorizontalAlignment = Enum.HorizontalAlignment.Right,
							Padding = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100),
							FillDirection = Enum.FillDirection.Horizontal
						})
					})),
					UIPadding = roactModule.createElement("UIPadding", {
						PaddingBottom = UDim.new(0, var19),
						PaddingRight = UDim.new(0, var19)
					})
				})
			})
		end)
		t_4.addSubtitleSpace = title == nil
		t_4.isCircular = p9.props.isCircular
		t_4.horizontalAlignment = p9.props.horizontalAlignment
		t_4.thumbnailFrameSize = p9.props.thumbnailFrameSize
		t_4.openTypeFeatures = p9.props.openTypeFeatures
		t_3.Tile = createElement_1(tileModule, t_4)
		
		return createElement(var23, t_2, t_3)
	end)
end

return roactModule.forwardRef(function(p15, p16) --[[ line: 377 ]]
	-- upvalues: roactModule (ref), playerTile (ref), dictionary (ref)
	return roactModule.createElement(playerTile, dictionary.join(p15, { forwardedRef = p16 }))
end)