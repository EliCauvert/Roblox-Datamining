local parent = script.Parent.Parent
local parent_1 = parent.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent_1.React)
local reactOtterModule = require(parent_1.ReactOtter)
local reactUtilsModule = require(parent_1.ReactUtils)
local navigationTypeModule = require(parent.Enums.NavigationType)
local isPointWithinBoundsModule = require(parent.Utils.isPointWithinBounds)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useEventConnection = reactUtilsModule.useEventConnection
local useMotor = reactOtterModule.useMotor
local useRef = reactModule.useRef
local useState = reactModule.useState

return function(p1, p2, p3, p4)
	-- upvalues: useRef (ref), useState (ref), useCallback (ref), useMotor (ref), reactModule (ref), reactOtterModule (ref), navigationTypeModule (ref), useEffect (ref), useEventConnection (ref), userInputService (ref), isPointWithinBoundsModule (ref)
	local var1 = useRef(nil)
	local var2, var3 = useState(p2)
	local var4 = useRef(nil)
	local var5 = useRef(false)
	local var6 = useRef(nil)
	local var7 = useRef(nil)
	local var8 = useRef(nil)
	local var9 = useRef(nil)
	local var10 = useRef(false)
	local var11 = useMotor((p2 - 1) * -p3.Y, useCallback(function(p5)
		-- upvalues: var4 (ref)
		if var4.current then
			var4.current.Position = UDim2.new(0.5, 0, 0, p5)
			
			return
		end
	end, {}), useCallback(function()
		-- upvalues: var5 (ref)
		var5.current = false
	end, {}))
	local var12 = reactModule.useCallback(function(p5, p6)
		-- upvalues: p1 (ref), var4 (ref), var1 (ref), var5 (ref), var10 (ref), p4 (ref), p3 (ref), var11 (ref), reactOtterModule (copy), var3 (ref)
		if not p1 or not var4.current or (not var1.current or var5.current) or (var10.current or p4 < 1) then return end
		assert(var4.current ~= nil, "motionRef.current is nil")
		var5.current = true
		local clampedValue = math.clamp(p5, 1, p4)
		local var13 = (clampedValue - 1) * -p3.Y
		
		if p6 then
			var11(reactOtterModule.instant(var13))
		else
			var11(reactOtterModule.spring(var13, { frequency = 8 }))
		end
		var3(clampedValue)
	end, { p1, p3, p4, var11 })
	local var13 = reactModule.useCallback(function(p5, p6)
		-- upvalues: navigationTypeModule (copy), var12 (ref), var2 (ref)
		if p5 == navigationTypeModule.Previous then
			var12(var2 - 1, p6)
			
			return
		elseif p5 == navigationTypeModule.Next then
			var12(var2 + 1, p6)
			
			return
		end
		var12(var2, p6)
	end, { var2, var12 })
	useEffect(function()
		-- upvalues: var4 (ref), var6 (ref), p3 (ref), var5 (ref), var13 (ref), navigationTypeModule (copy)
		if var4.current and var6.current ~= p3 then
			var5.current = false
			var13(navigationTypeModule.Current, true)
			var6.current = p3
			
			return
		end
	end, { p3, var13 })
	useEventConnection(userInputService.TouchPinch, reactModule.useCallback(function(_, _, _, p5, _)
		-- upvalues: var13 (ref), navigationTypeModule (copy), var10 (ref), var8 (ref)
		if p5 == Enum.UserInputState.Begin then
			var13(navigationTypeModule.Current)
			var10.current = true
			
			return
		elseif p5 == Enum.UserInputState.End then
			var10.current = false
			var8.current = nil
		end
	end, { var13 }))
	useEventConnection(userInputService.TouchStarted, reactModule.useCallback(function(p5)
		-- upvalues: p1 (ref), var4 (ref), var1 (ref), var8 (ref), isPointWithinBoundsModule (copy), var7 (ref), var9 (ref), var11 (ref), reactOtterModule (copy)
		if not p1 or not var4.current or (not var1.current or var8.current) then return end
		if isPointWithinBoundsModule(Vector2.new(p5.Position.X, p5.Position.Y), var1.current.AbsolutePosition, var1.current.AbsoluteSize) then
			var7.current = var4.current.Position.Y.Offset
			var9.current = p5.Position.Y
			var8.current = p5
			var11(reactOtterModule.instant(var4.current.Position.Y.Offset))
			
			return
		end
	end, { p1, var11 }))
	useEventConnection(userInputService.TouchMoved, reactModule.useCallback(function(p5)
		-- upvalues: p1 (ref), var4 (ref), var1 (ref), var8 (ref), var7 (ref), var9 (ref), var10 (ref), p4 (ref), p3 (ref), var11 (ref), reactOtterModule (copy)
		if p1 and var4.current and (var1.current and var8.current == p5) and (var7.current and var9.current and not var10.current) then
			var11(reactOtterModule.instant(math.clamp(var7.current + (p5.Position.Y - var9.current), (p4 - 1) * -p3.Y - 100, 100)))
			
			return
		end
	end, { p1, p3, p4, var11 }))
	useEventConnection(userInputService.TouchSwipe, reactModule.useCallback(function(p5)
		-- upvalues: p1 (ref), var4 (ref), var1 (ref), var8 (ref), var10 (ref), var5 (ref), var13 (ref), navigationTypeModule (copy)
		if not p1 or not var4.current or (not var1.current or not var8.current) or (var10.current or var5.current) then return end
		if p5 == Enum.SwipeDirection.Up then
			var13(navigationTypeModule.Next)
			
			return
		elseif p5 == Enum.SwipeDirection.Down then
			var13(navigationTypeModule.Previous)
			
			return
		end
		var13(navigationTypeModule.Current)
	end, { p1, var13 }))
	useEventConnection(userInputService.TouchEnded, reactModule.useCallback(function(p5)
		-- upvalues: p1 (ref), var4 (ref), var1 (ref), var8 (ref), var7 (ref), var5 (ref), p3 (ref), var13 (ref), navigationTypeModule (copy)
		if not p1 or not var4.current or (not var1.current or var8.current ~= p5) or (not var7.current or var5.current) then return end
		local var14 = var4.current.Position.Y.Offset - var7.current
		
		if p3.Y * 0.25 < -var14 then
			var13(navigationTypeModule.Next)
		elseif p3.Y * 0.25 < var14 then
			var13(navigationTypeModule.Previous)
		else
			var13(navigationTypeModule.Current)
		end
		var8.current = nil
		var7.current = nil
	end, { p1, p3, var13 }))
	useEventConnection(userInputService.PointerAction, reactModule.useCallback(function(p5, p6)
		-- upvalues: p1 (ref), var13 (ref), navigationTypeModule (copy)
		if not p1 then return end
		if p5 < 0 or p6.Y < -0.1 then
			var13(navigationTypeModule.Next)
			
			return
		elseif p5 > 0 or p6.Y > 0.1 then
			var13(navigationTypeModule.Previous)
		end
	end, { p1, var13 }))
	
	return var2, var1, var4, var12, var13
end