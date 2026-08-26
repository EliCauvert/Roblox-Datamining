local parent = script.Parent.Parent
local parent_1 = parent.Parent
local userInputService = game:GetService("UserInputService")
local reactModule = require(parent_1.React)
local reactOtterModule = require(parent_1.ReactOtter)
local reactUtilsModule = require(parent_1.ReactUtils)
local isPointWithinBoundsModule = require(parent.Utils.isPointWithinBounds)
local useMotor = reactOtterModule.useMotor
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useEventConnection = reactUtilsModule.useEventConnection
local useRef = reactModule.useRef
local useState = reactModule.useState
local t = { dampingRatio = 1, frequency = 4 }

return function(p1)
	-- upvalues: useState (ref), useRef (ref), useCallback (ref), useMotor (ref), useEffect (ref), reactOtterModule (ref), t (ref), isPointWithinBoundsModule (ref), useEventConnection (ref), userInputService (ref)
	local var1, var2 = useState(false)
	local var3 = useRef(nil)
	local var4 = useRef(nil)
	local var5 = useRef(nil)
	local var6 = useMotor({
		scale = 1,
		xAnchor = 0.5,
		yAnchor = 0.5,
		xPos = 0.5,
		yPos = 0.5
	}, useCallback(function(p2)
		-- upvalues: var3 (ref)
		if var3.current then
			var3.current.AnchorPoint = Vector2.new(p2.xAnchor, p2.yAnchor)
			var3.current.Position = UDim2.fromScale(p2.xPos, p2.yPos)
			var3.current.Size = UDim2.fromScale(p2.scale, p2.scale)
			
			return
		end
	end, {}))
	useEffect(function()
		-- upvalues: var3 (ref), p1 (ref), var4 (ref), var5 (ref)
		if not var3.current then return end
		if p1 then
			var4.current = var3.current.AbsolutePosition
			var5.current = var3.current.AbsoluteSize
			
			return
		end
		var4.current = nil
		var5.current = nil
		var3.current.AnchorPoint = Vector2.new(0.5, 0.5)
		var3.current.Position = UDim2.fromScale(0.5, 0.5)
		var3.current.Size = UDim2.fromScale(1, 1)
	end, { p1 })
	useEventConnection(userInputService.TouchPinch, useCallback(function(p2, p3, _, p4, _)
		-- upvalues: p1 (ref), var3 (ref), var1 (ref), var6 (ref), reactOtterModule (copy), t (copy), var4 (ref), var5 (ref), var2 (ref), isPointWithinBoundsModule (copy)
		local absolutePosition
		if not p1 or not var3.current then return end
		if p4 == Enum.UserInputState.End and var1 or #p2 < 2 then
			var6({
				scale = reactOtterModule.spring(1, t),
				xPos = reactOtterModule.spring(var3.current.AnchorPoint.X, t),
				yPos = reactOtterModule.spring(var3.current.AnchorPoint.Y, t)
			})
			var4.current = nil
			var5.current = nil
			var2(false)
			
			return
		elseif p4 == Enum.UserInputState.Begin then
			local var7 = p2[1]
			local var8 = p2[2]
			absolutePosition = var3.current.AbsolutePosition
			local absoluteSize = var3.current.AbsoluteSize
			
			if not isPointWithinBoundsModule(var7, absolutePosition, absoluteSize) or not isPointWithinBoundsModule(var8, absolutePosition, absoluteSize) then return end
			var4.current = absolutePosition
			var5.current = absoluteSize
			local var9 = (var7 + var8) / 2 - (absolutePosition + absoluteSize / 2)
			local var10 = var9.X / absoluteSize.X + 0.5
			local var11 = var9.Y / absoluteSize.Y + 0.5
			var6({
				xAnchor = reactOtterModule.instant(var10),
				yAnchor = reactOtterModule.instant(var11),
				xPos = reactOtterModule.instant(var10),
				yPos = reactOtterModule.instant(var11)
			})
			var2(true)
		end
		if not var1 then return end
		if var4.current and var5.current then
			absolutePosition = (p2[1] + p2[2]) / 2 - (var4.current + var5.current / 2)
			var6({
				scale = reactOtterModule.instant(math.clamp(p3, 0.5, 3)),
				xPos = reactOtterModule.instant(absolutePosition.X / var5.current.X + 0.5),
				yPos = reactOtterModule.instant(absolutePosition.Y / var5.current.Y + 0.5)
			})
			
			return
		end
	end, { p1, var1, var6 }))
	
	return var1, var3
end