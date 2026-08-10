local appSplitView = script:FindFirstAncestor("AppSplitView")
local reactModule = require(appSplitView.Parent.React)
local enumsModule = require(appSplitView.Common.Enums)

local function toSupportSize(p0) --[[ line: 10 ]]
	return UDim2.new(0, p0, 1, 0)
end

return function(p1) --[[ line: 22 | named "useSplitViewResize" ]]
	-- upvalues: enumsModule (ref), reactModule (ref), toSupportSize (ref)
	local navWidth = p1.navWidth
	local supportWidth = p1.supportWidth
	local var4 = (p1.variant or enumsModule.SplitVariant.SplitRight) == enumsModule.SplitVariant.SplitRight
	local var5, var6 = reactModule.useState(p1.hasWidthOverride == true)
	local var7, var8 = reactModule.useBinding(supportWidth)
	local var9, var10 = reactModule.useBinding(supportWidth)
	local var11 = reactModule.useRef(supportWidth)
	local var12 = reactModule.useRef(p1)
	var12.current = p1
	reactModule.useEffect(function() --[[ line: 35 ]]
		-- upvalues: p1 (ref), var6 (ref)
		if p1.hasWidthOverride then
			var6(true)
		end
	end, { p1.hasWidthOverride })
	reactModule.useEffect(function() --[[ line: 41 ]]
		-- upvalues: var8 (ref), supportWidth (ref), var11 (ref), var10 (ref)
		var8(supportWidth)
		
		if supportWidth == 0 then
			var11.current = 0
			var10(0)
		end
	end, { supportWidth })
	local var13 = reactModule.useCallback(function(p2) --[[ line: 49 ]]
		-- upvalues: var11 (ref), var10 (ref)
		local x = p2.AbsoluteSize.X
		var11.current = x
		var10(x)
	end, {})
	local var14 = reactModule.useCallback(function(p3) --[[ line: 55 ]]
		-- upvalues: var6 (ref), var12 (ref), enumsModule (copy), var8 (ref), var11 (ref)
		var6(true)
		var8(var11.current + (if (var12.current.variant or enumsModule.SplitVariant.SplitRight) == enumsModule.SplitVariant.SplitRight then -1 else 1) * p3.X)
	end, {})
	local var15 = reactModule.useCallback(function() --[[ line: 63 ]]
		-- upvalues: var12 (ref), var11 (ref)
		local current = var12.current
		
		if current.onSupportPaneWidthChanged then
			current.onSupportPaneWidthChanged(var11.current)
		end
	end, {})
	local var16 = reactModule.useCallback(function(p4) --[[ line: 70 ]]
		-- upvalues: navWidth (ref)
		return UDim2.new(0, navWidth + p4, 0, 0)
	end, { navWidth })
	local var17 = reactModule.useCallback(function(p5) --[[ line: 74 ]]
		-- upvalues: navWidth (ref)
		return UDim2.new(1, -(navWidth + p5), 1, 0)
	end, { navWidth })
	local var18 = reactModule.useCallback(function(p6) --[[ line: 78 ]]
		-- upvalues: var4 (ref), navWidth (ref)
		local var20 = if var4 then (-p6) - 12 else navWidth + p6 - 12
		
		return if var4 then UDim2.new(1, var20, 0, 0) else UDim2.new(0, var20, 0, 0)
	end, { navWidth, var4 })
	local var19 = reactModule.useCallback(function(p7) --[[ line: 83 ]]
		return UDim2.new(1, -p7, 0, 0)
	end, {})
	
	return {
		resizerHitWidth = 24,
		contentPosition = reactModule.useMemo(function() --[[ line: 87 ]]
			-- upvalues: var4 (ref), navWidth (ref), var9 (ref), var16 (ref)
			return if var4 then UDim2.new(0, navWidth, 0, 0) else var9:map(var16)
		end, { var4, navWidth, var16 }),
		contentSize = reactModule.useMemo(function() --[[ line: 91 ]]
			-- upvalues: var9 (ref), var17 (ref)
			return var9:map(var17)
		end, { var17 }),
		supportPosition = reactModule.useMemo(function() --[[ line: 95 ]]
			-- upvalues: var4 (ref), var9 (ref), var19 (ref), navWidth (ref)
			return if var4 then var9:map(var19) else UDim2.new(0, navWidth, 0, 0)
		end, { var4, navWidth, var19 }),
		supportSize = if var5 then reactModule.useMemo(function() --[[ line: 99 ]]
			-- upvalues: var7 (ref), toSupportSize (copy)
			return var7:map(toSupportSize)
		end, {}) else nil,
		resizerPosition = reactModule.useMemo(function() --[[ line: 104 ]]
			-- upvalues: var9 (ref), var18 (ref)
			return var9:map(var18)
		end, { var18 }),
		onSupportAbsoluteSizeChanged = var13,
		onResizerDrag = var14,
		onResizerDragEnd = var15
	}
end