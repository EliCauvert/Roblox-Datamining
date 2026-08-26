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
	onActivated = function() end
}
local t = { dampingRatio = 1, frequency = 4 }
local t_1 = { [controlStateModule.Default] = "SystemPrimaryContent" }
local vignette246 = imagesModule["component_assets/vignette_246"]

local function _(p1)
	-- upvalues: withStyleModule (ref), object (ref), UIBloxConfigModule (ref), roactModule (ref), playerContextModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: object (copy), p1 (ref), UIBloxConfigModule (copy), roactModule (copy), playerContextModule (copy)
		local tokens = p2.Tokens
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			PlayerContext = roactModule.createElement(playerContextModule, object.assign({}, {
				iconPadding = 0,
				fontStyle = if p1.playerContext.onActivated then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.CaptionMedium else tokens.Semantic.Typography.CaptionHeader elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.BodySmall else tokens.Semantic.Typography.CaptionBody,
				iconTextSpacing = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Space_50,
				iconSize = UDim2.fromOffset(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Size_150, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Size_150),
				textHeight = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_700 else tokens.Global.Size_350,
				horizontalAlignment = p1.horizontalAlignment,
				textXAlignment = p1.textXAlignment
			}, p1.playerContext))
		})
	end)
end

local _ = function(p1)
	-- upvalues: withStyleModule (ref), UIBloxConfigModule (ref), getContentStyleModule (ref), t_1 (ref), roactModule (ref), cryoModule (ref), springAnimatedItemModule (ref), t (ref), vignette246 (ref), list (ref), playerTileButtonModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: UIBloxConfigModule (copy), getContentStyleModule (copy), t_1 (copy), p1 (ref), roactModule (copy), cryoModule (copy), springAnimatedItemModule (copy), t (copy), vignette246 (copy), list (copy), playerTileButtonModule (copy)
		local tokens = p2.Tokens
		local var1 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100
		local var2 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_900 else tokens.Global.Size_450
		
		return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			ButtonBackgroundGradient = not p1.isCircular and (not cryoModule.isEmpty(p1.buttons) and roactModule.createElement("Frame", {
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var2 + var1 * 2),
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0)
			}, {
				UIGradient = roactModule.createElement("UIGradient", {
					Rotation = 90,
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, p2.Theme.BackgroundUIContrast.Color),
						ColorSequenceKeypoint.new(1, p2.Theme.BackgroundUIContrast.Color)
					}),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(1, p2.Theme.BackgroundUIContrast.Transparency)
					})
				}),
				UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
			})),
			HoverTransparency = roactModule.createElement(springAnimatedItemModule.AnimatedImageLabel, {
				springOptions = t,
				animatedValues = { imageTransparency = if p1.mouseEntered then 0.6 else 1 },
				mapValuesToProps = function(p3)
					return { ImageTransparency = p3.imageTransparency }
				end,
				regularProps = {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Image = vignette246.Image,
					ImageRectSize = vignette246.ImageRectSize,
					ImageRectOffset = vignette246.ImageRectOffset,
					ImageColor3 = getContentStyleModule(t_1, p1.controlState, p2).Color,
					ImageTransparency = 0,
					LayoutOrder = 2,
					[roactModule.Event.MouseEnter] = p1.hoverMouseEnter,
					[roactModule.Event.MouseLeave] = p1.hoverMouseLeave
				}
			}, {
				corner = roactModule.createElement("UICorner", {
					CornerRadius = if p1.isCircular then UDim.new(0.5, 0) else UDim.new(0, 8)
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
					Size = UDim2.new(0, p1.tileSize.X.Offset - var1 * 2, 0, var2),
					AnchorPoint = Vector2.new(1, 1)
				}, list.join(list.map(p1.buttons, function(p3)
					-- upvalues: roactModule (copy), playerTileButtonModule (copy), var2 (ref), var1 (ref), p1 (copy)
					return roactModule.createElement(playerTileButtonModule, {
						buttonHeight = var2,
						outerButtonPadding = var1,
						tileSize = p1.tileSize,
						icon = p3.icon,
						isSecondary = p3.isSecondary,
						isDisabled = p3.isDisabled,
						onActivated = p3.onActivated,
						mouseEnter = p1.hoverMouseEnter,
						mouseLeave = p1.hoverMouseLeave,
						isRoactGamepadEnabled = p1.isRoactGamepadEnabled
					})
				end), {
					roactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						Padding = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100),
						FillDirection = Enum.FillDirection.Horizontal
					})
				})),
				UIPadding = roactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, var1),
					PaddingRight = UDim.new(0, var1)
				})
			})
		})
	end)
