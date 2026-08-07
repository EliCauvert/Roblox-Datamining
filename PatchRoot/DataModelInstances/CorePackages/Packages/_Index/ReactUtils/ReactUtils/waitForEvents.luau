-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:39 2026 Pacific Standard Time.

local reactRobloxModule = require(script:FindFirstAncestor("ReactUtils").Parent.ReactRoblox)

return setmetatable({
	act = function() --[[ line: 13 ]]
		-- upvalues: reactRobloxModule (ref)
		reactRobloxModule.act(function() --[[ line: 14 ]]
			task.wait(0)
		end)
	end
}, {
	__call = function() --[[ line: 6 ]]
		task.wait(0)
	end
})