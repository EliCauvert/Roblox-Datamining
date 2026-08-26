return function(p1, p2, p3)
	local var1 = 384
	local var2 = 216
	
	if p3 then
		var1 = 768
		var2 = 432
	end
	return if p1 and p1 ~= "0" then `rbxthumb://type=Asset&id={p1}&w={var1}&h={var2}` else `rbxthumb://type=GameThumbnail&id={p2}&w={var1}&h={var2}`
end