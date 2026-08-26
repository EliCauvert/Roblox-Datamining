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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), withGuiObjectPropsModule (ref), useTokensModule (ref), useStyleTagsModule (ref), reactModule (ref), visibilityModule (ref), useCursorModule (ref), reactOtterModule (ref), t (ref), controlStateModule (ref)
	local var1 = withDefaultsModule(p1, t_1)
	local var2 = withGuiObjectPropsModule({ selection = var1.selection }, {})
	local var3 = useTokensModule()
	local var4 = useStyleTagsModule(p1.tag)
	local shift400 = var3.Color.Shift.Shift_400
	local var5 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), visibilityModule (copy), var3 (ref)
		return if var1.scrollBarVisibility == visibilityModule.None then 0 else var3.Size.Size_150
	end, { var1.scrollBarVisibility })
	local var6 = useCursorModule()
	local var7 = reactModule.useRef(nil)
	local var8, var9 = reactOtterModule.useAnimatedBinding(1)
	local var10 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var7 (ref), var9 (ref), reactOtterModule (copy), shift400 (ref), t (copy)
		if var7.current then
			task.cancel(var7.current)
		end
		if p3 then
			var9(reactOtterModule.spring(shift400.Transparency, t))
		end
		if p4 ~= nil then
			var7.current = task.delay(p4, function()
				-- upvalues: var9 (copy), reactOtterModule (copy), t (copy)
				var9(reactOtterModule.spring(1, t))
			end)
		end
	end, { shift400 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var10 (ref), controlStateModule (copy)
		if var1.scrollBarVisibility == "None" then
			var10(false, 0)
			
			return
		elseif var1.scrollBarVisibility == "Always" then
			var10(true)
			
			return
		end
		var10(if var1.controlState ~= controlStateModule.Hover then if var1.controlState ~= controlStateModule.Selected then var1.controlState == controlStateModule.Pressed else true else true, if var1.controlState == controlStateModule.Default then 0 else nil)
	end, { var1.scrollBarVisibility, var1.controlState })
	
	return reactModule.createElement("ScrollingFrame", {
		AutomaticCanvasSize = var1.AutomaticCanvasSize,
		CanvasSize = var1.CanvasSize,
		ClipsDescendants = var1.ClipsDescendants,
		ScrollingDirection = var1.ScrollingDirection,
		ScrollingEnabled = var1.ScrollingEnabled,
		ScrollBarImageColor3 = shift400.Color3,
		ScrollBarImageTransparency = var8,
		ScrollBarThickness = var5,
		VerticalScrollBarInset = var1.VerticalScrollBarInset,
		HorizontalScrollBarInset = var1.HorizontalScrollBarInset,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = var1.AutomaticSize,
		Size = UDim2.fromScale(1, 1),
		Selectable = var2.Selectable,
		NextSelectionUp = var2.NextSelectionUp,
		NextSelectionDown = var2.NextSelectionDown,
		NextSelectionLeft = var2.NextSelectionLeft,
		NextSelectionRight = var2.NextSelectionRight,
		SelectionImageObject = var2.SelectionImageObject or var6,
		SelectionOrder = var2.SelectionOrder,
		[reactModule.Change.CanvasPosition] = if var1.scrollBarVisibility == "Auto" then function(p3)
			-- upvalues: var10 (ref), var1 (ref)
			var10(true, 3)
			
			if var1.onCanvasPositionChanged then
				var1.onCanvasPositionChanged(p3)
			end
		end else var1.onCanvasPositionChanged,
		[reactModule.Change.AbsoluteCanvasSize] = var1.onAbsoluteCanvasSizeChanged,
		[reactModule.Change.AbsoluteWindowSize] = var1.onAbsoluteWindowSizeChanged,
		ref = p2,
		[reactModule.Tag] = var4
	}, var1.children)
end))