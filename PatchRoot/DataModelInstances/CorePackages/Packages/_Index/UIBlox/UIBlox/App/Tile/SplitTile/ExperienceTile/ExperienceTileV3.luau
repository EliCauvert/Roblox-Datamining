-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:01 2026 Pacific Standard Time.

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

local function renderContentWithPadding(p0, p1, p2, p3) --[[ line: 82 ]]
	-- upvalues: reactModule (ref), cryoModule (ref), roactModule (ref)
	return reactModule.createElement(p0, cryoModule.Dictionary.join({ BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, p2), {
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, p1.Left),
			PaddingRight = UDim.new(0, p1.Right),
			PaddingTop = UDim.new(0, p1.Top),
			PaddingBottom = UDim.new(0, p1.Bottom)
		}),
		Content = roactModule.createFragment(p3)
	})
end

local function _(p4, p5) --[[ line: 106 | named "getFinalAspectRatioMode" ]]
	-- upvalues: aspectRatioModeModule (ref)
	return if p4 == nil then if p5 then aspectRatioModeModule.Wide else aspectRatioModeModule.Square elseif p5 then aspectRatioModeModule.Wide else p4
end

return function(p6) --[[ line: 122 | named "ExperienceTileV3" ]]
	-- upvalues: useStyleModule (ref), setDefaultModule (ref), constantsModule (ref), cryoModule (ref), reactModule (ref), aspectRatioModeModule (ref), getAspectRatioModule (ref), renderContentWithPadding (ref), verticalTileThumbnailModule (ref), roactModule (ref), tileContentPanelModule (ref), experienceActionRowModule (ref), useControlStateModule (ref), useCursorModule (ref), getControlStateColorModule (ref), interactableModule (ref), verticalTileModule (ref)
	local color, transparency
	local var17 = useStyleModule()
	local var18 = setDefaultModule(p6.footerHeight, constantsModule.DEFAULT_FOOTER_HEIGHT)
	local var19 = setDefaultModule(p6.isHoverEnabled, false)
	local var20 = setDefaultModule(p6.hasBackground, true)
	local var21 = cryoModule.Dictionary.join(constantsModule.getDefaultStyleProps(var17), p6.styleProps or {})
	local backgroundColor = var21.backgroundColor
	local border = var21.border
	local dropShadow = var21.dropShadow
	local topContentPadding = var21.topContentPadding
	local bottomContentPadding = var21.bottomContentPadding
	local overlayColors = var21.overlayColors
	local selectionCursorPadding = var21.selectionCursorPadding
	local contentTitlePadding = var21.contentTitlePadding
	local contentTitleFont = var21.contentTitleFont
	local var22 = setDefaultModule(p6.contentTextLineCount, constantsModule.DEFAULT_TEXT_LINE_COUNT)
	local var23 = reactModule.useCallback(function(p7) --[[ line: 140 ]]
		-- upvalues: var17 (ref), p6 (ref), aspectRatioModeModule (copy), getAspectRatioModule (copy), renderContentWithPadding (copy), topContentPadding (ref), reactModule (copy), verticalTileThumbnailModule (copy), border (ref), var20 (ref), roactModule (copy)
		local var30 = p7 and not var17.Settings.ReducedMotion
		local thumbnailAspectRatioOverride = p6.thumbnailAspectRatioOverride
		var30 = if thumbnailAspectRatioOverride ~= nil then if var30 then aspectRatioModeModule.Wide else aspectRatioModeModule.Square elseif var30 then aspectRatioModeModule.Wide else thumbnailAspectRatioOverride
		local var31 = getAspectRatioModule(var30)
		
		return renderContentWithPadding("Frame", topContentPadding, {
			ZIndex = 3,
			Size = UDim2.new(1, 0, var31, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, {
			Thumbnail = reactModule.createElement(verticalTileThumbnailModule, {
				isTopRounded = true,
				aspectRatio = var31,
				border = border,
				isBottomRounded = not var20,
				thumbnail = if var30 == aspectRatioModeModule.Wide then p6.wideThumbnail else p6.thumbnail
			}),
			TopContentOverlay = if p6.renderTopContentOverlay ~= nil then nil else roactModule.createFragment(p6.renderTopContentOverlay(var30, border))
		})
	end, {
		p6.renderTopContentOverlay, p6.wideThumbnail, p6.thumbnail,
		p6.thumbnailAspectRatioOverride, topContentPadding, border, var20
	})
	local var24 = reactModule.useCallback(function(p8) --[[ line: 174 ]]
		-- upvalues: var22 (ref), contentTitleFont (ref), var17 (ref), contentTitlePadding (ref), var18 (ref), bottomContentPadding (ref), p6 (ref), renderContentWithPadding (copy), border (ref), reactModule (copy), tileContentPanelModule (copy)
		local var32 = math.floor(var22 * contentTitleFont.RelativeSize * var17.Font.BaseSize + contentTitlePadding) + var18 + bottomContentPadding.Top + bottomContentPadding.Bottom
		
		return if p6.renderBottomContent == nil then reactModule.createElement(tileContentPanelModule, {
			hasSidePadding = true,
			contentTitle = p6.experienceName,
			panelHeight = UDim.new(0, var32),
			outerPadding = bottomContentPadding,
			footerHeight = UDim.new(0, var18),
			textLineCount = var22,
			titleFont = contentTitleFont,
			titlePadding = contentTitlePadding,
			contentFooter = if p8 then p6.footer else nil
		}) else renderContentWithPadding("Frame", bottomContentPadding, { Size = UDim2.new(1, 0, 0, var32) }, { BottomContent = p6.renderBottomContent(p8, border) })
	end, {
		p6.experienceName, p6.renderBottomContent, p6.footer, var22,
		contentTitlePadding, bottomContentPadding, var18, contentTitleFont, border,
		var17
	})
	local var25 = reactModule.useCallback(function(p9) --[[ line: 213 ]]
		-- upvalues: p6 (ref), reactModule (copy), experienceActionRowModule (copy), var18 (ref), bottomContentPadding (ref), renderContentWithPadding (copy)
		return if p6.renderBottomContent == nil then if p9 then if p6.renderActionRow == nil then reactModule.createElement(experienceActionRowModule, p6.actionRowProps) else p6.renderActionRow() else renderContentWithPadding("Frame", bottomContentPadding, {
			Size = UDim2.new(1, 0, 0, var18 + bottomContentPadding.Top + bottomContentPadding.Bottom),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1)
		}, {
			FooterContent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { Footer = p6.footer })
		}) else nil
	end, {
		p6.footer, p6.actionRowProps, p6.renderBottomContent, p6.renderActionRow,
		bottomContentPadding, var18
	})
	local var26, var27 = useControlStateModule()
	local var28 = useCursorModule(border.CornerRadius)
	local var29 = getControlStateColorModule(var26, overlayColors)
	local _ = nil
	local _ = nil
	
	if var29 == nil then
		color = nil
		transparency = 1
	else
		color = var29.Color
		transparency = var29.Transparency
	end
	return renderContentWithPadding(interactableModule, selectionCursorPadding, {
		Size = UDim2.new(1, 0, 1, 0),
		SelectionImageObject = var28,
		onStateChanged = var27,
		isDisabled = p6.isDisabled,
		[reactModule.Event.Activated] = p6.onActivated,
		[reactModule.Event.SelectionGained] = p6.onSelectionGained,
		[reactModule.Event.SelectionLost] = p6.onSelectionLost
	}, {
		VerticalTile = reactModule.createElement(verticalTileModule, {
			isOverlayVisible = false,
			isActive = false,
			reservedBottomHeight = 0,
			hasBackground = var20,
			hasOutline = setDefaultModule(p6.hasOutline, true),
			isHoverEnabled = var19,
			hoverDelay = p6.hoverDelay,
			onHoverChanged = p6.onHoverChanged,
			renderTopContent = var23,
			renderBottomContent = var24,
			renderFooterRow = var25,
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