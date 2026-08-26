local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return {
	calculateSVFromPosition = function(p1, p2, p3)
		return math.clamp(p1.X - p2.X, 0, p3.X) / p3.X, 1 - math.clamp(p1.Y - p2.Y, 0, p3.Y) / p3.Y
	end,
	createHSVUpdateHandler = function(p1, p2, p3, p4, p5)
		return function(p6, p7, p8)
			-- upvalues: p5 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (ref)
			p5.current = true
			p1(p6)
			p2(p7)
			p3(p8)
			p4(Color3.fromHSV(p6, p7, p8))
			p5.current = false
		end
	end,
	createColorInputChangeHandler = function(p1, p2, p3, p4, p5)
		return function(p6)
			-- upvalues: p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref)
			p1(p6)
			
			if not p2.current then
				local var1, var2, var3 = p6:ToHSV()
				p3(var1)
				p4(var2)
				p5(var3)
			end
		end
	end,
	isPartialHSV = function(p1)
		return if typeof(p1) == "Color3" then false elseif p1.S ~= nil then p1.V == nil else true
	end,
	toColor3 = function(p1)
		return if typeof(p1) == "Color3" then p1 else Color3.fromHSV(p1.H / 360, (p1.S or 100) / 100, (p1.V or 100) / 100)
	end
}