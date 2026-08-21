local viewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local reactModule = require(viewRecyclerReact.Parent.React)
local signalsReactModule = require(viewRecyclerReact.Parent.SignalsReact)
local createRecyclableViewModule = require(viewRecyclerReact.ReactAdapter.createRecyclableView)

return function(p0, p1) --[[ line: 12 | named "createRecyclableComponent" ]]
	-- upvalues: signalsReactModule (ref), reactModule (ref), createRecyclableViewModule (ref)
	return createRecyclableViewModule(function(p2) --[[ line: 16 | named "OrdinaryPropsAdapter" ]]
		-- upvalues: signalsReactModule (copy), reactModule (copy), p0 (ref)
		local cloned = table.clone(signalsReactModule.useSignalState(p2.valueSignal))
		cloned.pending = p2.pending
		
		return reactModule.createElement(p0, cloned)
	end, p1)
end