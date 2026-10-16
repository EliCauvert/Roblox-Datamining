local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent.Parent
local Parent3 = Parent2.Parent
local Core = Parent3.Core
local Parent4 = Parent3.Parent
local CryoModule = require(Parent4.Cryo)
local ReactModule = require(Parent4.React)
local RoactModule = require(Parent4.Roact)
local GetControlStateColorModule = require(Parent3.Utility.getControlStateColor)
local SetDefaultModule = require(Parent3.Utility.setDefault)
local UseStyleModule = require(Core.Style.useStyle)
local InteractableModule = require(Core.Control.Interactable)
local UseControlStateModule = require(Core.Control.useControlState)
local _ = require(Parent2.Style.StyleTypes)
local _ = require(Parent2.Style.Fonts)
local UseCursorModule = require(Parent2.SelectionCursor.useCursor)
local ConstantsModule = require(Parent.Constants)
local ExperienceActionRowModule = require(Parent.ExperienceActionRow)
local AspectRatioModeModule = require(Parent.Enum.AspectRatioMode)
local GetAspectRatioModule = require(Parent.getAspectRatio)
local VerticalTileModule = require(Parent1.VerticalTile.VerticalTile)
local TileContentPanelModule = require(Parent1.TileContentPanel)
local VerticalTileThumbnailModule = require(Parent1.VerticalTile.VerticalTileThumbnail)

local function renderContentWithPadding(InteractableModule, BottomContentPadding, p1, p2) --[[ Line: 82 ]]
	-- upvalues: ReactModule (copy), CryoModule (copy), RoactModule (copy)
	return ReactModule.createElement(InteractableModule, CryoModule.Dictionary.join({ BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, p1), {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, BottomContentPadding.Left),
			PaddingRight = UDim.new(0, BottomContentPadding.Right),
			PaddingTop = UDim.new(0, BottomContentPadding.Top),
			PaddingBottom = UDim.new(0, BottomContentPadding.Bottom)
		}),
		Content = RoactModule.createFragment(p2)
	})
end

local function _(p1, p2) --[[ Line: 106 | Named "getFinalAspectRatioMode" ]]
	-- upvalues: AspectRatioModeModule (copy)
	return if p1 == nil then if p2 then AspectRatioModeModule.Wide else AspectRatioModeModule.Square elseif p2 then AspectRatioModeModule.Wide else p1
end

