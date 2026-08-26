local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local getEditableInstanceFromContextModule = require(parent.util.getEditableInstanceFromContext)

return function(p1, p2, p3)
	-- upvalues: getEditableInstanceFromContextModule (ref)
	local var1, var2 = getEditableInstanceFromContextModule(p1, p2, p3.editableImages, p3)
	
	if var1 then
		return true, var2
	end
	return false
end