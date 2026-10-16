local Parent = script:FindFirstAncestor("MomentsCommon").Parent
local ReactModule = require(Parent.React)
local StoreContext = require(Parent.RoactRodux).StoreContext

return function() --[[ Line: 9 | Named "useStore" ]]
	-- upvalues: ReactModule (copy), StoreContext (copy)
	local UseContextResult = ReactModule.useContext(StoreContext)
	assert(UseContextResult, "useDispatch and useSelector can only be called from a descendant of the Rodux Store Provider")
	
	return UseContextResult
end