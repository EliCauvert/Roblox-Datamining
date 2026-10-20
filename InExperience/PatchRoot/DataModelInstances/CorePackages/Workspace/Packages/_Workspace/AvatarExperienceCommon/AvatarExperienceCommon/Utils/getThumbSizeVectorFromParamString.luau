return function(Text: string): Vector2?
	local Parts = string.split(Text, "&")
	
	if #Parts == 2 then
		local Match: string? = string.match(Parts[1], "%d[%d.]*")
		local Match1: string? = string.match(Parts[2], "%d[%d.]*")
		
		if Match and Match1 then
			return Vector2.new(tonumber(Match), (tonumber(Match1)))
		end
	end
	return nil
end