local list = {
	Color3.new(0.992156862745, 0.160784313725, 0.262745098039),
	Color3.new(0.003921568627, 0.635294117647, 1),
	Color3.new(0.007843137255, 0.721568627451, 0.341176470588),
	BrickColor.new("Alder").Color, BrickColor.new("Bright orange").Color,
	BrickColor.new("Bright yellow").Color,
	BrickColor.new("Light reddish violet").Color,
	BrickColor.new("Brick yellow").Color
}

local function HashNameToColor(p0) --[[ line: 13 ]]
	local var2 = 0
	
	for i = 1, #p0 do
		local byteValue = string.byte(string.sub(p0, i, i))
		local var4 = #p0 - i + 1
		
		if #p0 % 2 == 1 then
			var4 -= 1
		end
		if var4 % 4 >= 2 then
			byteValue = -byteValue
		end
		var2 += byteValue
	end
	return var2
end

return function(p1) --[[ line: 31 | named "computeNameColor" ]]
	-- upvalues: list (ref), HashNameToColor (ref)
	return list[(HashNameToColor(p1) + 0) % #list + 1]
end