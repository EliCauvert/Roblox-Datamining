local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local GetEditableInstanceFromContextModule = require(Parent.util.getEditableInstanceFromContext)

return function(p1, p2, p3) --[[ Line: 6 ]]
	-- upvalues: GetEditableInstanceFromContextModule (copy)
	local EditableInstanceFromContextModule, EditableInstanceFromContextModule2 = GetEditableInstanceFromContextModule(p1, p2, p3.editableMeshes, p3)
	
	if EditableInstanceFromContextModule then
		return true, EditableInstanceFromContextModule2
	else
		return false
	end
end