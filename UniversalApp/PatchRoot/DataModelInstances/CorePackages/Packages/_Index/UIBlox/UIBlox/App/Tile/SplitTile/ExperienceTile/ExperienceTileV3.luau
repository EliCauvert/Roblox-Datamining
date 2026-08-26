local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent.Parent
local parent_3 = parent_2.Parent
local core = parent_3.Core
local parent_4 = parent_3.Parent
local cryoModule = require(parent_4.Cryo)
local reactModule = require(parent_4.React)
local roactModule = require(parent_4.Roact)
local getControlStateColorModule = require(parent_3.Utility.getControlStateColor)
local setDefaultModule = require(parent_3.Utility.setDefault)
local useStyleModule = require(core.Style.useStyle)
local interactableModule = require(core.Control.Interactable)
local useControlStateModule = require(core.Control.useControlState)
local _ = require(parent_2.Style.StyleTypes)
local _ = require(parent_2.Style.Fonts)
local useCursorModule = require(parent_2.SelectionCursor.useCursor)
local constantsModule = require(parent.Constants)
local experienceActionRowModule = require(parent.ExperienceActionRow)
local aspectRatioModeModule = require(parent.Enum.AspectRatioMode)
local getAspectRatioModule = require(parent.getAspectRatio)
local verticalTileModule = require(parent_1.VerticalTile.VerticalTile)
local tileContentPanelModule = require(parent_1.TileContentPanel)
local verticalTileThumbnailModule = require(parent_1.VerticalTile.VerticalTileThumbnail)

local function renderContentWithPadding(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), cryoModule (ref), roactModule (ref)
	return reactModule.createElement(p1, cryoModule.Dictionary.join({ BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, p3), {
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p2.Left),
			PaddingRight = UDim.new(0, p2.Right),
			PaddingTop = UDim.new(0, p2.Top),
			PaddingBottom = UDim.new(0, p2.Bottom)
		}),
		Content = roactModule.createFragment(p4)
	})
end

local function _(p1, p2)
	-- upvalues: aspectRatioModeModule (ref)
	return if p1 == nil then if p2 then aspectRatioModeModule.Wide else aspectRatioModeModule.Square elseif p2 then aspectRatioModeModule.Wide else p1
end

