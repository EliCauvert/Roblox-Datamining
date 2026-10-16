local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ReactModule = require(ViewRecyclerReact.Parent.React)
local SignalsReactModule = require(ViewRecyclerReact.Parent.SignalsReact)
local CreateRecyclableViewModule = require(ViewRecyclerReact.ReactAdapter.createRecyclableView)

return function(p1, p2) --[[ Line: 12 | Named "createRecyclableComponent" ]]
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), CreateRecyclableViewModule (copy)
	return CreateRecyclableViewModule(function(p3) --[[ Line: 16 | Named "OrdinaryPropsAdapter" ]]
		-- upvalues: SignalsReactModule (upval), ReactModule (upval), p1 (copy)
		local Copy = table.clone((SignalsReactModule.useSignalState(p3.itemSignal)))
		Copy.pending = p3.pending
		
		return ReactModule.createElement(p1, Copy)
	end, p2)
end