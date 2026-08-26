local list = {
	Color3.new(0.992156862745, 0.160784313725, 0.262745098039),
	Color3.new(0.003921568627, 0.635294117647, 1),
	Color3.new(0.007843137255, 0.721568627451, 0.341176470588),
	BrickColor.new("Alder").Color, BrickColor.new("Bright orange").Color,
	BrickColor.new("Bright yellow").Color,
	BrickColor.new("Light reddish violet").Color,
	BrickColor.new("Brick yellow").Color
}

local function HashNameToColor(p1)
	local var1 = 0
	
	for i = 1, #p1 do
		local byteValue = string.byte(string.sub(p1, i, i))
		local var2 = #p1 - i + 1
		
		if #p1 % 2 == 1 then
			var2 -= 1
		end
		if var2 % 4 >= 2 then
			byteValue = -byteValue
		end
		var1 += byteValue
	end
	return var1
end

return function(p2)
	-- upvalues: list (ref), HashNameToColor (ref)
	return list[(HashNameToColor(p2) + 0) % #list + 1]
end