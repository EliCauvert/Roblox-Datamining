local tweenService = game:GetService("TweenService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local fFlagCollectionViewMathChanges = require(parent.SharedFlags).FFlagCollectionViewMathChanges
local _ = require(collectionViews.Carousel.calculateCarouselSpacingMetrics)

return function(p0, p1, p2, p3, p4, p5, p6, p7) --[[ line: 16 | named "useScrollButtonHandlers" ]]
	-- upvalues: argCheckModule (ref), reactModule (ref), fFlagCollectionViewMathChanges (ref), userGameSettingsService (ref), tweenService (ref)
	argCheckModule.assert(p3 >= 1)
	argCheckModule.assert(p1 >= 0)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(p2)
	local var9 = reactModule.useRef(0)
	local maxValue = math.max(0, p1 - p3)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useCallback(function(p8) --[[ line: 38 ]]
		-- upvalues: var9 (ref), maxValue (ref)
		var9.current = math.max(0, math.min(maxValue, p8))
		
		return var9.current
	end, { maxValue, var9 })
	local var13 = reactModule.useCallback(function() --[[ line: 45 ]]
		-- upvalues: p2 (ref), var6 (ref), var8 (ref), var9 (ref), maxValue (ref)
		if p2 then
			var6(var9.current > 0)
			var8(var9.current < maxValue)
			
			return
		end
		var6(false)
		var8(false)
	end, { p2, maxValue, var9 })
	local var14 = reactModule.useCallback(function(p9, p10) --[[ line: 63 ]]
		-- upvalues: p0 (ref), fFlagCollectionViewMathChanges (copy), p3 (ref), p7 (ref), p4 (ref), p5 (ref), userGameSettingsService (copy), var11 (ref), tweenService (copy), p6 (ref), var13 (ref)
		local current = p0.current
		
		if current ~= nil then
			local floored
			local _ = nil
			local _ = nil
			
			if fFlagCollectionViewMathChanges then
				if p3 < 1 then return end
				floored = math.floor(p9 * p7:getValue().stride + 0.5)
			else
				floored = p9 * (p4:getValue().X + p5)
			end
			local canvasPosition = current.CanvasPosition
			
			if fFlagCollectionViewMathChanges and math.abs(canvasPosition.X - floored) < 1 then return end
			local vector2 = Vector2.new(floored, canvasPosition.Y)
			
			if p10 and not userGameSettingsService.ReducedMotion then
				if var11.current then
					var11.current:Cancel()
				end
				var11.current = tweenService:Create(current, TweenInfo.new(p6 or 0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), { CanvasPosition = vector2 }):Play()
				
				return
			else
				current.CanvasPosition = vector2
				var13()
			end
		end
	end, {
		var13, if fFlagCollectionViewMathChanges then p7 else p4,
		if fFlagCollectionViewMathChanges then p3 else p5, var11, p6, p0
	})
	local var15 = reactModule.useCallback(function() --[[ line: 113 ]]
		-- upvalues: var12 (ref), var9 (ref), p3 (ref), var14 (ref)
		var14(var12(var9.current - p3), true)
	end, { var14, var12, p3, var9 })
	local var16 = reactModule.useCallback(function() --[[ line: 118 ]]
		-- upvalues: var12 (ref), var9 (ref), p3 (ref), var14 (ref)
		var14(var12(var9.current + p3), true)
	end, { var14, var12, p3, var9 })
	reactModule.useEffect(function() --[[ line: 126 ]]
		-- upvalues: var12 (ref), var9 (ref), p2 (ref), var14 (ref), var13 (ref)
		var12(var9.current)
		
		if p2 then
			var14(var9.current)
		end
		var13()
	end, { var12, var14, p2 })
	reactModule.useEffect(function() --[[ line: 142 ]]
		-- upvalues: p2 (ref), p0 (ref), var12 (ref), var9 (ref), var14 (ref), var13 (ref)
		if not p2 then
			return nil
		end
		local t = {}
		
		if p0.current ~= nil then
			local current = p0.current
			table.insert(t, current:GetPropertyChangedSignal("CanvasSize"):Connect(function() --[[ line: 152 ]]
				-- upvalues: var12 (copy), var9 (copy), var14 (copy), var13 (copy)
				var12(var9.current)
				var14(var9.current)
				var13()
			end))
			table.insert(t, current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ line: 161 ]]
				-- upvalues: var12 (copy), var9 (copy), var13 (copy)
				var12(var9.current)
				var13()
			end))
		end
		return function() --[[ line: 168 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		var14,
		var9,
		p0,
		p2,
		var12
	})
	
	return var15, var16, var5, var7
end