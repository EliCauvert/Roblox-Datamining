local GetBuilderIconForKeycodeFunction = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).getBuilderIconForKeycode

return function(p1)
	-- upvalues: GetBuilderIconForKeycodeFunction (copy)
	local Success, Result = pcall(function()
		-- upvalues: GetBuilderIconForKeycodeFunction (upval), p1 (copy)
		return GetBuilderIconForKeycodeFunction(p1)
	end)
	
	return if Success then Result else nil
end