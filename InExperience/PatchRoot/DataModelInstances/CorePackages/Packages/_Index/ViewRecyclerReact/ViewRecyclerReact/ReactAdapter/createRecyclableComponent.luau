local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local reactModule = require(viewRecyclerReact.Parent.React)
local signalsReactModule = require(viewRecyclerReact.Parent.SignalsReact)
local createRecyclableViewModule = require(viewRecyclerReact.ReactAdapter.createRecyclableView)

return function(p0, p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref), createRecyclableViewModule (ref)
	return createRecyclableViewModule(function(p2)
		-- upvalues: signalsReactModule (copy), reactModule (copy), p0 (ref)
		local cloned = table.clone(signalsReactModule.useSignalState(p2.valueSignal))
		cloned.pending = p2.pending
		
		return reactModule.createElement(p0, cloned)
	end, p1)
end