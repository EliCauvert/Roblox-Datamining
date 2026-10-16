local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local _ = require(Foundation.Components.Types)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local WithGuiObjectPropsModule = require(Foundation.Utility.withGuiObjectProps)
local UseCursorModule = require(Foundation.Providers.Cursor.useCursor)
local UseStyleTagsModule = require(Foundation.Providers.Style.useStyleTags)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local VisibilityModule = require(Foundation.Enums.Visibility)
local ControlStateModule = require(Foundation.Enums.ControlState)
local config = { frequency = 2 }
local config1 = { scrollBarVisibility = "Auto" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 52 | Named "ScrollingFrame" ]]
	-- upvalues: WithDefaultsModule (copy), config1 (copy), WithGuiObjectPropsModule (copy), UseTokensModule (copy), UseStyleTagsModule (copy), ReactModule (copy), VisibilityModule (copy), UseCursorModule (copy), ReactOtterModule (copy), config (copy), ControlStateModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local WithGuiObjectPropsModuleResult = WithGuiObjectPropsModule({ selection = WithDefaultsModuleResult.selection }, {})
	local UseTokensModuleResult = UseTokensModule()
	local UseStyleTagsModuleResult = UseStyleTagsModule(p1.tag)
	local Shift400 = UseTokensModuleResult.Color.Shift.Shift_400
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 58 ]]
		-- upvalues: WithDefaultsModuleResult (copy), VisibilityModule (upval), UseTokensModuleResult (copy)
		return if WithDefaultsModuleResult.scrollBarVisibility == VisibilityModule.None then 0 else UseTokensModuleResult.Size.Size_150
	end, { WithDefaultsModuleResult.scrollBarVisibility })
	local UseCursorModuleResult = UseCursorModule()
	local UseRefResult = ReactModule.useRef(nil)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1)
	local UseResult = ReactModule.useCallback(function(p2, Delay) --[[ Line: 69 ]]
		-- upvalues: UseRefResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), Shift400 (copy), config (upval)
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		if p2 then
			UseAnimatedBindingResult2(ReactOtterModule.spring(Shift400.Transparency, config))
		end
		if Delay ~= nil then
			UseRefResult.current = task.delay(Delay, function() --[[ Line: 79 ]]
				-- upvalues: UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
				UseAnimatedBindingResult2(ReactOtterModule.spring(1, config))
			end)
		end
	end, { Shift400 })
	ReactModule.useEffect(function() --[[ Line: 85 ]]
		-- upvalues: WithDefaultsModuleResult (copy), UseResult (copy), ControlStateModule (upval)
		if WithDefaultsModuleResult.scrollBarVisibility == "None" then
			UseResult(false, 0)
			
			return
		end
		if WithDefaultsModuleResult.scrollBarVisibility == "Always" then
			UseResult(true)
			
			return
		else
			UseResult(WithDefaultsModuleResult.controlState == ControlStateModule.Hover or (WithDefaultsModuleResult.controlState == ControlStateModule.Selected or WithDefaultsModuleResult.controlState == ControlStateModule.Pressed), if WithDefaultsModuleResult.controlState == ControlStateModule.Default then 0 else nil)
		end
	end, {
		WithDefaultsModuleResult.scrollBarVisibility,
		WithDefaultsModuleResult.controlState
	})
	
	return ReactModule.createElement("ScrollingFrame", {
		AutomaticCanvasSize = WithDefaultsModuleResult.AutomaticCanvasSize,
		CanvasSize = WithDefaultsModuleResult.CanvasSize,
		ClipsDescendants = WithDefaultsModuleResult.ClipsDescendants,
		ScrollingDirection = WithDefaultsModuleResult.ScrollingDirection,
		ScrollingEnabled = WithDefaultsModuleResult.ScrollingEnabled,
		ScrollBarImageColor3 = Shift400.Color3,
		ScrollBarImageTransparency = UseAnimatedBindingResult,
		ScrollBarThickness = UseMemoResult,
		VerticalScrollBarInset = WithDefaultsModuleResult.VerticalScrollBarInset,
		HorizontalScrollBarInset = WithDefaultsModuleResult.HorizontalScrollBarInset,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = WithDefaultsModuleResult.AutomaticSize,
		Size = UDim2.fromScale(1, 1),
		Selectable = WithGuiObjectPropsModuleResult.Selectable,
		NextSelectionUp = WithGuiObjectPropsModuleResult.NextSelectionUp,
		NextSelectionDown = WithGuiObjectPropsModuleResult.NextSelectionDown,
		NextSelectionLeft = WithGuiObjectPropsModuleResult.NextSelectionLeft,
		NextSelectionRight = WithGuiObjectPropsModuleResult.NextSelectionRight,
		SelectionImageObject = WithGuiObjectPropsModuleResult.SelectionImageObject or UseCursorModuleResult,
		SelectionOrder = WithGuiObjectPropsModuleResult.SelectionOrder,
		[ReactModule.Change.CanvasPosition] = if WithDefaultsModuleResult.scrollBarVisibility == "Auto" then function(p2) --[[ Line: 132 ]]
			-- upvalues: UseResult (copy), WithDefaultsModuleResult (copy)
			UseResult(true, 3)
			
			if WithDefaultsModuleResult.onCanvasPositionChanged then
				WithDefaultsModuleResult.onCanvasPositionChanged(p2)
			end
		end else WithDefaultsModuleResult.onCanvasPositionChanged,
		[ReactModule.Change.AbsoluteCanvasSize] = WithDefaultsModuleResult.onAbsoluteCanvasSizeChanged,
		[ReactModule.Change.AbsoluteWindowSize] = WithDefaultsModuleResult.onAbsoluteWindowSizeChanged,
		ref = Ref,
		[ReactModule.Tag] = UseStyleTagsModuleResult
	}, WithDefaultsModuleResult.children)
end))