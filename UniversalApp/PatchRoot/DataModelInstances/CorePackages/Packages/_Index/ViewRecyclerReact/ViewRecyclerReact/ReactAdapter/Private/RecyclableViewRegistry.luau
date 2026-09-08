local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(viewRecyclerReact.Parent.React)
local _ = require(viewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local _ = require(viewRecyclerReact.Parent.Signals)
local tbl = setmetatable({}, { __mode = "k" })

return {
	register = function(p1, p2)
		-- upvalues: tbl (ref)
		tbl[p1] = p2
	end,
	isRegistered = function(p1)
		-- upvalues: tbl (ref)
		return tbl[p1] ~= nil
	end,
	getMetadata = function(p1)
		-- upvalues: tbl (ref)
		return tbl[p1]
	end
}