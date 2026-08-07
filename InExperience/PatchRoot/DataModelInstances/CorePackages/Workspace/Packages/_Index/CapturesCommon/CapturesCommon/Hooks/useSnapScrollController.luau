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

return function(p0, p1, p2, p3) --[[ line: 26 | named "useSnapScrollController" ]]
	-- upvalues: useRef (ref), useState (ref), useCallback (ref), useMotor (ref), reactModule (ref), reactOtterModule (ref), navigationTypeModule (ref), useEffect (ref), useEventConnection (ref), userInputService (ref), isPointWithinBoundsModule (ref)
	local var6 = useRef(nil)
	local var7, var8 = useState(p1)
	local var9 = useRef(nil)
	local var10 = useRef(false)
	local var11 = useRef(nil)
	local var12 = useRef(nil)
	local var13 = useRef(nil)
	local var14 = useRef(nil)
	local var15 = useRef(false)
	local var16 = useMotor((p1 - 1) * -p2.Y, useCallback(function(p4) --[[ line: 42 ]]
		-- upvalues: var9 (ref)
		if var9.current then
			var9.current.Position = UDim2.new(0.5, 0, 0, p4)
			
			return
		end
	end, {}), useCallback(function() --[[ line: 50 ]]
		-- upvalues: var10 (ref)
		var10.current = false
	end, {}))
	local var17 = reactModule.useCallback(function(p5, p6) --[[ line: 57 ]]
		-- upvalues: p0 (ref), var9 (ref), var6 (ref), var10 (ref), var15 (ref), p3 (ref), p2 (ref), var16 (ref), reactOtterModule (copy), var8 (ref)
		if not p0 or not var9.current or (not var6.current or var10.current) or (var15.current or p3 < 1) then return end
		assert(var9.current ~= nil, "motionRef.current is nil")
		var10.current = true
		local clampedValue = math.clamp(p5, 1, p3)
		local var20 = (clampedValue - 1) * -p2.Y
		
		if p6 then
			var16(reactOtterModule.instant(var20))
		else
			var16(reactOtterModule.spring(var20, { frequency = 8 }))
		end
		var8(clampedValue)
	end, { p0, p2, p3, var16 })
	local var18 = reactModule.useCallback(function(p7, p8) --[[ line: 86 ]]
		-- upvalues: navigationTypeModule (copy), var17 (ref), var7 (ref)
		if p7 == navigationTypeModule.Previous then
			var17(var7 - 1, p8)
			
			return
		elseif p7 == navigationTypeModule.Next then
			var17(var7 + 1, p8)
			
			return
		end
		var17(var7, p8)
	end, { var7, var17 })
	useEffect(function() --[[ line: 96 ]]
		-- upvalues: var9 (ref), var11 (ref), p2 (ref), var10 (ref), var18 (ref), navigationTypeModule (copy)
		if var9.current and var11.current ~= p2 then
			var10.current = false
			var18(navigationTypeModule.Current, true)
			var11.current = p2
			
			return
		end
	end, { p2, var18 })
	useEventConnection(userInputService.TouchPinch, reactModule.useCallback(function(_, _, _, p9, _) --[[ line: 106 ]]
		-- upvalues: var18 (ref), navigationTypeModule (copy), var15 (ref), var13 (ref)
		if p9 == Enum.UserInputState.Begin then
			var18(navigationTypeModule.Current)
			var15.current = true
			
			return
		elseif p9 == Enum.UserInputState.End then
			var15.current = false
			var13.current = nil
		end
	end, { var18 }))
	useEventConnection(userInputService.TouchStarted, reactModule.useCallback(function(p10) --[[ line: 118 ]]
		-- upvalues: p0 (ref), var9 (ref), var6 (ref), var13 (ref), isPointWithinBoundsModule (copy), var12 (ref), var14 (ref), var16 (ref), reactOtterModule (copy)
		if not p0 or not var9.current or (not var6.current or var13.current) then return end
		if isPointWithinBoundsModule(Vector2.new(p10.Position.X, p10.Position.Y), var6.current.AbsolutePosition, var6.current.AbsoluteSize) then
			var12.current = var9.current.Position.Y.Offset
			var14.current = p10.Position.Y
			var13.current = p10
			var16(reactOtterModule.instant(var9.current.Position.Y.Offset))
			
			return
		end
	end, { p0, var16 }))
	useEventConnection(userInputService.TouchMoved, reactModule.useCallback(function(p11) --[[ line: 140 ]]
		-- upvalues: p0 (ref), var9 (ref), var6 (ref), var13 (ref), var12 (ref), var14 (ref), var15 (ref), p3 (ref), p2 (ref), var16 (ref), reactOtterModule (copy)
		if p0 and var9.current and (var6.current and var13.current == p11) and (var12.current and var14.current and not var15.current) then
			var16(reactOtterModule.instant(math.clamp(var12.current + (p11.Position.Y - var14.current), (p3 - 1) * -p2.Y - 100, 100)))
			
			return
		end
	end, { p0, p2, p3, var16 }))
	useEventConnection(userInputService.TouchSwipe, reactModule.useCallback(function(p12) --[[ line: 166 ]]
		-- upvalues: p0 (ref), var9 (ref), var6 (ref), var13 (ref), var15 (ref), var10 (ref), var18 (ref), navigationTypeModule (copy)
		if not p0 or not var9.current or (not var6.current or not var13.current) or (var15.current or var10.current) then return end
		if p12 == Enum.SwipeDirection.Up then
			var18(navigationTypeModule.Next)
			
			return
		elseif p12 == Enum.SwipeDirection.Down then
			var18(navigationTypeModule.Previous)
			
			return
		end
		var18(navigationTypeModule.Current)
	end, { p0, var18 }))
	useEventConnection(userInputService.TouchEnded, reactModule.useCallback(function(p13) --[[ line: 190 ]]
		-- upvalues: p0 (ref), var9 (ref), var6 (ref), var13 (ref), var12 (ref), var10 (ref), p2 (ref), var18 (ref), navigationTypeModule (copy)
		if not p0 or not var9.current or (not var6.current or var13.current ~= p13) or (not var12.current or var10.current) then return end
		local var21 = var9.current.Position.Y.Offset - var12.current
		
		if p2.Y * 0.25 < -var21 then
			var18(navigationTypeModule.Next)
		elseif p2.Y * 0.25 < var21 then
			var18(navigationTypeModule.Previous)
		else
			var18(navigationTypeModule.Current)
		end
		var13.current = nil
		var12.current = nil
	end, { p0, p2, var18 }))
	useEventConnection(userInputService.PointerAction, reactModule.useCallback(function(p14, p15) --[[ line: 218 ]]
		-- upvalues: p0 (ref), var18 (ref), navigationTypeModule (copy)
		if not p0 then return end
		if p14 < 0 or p15.Y < -0.1 then
			var18(navigationTypeModule.Next)
			
			return
		elseif p14 > 0 or p15.Y > 0.1 then
			var18(navigationTypeModule.Previous)
		end
	end, { p0, var18 }))
	
	return var7, var6, var9, var17, var18
end