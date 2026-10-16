local Parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local config = {
	BackgroundTransparency = 1,
	SelectionGroup = true,
	Size = UDim2.fromScale(1, 1)
}
local config1 = {
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop
}

return ReactModule.forwardRef(function(p1, Ref) --[[ Line: 26 | Named "BaseFocusRoot" ]]
	-- upvalues: CryoModule (copy), config (copy), config1 (copy), ReactModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1.frameProps or {}, { ref = Ref })
	
	if p1.isIsolated then
		JoinResult = CryoModule.Dictionary.union(config1, JoinResult)
	end
	return ReactModule.createElement("Frame", JoinResult, p1.children)
end)