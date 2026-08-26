local getBuilderIconForKeycode = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).getBuilderIconForKeycode

return function(p1)
	-- upvalues: getBuilderIconForKeycode (ref)
	local ok, status = pcall(function()
		-- upvalues: getBuilderIconForKeycode (copy), p1 (ref)
		return getBuilderIconForKeycode(p1)
	end)
	
	return if ok then status else nil
end