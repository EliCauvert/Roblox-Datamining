local parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local t = {
	BackgroundTransparency = 1,
	SelectionGroup = true,
	Size = UDim2.fromScale(1, 1)
}
local t_1 = {
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop
}

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: cryoModule (ref), t (ref), t_1 (ref), reactModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1.frameProps or {}, { ref = p2 })
	
	if p1.isIsolated then
		var1 = cryoModule.Dictionary.union(t_1, var1)
	end
	return reactModule.createElement("Frame", var1, p1.children)
end)