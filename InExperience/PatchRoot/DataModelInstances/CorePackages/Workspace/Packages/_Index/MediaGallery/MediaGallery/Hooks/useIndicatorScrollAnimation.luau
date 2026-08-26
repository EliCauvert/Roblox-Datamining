local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local _ = require(parent.ReactOtter)
local _ = require(parent.AppCommonLib)
local MAX_VISIBLE_INDICATORS = require(mediaGallery.MediaGalleryConstants).MAX_VISIBLE_INDICATORS

local function _(p1, p2, p3)
	-- upvalues: MAX_VISIBLE_INDICATORS (ref)
	return if p1 <= MAX_VISIBLE_INDICATORS then 1 elseif p3 == "Right" then math.max(1, math.min(p2, p1 - 2) - MAX_VISIBLE_INDICATORS + 2 + 1) else math.min(p1 - MAX_VISIBLE_INDICATORS + 1, math.max(p2, 3) - 2)
end

return function(p1)
	-- upvalues: reactModule (ref), MAX_VISIBLE_INDICATORS (ref), otterModule (ref)
	local var1, var2 = reactModule.useState(p1.startIndex)
	local var3, var4 = reactModule.useState(p1.startIndex)
	local var5, var6 = reactModule.useState(1)
	local var7, var8 = reactModule.useBinding(Vector2.new(0, 0))
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useBinding(0)
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		return Vector2.new((p2 - 1) * (p1.indicatorSize + p1.indicatorPadding), 0)
	end, { p1.indicatorSize, p1.indicatorPadding })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), MAX_VISIBLE_INDICATORS (copy), var8 (ref), var13 (ref), var6 (ref), var12 (ref), var4 (ref), var2 (ref)
		local numberOfItems = p1.numberOfItems
		local var14 = if numberOfItems <= MAX_VISIBLE_INDICATORS then 1 else math.max(1, math.min(p1.startIndex, numberOfItems - 2) - MAX_VISIBLE_INDICATORS + 2 + 1)
		var8(var13(var14))
		var6(var14)
		var12(1)
		var4(p1.startIndex)
		var2(p1.startIndex)
	end, { p1.numberOfItems, p1.startIndex, var13 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var4 (ref), var6 (ref), MAX_VISIBLE_INDICATORS (copy), var10 (ref)
		local scrolledSignalConnection = p1.scrolledSignal:connect(function(p2)
			-- upvalues: var2 (copy), var4 (copy), var6 (copy), p1 (copy), MAX_VISIBLE_INDICATORS (copy), var10 (copy)
			var2(function(p3)
				-- upvalues: p2 (ref), var4 (copy), var6 (copy), p1 (copy), MAX_VISIBLE_INDICATORS (copy), var10 (copy)
				local var14 = if p3 < p2 then "Right" else "Left"
				var4(p3)
				local numberOfItems = p1.numberOfItems
				var6(if numberOfItems <= MAX_VISIBLE_INDICATORS then 1 elseif var14 == "Right" then math.max(1, math.min(p2, numberOfItems - 2) - MAX_VISIBLE_INDICATORS + 2 + 1) else math.min(numberOfItems - MAX_VISIBLE_INDICATORS + 1, math.max(p2, 3) - 2))
				var10(true)
				
				return p2
			end)
		end)
		
		return function()
			-- upvalues: scrolledSignalConnection (write)
			if scrolledSignalConnection ~= nil then
				scrolledSignalConnection:disconnect()
				scrolledSignalConnection = nil
			end
		end
	end, { p1.numberOfItems, p1.scrolledSignal })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), otterModule (copy), p1 (ref), var7 (ref), var13 (ref), var5 (ref), var12 (ref), var8 (ref), var10 (ref)
		if var9 then
			local var14 = otterModule.createSingleMotor(0)
			var14:setGoal(if p1.useSpring then otterModule.spring(1, p1.springConfig) else otterModule.instant(1))
			local value = var7:getValue()
			local var15 = var13(var5)
			var14:onStep(function(p2)
				-- upvalues: var12 (copy), var8 (copy), value (ref), var15 (ref)
				var12(p2)
				var8(value:Lerp(var15, p2))
			end)
			var14:onComplete(function()
				-- upvalues: var10 (copy)
				var10(false)
			end)
			
			return function()
				-- upvalues: var14 (ref)
				var14:destroy()
			end
		end
	end, {
		p1.useSpring,
		p1.springConfig,
		var9,
		var5,
		var13
	})
	
	return {
		currentItemIndex = var1,
		previousItemIndex = var3,
		firstVisibleIndex = var5,
		animationProgressBinding = var11,
		canvasPositionBinding = var7
	}
end