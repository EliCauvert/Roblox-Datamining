local Parent = script:FindFirstAncestor("EconomyCommonCoreScriptHooks").Parent
local ReactModule = require(Parent.React)
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local UseFocusNavigationSurfaceModule = require(script.Parent.useFocusNavigationSurface)

return function(p1)
	-- upvalues: UseFocusNavigationSurfaceModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = UseFocusNavigationSurfaceModule({
			selectionGroupName = p1.selectionGroupName,
			focusNavigableSurfaceIdentifier = if p1.surfaceIdentifier then p1.surfaceIdentifier else FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}),
		Size = UDim2.fromScale(1, 1),
		SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
		SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
		SelectionBehaviorUp = Enum.SelectionBehavior.Stop
	}, p1.children)
end