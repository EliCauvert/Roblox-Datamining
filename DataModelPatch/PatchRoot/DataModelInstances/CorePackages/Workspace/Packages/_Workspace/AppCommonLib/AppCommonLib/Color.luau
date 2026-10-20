local ColorModule = {
	RgbFromHex = function(p1: number)
		assert(p1 >= 0 and p1 <= 16777215, "RgbFromHex: Out of range")
		local v1 = p1 % 256
		local v2 = (p1 - v1) / 256
		local v3 = v2 % 256
		
		return (v2 - v3) / 256, v3, v1
	end
}

function ColorModule.Color3FromHex(p1): Color3
	-- upvalues: ColorModule (copy)
	return Color3.fromRGB(ColorModule.RgbFromHex(p1))
end

return ColorModule