local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local reactModule = require(viewRecyclerReact.Parent.React)
local signalsReactModule = require(viewRecyclerReact.Parent.SignalsReact)
local createRecyclableViewModule = require(viewRecyclerReact.ReactAdapter.createRecyclableView)

return function(p1, p2)
	-- upvalues: signalsReactModule (ref), reactModule (ref), createRecyclableViewModule (ref)
	return createRecyclableViewModule(function(p3)
		-- upvalues: signalsReactModule (copy), reactModule (copy), p1 (ref)
		local cloned = table.clone(signalsReactModule.useSignalState(p3.itemSignal))
		cloned.pending = p3.pending
		
		return reactModule.createElement(p1, cloned)
	end, p2)
end