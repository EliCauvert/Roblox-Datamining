-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:39 2026 Pacific Standard Time.

local r15plusUtilsModule = require(script.Parent.Parent.util.R15plusUtils)

return function(p0) --[[ line: 12 ]]
	-- upvalues: r15plusUtilsModule (ref)
	if not r15plusUtilsModule.checkFlagEnabledForAllowHrd() then
		return p0.CFrame
	end
	local cFrame = p0.CFrame
	local parent = p0.Parent
	while parent and parent:IsA("Attachment") do
		cFrame = parent.CFrame * cFrame
		parent = parent.Parent
	end
	return cFrame
end