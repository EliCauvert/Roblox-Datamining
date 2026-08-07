local mediaGallery = script:FindFirstAncestor("MediaGallery")
local parent = mediaGallery.Parent
local otterModule = require(parent.Otter)
local reactModule = require(parent.React)
local _ = require(parent.ReactOtter)
local _ = require(parent.AppCommonLib)
local MAX_VISIBLE_INDICATORS = require(mediaGallery.MediaGalleryConstants).MAX_VISIBLE_INDICATORS

local function _(p0, p1, p2) --[[ line: 21 | named "getFirstVisibleIndex" ]]
	-- upvalues: MAX_VISIBLE_INDICATORS (ref)
	return if p0 <= MAX_VISIBLE_INDICATORS then 1 elseif p2 == "Right" then math.max(1, math.min(p1, p0 - 2) - MAX_VISIBLE_INDICATORS + 2 + 1) else math.min(p0 - MAX_VISIBLE_INDICATORS + 1, math.max(p1, 3) - 2)
end

return function(p3) --[[ line: 54 | named "useIndicatorScrollAnimation" ]]
	-- upvalues: reactModule (ref), MAX_VISIBLE_INDICATORS (ref), otterModule (ref)
	local var3, var4 = reactModule.useState(p3.startIndex)
	local var5, var6 = reactModule.useState(p3.startIndex)
	local var7, var8 = reactModule.useState(1)
	local var9, var10 = reactModule.useBinding(Vector2.new(0, 0))
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useBinding(0)
	local var15 = reactModule.useCallback(function(p4) --[[ line: 63 ]]
		-- upvalues: p3 (ref)
		return Vector2.new((p4 - 1) * (p3.indicatorSize + p3.indicatorPadding), 0)
	end, { p3.indicatorSize, p3.indicatorPadding })
	reactModule.useEffect(function() --[[ line: 70 ]]
		-- upvalues: p3 (ref), MAX_VISIBLE_INDICATORS (copy), var10 (ref), var15 (ref), var8 (ref), var14 (ref), var6 (ref), var4 (ref)
		local numberOfItems = p3.numberOfItems
		local var16 = if numberOfItems <= MAX_VISIBLE_INDICATORS then 1 else math.max(1, math.min(p3.startIndex, numberOfItems - 2) - MAX_VISIBLE_INDICATORS + 2 + 1)
		var10(var15(var16))
		var8(var16)
		var14(1)
		var6(p3.startIndex)
		var4(p3.startIndex)
	end, { p3.numberOfItems, p3.startIndex, var15 })
	reactModule.useEffect(function() --[[ line: 83 ]]
		-- upvalues: p3 (ref), var4 (ref), var6 (ref), var8 (ref), MAX_VISIBLE_INDICATORS (copy), var12 (ref)
		local scrolledSignalConnection = p3.scrolledSignal:connect(function(p5) --[[ line: 84 ]]
			-- upvalues: var4 (copy), var6 (copy), var8 (copy), p3 (copy), MAX_VISIBLE_INDICATORS (copy), var12 (copy)
			var4(function(p6) --[[ line: 85 ]]
				-- upvalues: p5 (ref), var6 (copy), var8 (copy), p3 (copy), MAX_VISIBLE_INDICATORS (copy), var12 (copy)
				local var18 = if p6 < p5 then "Right" else "Left"
				var6(p6)
				local numberOfItems = p3.numberOfItems
				var8(if numberOfItems <= MAX_VISIBLE_INDICATORS then 1 elseif var18 == "Right" then math.max(1, math.min(p5, numberOfItems - 2) - MAX_VISIBLE_INDICATORS + 2 + 1) else math.min(numberOfItems - MAX_VISIBLE_INDICATORS + 1, math.max(p5, 3) - 2))
				var12(true)
				
				return p5
			end)
		end)
		
		return function() --[[ line: 94 ]]
			-- upvalues: scrolledSignalConnection (write)
			if scrolledSignalConnection ~= nil then
				scrolledSignalConnection:disconnect()
				scrolledSignalConnection = nil
			end
		end
	end, { p3.numberOfItems, p3.scrolledSignal })
	reactModule.useEffect(function() --[[ line: 107 ]]
		-- upvalues: var11 (ref), otterModule (copy), p3 (ref), var9 (ref), var15 (ref), var7 (ref), var14 (ref), var10 (ref), var12 (ref)
		if var11 then
			local var19 = otterModule.createSingleMotor(0)
			var19:setGoal(if p3.useSpring then otterModule.spring(1, p3.springConfig) else otterModule.instant(1))
			local value = var9:getValue()
			local var21 = var15(var7)
			var19:onStep(function(p7) --[[ line: 118 ]]
				-- upvalues: var14 (copy), var10 (copy), value (ref), var21 (ref)
				var14(p7)
				var10(value:Lerp(var21, p7))
			end)
			var19:onComplete(function() --[[ line: 123 ]]
				-- upvalues: var12 (copy)
				var12(false)
			end)
			
			return function() --[[ line: 127 ]]
				-- upvalues: var19 (ref)
				var19:destroy()
			end
		end
	end, {
		p3.useSpring,
		p3.springConfig,
		var11,
		var7,
		var15
	})
	
	return {
		currentItemIndex = var3,
		previousItemIndex = var5,
		firstVisibleIndex = var7,
		animationProgressBinding = var13,
		canvasPositionBinding = var9
	}
end