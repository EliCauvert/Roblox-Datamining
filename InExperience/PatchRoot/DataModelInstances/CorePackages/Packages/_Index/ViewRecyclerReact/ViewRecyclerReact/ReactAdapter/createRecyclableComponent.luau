local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewReadinessModule = require(ViewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local SignalsReactModule = require(ViewRecyclerReact.Parent.SignalsReact)
local CreateRecyclableViewModule = require(ViewRecyclerReact.ReactAdapter.createRecyclableView)

return function(Callback, p1)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), RecyclableViewReadinessModule (copy), CreateRecyclableViewModule (copy)
	local IsFunction = type(Callback) == "function"
	
	local function OrdinaryPropsAdapter(p2)
		-- upvalues: SignalsReactModule (upval), IsFunction (copy), Callback (copy), ReactModule (upval)
		local UseSignalStateResult = SignalsReactModule.useSignalState(p2.itemSignal)
		assert(type(UseSignalStateResult) == "table", "createRecyclableComponent: the item must be a props table; use createRecyclableView for other item values")
		local Copy = table.clone(UseSignalStateResult)
		Copy.pending = p2.pending
		
		return if IsFunction then Callback(Copy) else ReactModule.createElement(Callback, Copy)
	end
	
	local Copy = table.clone(p1 or {})
	
	if Copy.readiness == nil then
		Copy.readiness = RecyclableViewReadinessModule.ReadyOnCommit
	end
	return CreateRecyclableViewModule(OrdinaryPropsAdapter, Copy)
end