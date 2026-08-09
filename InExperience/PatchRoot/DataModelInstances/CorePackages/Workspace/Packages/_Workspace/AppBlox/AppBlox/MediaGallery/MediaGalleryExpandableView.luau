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
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.MediaGalleryTypes)
local t = {
	titleText = "Media",
	numItemsShown = 4,
	itemAspectRatio = 1.777777777778,
	animationConfig = { dampingRatio = 1, frequency = 6.666666666667 },
	onActivated = function() --[[ line: 29 ]] end,
	onSelectionGained = function() --[[ line: 30 ]] end,
	exitFullscreen = function() --[[ line: 31 ]] end
}

return function(p0) --[[ line: 67 | named "MediaGalleryExpandableView" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), constantsModule (ref), reactOtterModule (ref), reactModule (ref), useCursor (ref), useSelectionCursor (ref), cursorKind (ref), styledTextLabel (ref)
	local var6 = cryoModule.Dictionary.join(t, p0)
	local var7 = useStyle()
	local var8 = cryoModule.Dictionary.join(constantsModule.getDefaultStyleProps(var7), var6.styleProps or {})
	local borderRadius = var8.borderRadius
	local gutter = var8.gutter
	local contentGap = var8.contentGap
	local titleFont = var8.titleFont
	local titleTextColor = var8.titleTextColor
	local var9, var10 = reactOtterModule.useAnimatedBinding(0)
	local var11, var12 = reactModule.useState(Vector2.zero)
	local var13 = if var6.showCursor then useCursor(borderRadius) else useSelectionCursor(cursorKind.Invisible)
	
	return reactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		GroupTransparency = var6.groupTransparency,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, contentGap)
		}),
		ExpandableArea = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = var9:map(function(p1) --[[ line: 199 ]]
				return UDim2.new(1, 0, 0, p1)
			end)
		}),
		Title = reactModule.createElement(styledTextLabel, {
			layoutOrder = 2,
			text = var6.titleText,
			fontStyle = titleFont,
			colorStyle = titleTextColor,
			textXAlignment = Enum.TextXAlignment.Left,
			size = UDim2.new(1, 0, 0, if titleFont.RelativeSize then titleFont.RelativeSize * var7.Font.BaseSize else titleFont.FontSize)
		}),
		MediaGallery = reactModule.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 0, var11.Y),
			BackgroundTransparency = 1,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollBarImageTransparency = 1,
			ScrollBarThickness = 0,
			ScrollingDirection = Enum.ScrollingDirection.X,
			Selectable = false,
			LayoutOrder = 3,
			[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p2, _, _, _) --[[ line: 83 ]]
				-- upvalues: gutter (ref), var6 (ref), var12 (ref)
				local var14 = (p2.AbsoluteSize.X - gutter * (var6.numItemsShown - 1)) / var6.numItemsShown
				var12(Vector2.new(var14, var14 / var6.itemAspectRatio))
			end, { gutter, var6.itemAspectRatio, var6.numItemsShown }),
			[reactModule.Event.SelectionChanged] = reactModule.useCallback(function(p3, _, p4, p5) --[[ line: 97 ]]
				-- upvalues: var10 (ref), reactOtterModule (copy), var6 (ref)
				if not p3 then
					return nil
				end
				local var15 = p5 ~= nil and p5:IsDescendantOf(p3)
				local var16 = p4 ~= nil and p4:IsDescendantOf(p3)
				local var16_1 = not var15 and var16
				
				if var15 and not var16 then
					var10(reactOtterModule.spring(var6.expandableAreaHeightOffset, var6.animationConfig))
					var6.mediaGalleryGainFocused(true)
					
					return nil
				elseif not var16_1 then
					return nil
				elseif not (p5 ~= nil and p4.AbsolutePosition.Y < p5.AbsolutePosition.Y) then
					var10(reactOtterModule.spring(0, var6.animationConfig))
				end
				var6.exitFullscreen()
				var6.mediaGalleryGainFocused(false)
				
				return nil
			end, {
				var6.expandableAreaHeightOffset,
				var6.animationConfig,
				var6.exitFullscreen,
				var6.mediaGalleryGainFocused
			})
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, gutter)
			}),
			Items = reactModule.createElement(reactModule.Fragment, {}, reactModule.useMemo(function() --[[ line: 148 ]]
				-- upvalues: var6 (ref), reactModule (copy), var11 (ref), var13 (ref), borderRadius (ref)
				local t = {}
				
				for i, v in var6.items do
					t["Item" .. i] = reactModule.createElement("ImageButton", {
						LayoutOrder = i,
						Size = UDim2.fromOffset(var11.X, var11.Y),
						Image = v.imageId,
						ScaleType = Enum.ScaleType.Crop,
						BackgroundTransparency = 1,
						AutoButtonColor = false,
						SelectionImageObject = var13,
						[reactModule.Event.Activated] = function() --[[ line: 159 ]]
							-- upvalues: var6 (copy), i (ref)
							var6.onActivated(i)
						end,
						[reactModule.Event.SelectionGained] = function() --[[ line: 162 ]]
							-- upvalues: var6 (copy), i (ref)
							var6.onSelectionGained(i)
						end
					}, {
						Corner = reactModule.createElement("UICorner", { CornerRadius = borderRadius })
					})
				end
				return t
			end, {
				var11, var6.items, var6.onActivated, var6.onSelectionGained, var13,
				borderRadius
			}))
		})
	})
end