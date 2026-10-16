local list = {
	Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157),
	Color3.new(0.00392156862745098, 0.6352941176470588, 1),
	Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353),
	BrickColor.new("Alder").Color, BrickColor.new("Bright orange").Color,
	BrickColor.new("Bright yellow").Color,
	BrickColor.new("Light reddish violet").Color,
	BrickColor.new("Brick yellow").Color
}

local function HashNameToColor(Text: string): number --[[ Line: 13 ]]
	local Total = 0
	
	for i = 1, #Text do
		local ByteValue = string.byte((string.sub(Text, i, i)))
		local NewI = #Text - i + 1
		
		if #Text % 2 == 1 then
			NewI -= 1
		end
		if NewI % 4 >= 2 then
			ByteValue = -ByteValue
		end
		Total += ByteValue
	end
	return Total
end

return function(p1) --[[ Line: 31 | Named "computeNameColor" ]]
	-- upvalues: list (copy), HashNameToColor (copy)
	return list[(HashNameToColor(p1) + 0) % #list + 1]
end