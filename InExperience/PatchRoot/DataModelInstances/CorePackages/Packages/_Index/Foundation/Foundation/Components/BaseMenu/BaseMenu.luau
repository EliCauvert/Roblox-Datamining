local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local scrollViewModule = require(foundation.Components.ScrollView)
local viewModule = require(foundation.Components.View)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useBindableModule = require(foundation.Utility.useBindable)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(foundation.Enums.ControlState)
local radiusModule = require(foundation.Enums.Radius)
local _ = require(foundation.Components.Types)
local inputSizeModule = require(foundation.Enums.InputSize)
local baseMenuContextModule = require(script.Parent.BaseMenuContext)
local useSubmenuHoverModule = require(script.Parent.useSubmenuHover)
local declarativeBaseMenuContentModule = require(script.Parent.DeclarativeBaseMenuContent)
local t = { size = inputSizeModule.Medium }
local t_1 = {
	[radiusModule.Small] = "radius-small",
	[radiusModule.Medium] = "radius-medium"
}

local function computeAutomaticSize(p0) --[[ line: 67 ]]
	return if p0.autoSize then if p0.isOverMaxHeight then Enum.AutomaticSize.X else Enum.AutomaticSize.XY elseif p0.isOverMaxHeight then Enum.AutomaticSize.None else Enum.AutomaticSize.Y
end

local function computeSize(p1) --[[ line: 73 ]]
	local var18 = if p1.isOverMaxHeight and p1.maxHeight then UDim.new(0, p1.maxHeight) else UDim.new()
	
	return if p1.autoSize then UDim2.new(UDim.new(), var18) else UDim2.new(p1.width or UDim.new(), var18)
