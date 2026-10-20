return function(p1, p2, p3): string
	local v1 = 384
	local v2 = 216
	
	if p3 then
		v1 = 768
		v2 = 432
	end
	return if p1 and p1 ~= "0" then `rbxthumb://type=Asset&id={p1}&w={v1}&h={v2}` else `rbxthumb://type=GameThumbnail&id={p2}&w={v1}&h={v2}`
end