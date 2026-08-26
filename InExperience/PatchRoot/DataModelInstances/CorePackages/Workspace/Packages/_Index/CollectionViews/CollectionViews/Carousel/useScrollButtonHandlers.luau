local tweenService = game:GetService("TweenService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local fFlagCollectionViewMathChanges = require(parent.SharedFlags).FFlagCollectionViewMathChanges
local _ = require(collectionViews.Carousel.calculateCarouselSpacingMetrics)

return function(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: argCheckModule (ref), reactModule (ref), fFlagCollectionViewMathChanges (ref), userGameSettingsService (ref), tweenService (ref)
	argCheckModule.assert(p4 >= 1)
	argCheckModule.assert(p2 >= 0)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(p3)
	local var5 = reactModule.useRef(0)
	local maxValue = math.max(0, p2 - p4)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useCallback(function(p9)
		-- upvalues: var5 (ref), maxValue (ref)
		var5.current = math.max(0, math.min(maxValue, p9))
		
		return var5.current
	end, { maxValue, var5 })
	local var8 = reactModule.useCallback(function()
		-- upvalues: p3 (ref), var2 (ref), var4 (ref), var5 (ref), maxValue (ref)
		if p3 then
			var2(var5.current > 0)
			var4(var5.current < maxValue)
			
			return
		end
		var2(false)
		var4(false)
	end, { p3, maxValue, var5 })
	local var9 = reactModule.useCallback(function(p9, p10)
		-- upvalues: p1 (ref), fFlagCollectionViewMathChanges (copy), p4 (ref), p8 (ref), p5 (ref), p6 (ref), userGameSettingsService (copy), var6 (ref), tweenService (copy), p7 (ref), var8 (ref)
		local current = p1.current
		
		if current ~= nil then
			local floored
			local _ = nil
			local _ = nil
			
			if fFlagCollectionViewMathChanges then
				if p4 < 1 then return end
				floored = math.floor(p9 * p8:getValue().stride + 0.5)
			else
				floored = p9 * (p5:getValue().X + p6)
			end
			local canvasPosition = current.CanvasPosition
			
			if fFlagCollectionViewMathChanges and math.abs(canvasPosition.X - floored) < 1 then return end
			local vector2 = Vector2.new(floored, canvasPosition.Y)
			
			if p10 and not userGameSettingsService.ReducedMotion then
				if var6.current then
					var6.current:Cancel()
				end
				var6.current = tweenService:Create(current, TweenInfo.new(p7 or 0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), { CanvasPosition = vector2 }):Play()
				
				return
			else
				current.CanvasPosition = vector2
				var8()
			end
		end
	end, {
		var8, if fFlagCollectionViewMathChanges then p8 else p5,
		if fFlagCollectionViewMathChanges then p4 else p6, var6, p7, p1
	})
	local var10 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var5 (ref), p4 (ref), var9 (ref)
		var9(var7(var5.current - p4), true)
	end, { var9, var7, p4, var5 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var5 (ref), p4 (ref), var9 (ref)
		var9(var7(var5.current + p4), true)
	end, { var9, var7, p4, var5 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var5 (ref), p3 (ref), var9 (ref), var8 (ref)
		var7(var5.current)
		
		if p3 then
			var9(var5.current)
		end
		var8()
	end, { var7, var9, p3 })
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), p1 (ref), var7 (ref), var5 (ref), var9 (ref), var8 (ref)
		if not p3 then
			return nil
		end
		local t = {}
		
		if p1.current ~= nil then
			local current = p1.current
			table.insert(t, current:GetPropertyChangedSignal("CanvasSize"):Connect(function()
				-- upvalues: var7 (copy), var5 (copy), var9 (copy), var8 (copy)
				var7(var5.current)
				var9(var5.current)
				var8()
			end))
			table.insert(t, current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: var7 (copy), var5 (copy), var8 (copy)
				var7(var5.current)
				var8()
			end))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		var9,
		var5,
		p1,
		p3,
		var7
	})
	
	return var10, var11, var1, var3
end