return function(p1) --[[ Line: 122 | Named "ExperienceTileV3" ]]
	-- upvalues: UseStyleModule (copy), SetDefaultModule (copy), ConstantsModule (copy), CryoModule (copy), ReactModule (copy), AspectRatioModeModule (copy), GetAspectRatioModule (copy), renderContentWithPadding (copy), VerticalTileThumbnailModule (copy), RoactModule (copy), TileContentPanelModule (copy), ExperienceActionRowModule (copy), UseControlStateModule (copy), UseCursorModule (copy), GetControlStateColorModule (copy), InteractableModule (copy), VerticalTileModule (copy)
	local UseStyleModuleResult = UseStyleModule()
	local SetDefaultModuleResult = SetDefaultModule(p1.footerHeight, ConstantsModule.DEFAULT_FOOTER_HEIGHT)
	local SetDefaultModuleResult1 = SetDefaultModule(p1.isHoverEnabled, false)
	local SetDefaultModuleResult2 = SetDefaultModule(p1.hasBackground, true)
	local JoinResult = CryoModule.Dictionary.join(ConstantsModule.getDefaultStyleProps(UseStyleModuleResult), p1.styleProps or {})
	local BackgroundColor = JoinResult.backgroundColor
	local Border = JoinResult.border
	local DropShadow = JoinResult.dropShadow
	local TopContentPadding = JoinResult.topContentPadding
	local BottomContentPadding = JoinResult.bottomContentPadding
	local OverlayColors = JoinResult.overlayColors
	local SelectionCursorPadding = JoinResult.selectionCursorPadding
	local ContentTitlePadding = JoinResult.contentTitlePadding
	local ContentTitleFont = JoinResult.contentTitleFont
	local SetDefaultModuleResult3 = SetDefaultModule(p1.contentTextLineCount, ConstantsModule.DEFAULT_TEXT_LINE_COUNT)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 140 ]]
		-- upvalues: UseStyleModuleResult (copy), p1 (copy), AspectRatioModeModule (upval), GetAspectRatioModule (upval), renderContentWithPadding (upval), TopContentPadding (copy), ReactModule (upval), VerticalTileThumbnailModule (upval), Border (copy), SetDefaultModuleResult2 (copy), RoactModule (upval)
		local NoReducedMotion: boolean = p2 and not UseStyleModuleResult.Settings.ReducedMotion
		local ThumbnailAspectRatioOverride = p1.thumbnailAspectRatioOverride
		local Wide = if ThumbnailAspectRatioOverride == nil then if NoReducedMotion then AspectRatioModeModule.Wide else AspectRatioModeModule.Square elseif NoReducedMotion then AspectRatioModeModule.Wide else ThumbnailAspectRatioOverride
		local AspectRatioModule = GetAspectRatioModule(Wide)
		
		return renderContentWithPadding("Frame", TopContentPadding, {
			ZIndex = 3,
			Size = UDim2.new(1, 0, AspectRatioModule, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, {
			Thumbnail = ReactModule.createElement(VerticalTileThumbnailModule, {
				isTopRounded = true,
				aspectRatio = AspectRatioModule,
				border = Border,
				isBottomRounded = not SetDefaultModuleResult2,
				thumbnail = if Wide == AspectRatioModeModule.Wide then p1.wideThumbnail else p1.thumbnail
			}),
			TopContentOverlay = if p1.renderTopContentOverlay == nil then nil else RoactModule.createFragment((p1.renderTopContentOverlay(NoReducedMotion, Border)))
		})
	end, {
		p1.renderTopContentOverlay, p1.wideThumbnail, p1.thumbnail,
		p1.thumbnailAspectRatioOverride, TopContentPadding, Border,
		SetDefaultModuleResult2
	})
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 174 ]]
		-- upvalues: SetDefaultModuleResult3 (copy), ContentTitleFont (copy), UseStyleModuleResult (copy), ContentTitlePadding (copy), SetDefaultModuleResult (copy), BottomContentPadding (copy), p1 (copy), renderContentWithPadding (upval), Border (copy), ReactModule (upval), TileContentPanelModule (upval)
		local NewFloored = math.floor(SetDefaultModuleResult3 * ContentTitleFont.RelativeSize * UseStyleModuleResult.Font.BaseSize + ContentTitlePadding) + SetDefaultModuleResult + BottomContentPadding.Top + BottomContentPadding.Bottom
		
		return if p1.renderBottomContent == nil then ReactModule.createElement(TileContentPanelModule, {
			hasSidePadding = true,
			contentTitle = p1.experienceName,
			panelHeight = UDim.new(0, NewFloored),
			outerPadding = BottomContentPadding,
			footerHeight = UDim.new(0, SetDefaultModuleResult),
			textLineCount = SetDefaultModuleResult3,
			titleFont = ContentTitleFont,
			titlePadding = ContentTitlePadding,
			contentFooter = if p2 then p1.footer else nil
		}) else renderContentWithPadding("Frame", BottomContentPadding, { Size = UDim2.new(1, 0, 0, NewFloored) }, { BottomContent = p1.renderBottomContent(p2, Border) })
	end, {
		p1.experienceName, p1.renderBottomContent, p1.footer, SetDefaultModuleResult3,
		ContentTitlePadding, BottomContentPadding, SetDefaultModuleResult,
		ContentTitleFont, Border, UseStyleModuleResult
	})
	local UseResult2 = ReactModule.useCallback(function(p2) --[[ Line: 213 ]]
		-- upvalues: p1 (copy), ReactModule (upval), ExperienceActionRowModule (upval), SetDefaultModuleResult (copy), BottomContentPadding (copy), renderContentWithPadding (upval)
		return if p1.renderBottomContent == nil then if p2 then if p1.renderActionRow == nil then ReactModule.createElement(ExperienceActionRowModule, p1.actionRowProps) else p1.renderActionRow() else renderContentWithPadding("Frame", BottomContentPadding, {
			Size = UDim2.new(1, 0, 0, SetDefaultModuleResult + BottomContentPadding.Top + BottomContentPadding.Bottom),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1)
		}, {
			FooterContent = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { Footer = p1.footer })
		}) else nil
	end, {
		p1.footer, p1.actionRowProps, p1.renderBottomContent, p1.renderActionRow,
		BottomContentPadding, SetDefaultModuleResult
	})
	local UseControlStateModuleResult, UseControlStateModuleResult2 = UseControlStateModule()
	local UseCursorModuleResult = UseCursorModule(Border.CornerRadius)
	local ControlStateColorModule = GetControlStateColorModule(UseControlStateModuleResult, OverlayColors)
	local Color = nil
	local Transparency = nil
	
	if ControlStateColorModule == nil then
		Color = nil
		Transparency = 1
	else
		Color = ControlStateColorModule.Color
		Transparency = ControlStateColorModule.Transparency
	end
	return renderContentWithPadding(InteractableModule, SelectionCursorPadding, {
		Size = UDim2.new(1, 0, 1, 0),
		SelectionImageObject = UseCursorModuleResult,
		onStateChanged = UseControlStateModuleResult2,
		isDisabled = p1.isDisabled,
		[ReactModule.Event.Activated] = p1.onActivated,
		[ReactModule.Event.SelectionGained] = p1.onSelectionGained,
		[ReactModule.Event.SelectionLost] = p1.onSelectionLost
	}, {
		VerticalTile = ReactModule.createElement(VerticalTileModule, {
			isOverlayVisible = false,
			isActive = false,
			reservedBottomHeight = 0,
			hasBackground = SetDefaultModuleResult2,
			hasOutline = SetDefaultModule(p1.hasOutline, true),
			isHoverEnabled = SetDefaultModuleResult1,
			hoverDelay = p1.hoverDelay,
			onHoverChanged = p1.onHoverChanged,
			renderTopContent = UseResult,
			renderBottomContent = UseResult1,
			renderFooterRow = UseResult2,
			backgroundColor = BackgroundColor,
			border = Border,
			dropShadow = DropShadow
		}),
		OverlayColor = ReactModule.createElement("Frame", {
			ZIndex = 10,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color,
			BackgroundTransparency = Transparency
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = Border.CornerRadius })
		})
	})
end