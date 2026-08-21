local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(viewRecyclerReact.Parent.React)
local _ = require(viewRecyclerReact.Parent.Signals)
local tbl = setmetatable({}, { __mode = "k" })

return {
	register = function(p0, p1) --[[ line: 22 ]]
		-- upvalues: tbl (ref)
		tbl[p0] = p1
	end,
	isRegistered = function(p2) --[[ line: 26 ]]
		-- upvalues: tbl (ref)
		return tbl[p2] ~= nil
	end,
	getMetadata = function(p3) --[[ line: 30 ]]
		-- upvalues: tbl (ref)
		return tbl[p3]
	end
}