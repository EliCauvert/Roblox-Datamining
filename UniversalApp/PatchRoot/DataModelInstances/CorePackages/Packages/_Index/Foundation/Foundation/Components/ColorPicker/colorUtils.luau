local _ = require(script:FindFirstAncestor("Foundation").Components.Types)

return {
	calculateSVFromPosition = function(p0, p1, p2) --[[ line: 25 ]]
		return math.clamp(p0.X - p1.X, 0, p2.X) / p2.X, 1 - math.clamp(p0.Y - p1.Y, 0, p2.Y) / p2.Y
	end,
	createHSVUpdateHandler = function(p3, p4, p5, p6, p7) --[[ line: 39 ]]
		return function(p8, p9, p10) --[[ line: 46 ]]
			-- upvalues: p7 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref)
			p7.current = true
			p3(p8)
			p4(p9)
			p5(p10)
			p6(Color3.fromHSV(p8, p9, p10))
			p7.current = false
		end
	end,
	createColorInputChangeHandler = function(p11, p12, p13, p14, p15) --[[ line: 60 ]]
		return function(p16) --[[ line: 67 ]]
			-- upvalues: p11 (ref), p12 (ref), p13 (ref), p14 (ref), p15 (ref)
			p11(p16)
			
			if not p12.current then
				local var0, var1, var2 = p16:ToHSV()
				p13(var0)
				p14(var1)
				p15(var2)
			end
		end
	end,
	isPartialHSV = function(p17) --[[ line: 17 ]]
		return if typeof(p17) == "Color3" then false elseif p17.S ~= nil then p17.V == nil else true
	end,
	toColor3 = function(p18) --[[ line: 6 ]]
		return if typeof(p18) == "Color3" then p18 else Color3.fromHSV(p18.H / 360, (p18.S or 100) / 100, (p18.V or 100) / 100)
	end
}