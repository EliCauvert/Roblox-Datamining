local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local t = { dampingRatio = 0.9, frequency = 6 }

return function(p0)
	-- upvalues: reactModule (ref), reactOtterModule (ref), t (ref)
	local var3 = if p0.hasHeader and p0.hasExpandableBody then p0.sectionGap else 0
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useRef(false)
	local var9, var10 = reactModule.useState(nil)
	local var11, var12 = reactModule.useState(nil)
	local var13 = reactModule.useCallback(function(p1)
		-- upvalues: var12 (ref)
		var12(p1.AbsoluteSize.Y)
	end, {})
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref)
		var10(p2.AbsoluteSize.Y)
	end, {})
	local compactHeight = p0.compactHeight
	local buttonHeight = p0.buttonHeight
	local var15 = compactHeight ~= nil and compactHeight > 0
	local var16 = if var15 then compactHeight else 0
	local var9_1 = var9 or 0
	local var18 = if p0.hasHeader then (var11 or 0) + var3 else 0
	local var19 = buttonHeight + p0.sectionGap
	local var20 = not var15 or (not p0.hasHeader or var11 ~= nil)
	local var21 = not var15 or (not p0.hasExpandableBody or var9 ~= nil)
	local var22 = if var15 then math.max(0, var16 - var18 - var19) else 0
	local var23 = var15 and (var20 and (var21 and (var22 > 0 and var22 + 1 < var9_1)))
	local var24 = var15 and (p0.hasExpandableBody and (not var4 and not (var20 and var21)))
	local var25 = var23 and not var4
	local var26 = var23 and (var4 and not var6)
	local var24_1 = var24 or (var25 or var26)
	local var24_2 = var24 or var25
	local reducedMotion = p0.reducedMotion
	local var29 = if var4 then var9_1 elseif var24_1 then var22 else 0
	local var30, var31 = reactOtterModule.useAnimatedBinding(var29, reactModule.useCallback(function()
		-- upvalues: var8 (ref), var7 (ref)
		if var8.current then
			var8.current = false
			var7(true)
		end
	end, {}))
	local var32 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var23 (ref), reducedMotion (ref), var8 (ref), var7 (ref), var31 (ref), reactOtterModule (copy), var9_1 (ref), t (copy)
		var5(true)
		
		if not var23 then return end
		if reducedMotion then
			var8.current = false
			var7(true)
			var31(reactOtterModule.instant(var9_1))
			
			return
		end
		var8.current = true
		var7(false)
		var31(reactOtterModule.spring(var9_1, t))
	end, { var9_1, var23, reducedMotion, var31 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var26 (ref), var8 (ref), var31 (ref), reactOtterModule (copy), var29 (ref)
		if var26 then
			return
		end
		var8.current = false
		var31(reactOtterModule.instant(var29))
	end, { var29, var26, var31 })
	
	return {
		isCompact = var25,
		shouldReserveCompactHeight = var24_2,
		useCompactViewport = var24_1,
		animatedViewportHeight = var30,
		onExpand = var32,
		onHeaderAbsoluteSizeChanged = var13,
		onContentAbsoluteSizeChanged = var14
	}
end