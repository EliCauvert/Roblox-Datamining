local parent = script:FindFirstAncestor("AppBlox").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local UIBloxModule = require(parent.UIBlox)
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local view = foundationModule.View
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppEdpConsoleMediaGalleryVideo = sharedFlagsModule.FFlagLuaAppEdpConsoleMediaGalleryVideo
local fFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon = sharedFlagsModule.FFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.MediaGalleryTypes)
local t = {
	titleText = "Media",
	numItemsShown = 4,
	itemAspectRatio = 1.777777777778,
	animationConfig = { dampingRatio = 1, frequency = 6.666666666667 },
	onActivated = function() end,
	onSelectionGained = function() end,
	exitFullscreen = function() end
}

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), fFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon (ref), useTokens (ref), constantsModule (ref), reactOtterModule (ref), reactModule (ref), useCursor (ref), useSelectionCursor (ref), cursorKind (ref), view (ref), icon (ref), iconSize (ref), fFlagLuaAppEdpConsoleMediaGalleryVideo (ref), styledTextLabel (ref)
	local var8 = cryoModule.Dictionary.join(t, p0)
	local var9 = useStyle()
	local var10 = if fFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon then useTokens() else nil
	local var11 = cryoModule.Dictionary.join(constantsModule.getDefaultStyleProps(var9), var8.styleProps or {})
	local borderRadius = var11.borderRadius
	local gutter = var11.gutter
	local contentGap = var11.contentGap
	local titleFont = var11.titleFont
	local titleTextColor = var11.titleTextColor
	local var12, var13 = reactOtterModule.useAnimatedBinding(0)
	local var14, var15 = reactModule.useState(Vector2.zero)
	local var16 = if var8.showCursor then useCursor(borderRadius) else useSelectionCursor(cursorKind.Invisible)
	
	return reactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		GroupTransparency = var8.groupTransparency,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = if fFlagLuaAppEdpConsoleMediaGalleryVideo then var8.rootRef else nil
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, contentGap)
		}),
		ExpandableArea = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = var12:map(function(p1)
				return UDim2.new(1, 0, 0, p1)
			end)
		}),
		Title = reactModule.createElement(styledTextLabel, {
			layoutOrder = 2,
			text = var8.titleText,
			fontStyle = titleFont,
			colorStyle = titleTextColor,
			textXAlignment = Enum.TextXAlignment.Left,
			size = UDim2.new(1, 0, 0, if titleFont.RelativeSize then titleFont.RelativeSize * var9.Font.BaseSize else titleFont.FontSize)
		}),
		MediaGallery = reactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 0, var14.Y),
			BackgroundTransparency = 1,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollBarImageTransparency = 1,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.X,
			Selectable = false,
			LayoutOrder = 3,
			[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p2, _, _, _)
				-- upvalues: gutter (ref), var8 (ref), var15 (ref)
				local var17 = (p2.AbsoluteSize.X - gutter * (var8.numItemsShown - 1)) / var8.numItemsShown
				var15(Vector2.new(var17, var17 / var8.itemAspectRatio))
			end, { gutter, var8.itemAspectRatio, var8.numItemsShown }),
			[reactModule.Event.SelectionChanged] = reactModule.useCallback(function(p3, _, p4, p5)
				-- upvalues: var13 (ref), reactOtterModule (copy), var8 (ref)
				if not p3 then
					return nil
				end
				local var18 = p5 ~= nil and p5:IsDescendantOf(p3)
				local var19 = p4 ~= nil and p4:IsDescendantOf(p3)
				local var19_1 = not var18 and var19
				
				if var18 and not var19 then
					var13(reactOtterModule.spring(var8.expandableAreaHeightOffset, var8.animationConfig))
					var8.mediaGalleryGainFocused(true)
					
					return nil
				elseif not var19_1 then
					return nil
				elseif not (p5 ~= nil and p4.AbsolutePosition.Y < p5.AbsolutePosition.Y) then
					var13(reactOtterModule.spring(0, var8.animationConfig))
				end
				var8.exitFullscreen()
				var8.mediaGalleryGainFocused(false)
				
				return nil
			end, {
				var8.expandableAreaHeightOffset,
				var8.animationConfig,
				var8.exitFullscreen,
				var8.mediaGalleryGainFocused
			})
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, gutter)
			}),
			Items = reactModule.createElement(reactModule.Fragment, {}, reactModule.useMemo(function()
				-- upvalues: var8 (ref), reactModule (copy), var14 (ref), var16 (ref), borderRadius (ref), fFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon (copy), view (copy), icon (copy), iconSize (copy), var10 (ref)
				local t = {}
				
				for i, v in var8.items do
					t["Item" .. i] = reactModule.createElement("ImageButton", {
						LayoutOrder = i,
						Size = UDim2.fromOffset(var14.X, var14.Y),
						Image = v.imageId,
						ScaleType = Enum.ScaleType.Crop,
						BackgroundTransparency = 1,
						AutoButtonColor = false,
						SelectionImageObject = var16,
						[reactModule.Event.Activated] = function()
							-- upvalues: var8 (copy), i (ref)
							var8.onActivated(i)
						end,
						[reactModule.Event.SelectionGained] = function()
							-- upvalues: var8 (copy), i (ref)
							var8.onSelectionGained(i)
						end
					}, {
						Corner = reactModule.createElement("UICorner", { CornerRadius = borderRadius }),
						PlayIcon = if fFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon and v.videoId then reactModule.createElement(view, {
							tag = "auto-xy padding-medium radius-circle bg-over-media-100",
							ZIndex = 2,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.fromScale(0.5, 0.5),
							selection = { Selectable = false }
						}, {
							Icon = reactModule.createElement(icon, {
								name = "play-large",
								size = iconSize.Medium,
								style = var10.Color.Content.Emphasis
							})
						}) else nil
					})
				end
				return t
			end, {
				var14, var8.items, var8.onActivated, var8.onSelectionGained, var16,
				borderRadius,
				if fFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon then var10 else nil
			}))
		})
	})
end