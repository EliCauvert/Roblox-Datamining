local _ = require(script:FindFirstAncestor("Foundation").Providers.Style.Tokens)

return function(Size, p1)
	local Size100 = p1.Size.Size_100
	local Size600 = p1.Size.Size_600
	local Size900 = p1.Size.Size_900
	
	if Size600 <= Size and Size <= Size900 then
		Size = Size600
	end
	return math.round(Size / Size100) * Size100
end