local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactModule = require(parent.React)
local storeContext = require(parent.RoactRodux).StoreContext

return function() --[[ line: 16 | named "useStore" ]]
	-- upvalues: reactModule (ref), storeContext (ref)
	local var1 = reactModule.useContext(storeContext)
	assert(var1, "useDispatch and useSelector can only be called from a descendant of the Rodux Store Provider")
	
	return var1
end