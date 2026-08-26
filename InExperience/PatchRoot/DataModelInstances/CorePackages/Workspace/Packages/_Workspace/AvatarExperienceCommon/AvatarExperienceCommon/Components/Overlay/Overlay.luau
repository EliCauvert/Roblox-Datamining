local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local useFocusNavigableSurfaceRegistryConnection = require(parent.FocusNavigationUtils).useFocusNavigableSurfaceRegistryConnection
local focusNavigableSurfaceIdentifierEnum = require(parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum

return function(p1)
	-- upvalues: reactModule (ref), useFocusNavigableSurfaceRegistryConnection (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local _ = nil
	local _ = nil
	local var1, var2 = reactModule.useState(nil)
	useFocusNavigableSurfaceRegistryConnection(var1, focusNavigableSurfaceIdentifierEnum.CentralOverlay)
	local cloned = table.clone(p1)
	cloned.ref = var2
	cloned.SelectionGroup = true
	cloned.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
	cloned.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
	cloned.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
	cloned.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
	
	return reactModule.createElement("Frame", cloned)
end