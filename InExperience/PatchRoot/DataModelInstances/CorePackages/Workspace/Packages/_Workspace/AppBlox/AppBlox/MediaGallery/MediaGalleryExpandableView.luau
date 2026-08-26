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

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), fFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon (ref), useTokens (ref), constantsModule (ref), reactOtterModule (ref), reactModule (ref), useCursor (ref), useSelectionCursor (ref), cursorKind (ref), view (ref), icon (ref), iconSize (ref), fFlagLuaAppEdpConsoleMediaGalleryVideo (ref), styledTextLabel (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useStyle()
	local var3 = if fFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon then useTokens() else nil
	local var4 = cryoModule.Dictionary.join(constantsModule.getDefaultStyleProps(var2), var1.styleProps or {})
	local borderRadius = var4.borderRadius
	local gutter = var4.gutter
	local contentGap = var4.contentGap
	local titleFont = var4.titleFont
	local titleTextColor = var4.titleTextColor
	local var5, var6 = reactOtterModule.useAnimatedBinding(0)
	local var7, var8 = reactModule.useState(Vector2.zero)
	local var9 = if var1.showCursor then useCursor(borderRadius) else useSelectionCursor(cursorKind.Invisible)
	
	return reactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		GroupTransparency = var1.groupTransparency,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		ref = if fFlagLuaAppEdpConsoleMediaGalleryVideo then var1.rootRef else nil
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, contentGap)
		}),
		ExpandableArea = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = var5:map(function(p2)
				return UDim2.new(1, 0, 0, p2)
			end)
		}),
		Title = reactModule.createElement(styledTextLabel, {
			layoutOrder = 2,
			text = var1.titleText,
			fontStyle = titleFont,
			colorStyle = titleTextColor,
			textXAlignment = Enum.TextXAlignment.Left,
			size = UDim2.new(1, 0, 0, if titleFont.RelativeSize then titleFont.RelativeSize * var2.Font.BaseSize else titleFont.FontSize)
		}),
		MediaGallery = reactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 0, var7.Y),
			BackgroundTransparency = 1,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollBarImageTransparency = 1,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.X,
			Selectable = false,
			LayoutOrder = 3,
			[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p2, _, _, _)
				-- upvalues: gutter (ref), var1 (ref), var8 (ref)
				local var10 = (p2.AbsoluteSize.X - gutter * (var1.numItemsShown - 1)) / var1.numItemsShown
				var8(Vector2.new(var10, var10 / var1.itemAspectRatio))
			end, { gutter, var1.itemAspectRatio, var1.numItemsShown }),
			[reactModule.Event.SelectionChanged] = reactModule.useCallback(function(p2, _, p3, p4)
				-- upvalues: var6 (ref), reactOtterModule (copy), var1 (ref)
				if not p2 then
					return nil
				end
				local var10 = p4 ~= nil and p4:IsDescendantOf(p2)
				local var11 = p3 ~= nil and p3:IsDescendantOf(p2)
				local var12 = not var10 and var11
				
				if var10 and not var11 then
					var6(reactOtterModule.spring(var1.expandableAreaHeightOffset, var1.animationConfig))
					var1.mediaGalleryGainFocused(true)
					
					return nil
				elseif not var12 then
					return nil
				elseif not (p4 ~= nil and p3.AbsolutePosition.Y < p4.AbsolutePosition.Y) then
					var6(reactOtterModule.spring(0, var1.animationConfig))
				end
				var1.exitFullscreen()
				var1.mediaGalleryGainFocused(false)
				
				return nil
			end, {
				var1.expandableAreaHeightOffset,
				var1.animationConfig,
				var1.exitFullscreen,
				var1.mediaGalleryGainFocused
			})
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, gutter)
			}),
			Items = reactModule.createElement(reactModule.Fragment, {}, reactModule.useMemo(function()
				-- upvalues: var1 (ref), reactModule (copy), var7 (ref), var9 (ref), borderRadius (ref), fFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon (copy), view (copy), icon (copy), iconSize (copy), var3 (ref)
				local t = {}
				
				for i, v in var1.items do
					t["Item" .. i] = reactModule.createElement("ImageButton", {
						LayoutOrder = i,
						Size = UDim2.fromOffset(var7.X, var7.Y),
						Image = v.imageId,
						ScaleType = Enum.ScaleType.Crop,
						BackgroundTransparency = 1,
						AutoButtonColor = false,
						SelectionImageObject = var9,
						[reactModule.Event.Activated] = function()
							-- upvalues: var1 (copy), i (ref)
							var1.onActivated(i)
						end,
						[reactModule.Event.SelectionGained] = function()
							-- upvalues: var1 (copy), i (ref)
							var1.onSelectionGained(i)
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
								style = var3.Color.Content.Emphasis
							})
						}) else nil
					})
				end
				return t
			end, {
				var7, var1.items, var1.onActivated, var1.onSelectionGained, var9,
				borderRadius,
				if fFlagLuaAppEdpConsoleMediaGalleryVideoPlayIcon then var3 else nil
			}))
		})
	})
end