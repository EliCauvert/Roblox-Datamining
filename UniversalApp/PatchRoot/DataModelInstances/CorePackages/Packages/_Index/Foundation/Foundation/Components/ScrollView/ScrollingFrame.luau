local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local _ = require(foundation.Components.Types)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local withGuiObjectPropsModule = require(foundation.Utility.withGuiObjectProps)
local useCursorModule = require(foundation.Providers.Cursor.useCursor)
local useStyleTagsModule = require(foundation.Providers.Style.useStyleTags)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local visibilityModule = require(foundation.Enums.Visibility)
local controlStateModule = require(foundation.Enums.ControlState)
local t = { frequency = 2 }
local t_1 = { scrollBarVisibility = "Auto" }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 52 | named "ScrollingFrame" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), withGuiObjectPropsModule (ref), useTokensModule (ref), useStyleTagsModule (ref), reactModule (ref), visibilityModule (ref), useCursorModule (ref), reactOtterModule (ref), t (ref), controlStateModule (ref)
	local var12 = withDefaultsModule(p0, t_1)
	local var13 = withGuiObjectPropsModule({ selection = var12.selection }, {})
	local var14 = useTokensModule()
	local var15 = useStyleTagsModule(p0.tag)
	local shift400 = var14.Color.Shift.Shift_400
	local var16 = reactModule.useMemo(function() --[[ line: 58 ]]
		-- upvalues: var12 (ref), visibilityModule (copy), var14 (ref)
		return if var12.scrollBarVisibility == visibilityModule.None then 0 else var14.Size.Size_150
	end, { var12.scrollBarVisibility })
	local var17 = useCursorModule()
	local var18 = reactModule.useRef(nil)
	local var19, var20 = reactOtterModule.useAnimatedBinding(1)
	local var21 = reactModule.useCallback(function(p2, p3) --[[ line: 69 ]]
		-- upvalues: var18 (ref), var20 (ref), reactOtterModule (copy), shift400 (ref), t (copy)
		if var18.current then
			task.cancel(var18.current)
		end
		if p2 then
			var20(reactOtterModule.spring(shift400.Transparency, t))
		end
		if p3 ~= nil then
			var18.current = task.delay(p3, function() --[[ line: 79 ]]
				-- upvalues: var20 (copy), reactOtterModule (copy), t (copy)
				var20(reactOtterModule.spring(1, t))
			end)
		end
	end, { shift400 })
	reactModule.useEffect(function() --[[ line: 85 ]]
		-- upvalues: var12 (ref), var21 (ref), controlStateModule (copy)
		if var12.scrollBarVisibility == "None" then
			var21(false, 0)
			
			return
		elseif var12.scrollBarVisibility == "Always" then
			var21(true)
			
			return
		end
		var21(if var12.controlState ~= controlStateModule.Hover then if var12.controlState ~= controlStateModule.Selected then var12.controlState == controlStateModule.Pressed else true else true, if var12.controlState == controlStateModule.Default then 0 else nil)
	end, { var12.scrollBarVisibility, var12.controlState })
	
	return reactModule.createElement("ScrollingFrame", {
		AutomaticCanvasSize = var12.AutomaticCanvasSize,
		CanvasSize = var12.CanvasSize,
		ClipsDescendants = var12.ClipsDescendants,
		ScrollingDirection = var12.ScrollingDirection,
		ScrollingEnabled = var12.ScrollingEnabled,
		ScrollBarImageColor3 = shift400.Color3,
		ScrollBarImageTransparency = var19,
		ScrollBarThickness = var16,
		VerticalScrollBarInset = var12.VerticalScrollBarInset,
		HorizontalScrollBarInset = var12.HorizontalScrollBarInset,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = var12.AutomaticSize,
		Size = UDim2.fromScale(1, 1),
		Selectable = var13.Selectable,
		NextSelectionUp = var13.NextSelectionUp,
		NextSelectionDown = var13.NextSelectionDown,
		NextSelectionLeft = var13.NextSelectionLeft,
		NextSelectionRight = var13.NextSelectionRight,
		SelectionImageObject = var13.SelectionImageObject or var17,
		SelectionOrder = var13.SelectionOrder,
		[reactModule.Change.CanvasPosition] = if var12.scrollBarVisibility == "Auto" then function(p4) --[[ line: 132 ]]
			-- upvalues: var21 (ref), var12 (ref)
			var21(true, 3)
			
			if var12.onCanvasPositionChanged then
				var12.onCanvasPositionChanged(p4)
			end
		end else var12.onCanvasPositionChanged,
		[reactModule.Change.AbsoluteCanvasSize] = var12.onAbsoluteCanvasSizeChanged,
		[reactModule.Change.AbsoluteWindowSize] = var12.onAbsoluteWindowSizeChanged,
		ref = p1,
		[reactModule.Tag] = var15
	}, var12.children)
end))