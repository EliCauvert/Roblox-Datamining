local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ReactModule = require(ViewRecyclerReact.Parent.React)
local SignalsReactModule = require(ViewRecyclerReact.Parent.SignalsReact)
local CreateRecyclableViewModule = require(ViewRecyclerReact.ReactAdapter.createRecyclableView)

return function(p1, p2)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), CreateRecyclableViewModule (copy)
	return CreateRecyclableViewModule(function(p3)
		-- upvalues: SignalsReactModule (upval), ReactModule (upval), p1 (copy)
		local Copy = table.clone((SignalsReactModule.useSignalState(p3.itemSignal)))
		Copy.pending = p3.pending
		
		return ReactModule.createElement(p1, Copy)
	end, p2)
end