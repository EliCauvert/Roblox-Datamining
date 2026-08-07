-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

local getBuilderIconForKeycode = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).getBuilderIconForKeycode

return function(p0) --[[ line: 8 ]]
	-- upvalues: getBuilderIconForKeycode (ref)
	local ok, status = pcall(function() --[[ line: 9 ]]
		-- upvalues: getBuilderIconForKeycode (copy), p0 (ref)
		return getBuilderIconForKeycode(p0)
	end)
	
	return if ok then status else nil
end