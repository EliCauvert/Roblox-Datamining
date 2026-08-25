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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), t (ref), withDefaultsModule (ref), useBindableModule (ref), useScaledValueModule (ref), useSubmenuHoverModule (ref), flagsModule (ref), declarativeBaseMenuContentModule (ref), t_1 (ref), baseMenuContextModule (ref), baseMenuScrollContainerModule (ref), withCommonPropsModule (ref), viewModule (ref)
	local var1, var2 = reactModule.useBinding(false)
	local cloned = table.clone(t)
	cloned.Visible = var1
	local var3 = withDefaultsModule(p1, cloned)
	local var4 = useBindableModule(var3.width)
	local var5 = useBindableModule(var3.maxHeight)
	local var6 = useScaledValueModule(260)
	local var7 = useScaledValueModule(320)
	local var8, var9 = reactModule.useState(false)
	local var10 = useSubmenuHoverModule()
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		task.delay(0, function()
			-- upvalues: var2 (copy)
			var2(true)
		end)
	end, {})
	local var11 = reactModule.useCallback(function()
		-- upvalues: var9 (ref)
		var9(true)
	end, {})
	local var12 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), flagsModule (copy), var6 (ref)
		return var4:map(function(p1)
			-- upvalues: flagsModule (copy), var6 (copy)
			return if p1 then p1.Offset elseif flagsModule.FoundationBaseMenuContentSizing then 0 else var6
		end)
	end, { var4, var6 })
	local var1 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), flagsModule (copy), var3 (ref), var7 (ref)
		return var4:map(function(p1)
			-- upvalues: flagsModule (copy), var3 (copy), var7 (copy)
			return if flagsModule.FoundationBaseMenuContentSizing then not p1 or var3.couldGrow == true else not p1 or (var3.couldGrow == true and p1.Offset < var7)
		end)
	end, { var4, var7, var3.couldGrow })
	local var1 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var1 (ref), var12 (ref), flagsModule (copy), var7 (ref)
		return {
			MinSize = reactModule.joinBindings({ var1, var12 }):map(function(p1)
				-- upvalues: flagsModule (copy)
				local var1 = p1[2]
				
				return if p1[1] then if flagsModule.FoundationBaseMenuContentSizing and var1 == 0 then nil else Vector2.new(var1, 0) else nil
			end),
			MaxSize = if flagsModule.FoundationBaseMenuContentSizing then nil else var1:map(function(p1)
				-- upvalues: var7 (copy)
				return if p1 then Vector2.new(var7, 1e999) else nil
			end)
		}
	end, { var1, var12, var7 })
	local children = var3.children
	
	if not children and var3.items then
		children = reactModule.createElement(declarativeBaseMenuContentModule, { items = var3.items, size = var3.size })
	end
	local var2 = if var3.radius ~= nil then "" else t_1[var3.radius]
	local var3 = reactModule.createElement(baseMenuContextModule.Provider, {
		value = if flagsModule.FoundationStableContextValues then if flagsModule.FoundationStableContextValues then reactModule.useMemo(function()
			-- upvalues: var3 (ref), var8 (ref), var11 (ref), var10 (ref)
			return {
				depth = 1,
				onActivated = var3.onActivated,
				onNestedLeafActivated = var3.onNestedLeafActivated,
				size = var3.size,
				hasLeading = var8,
				setHasLeading = var11,
				hoverOpenPath = var10.openPath,
				hoverOpenAtDepth = var10.openAtDepth,
				hoverCloseAtDepth = var10.closeAtDepth,
				hoverReset = var10.reset,
				maxHeight = var3.maxHeight
			}
		end, {
			var3.onActivated, var3.onNestedLeafActivated, var3.size, var8,
			var10.openPath, var10.openAtDepth, var10.closeAtDepth, var10.reset,
			var3.maxHeight
		}) else nil else {
			depth = 1,
			onActivated = var3.onActivated,
			onNestedLeafActivated = var3.onNestedLeafActivated,
			size = var3.size,
			hasLeading = var8,
			setHasLeading = var11,
			hoverOpenPath = var10.openPath,
			hoverOpenAtDepth = var10.openAtDepth,
			hoverCloseAtDepth = var10.closeAtDepth,
			hoverReset = var10.reset,
			maxHeight = var3.maxHeight
		}
	}, children)
	
	return if var3.maxHeight then reactModule.createElement(baseMenuScrollContainerModule, {
		maxHeight = var5,
		autoSize = var1,
		width = var4,
		scrollViewProps = withCommonPropsModule(var3, {
			ref = p2,
			sizeConstraint = var1,
			scrollingFrameRef = var3.scrollingFrameRef,
			tag = `stroke-standard stroke-default {var2}`
		})
	}, var3) else reactModule.createElement(viewModule, withCommonPropsModule(var3, {
		tag = `col stroke-standard stroke-default {var2}`,
		AutomaticSize = var1:map(function(p1)
			return if p1 then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y
		end),
		Size = reactModule.joinBindings({ var1, var4 }):map(function(p1)
			return if p1[1] then nil else UDim2.new(p1[2], UDim.new())
		end),
		ref = p2,
		sizeConstraint = var1
	}), var3)
end))