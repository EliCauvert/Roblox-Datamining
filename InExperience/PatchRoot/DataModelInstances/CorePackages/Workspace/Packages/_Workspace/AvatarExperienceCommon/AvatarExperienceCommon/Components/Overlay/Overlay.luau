local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local UseFocusNavigableSurfaceRegistryConnectionFunction = require(Parent.FocusNavigationUtils).useFocusNavigableSurfaceRegistryConnection
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum

return function(Tbl) --[[ Line: 8 | Named "Overlay" ]]
	-- upvalues: ReactModule (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	UseFocusNavigableSurfaceRegistryConnectionFunction(UseStateResult, FocusNavigableSurfaceIdentifierEnum.CentralOverlay)
	local Copy = table.clone(Tbl)
	Copy.ref = UseStateResult2
	Copy.SelectionGroup = true
	Copy.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
	Copy.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
	Copy.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
	Copy.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
	
	return ReactModule.createElement("Frame", Copy)
end