end

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 83 | named "BaseMenu" ]]
	-- upvalues: reactModule (ref), t (ref), withDefaultsModule (ref), useBindableModule (ref), useScaledValueModule (ref), useSubmenuHoverModule (ref), declarativeBaseMenuContentModule (ref), t_1 (ref), computeAutomaticSize (ref), scrollViewModule (ref), withCommonPropsModule (ref), flagsModule (ref), computeSize (ref), viewModule (ref), baseMenuContextModule (ref)
	local var19, var20 = reactModule.useBinding(false)
	local cloned = table.clone(t)
	cloned.Visible = var19
	local var22 = withDefaultsModule(p2, cloned)
	local var23 = useBindableModule(var22.width)
	local var24 = useBindableModule(var22.maxHeight)
	local var25 = useScaledValueModule(260)
	local var26 = useScaledValueModule(320)
	local var27, var28 = reactModule.useState(false)
	local var29, var30 = reactModule.useBinding(UDim2.fromScale(0, 1))
	local var31 = useSubmenuHoverModule()
	reactModule.useEffect(function() --[[ line: 96 ]]
		-- upvalues: var20 (ref)
		task.delay(0, function() --[[ line: 97 ]]
			-- upvalues: var20 (copy)
			var20(true)
		end)
	end, {})
	local var32 = reactModule.useCallback(function() --[[ line: 102 ]]
		-- upvalues: var28 (ref)
		var28(true)
	end, {})
	local var33 = reactModule.useMemo(function() --[[ line: 107 ]]
		-- upvalues: var23 (ref), var25 (ref)
		return var23:map(function(p4) --[[ line: 108 ]]
			-- upvalues: var25 (copy)
			return if p4 then p4.Offset else var25
		end)
	end, { var23, var25 })
	local var34 = reactModule.useMemo(function() --[[ line: 114 ]]
		-- upvalues: var23 (ref), var22 (ref), var26 (ref)
		return var23:map(function(p5) --[[ line: 115 ]]
			-- upvalues: var22 (copy), var26 (copy)
			return not p5 or var22.couldGrow and p5.Offset < var26
		end)
	end, { var23, var26, var22.couldGrow })
	local var35 = reactModule.useMemo(function() --[[ line: 120 ]]
		-- upvalues: reactModule (copy), var34 (ref), var33 (ref), var26 (ref)
		return {
			MinSize = reactModule.joinBindings({ var34, var33 }):map(function(p6) --[[ line: 122 ]]
				return if p6[1] then Vector2.new(p6[2], 0) else nil
			end),
			MaxSize = var34:map(function(p7) --[[ line: 127 ]]
				-- upvalues: var26 (copy)
				return if p7 then Vector2.new(var26, 1e999) else nil
			end)
		}
	end, { var34, var33, var26 })
	local var36 = reactModule.useMemo(function() --[[ line: 133 ]]
		-- upvalues: reactModule (copy), var29 (ref), var24 (ref)
		return reactModule.joinBindings({ canvasSize = var29, maxHeight = var24 }):map(function(p8) --[[ line: 135 ]]
			return p8.maxHeight ~= nil and p8.maxHeight < p8.canvasSize.Y.Offset
		end)
	end, { var24 })
	local var37 = reactModule.useCallback(function(p9) --[[ line: 140 ]]
		-- upvalues: var30 (ref)
		return var30(UDim2.fromOffset(p9.AbsoluteSize.X, p9.AbsoluteSize.Y))
	end, { var30 })
	local children = var22.children
	
	if not children and var22.items then
		children = reactModule.createElement(declarativeBaseMenuContentModule, { items = var22.items, size = var22.size })
	end
	local var38 = if var22.radius ~= nil then "" else t_1[var22.radius]
	
	if var22.maxHeight then
		local var39 = reactModule.joinBindings({ autoSize = var34, isOverMaxHeight = var36 }):map(computeAutomaticSize)
		
		return reactModule.createElement(scrollViewModule, withCommonPropsModule(var22, {
			ref = p3,
			scroll = {
				AutomaticCanvasSize = if flagsModule.FoundationBaseMenuAutoYCanvasSizing then Enum.AutomaticSize.Y else nil,
				AutomaticSize = var39,
				ScrollingDirection = Enum.ScrollingDirection.Y,
				CanvasSize = var29
			},
			AutomaticSize = var39,
			Size = reactModule.joinBindings({
				autoSize = var34,
				width = var23,
				isOverMaxHeight = var36,
				maxHeight = var24
			}):map(computeSize),
			sizeConstraint = var35,
			tag = `stroke-standard stroke-default {var38}`
		}), reactModule.createElement(viewModule, {
			tag = if flagsModule.FoundationBaseMenuAutoYCanvasSizing then "col size-full-0 auto-y" else "col size-full",
			onAbsoluteSizeChanged = var37
		}, reactModule.createElement(baseMenuContextModule.Provider, {
			value = {
				depth = 1,
				onActivated = var22.onActivated,
				onNestedLeafActivated = var22.onNestedLeafActivated,
				size = var22.size,
				hasLeading = var27,
				setHasLeading = var32,
				hoverOpenPath = var31.openPath,
				hoverOpenAtDepth = var31.openAtDepth,
				hoverCloseAtDepth = var31.closeAtDepth,
				hoverReset = var31.reset
			}
		}, children)))
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var22, {
		tag = `col stroke-standard stroke-default {var38}`,
		AutomaticSize = var34:map(function(p10) --[[ line: 210 ]]
			return if p10 then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y
		end),
		Size = reactModule.joinBindings({ var34, var23 }):map(function(p11) --[[ line: 213 ]]
			return if p11[1] then nil else UDim2.new(p11[2], UDim.new())
		end),
		ref = p3,
		sizeConstraint = var35
	}), reactModule.createElement(baseMenuContextModule.Provider, {
		value = {
			depth = 1,
			onActivated = var22.onActivated,
			onNestedLeafActivated = var22.onNestedLeafActivated,
			size = var22.size,
			hasLeading = var27,
			setHasLeading = var32,
			hoverOpenPath = var31.openPath,
			hoverOpenAtDepth = var31.openAtDepth,
			hoverCloseAtDepth = var31.closeAtDepth,
			hoverReset = var31.reset
		}
	}, children))
end))