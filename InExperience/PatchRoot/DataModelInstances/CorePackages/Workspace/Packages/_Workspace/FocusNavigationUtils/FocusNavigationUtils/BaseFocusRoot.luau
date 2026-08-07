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

return reactModule.forwardRef(function(p0, p1) --[[ line: 26 | named "BaseFocusRoot" ]]
	-- upvalues: cryoModule (ref), t (ref), t_1 (ref), reactModule (ref)
	local var4 = cryoModule.Dictionary.join(t, p0.frameProps or {}, { ref = p1 })
	
	if p0.isIsolated then
		var4 = cryoModule.Dictionary.union(t_1, var4)
	end
	return reactModule.createElement("Frame", var4, p0.children)
end)