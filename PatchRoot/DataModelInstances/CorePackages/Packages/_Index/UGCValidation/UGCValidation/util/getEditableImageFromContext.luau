-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:39 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local getEditableInstanceFromContextModule = require(parent.util.getEditableInstanceFromContext)

return function(p0, p1, p2) --[[ line: 6 ]]
	-- upvalues: getEditableInstanceFromContextModule (ref)
	local var1, var2 = getEditableInstanceFromContextModule(p0, p1, p2.editableImages, p2)
	
	if var1 then
		return true, var2
	end
	return false
end