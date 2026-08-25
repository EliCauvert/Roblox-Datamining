local getBuilderIconForKeycode = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).getBuilderIconForKeycode

return function(p0)
	-- upvalues: getBuilderIconForKeycode (ref)
	local ok, status = pcall(function()
		-- upvalues: getBuilderIconForKeycode (copy), p0 (ref)
		return getBuilderIconForKeycode(p0)
	end)
	
	return if ok then status else nil
end