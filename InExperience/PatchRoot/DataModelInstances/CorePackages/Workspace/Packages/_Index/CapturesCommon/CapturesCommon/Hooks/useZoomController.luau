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

return function(p0) --[[ line: 28 | named "useZoomController" ]]
	-- upvalues: useState (ref), useRef (ref), useCallback (ref), useMotor (ref), useEffect (ref), reactOtterModule (ref), t (ref), isPointWithinBoundsModule (ref), useEventConnection (ref), userInputService (ref)
	local var6, var7 = useState(false)
	local var8 = useRef(nil)
	local var9 = useRef(nil)
	local var10 = useRef(nil)
	local var11 = useMotor({
		scale = 1,
		xAnchor = 0.5,
		yAnchor = 0.5,
		xPos = 0.5,
		yPos = 0.5
	}, useCallback(function(p1) --[[ line: 35 ]]
		-- upvalues: var8 (ref)
		if var8.current then
			var8.current.AnchorPoint = Vector2.new(p1.xAnchor, p1.yAnchor)
			var8.current.Position = UDim2.fromScale(p1.xPos, p1.yPos)
			var8.current.Size = UDim2.fromScale(p1.scale, p1.scale)
			
			return
		end
	end, {}))
	useEffect(function() --[[ line: 53 ]]
		-- upvalues: var8 (ref), p0 (ref), var9 (ref), var10 (ref)
		if not var8.current then return end
		if p0 then
			var9.current = var8.current.AbsolutePosition
			var10.current = var8.current.AbsoluteSize
			
			return
		end
		var9.current = nil
		var10.current = nil
		var8.current.AnchorPoint = Vector2.new(0.5, 0.5)
		var8.current.Position = UDim2.fromScale(0.5, 0.5)
		var8.current.Size = UDim2.fromScale(1, 1)
	end, { p0 })
	useEventConnection(userInputService.TouchPinch, useCallback(function(p2, p3, _, p4, _) --[[ line: 71 ]]
		-- upvalues: p0 (ref), var8 (ref), var6 (ref), var11 (ref), reactOtterModule (copy), t (copy), var9 (ref), var10 (ref), var7 (ref), isPointWithinBoundsModule (copy)
		local absolutePosition
		if not p0 or not var8.current then return end
		if p4 == Enum.UserInputState.End and var6 or #p2 < 2 then
			var11({
				scale = reactOtterModule.spring(1, t),
				xPos = reactOtterModule.spring(var8.current.AnchorPoint.X, t),
				yPos = reactOtterModule.spring(var8.current.AnchorPoint.Y, t)
			})
			var9.current = nil
			var10.current = nil
			var7(false)
			
			return
		elseif p4 == Enum.UserInputState.Begin then
			local var12 = p2[1]
			local var13 = p2[2]
			absolutePosition = var8.current.AbsolutePosition
			local absoluteSize = var8.current.AbsoluteSize
			
			if not isPointWithinBoundsModule(var12, absolutePosition, absoluteSize) or not isPointWithinBoundsModule(var13, absolutePosition, absoluteSize) then return end
			var9.current = absolutePosition
			var10.current = absoluteSize
			local var14 = (var12 + var13) / 2 - (absolutePosition + absoluteSize / 2)
			local var15 = var14.X / absoluteSize.X + 0.5
			local var16 = var14.Y / absoluteSize.Y + 0.5
			var11({
				xAnchor = reactOtterModule.instant(var15),
				yAnchor = reactOtterModule.instant(var16),
				xPos = reactOtterModule.instant(var15),
				yPos = reactOtterModule.instant(var16)
			})
			var7(true)
		end
		if not var6 then return end
		if var9.current and var10.current then
			absolutePosition = (p2[1] + p2[2]) / 2 - (var9.current + var10.current / 2)
			var11({
				scale = reactOtterModule.instant(math.clamp(p3, 0.5, 3)),
				xPos = reactOtterModule.instant(absolutePosition.X / var10.current.X + 0.5),
				yPos = reactOtterModule.instant(absolutePosition.Y / var10.current.Y + 0.5)
			})
			
			return
		end
	end, { p0, var6, var11 }))
	
	return var6, var8
end