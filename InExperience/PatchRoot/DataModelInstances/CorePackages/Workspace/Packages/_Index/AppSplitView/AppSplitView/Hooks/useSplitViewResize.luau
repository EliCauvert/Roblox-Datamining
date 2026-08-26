local appSplitView = script:FindFirstAncestor("AppSplitView")
local reactModule = require(appSplitView.Parent.React)
local enumsModule = require(appSplitView.Common.Enums)

local function toSupportSize(p1)
	return UDim2.new(0, p1, 1, 0)
end

return function(p1)
	-- upvalues: enumsModule (ref), reactModule (ref), toSupportSize (ref)
	local navWidth = p1.navWidth
	local supportWidth = p1.supportWidth
	local var1 = (p1.variant or enumsModule.SplitVariant.SplitRight) == enumsModule.SplitVariant.SplitRight
	local var2, var3 = reactModule.useState(p1.hasWidthOverride == true)
	local var4, var5 = reactModule.useBinding(supportWidth)
	local var6, var7 = reactModule.useBinding(supportWidth)
	local var8 = reactModule.useRef(supportWidth)
	local var9 = reactModule.useRef(p1)
	var9.current = p1
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref)
		if p1.hasWidthOverride then
			var3(true)
		end
	end, { p1.hasWidthOverride })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), supportWidth (ref), var8 (ref), var7 (ref)
		var5(supportWidth)
		
		if supportWidth == 0 then
			var8.current = 0
			var7(0)
		end
	end, { supportWidth })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref), var7 (ref)
		local x = p2.AbsoluteSize.X
		var8.current = x
		var7(x)
	end, {})
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var9 (ref), enumsModule (copy), var5 (ref), var8 (ref)
		var3(true)
		var5(var8.current + (if (var9.current.variant or enumsModule.SplitVariant.SplitRight) == enumsModule.SplitVariant.SplitRight then -1 else 1) * p2.X)
	end, {})
	local var12 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var8 (ref)
		local current = var9.current
		
		if current.onSupportPaneWidthChanged then
			current.onSupportPaneWidthChanged(var8.current)
		end
	end, {})
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: navWidth (ref)
		return UDim2.new(0, navWidth + p2, 0, 0)
	end, { navWidth })
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: navWidth (ref)
		return UDim2.new(1, -(navWidth + p2), 1, 0)
	end, { navWidth })
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), navWidth (ref)
		local var16 = if var1 then (-p2) - 12 else navWidth + p2 - 12
		
		return if var1 then UDim2.new(1, var16, 0, 0) else UDim2.new(0, var16, 0, 0)
	end, { navWidth, var1 })
	local var16 = reactModule.useCallback(function(p2)
		return UDim2.new(1, -p2, 0, 0)
	end, {})
	
	return {
		resizerHitWidth = 24,
		contentPosition = reactModule.useMemo(function()
			-- upvalues: var1 (ref), navWidth (ref), var6 (ref), var13 (ref)
			return if var1 then UDim2.new(0, navWidth, 0, 0) else var6:map(var13)
		end, { var1, navWidth, var13 }),
		contentSize = reactModule.useMemo(function()
			-- upvalues: var6 (ref), var14 (ref)
			return var6:map(var14)
		end, { var14 }),
		supportPosition = reactModule.useMemo(function()
			-- upvalues: var1 (ref), var6 (ref), var16 (ref), navWidth (ref)
			return if var1 then var6:map(var16) else UDim2.new(0, navWidth, 0, 0)
		end, { var1, navWidth, var16 }),
		supportSize = if var2 then reactModule.useMemo(function()
			-- upvalues: var4 (ref), toSupportSize (copy)
			return var4:map(toSupportSize)
		end, {}) else nil,
		resizerPosition = reactModule.useMemo(function()
			-- upvalues: var6 (ref), var15 (ref)
			return var6:map(var15)
		end, { var15 }),
		onSupportAbsoluteSizeChanged = var10,
		onResizerDrag = var11,
		onResizerDragEnd = var12
	}
end