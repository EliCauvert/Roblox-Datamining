local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local _ = require(parent.ReactOtter)
local signal = require(parent.AppCommonLib).Signal
local _ = require(mediaGallery.MediaGalleryTypes)

return function(p0) --[[ line: 51 | named "useSnapScroll" ]]
	-- upvalues: reactModule (ref), signal (ref), otterModule (ref)
	local var3, var4 = reactModule.useState(p0.targetIndex or 1)
	local var5 = reactModule.useRef(var3)
	var5.current = var3
	local var6, var7 = reactModule.useBinding(Vector2.new(0, 0))
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useCallback(function(p1) --[[ line: 65 ]]
		-- upvalues: var6 (ref), p0 (ref)
		return if p1 == 1 then Vector2.new(0, 0) else Vector2.new(var6:getValue().X + p0.itemPadding, 0)
	end, { p0.itemPadding })
	local var12, var13 = reactModule.useBinding(var11(var3))
	reactModule.useEffect(function() --[[ line: 79 ]]
		-- upvalues: var6 (ref), var13 (ref), var11 (ref), var3 (ref)
		if var6:getValue().X > 0 then
			var13(var11(var3))
		end
	end, { var11, var3 })
	local var14 = reactModule.useRef(signal.new())
	local var15 = reactModule.useCallback(function(p2, p3) --[[ line: 88 ]]
		-- upvalues: var9 (ref), var12 (ref), var6 (ref), p0 (ref), var5 (ref), var14 (ref), var10 (ref), otterModule (copy), var13 (ref), var4 (ref)
		if var9.current then return end
		local var19, var20
		local value = var12:getValue()
		local var18 = var6:getValue().X + p0.itemPadding
		local current = var5.current
		local _ = nil
		local _ = nil
		
		if p2 == "Right" then
			var19 = current + 1
			var20 = value + Vector2.new(var18, 0)
		else
			var19 = current - 1
			var20 = value - Vector2.new(var18, 0)
		end
		if var19 < 1 or p0.itemCount < var19 then return end
		var9.current = true
		var14.current:fire(var19)
		
		if var10.current then
			var10.current:destroy()
		end
		local var21 = otterModule.createSingleMotor(0)
		var10.current = var21
		var21:onStep(function(p4) --[[ line: 121 ]]
			-- upvalues: var13 (copy), value (ref), var20 (write)
			var13(value:Lerp(var20, p4))
		end)
		var21:onComplete(function() --[[ line: 125 ]]
			-- upvalues: var9 (copy), var10 (copy), var5 (copy), var19 (write), var4 (copy), p0 (copy), p3 (ref)
			var9.current = false
			var10.current = nil
			var5.current = var19
			var4(var19)
			
			if p0.onScrollComplete then
				p0.onScrollComplete(var19, p3)
			end
		end)
		
		if p0.springConfig then
			var21:setGoal(otterModule.spring(1, p0.springConfig))
		else
			var21:setGoal(otterModule.instant(1))
		end
	end, {
		p0.itemCount,
		p0.itemPadding,
		p0.springConfig,
		p0.onScrollComplete,
		var12
	})
	local var16 = reactModule.useCallback(function(p5) --[[ line: 151 ]]
		-- upvalues: var7 (ref), var9 (ref), var13 (ref), var11 (ref), var5 (ref)
		var7(p5.AbsoluteSize)
		
		if not var9.current then
			var13(var11(var5.current))
		end
	end, { var11 })
	reactModule.useEffect(function() --[[ line: 159 ]]
		-- upvalues: var4 (ref), p0 (ref)
		var4(p0.targetIndex or 1)
	end, { p0.targetIndex })
	reactModule.useEffect(function() --[[ line: 165 ]]
		-- upvalues: var10 (ref)
		return function() --[[ line: 166 ]]
			-- upvalues: var10 (copy)
			if var10.current then
				var10.current:destroy()
				var10.current = nil
			end
		end
	end, {})
	
	return {
		currentIndex = var3,
		canvasPosition = var12,
		scrolledSignal = var14.current,
		scrollingFrameRef = var8,
		absoluteSizeBinding = var6,
		scrollInDirection = var15,
		onAbsoluteSizeChanged = var16
	}
end