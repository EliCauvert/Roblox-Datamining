local parent = script:FindFirstAncestor("FriendsChat").Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local createMessageDisplayStoreModule = require(script.Parent.createMessageDisplayStore)

return function(p0, p1)
	-- upvalues: reactModule (ref), createMessageDisplayStoreModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: createMessageDisplayStoreModule (copy), p0 (ref), p1 (ref)
		return createMessageDisplayStoreModule(p0, p1)
	end, { p0, p1 })
end