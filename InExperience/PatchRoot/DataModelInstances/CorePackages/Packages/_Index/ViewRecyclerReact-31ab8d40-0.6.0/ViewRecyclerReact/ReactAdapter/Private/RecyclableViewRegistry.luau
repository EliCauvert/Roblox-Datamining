local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(ViewRecyclerReact.Parent.React)
local _ = require(ViewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local _ = require(ViewRecyclerReact.Parent.Signals)
local self = setmetatable({}, { __mode = "k" })

return {
	register = function(Key, p1)
		-- upvalues: self (copy)
		self[Key] = p1
	end,
	isRegistered = function(p1): boolean
		-- upvalues: self (copy)
		return self[p1] ~= nil
	end,
	getMetadata = function(p1)
		-- upvalues: self (copy)
		return self[p1]
	end
}