return function(p0, p1, p2) --[[ line: 1 | named "formatExperienceThumbnail" ]]
	local var0 = 384
	local var1 = 216
	
	if p2 then
		var0 = 768
		var1 = 432
	end
	return if p0 and p0 ~= "0" then `rbxthumb://type=Asset&id={p0}&w={var0}&h={var1}` else `rbxthumb://type=GameThumbnail&id={p1}&w={var0}&h={var1}`
end