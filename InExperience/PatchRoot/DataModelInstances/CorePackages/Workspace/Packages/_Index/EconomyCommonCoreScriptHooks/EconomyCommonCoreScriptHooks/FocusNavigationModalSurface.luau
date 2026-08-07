local parent = script:FindFirstAncestor("EconomyCommonCoreScriptHooks").Parent
local reactModule = require(parent.React)
local focusNavigableSurfaceIdentifierEnum = require(parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local useFocusNavigationSurfaceModule = require(script.Parent.useFocusNavigationSurface)

return function(p0) --[[ line: 16 | named "FocusNavigationModalSurface" ]]
	-- upvalues: useFocusNavigationSurfaceModule (ref), focusNavigableSurfaceIdentifierEnum (ref), reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = useFocusNavigationSurfaceModule({
			selectionGroupName = p0.selectionGroupName,
			focusNavigableSurfaceIdentifier = if p0.surfaceIdentifier then p0.surfaceIdentifier else focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}),
		Size = UDim2.fromScale(1, 1),
		SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
		SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
		SelectionBehaviorUp = Enum.SelectionBehavior.Stop
	}, p0.children)
end