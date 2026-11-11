local Parent = script:FindFirstAncestor("FriendsChat").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local CreateMessageDisplayStoreModule = require(script.Parent.createMessageDisplayStore)

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy), CreateMessageDisplayStoreModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: CreateMessageDisplayStoreModule (upval), p1 (copy), p2 (copy), p3 (copy)
		return CreateMessageDisplayStoreModule(p1, p2, p3)
	end, { p1, p2, p3 })
end