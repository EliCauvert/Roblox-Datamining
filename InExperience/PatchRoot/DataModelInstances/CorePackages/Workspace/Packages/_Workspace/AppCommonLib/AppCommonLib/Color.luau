local t = {
	RgbFromHex = function(p1)
		assert(p1 >= 0 and p1 <= 16777215, "RgbFromHex: Out of range")
		local var1 = p1 % 256
		p1 = (p1 - var1) / 256
		local var2 = p1 % 256
		
		return (p1 - var2) / 256, var2, var1
	end
}

function t.Color3FromHex(p1)
	-- upvalues: t (ref)
	return Color3.fromRGB(t.RgbFromHex(p1))
end

return t