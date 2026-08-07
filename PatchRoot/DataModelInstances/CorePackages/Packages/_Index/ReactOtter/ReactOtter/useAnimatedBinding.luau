-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:03 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.Otter)
local useMotorModule = require(script.Parent.useMotor)

return function(p0, p1) --[[ line: 12 | named "useAnimatedBinding" ]]
	-- upvalues: reactModule (ref), useMotorModule (ref)
	local var2, var3 = reactModule.useBinding(p0)
	
	return var2, useMotorModule(p0, var3, p1)
end