local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
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
local baseMenuScrollContainerModule = require(script.Parent.BaseMenuScrollContainer)
local useSubmenuHoverModule = require(script.Parent.useSubmenuHover)
local declarativeBaseMenuContentModule = require(script.Parent.DeclarativeBaseMenuContent)
local t = { size = inputSizeModule.Medium }
local t_1 = {
	[radiusModule.Small] = "radius-small",
	[radiusModule.Medium] = "radius-medium"
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 69 | named "BaseMenu" ]]
	-- upvalues: reactModule (ref), t (ref), withDefaultsModule (ref), useBindableModule (ref), useScaledValueModule (ref), useSubmenuHoverModule (ref), flagsModule (ref), declarativeBaseMenuContentModule (ref), t_1 (ref), baseMenuContextModule (ref), baseMenuScrollContainerModule (ref), withCommonPropsModule (ref), viewModule (ref)
	local var16, var17 = reactModule.useBinding(false)
	local cloned = table.clone(t)
	cloned.Visible = var16
	local var19 = withDefaultsModule(p0, cloned)
	local var20 = useBindableModule(var19.width)
	local var21 = useBindableModule(var19.maxHeight)
	local var22 = useScaledValueModule(260)
	local var23 = useScaledValueModule(320)
	local var24, var25 = reactModule.useState(false)
	local var26 = useSubmenuHoverModule()
	reactModule.useEffect(function() --[[ line: 81 ]]
		-- upvalues: var17 (ref)
		task.delay(0, function() --[[ line: 82 ]]
			-- upvalues: var17 (copy)
			var17(true)
		end)
	end, {})
	local var27 = reactModule.useCallback(function() --[[ line: 87 ]]
		-- upvalues: var25 (ref)
		var25(true)
	end, {})
	local var28 = reactModule.useMemo(function() --[[ line: 92 ]]
		-- upvalues: var20 (ref), flagsModule (copy), var22 (ref)
		return var20:map(function(p2) --[[ line: 93 ]]
			-- upvalues: flagsModule (copy), var22 (copy)
			return if p2 then p2.Offset elseif flagsModule.FoundationBaseMenuContentSizing then 0 else var22
		end)
	end, { var20, var22 })
	local var29 = reactModule.useMemo(function() --[[ line: 101 ]]
		-- upvalues: var20 (ref), flagsModule (copy), var19 (ref), var23 (ref)
		return var20:map(function(p3) --[[ line: 102 ]]
			-- upvalues: flagsModule (copy), var19 (copy), var23 (copy)
			return if flagsModule.FoundationBaseMenuContentSizing then not p3 or var19.couldGrow == true else not p3 or (var19.couldGrow == true and p3.Offset < var23)
		end)
	end, { var20, var23, var19.couldGrow })
	local var30 = reactModule.useMemo(function() --[[ line: 110 ]]
		-- upvalues: reactModule (copy), var29 (ref), var28 (ref), flagsModule (copy), var23 (ref)
		return {
			MinSize = reactModule.joinBindings({ var29, var28 }):map(function(p4) --[[ line: 112 ]]
				-- upvalues: flagsModule (copy)
				local var33 = p4[2]
				
				return if p4[1] then if flagsModule.FoundationBaseMenuContentSizing and var33 == 0 then nil else Vector2.new(var33, 0) else nil
			end),
			MaxSize = if flagsModule.FoundationBaseMenuContentSizing then nil else var29:map(function(p5) --[[ line: 124 ]]
				-- upvalues: var23 (copy)
				return if p5 then Vector2.new(var23, 1e999) else nil
			end)
		}
	end, { var29, var28, var23 })
	local children = var19.children
	
	if not children and var19.items then
		children = reactModule.createElement(declarativeBaseMenuContentModule, { items = var19.items, size = var19.size })
	end
	local var31 = if var19.radius ~= nil then "" else t_1[var19.radius]
	local var32 = reactModule.createElement(baseMenuContextModule.Provider, {
		value = {
			depth = 1,
			onActivated = var19.onActivated,
			onNestedLeafActivated = var19.onNestedLeafActivated,
			size = var19.size,
			hasLeading = var24,
			setHasLeading = var27,
			hoverOpenPath = var26.openPath,
			hoverOpenAtDepth = var26.openAtDepth,
			hoverCloseAtDepth = var26.closeAtDepth,
			hoverReset = var26.reset,
			maxHeight = var19.maxHeight
		}
	}, children)
	
	return if var19.maxHeight then reactModule.createElement(baseMenuScrollContainerModule, {
		maxHeight = var21,
		autoSize = var29,
		width = var20,
		scrollViewProps = withCommonPropsModule(var19, {
			ref = p1,
			sizeConstraint = var30,
			scrollingFrameRef = var19.scrollingFrameRef,
			tag = `stroke-standard stroke-default {var31}`
		})
	}, var32) else reactModule.createElement(viewModule, withCommonPropsModule(var19, {
		tag = `col stroke-standard stroke-default {var31}`,
		AutomaticSize = var29:map(function(p6) --[[ line: 173 ]]
			return if p6 then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y
		end),
		Size = reactModule.joinBindings({ var29, var20 }):map(function(p7) --[[ line: 176 ]]
			return if p7[1] then nil else UDim2.new(p7[2], UDim.new())
		end),
		ref = p1,
		sizeConstraint = var30
	}), var32)
end))