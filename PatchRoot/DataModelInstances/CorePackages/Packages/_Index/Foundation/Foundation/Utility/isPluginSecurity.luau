-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

local wrappersModule = require(script:FindFirstAncestor("Foundation").Utility.Wrappers)

return function() --[[ line: 4 | named "isPluginSecurity" ]]
	-- upvalues: wrappersModule (ref)
	local coreGui = wrappersModule.Services.CoreGui
	local ok, _ = pcall(function() --[[ line: 6 ]]
		-- upvalues: coreGui (ref)
		local _ = coreGui:GetChildren()
	end)
	
	return ok
end