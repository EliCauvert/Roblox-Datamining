local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local _ = require(parent.ReactOtter)
local signal = require(parent.AppCommonLib).Signal
local _ = require(mediaGallery.MediaGalleryTypes)

return function(p1)
	-- upvalues: reactModule (ref), signal (ref), otterModule (ref)
	local var1, var2 = reactModule.useState(p1.targetIndex or 1)
	local var3 = reactModule.useRef(var1)
	var3.current = var1
	local var4, var5 = reactModule.useBinding(Vector2.new(0, 0))
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), p1 (ref)
		return if p2 == 1 then Vector2.new(0, 0) else Vector2.new(var4:getValue().X + p1.itemPadding, 0)
	end, { p1.itemPadding })
	local var10, var11 = reactModule.useBinding(var9(var1))
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var11 (ref), var9 (ref), var1 (ref)
		if var4:getValue().X > 0 then
			var11(var9(var1))
		end
	end, { var9, var1 })
	local var12 = reactModule.useRef(signal.new())
	local var13 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var7 (ref), var10 (ref), var4 (ref), p1 (ref), var3 (ref), var12 (ref), var8 (ref), otterModule (copy), var11 (ref), var2 (ref)
		if var7.current then return end
		local var14, var15
		local value = var10:getValue()
		local var16 = var4:getValue().X + p1.itemPadding
		local current = var3.current
		local _ = nil
		local _ = nil
		
		if p2 == "Right" then
			var14 = current + 1
			var15 = value + Vector2.new(var16, 0)
		else
			var14 = current - 1
			var15 = value - Vector2.new(var16, 0)
		end
		if var14 < 1 or p1.itemCount < var14 then return end
		var7.current = true
		var12.current:fire(var14)
		
		if var8.current then
			var8.current:destroy()
		end
		local var17 = otterModule.createSingleMotor(0)
		var8.current = var17
		var17:onStep(function(p4)
			-- upvalues: var11 (copy), value (ref), var15 (write)
			var11(value:Lerp(var15, p4))
		end)
		var17:onComplete(function()
			-- upvalues: var7 (copy), var8 (copy), var3 (copy), var14 (write), var2 (copy), p1 (copy), p3 (ref)
			var7.current = false
			var8.current = nil
			var3.current = var14
			var2(var14)
			
			if p1.onScrollComplete then
				p1.onScrollComplete(var14, p3)
			end
		end)
		
		if p1.springConfig then
			var17:setGoal(otterModule.spring(1, p1.springConfig))
		else
			var17:setGoal(otterModule.instant(1))
		end
	end, {
		p1.itemCount,
		p1.itemPadding,
		p1.springConfig,
		p1.onScrollComplete,
		var10
	})
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref), var7 (ref), var11 (ref), var9 (ref), var3 (ref)
		var5(p2.AbsoluteSize)
		
		if not var7.current then
			var11(var9(var3.current))
		end
	end, { var9 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2(p1.targetIndex or 1)
	end, { p1.targetIndex })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref)
		return function()
			-- upvalues: var8 (copy)
			if var8.current then
				var8.current:destroy()
				var8.current = nil
			end
		end
	end, {})
	
	return {
		currentIndex = var1,
		canvasPosition = var10,
		scrolledSignal = var12.current,
		scrollingFrameRef = var6,
		absoluteSizeBinding = var4,
		scrollInDirection = var13,
		onAbsoluteSizeChanged = var14
	}
end