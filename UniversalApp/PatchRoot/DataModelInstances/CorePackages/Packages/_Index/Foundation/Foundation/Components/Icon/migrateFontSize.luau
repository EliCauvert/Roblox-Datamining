local _ = require(script:FindFirstAncestor("Foundation").Providers.Style.Tokens)

return function(p1, p2)
	local size100 = p2.Size.Size_100
	local size600 = p2.Size.Size_600
	
	if size600 <= p1 and p1 <= p2.Size.Size_900 then
		p1 = size600
	end
	return math.round(p1 / size100) * size100
end