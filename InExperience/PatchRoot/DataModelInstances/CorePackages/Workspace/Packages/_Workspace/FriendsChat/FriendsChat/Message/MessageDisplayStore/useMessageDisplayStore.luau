local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local createMessageDisplayStoreModule = require(script.Parent.createMessageDisplayStore)

return function(p1, p2)
	-- upvalues: reactModule (ref), createMessageDisplayStoreModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: createMessageDisplayStoreModule (copy), p1 (ref), p2 (ref)
		return createMessageDisplayStoreModule(p1, p2)
	end, { p1, p2 })
end