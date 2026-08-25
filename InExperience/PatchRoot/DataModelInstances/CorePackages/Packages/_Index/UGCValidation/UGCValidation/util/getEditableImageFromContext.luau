local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local getEditableInstanceFromContextModule = require(parent.util.getEditableInstanceFromContext)

return function(p0, p1, p2)
	-- upvalues: getEditableInstanceFromContextModule (ref)
	local var1, var2 = getEditableInstanceFromContextModule(p0, p1, p2.editableImages, p2)
	
	if var1 then
		return true, var2
	end
	return false
end