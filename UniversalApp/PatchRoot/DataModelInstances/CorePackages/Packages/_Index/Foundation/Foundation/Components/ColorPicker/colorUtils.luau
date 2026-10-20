local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return {
	calculateSVFromPosition = function(Vector, Vector1, Vector2)
		return math.clamp(Vector.X - Vector1.X, 0, Vector2.X) / Vector2.X, 1 - math.clamp(Vector.Y - Vector1.Y, 0, Vector2.Y) / Vector2.Y
	end,
	createHSVUpdateHandler = function(Callback, Callback1, Callback2, Callback3, p1)
		return function(Hue, Saturation, Value)
			-- upvalues: p1 (copy), Callback (copy), Callback1 (copy), Callback2 (copy), Callback3 (copy)
			p1.current = true
			Callback(Hue)
			Callback1(Saturation)
			Callback2(Value)
			Callback3((Color3.fromHSV(Hue, Saturation, Value)))
			p1.current = false
		end
	end,
	createColorInputChangeHandler = function(Callback, p1, Callback1, Callback2, Callback3)
		return function(p2)
			-- upvalues: Callback (copy), p1 (copy), Callback1 (copy), Callback2 (copy), Callback3 (copy)
			Callback(p2)
			
			if not p1.current then
				local HSV, HSV2, HSV3 = p2:ToHSV()
				Callback1(HSV)
				Callback2(HSV2)
				Callback3(HSV3)
			end
		end
	end,
	isPartialHSV = function(p1): boolean
		return typeof(p1) ~= "Color3" and (p1.S == nil or p1.V == nil)
	end,
	toColor3 = function(p1)
		return if typeof(p1) == "Color3" then p1 else Color3.fromHSV(p1.H / 360, (p1.S or 100) / 100, (p1.V or 100) / 100)
	end
}