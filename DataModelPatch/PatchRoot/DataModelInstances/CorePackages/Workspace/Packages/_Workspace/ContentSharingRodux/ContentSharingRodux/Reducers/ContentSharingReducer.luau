local GetPostsByUserIdModule = require(script:FindFirstAncestor("ContentSharingRodux").Reducers.ContentSharing.getPostsByUserId)
local config = { byUserId = {} }

return function(p1)
	-- upvalues: GetPostsByUserIdModule (copy), config (copy)
	local PostsByUserIdModule = GetPostsByUserIdModule(p1)
	
	return function(p2, p3)
		-- upvalues: config (upval), PostsByUserIdModule (copy)
		return PostsByUserIdModule(p2 or config, p3)
	end
end