local t = {
	RgbFromHex = function(p0) --[[ line: 3 ]]
		assert(p0 >= 0 and p0 <= 16777215, "RgbFromHex: Out of range")
		local var1 = p0 % 256
		p0 = (p0 - var1) / 256
		local var2 = p0 % 256
		
		return (p0 - var2) / 256, var2, var1
	end
}

function t.Color3FromHex(p1) --[[ line: 15 ]]
	-- upvalues: t (ref)
	return Color3.fromRGB(t.RgbFromHex(p1))
end

return t