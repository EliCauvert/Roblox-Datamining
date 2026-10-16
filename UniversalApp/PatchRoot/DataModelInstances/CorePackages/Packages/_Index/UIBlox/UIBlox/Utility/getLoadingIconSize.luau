local IconSize = require(script.Parent.Parent.Parent.Foundation).Enums.IconSize

return function(Vector, p1) --[[ Line: 15 | Named "getLoadingIconSize" ]]
	-- upvalues: IconSize (copy)
	if Vector == nil then
		return nil
	end
	local Offset: number = Vector.Y.Offset
	
	if Vector.Y.Scale > 0 and Offset <= 0 then
		return IconSize.Large
	end
	local list = {
		{ IconSize.XSmall, p1.Size.Size_200 },
		{ IconSize.Small, p1.Size.Size_400 },
		{ IconSize.Medium, p1.Size.Size_900 },
		{ IconSize.Large, p1.Size.Size_1200 }
	}
	local Entry = list[1][1]
	local Magnitude = math.abs(Offset - list[1][2])
	
	for i = 2, #list do
		local Magnitude1 = math.abs(Offset - list[i][2])
		
		if Magnitude1 < Magnitude then
			Entry = list[i][1]
			Magnitude = Magnitude1
		end
	end
	return Entry
end