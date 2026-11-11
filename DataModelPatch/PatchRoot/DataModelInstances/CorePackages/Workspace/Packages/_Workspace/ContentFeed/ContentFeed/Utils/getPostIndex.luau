local _ = require(script.Parent.Parent.Types)

return function(List, PostId): number?
	local Count = 1
	
	for _, value in pairs(List) do
		if value.postId == PostId then
			return Count
		end
		Count += 1
	end
	return nil
end