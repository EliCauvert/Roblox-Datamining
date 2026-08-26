local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local t = { dampingRatio = 0.9, frequency = 6 }

return function(p1)
	-- upvalues: reactModule (ref), reactOtterModule (ref), t (ref)
	local var1 = if p1.hasHeader and p1.hasExpandableBody then p1.sectionGap else 0
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(false)
	local var6 = reactModule.useRef(false)
	local var7, var8 = reactModule.useState(nil)
	local var9, var10 = reactModule.useState(nil)
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref)
		var10(p2.AbsoluteSize.Y)
	end, {})
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref)
		var8(p2.AbsoluteSize.Y)
	end, {})
	local compactHeight = p1.compactHeight
	local buttonHeight = p1.buttonHeight
	local var13 = compactHeight ~= nil and compactHeight > 0
	local var14 = if var13 then compactHeight else 0
	local var15 = var7 or 0
	local var16 = if p1.hasHeader then (var9 or 0) + var1 else 0
	local var17 = buttonHeight + p1.sectionGap
	local var18 = not var13 or (not p1.hasHeader or var9 ~= nil)
	local var19 = not var13 or (not p1.hasExpandableBody or var7 ~= nil)
	local var20 = if var13 then math.max(0, var14 - var16 - var17) else 0
	local var21 = var13 and (var18 and (var19 and (var20 > 0 and var20 + 1 < var15)))
	local var22 = var13 and (p1.hasExpandableBody and (not var2 and not (var18 and var19)))
	local var23 = var21 and not var2
	local var24 = var21 and (var2 and not var4)
	local var25 = var22 or (var23 or var24)
	local var26 = var22 or var23
	local reducedMotion = p1.reducedMotion
	local var27 = if var2 then var15 elseif var25 then var20 else 0
	local var28, var29 = reactOtterModule.useAnimatedBinding(var27, reactModule.useCallback(function()
		-- upvalues: var6 (ref), var5 (ref)
		if var6.current then
			var6.current = false
			var5(true)
		end
	end, {}))
	local var30 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var21 (ref), reducedMotion (ref), var6 (ref), var5 (ref), var29 (ref), reactOtterModule (copy), var15 (ref), t (copy)
		var3(true)
		
		if not var21 then return end
		if reducedMotion then
			var6.current = false
			var5(true)
			var29(reactOtterModule.instant(var15))
			
			return
		end
		var6.current = true
		var5(false)
		var29(reactOtterModule.spring(var15, t))
	end, { var15, var21, reducedMotion, var29 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var24 (ref), var6 (ref), var29 (ref), reactOtterModule (copy), var27 (ref)
		if var24 then
			return
		end
		var6.current = false
		var29(reactOtterModule.instant(var27))
	end, { var27, var24, var29 })
	
	return {
		isCompact = var23,
		shouldReserveCompactHeight = var26,
		useCompactViewport = var25,
		animatedViewportHeight = var28,
		onExpand = var30,
		onHeaderAbsoluteSizeChanged = var11,
		onContentAbsoluteSizeChanged = var12
	}
end