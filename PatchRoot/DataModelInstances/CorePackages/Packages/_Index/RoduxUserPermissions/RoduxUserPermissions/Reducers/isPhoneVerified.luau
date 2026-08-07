-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:09 2026 Pacific Standard Time.

local roduxModule = require(script.Parent.Parent.Parent.Rodux)

return function(p0) --[[ line: 7 ]]
	-- upvalues: roduxModule (ref)
	return roduxModule.createReducer(false, {
		[p0.networkingAccountInformation.GetPhoneInformation.Succeeded.name] = function(_, p1) --[[ line: 11 ]]
			return p1.responseBody and p1.responseBody.isVerified
		end
	})
end