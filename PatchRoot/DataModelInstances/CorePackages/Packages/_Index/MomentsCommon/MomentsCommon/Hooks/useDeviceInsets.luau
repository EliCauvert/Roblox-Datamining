-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:49 2026 Pacific Standard Time.

local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local reactModule = require(momentsCommon.Parent.React)
local hardwareSafeAreaInsetsModule = require(momentsCommon.Utils.HardwareSafeAreaInsets)

return function() --[[ line: 8 ]]
	-- upvalues: reactModule (ref), hardwareSafeAreaInsetsModule (ref)
	local var3, var4 = reactModule.useState(hardwareSafeAreaInsetsModule.deviceInsets())
	reactModule.useLayoutEffect(function() --[[ line: 10 ]]
		-- upvalues: hardwareSafeAreaInsetsModule (copy), var4 (ref), var3 (ref)
		local var5 = hardwareSafeAreaInsetsModule:connect(var4)
		
		if hardwareSafeAreaInsetsModule.diffInsets(var3, hardwareSafeAreaInsetsModule.deviceInsets()) then
			var4(hardwareSafeAreaInsetsModule.deviceInsets)
		end
		return function() --[[ line: 15 ]]
			-- upvalues: var5 (ref)
			var5.disconnect()
		end
	end, {})
	
	return var3
end