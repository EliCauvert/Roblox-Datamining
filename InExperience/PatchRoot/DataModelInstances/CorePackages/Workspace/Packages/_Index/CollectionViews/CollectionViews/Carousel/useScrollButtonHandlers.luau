local TweenService = game:GetService("TweenService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Parent = script:FindFirstAncestor("CollectionViews").Parent
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)

return function(p1, p2: number, p3, p4: number, p5, p6, p7) --[[ Line: 9 | Named "useScrollButtonHandlers" ]]
	-- upvalues: ArgCheckModule (copy), ReactModule (copy), UserGameSettings (copy), TweenService (copy)
	ArgCheckModule.assert(p4 >= 1)
	ArgCheckModule.assert(p2 >= 0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(p3)
	local UseRefResult = ReactModule.useRef(0)
	local Largest = math.max(0, p2 - p4)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p8: number) --[[ Line: 30 ]]
		-- upvalues: UseRefResult (copy), Largest (copy)
		UseRefResult.current = math.max(0, (math.min(Largest, p8)))
		
		return UseRefResult.current
	end, { Largest, UseRefResult })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 37 ]]
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
	local UseResult2 = ReactModule.useCallback(function(p8, p9) --[[ Line: 55 ]]
		-- upvalues: p1 (copy), p5 (copy), p6 (copy), UserGameSettings (upval), UseRefResult1 (copy), TweenService (upval), p7 (copy), UseResult1 (copy)
		local Current = p1.current
		
		if Current ~= nil then
			local _Vector2 = Vector2.new(p8 * (p5:getValue().X + p6), Current.CanvasPosition.Y)
			
			if p9 and not UserGameSettings.ReducedMotion then
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
		UseResult1, p5, p6, UseRefResult1, p7, p1
	})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 92 ]]
		-- upvalues: UseResult (copy), UseRefResult (copy), p4 (copy), UseResult2 (copy)
		UseResult2(UseResult(UseRefResult.current - p4), true)
	end, { UseResult2, UseResult, p4, UseRefResult })
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 97 ]]
		-- upvalues: UseResult (copy), UseRefResult (copy), p4 (copy), UseResult2 (copy)
		UseResult2(UseResult(UseRefResult.current + p4), true)
	end, { UseResult2, UseResult, p4, UseRefResult })
	ReactModule.useEffect(function() --[[ Line: 105 ]]
		-- upvalues: UseResult (copy), UseRefResult (copy), p3 (copy), UseResult2 (copy), UseResult1 (copy)
		UseResult(UseRefResult.current)
		
		if p3 then
			UseResult2(UseRefResult.current)
		end
		UseResult1()
	end, { UseResult, UseResult2, p3 })
	ReactModule.useEffect(function() --[[ Line: 121 ]]
		-- upvalues: p3 (copy), p1 (copy), UseResult (copy), UseRefResult (copy), UseResult2 (copy), UseResult1 (copy)
		if not p3 then
			return nil
		end
		local List = {}
		
		if p1.current ~= nil then
			local Current = p1.current
			table.insert(List, Current:GetPropertyChangedSignal("CanvasSize"):Connect(function() --[[ Line: 131 ]]
				-- upvalues: UseResult (upval), UseRefResult (upval), UseResult2 (upval), UseResult1 (upval)
				UseResult(UseRefResult.current)
				UseResult2(UseRefResult.current)
				UseResult1()
			end))
			table.insert(List, Current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 140 ]]
				-- upvalues: UseResult (upval), UseRefResult (upval), UseResult1 (upval)
				UseResult(UseRefResult.current)
				UseResult1()
			end))
		end
		return function() --[[ Line: 147 ]]
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