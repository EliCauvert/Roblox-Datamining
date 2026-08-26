local iconSize = require(script.Parent.Parent.Parent.Foundation).Enums.IconSize

return function(p1, p2)
	-- upvalues: iconSize (ref)
	if p1 == nil then
		return nil
	end
	local offset = p1.Y.Offset
	
	if p1.Y.Scale > 0 and offset <= 0 then
		return iconSize.Large
	end
	local list = {
		{ iconSize.XSmall, p2.Size.Size_200 },
		{ iconSize.Small, p2.Size.Size_400 },
		{ iconSize.Medium, p2.Size.Size_900 },
		{ iconSize.Large, p2.Size.Size_1200 }
	}
	local var1 = list[1][1]
	local absValue = math.abs(offset - list[1][2])
	
	for i = 2, #list do
		local absValue_1 = math.abs(offset - list[i][2])
		
		if absValue_1 < absValue then
			var1 = list[i][1]
			absValue = absValue_1
		end
	end
	return var1
end