return function(p1)
	-- upvalues: useStyleModule (ref), setDefaultModule (ref), constantsModule (ref), cryoModule (ref), reactModule (ref), aspectRatioModeModule (ref), getAspectRatioModule (ref), renderContentWithPadding (ref), verticalTileThumbnailModule (ref), roactModule (ref), tileContentPanelModule (ref), experienceActionRowModule (ref), useControlStateModule (ref), useCursorModule (ref), getControlStateColorModule (ref), interactableModule (ref), verticalTileModule (ref)
	local color, transparency
	local var1 = useStyleModule()
	local var2 = setDefaultModule(p1.footerHeight, constantsModule.DEFAULT_FOOTER_HEIGHT)
	local var3 = setDefaultModule(p1.isHoverEnabled, false)
	local var4 = setDefaultModule(p1.hasBackground, true)
	local var5 = cryoModule.Dictionary.join(constantsModule.getDefaultStyleProps(var1), p1.styleProps or {})
	local backgroundColor = var5.backgroundColor
	local border = var5.border
	local dropShadow = var5.dropShadow
	local topContentPadding = var5.topContentPadding
	local bottomContentPadding = var5.bottomContentPadding
	local overlayColors = var5.overlayColors
	local selectionCursorPadding = var5.selectionCursorPadding
	local contentTitlePadding = var5.contentTitlePadding
	local contentTitleFont = var5.contentTitleFont
	local var6 = setDefaultModule(p1.contentTextLineCount, constantsModule.DEFAULT_TEXT_LINE_COUNT)
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), p1 (ref), aspectRatioModeModule (copy), getAspectRatioModule (copy), renderContentWithPadding (copy), topContentPadding (ref), reactModule (copy), verticalTileThumbnailModule (copy), border (ref), var4 (ref), roactModule (copy)
		local var8 = p2 and not var1.Settings.ReducedMotion
		local thumbnailAspectRatioOverride = p1.thumbnailAspectRatioOverride
		var8 = if thumbnailAspectRatioOverride ~= nil then if var8 then aspectRatioModeModule.Wide else aspectRatioModeModule.Square elseif var8 then aspectRatioModeModule.Wide else thumbnailAspectRatioOverride
		local var9 = getAspectRatioModule(var8)
		
		return renderContentWithPadding("Frame", topContentPadding, {
			ZIndex = 3,
			Size = UDim2.new(1, 0, var9, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, {
			Thumbnail = reactModule.createElement(verticalTileThumbnailModule, {
				isTopRounded = true,
				aspectRatio = var9,
				border = border,
				isBottomRounded = not var4,
				thumbnail = if var8 == aspectRatioModeModule.Wide then p1.wideThumbnail else p1.thumbnail
			}),
			TopContentOverlay = if p1.renderTopContentOverlay ~= nil then nil else roactModule.createFragment(p1.renderTopContentOverlay(var8, border))
		})
	end, {
		p1.renderTopContentOverlay, p1.wideThumbnail, p1.thumbnail,
		p1.thumbnailAspectRatioOverride, topContentPadding, border, var4
	})
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), contentTitleFont (ref), var1 (ref), contentTitlePadding (ref), var2 (ref), bottomContentPadding (ref), p1 (ref), renderContentWithPadding (copy), border (ref), reactModule (copy), tileContentPanelModule (copy)
		local var9 = math.floor(var6 * contentTitleFont.RelativeSize * var1.Font.BaseSize + contentTitlePadding) + var2 + bottomContentPadding.Top + bottomContentPadding.Bottom
		
		return if p1.renderBottomContent == nil then reactModule.createElement(tileContentPanelModule, {
			hasSidePadding = true,
			contentTitle = p1.experienceName,
			panelHeight = UDim.new(0, var9),
			outerPadding = bottomContentPadding,
			footerHeight = UDim.new(0, var2),
			textLineCount = var6,
			titleFont = contentTitleFont,
			titlePadding = contentTitlePadding,
			contentFooter = if p2 then p1.footer else nil
		}) else renderContentWithPadding("Frame", bottomContentPadding, { Size = UDim2.new(1, 0, 0, var9) }, { BottomContent = p1.renderBottomContent(p2, border) })
	end, {
		p1.experienceName, p1.renderBottomContent, p1.footer, var6,
		contentTitlePadding, bottomContentPadding, var2, contentTitleFont, border,
		var1
	})
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), reactModule (copy), experienceActionRowModule (copy), var2 (ref), bottomContentPadding (ref), renderContentWithPadding (copy)
		return if p1.renderBottomContent == nil then if p2 then if p1.renderActionRow == nil then reactModule.createElement(experienceActionRowModule, p1.actionRowProps) else p1.renderActionRow() else renderContentWithPadding("Frame", bottomContentPadding, {
			Size = UDim2.new(1, 0, 0, var2 + bottomContentPadding.Top + bottomContentPadding.Bottom),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1)
		}, {
			FooterContent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { Footer = p1.footer })
		}) else nil
	end, {
		p1.footer, p1.actionRowProps, p1.renderBottomContent, p1.renderActionRow,
		bottomContentPadding, var2
	})
	local var10, var11 = useControlStateModule()
	local var12 = useCursorModule(border.CornerRadius)
	local var13 = getControlStateColorModule(var10, overlayColors)
	local _ = nil
	local _ = nil
	
	if var13 == nil then
		color = nil
		transparency = 1
	else
		color = var13.Color
		transparency = var13.Transparency
	end
	return renderContentWithPadding(interactableModule, selectionCursorPadding, {
		Size = UDim2.new(1, 0, 1, 0),
		SelectionImageObject = var12,
		onStateChanged = var11,
		isDisabled = p1.isDisabled,
		[reactModule.Event.Activated] = p1.onActivated,
		[reactModule.Event.SelectionGained] = p1.onSelectionGained,
		[reactModule.Event.SelectionLost] = p1.onSelectionLost
	}, {
		VerticalTile = reactModule.createElement(verticalTileModule, {
			isOverlayVisible = false,
			isActive = false,
			reservedBottomHeight = 0,
			hasBackground = var4,
			hasOutline = setDefaultModule(p1.hasOutline, true),
			isHoverEnabled = var3,
			hoverDelay = p1.hoverDelay,
			onHoverChanged = p1.onHoverChanged,
			renderTopContent = var7,
			renderBottomContent = var8,
			renderFooterRow = var9,
			backgroundColor = backgroundColor,
			border = border,
			dropShadow = dropShadow
		}),
		OverlayColor = reactModule.createElement("Frame", {
			ZIndex = 10,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = color,
			BackgroundTransparency = transparency
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = border.CornerRadius })
		})
	})
end