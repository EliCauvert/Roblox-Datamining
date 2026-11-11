local TweenService = game:GetService("TweenService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)
local FFlagCollectionViewMathChanges = require(Parent.SharedFlags).FFlagCollectionViewMathChanges
local _ = require(CollectionViews.Carousel.calculateCarouselSpacingMetrics)

return function(p1, p2: number, p3, p4: number, p5, p6, p7, p8)
	-- upvalues: ArgCheckModule (copy), ReactModule (copy), FFlagCollectionViewMathChanges (copy), UserGameSettings (copy), TweenService (copy)
	ArgCheckModule.assert(p4 >= 1)
	ArgCheckModule.assert(p2 >= 0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(p3)
	local UseRefResult = ReactModule.useRef(0)
	local Largest = math.max(0, p2 - p4)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p9: number)
		-- upvalues: UseRefResult (copy), Largest (copy)
		UseRefResult.current = math.max(0, (math.min(Largest, p9)))
		
		return UseRefResult.current
	end, { Largest, UseRefResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p3 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseRefResult (copy), Largest (copy)
		if p3 then
			UseStateResult2(UseRefResult.current > 0)
			UseStateResult2_1(UseRefResult.current < Largest)
			
			return
		else
			UseStateResult2(false)
			UseStateResult2_1(false)
		end
	end, { p3, Largest, UseRefResult })
	local UseResult2 = ReactModule.useCallback(function(p9, p10)
		-- upvalues: p1 (copy), FFlagCollectionViewMathChanges (upval), p4 (copy), p8 (copy), p5 (copy), p6 (copy), UserGameSettings (upval), UseRefResult1 (copy), TweenService (upval), p7 (copy), UseResult1 (copy)
		local Current = p1.current
		
		if Current ~= nil then
			local ScaledX = nil
			if FFlagCollectionViewMathChanges then
				if p4 < 1 then return end
				ScaledX = math.floor(p9 * p8:getValue().stride + 0.5)
			else
				ScaledX = p9 * (p5:getValue().X + p6)
			end
			local CanvasPosition = Current.CanvasPosition
			
			if FFlagCollectionViewMathChanges and math.abs(CanvasPosition.X - ScaledX) < 1 then return end
			local _Vector2 = Vector2.new(ScaledX, CanvasPosition.Y)
			
			if p10 and not UserGameSettings.ReducedMotion then
				if UseRefResult1.current then
					UseRefResult1.current:Cancel()
				end
				UseRefResult1.current = TweenService:Create(Current, TweenInfo.new(p7 or 0.75, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), { CanvasPosition = _Vector2 }):Play()
				
				return
			else
				Current.CanvasPosition = _Vector2
				UseResult1()
			end
		end
	end, {
		UseResult1, if FFlagCollectionViewMathChanges then p8 else p5,
		if FFlagCollectionViewMathChanges then p4 else p6, UseRefResult1, p7, p1
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), UseRefResult (copy), p4 (copy), UseResult2 (copy)
		UseResult2(UseResult(UseRefResult.current - p4), true)
	end, { UseResult2, UseResult, p4, UseRefResult })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), UseRefResult (copy), p4 (copy), UseResult2 (copy)
		UseResult2(UseResult(UseRefResult.current + p4), true)
	end, { UseResult2, UseResult, p4, UseRefResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), UseRefResult (copy), p3 (copy), UseResult2 (copy), UseResult1 (copy)
		UseResult(UseRefResult.current)
		
		if p3 then
			UseResult2(UseRefResult.current)
		end
		UseResult1()
	end, { UseResult, UseResult2, p3 })
	ReactModule.useEffect(function()
		-- upvalues: p3 (copy), p1 (copy), UseResult (copy), UseRefResult (copy), UseResult2 (copy), UseResult1 (copy)
		if not p3 then
			return nil
		end
		local List = {}
		
		if p1.current ~= nil then
			local Current = p1.current
			table.insert(List, Current:GetPropertyChangedSignal("CanvasSize"):Connect(function()
				-- upvalues: UseResult (upval), UseRefResult (upval), UseResult2 (upval), UseResult1 (upval)
				UseResult(UseRefResult.current)
				UseResult2(UseRefResult.current)
				UseResult1()
			end))
			table.insert(List, Current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: UseResult (upval), UseRefResult (upval), UseResult1 (upval)
				UseResult(UseRefResult.current)
				UseResult1()
			end))
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		UseResult2,
		UseRefResult,
		p1,
		p3,
		UseResult
	})
	
	return UseResult3, UseResult4, UseStateResult, UseStateResult1
end