end

function playerTile.init(p1)
	-- upvalues: roactModule (ref), controlStateModule (ref)
	p1.firstButtonIcon = roactModule.createRef()
	p1.secondButtonIcon = roactModule.createRef()
	p1.mouseEntered = false
	p1.state = {
		mouseEntered = false,
		controlState = controlStateModule.Initialize
	}
	
	function p6.onStateChanged(p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({ controlState = p3 })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, p3)
		end
	end
	
	function p6.hoverMouseEnter()
		-- upvalues: p1 (ref)
		p1:setState({ mouseEntered = true })
	end
	
	function p6.hoverMouseLeave()
		-- upvalues: p1 (ref)
		p1:setState({ mouseEntered = false })
	end
end

function playerTile.render(p1)
	-- upvalues: withStyleModule (ref), UIBloxConfigModule (ref), roactModule (ref), tileModule (ref), dictionary (ref), object (ref), playerContextModule (ref), imagesModule (ref), getContentStyleModule (ref), t_1 (ref), cryoModule (ref), springAnimatedItemModule (ref), t (ref), vignette246 (ref), list (ref), playerTileButtonModule (ref)
	local tileSize = p1.props.tileSize
	local title = p1.props.title
	local onActivated = p1.props.onActivated
	local thumbnail = p1.props.thumbnail
	
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), UIBloxConfigModule (copy), roactModule (copy), tileSize (ref), tileModule (copy), dictionary (copy), withStyleModule (copy), object (copy), playerContextModule (copy), title (ref), onActivated (ref), thumbnail (ref), imagesModule (copy), getContentStyleModule (copy), t_1 (copy), cryoModule (copy), springAnimatedItemModule (copy), t (copy), vignette246 (copy), list (copy), playerTileButtonModule (copy)
		local tokens = p2.Tokens
		local subtitleFontStyle = p1.props.subtitleFontStyle or (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.CaptionMedium else tokens.Semantic.Typography.CaptionHeader)
		local footerTopPadding = p1.props.footerTopPadding or (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Space_50)
		local createElement = roactModule.createElement
		local var1 = "Frame"
		local t_2 = {
			Size = tileSize,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			[roactModule.Ref] = p1.props.forwardedRef
		}
		local t_3 = {}
		local createElement_1 = roactModule.createElement
		local t_4 = {
			hasRoundedCorners = true,
			innerPadding = 0,
			titleRichText = true,
			titleTextLineCount = 1,
			textButtonRef = p1.props.buttonRef
		}
		local t_5 = {
			playerContext = if p1.props.Selectable then dictionary.join(p1.props.relevancyInfo, { Selectable = false }) else p1.props.relevancyInfo,
			controlState = p1.state.controlState
		}
		t_4.footer = withStyleModule(function(p3)
			-- upvalues: object (copy), t_5 (ref), UIBloxConfigModule (copy), roactModule (copy), playerContextModule (copy)
			local tokens = p3.Tokens
			
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
		t_4.Selectable = p1.props.Selectable
		t_4.titleTopPadding = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100
		t_4.subtitleTopPadding = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25
		t_4.footerTopPadding = footerTopPadding
		t_4.name = title
		t_4.nameTextColor = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis.Color3 else tokens.Semantic.Color.Text.Emphasis.Color3
		t_4.titleFontStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Typography.TitleLarge else tokens.Semantic.Typography.Subheader
		t_4.hasVerifiedBadge = p1.props.hasVerifiedBadge
		t_4.subtitle = p1.props.subtitle
		t_4.subtitleFontStyle = subtitleFontStyle
		t_4.onActivated = onActivated
		t_4.thumbnail = thumbnail
		t_4.backgroundImage = imagesModule[p2.Theme.PlayerBackgroundDefault.Image]
		local var2 = dictionary.join(p1.props, {
			hoverMouseEnter = p1.hoverMouseEnter,
			hoverMouseLeave = p1.hoverMouseLeave,
			mouseEntered = p1.state.mouseEntered
		})
		t_4.thumbnailOverlayComponents = withStyleModule(function(p3)
			-- upvalues: UIBloxConfigModule (copy), getContentStyleModule (copy), t_1 (copy), var2 (ref), roactModule (copy), cryoModule (copy), springAnimatedItemModule (copy), t (copy), vignette246 (copy), list (copy), playerTileButtonModule (copy)
			local tokens = p3.Tokens
			local var3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100
			local var4 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_900 else tokens.Global.Size_450
			
			return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				ButtonBackgroundGradient = not var2.isCircular and (not cryoModule.isEmpty(var2.buttons) and roactModule.createElement("Frame", {
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, var4 + var3 * 2),
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
					animatedValues = {
						imageTransparency = if var2.mouseEntered then 0.6 else 1
					},
					mapValuesToProps = function(p4)
						return { ImageTransparency = p4.imageTransparency }
					end,
					regularProps = {
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1,
						Image = vignette246.Image,
						ImageRectSize = vignette246.ImageRectSize,
						ImageRectOffset = vignette246.ImageRectOffset,
						ImageColor3 = getContentStyleModule(t_1, var2.controlState, p3).Color,
						ImageTransparency = 0,
						LayoutOrder = 2,
						[roactModule.Event.MouseEnter] = var2.hoverMouseEnter,
						[roactModule.Event.MouseLeave] = var2.hoverMouseLeave
					}
				}, {
					corner = roactModule.createElement("UICorner", {
						CornerRadius = if var2.isCircular then UDim.new(0.5, 0) else UDim.new(0, 8)
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
						Size = UDim2.new(0, var2.tileSize.X.Offset - var3 * 2, 0, var4),
						AnchorPoint = Vector2.new(1, 1)
					}, list.join(list.map(var2.buttons, function(p4)
						-- upvalues: roactModule (copy), playerTileButtonModule (copy), var4 (ref), var3 (ref), var2 (copy)
						return roactModule.createElement(playerTileButtonModule, {
							buttonHeight = var4,
							outerButtonPadding = var3,
							tileSize = var2.tileSize,
							icon = p4.icon,
							isSecondary = p4.isSecondary,
							isDisabled = p4.isDisabled,
							onActivated = p4.onActivated,
							mouseEnter = var2.hoverMouseEnter,
							mouseLeave = var2.hoverMouseLeave,
							isRoactGamepadEnabled = var2.isRoactGamepadEnabled
						})
					end), {
						roactModule.createElement("UIListLayout", {
							HorizontalAlignment = Enum.HorizontalAlignment.Right,
							Padding = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100),
							FillDirection = Enum.FillDirection.Horizontal
						})
					})),
					UIPadding = roactModule.createElement("UIPadding", {
						PaddingBottom = UDim.new(0, var3),
						PaddingRight = UDim.new(0, var3)
					})
				})
			})
		end)
		t_4.addSubtitleSpace = title == nil
		t_4.isCircular = p1.props.isCircular
		t_4.horizontalAlignment = p1.props.horizontalAlignment
		t_4.thumbnailFrameSize = p1.props.thumbnailFrameSize
		t_4.openTypeFeatures = p1.props.openTypeFeatures
		t_3.Tile = createElement_1(tileModule, t_4)
		
		return createElement(var1, t_2, t_3)
	end)
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), playerTile (ref), dictionary (ref)
	return roactModule.createElement(playerTile, dictionary.join(p1, { forwardedRef = p2 }))
end)