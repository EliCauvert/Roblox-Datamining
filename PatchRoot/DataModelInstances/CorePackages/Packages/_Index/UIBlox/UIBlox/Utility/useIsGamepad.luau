-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:05 2026 Pacific Standard Time.

local parent = script.Parent
local inputTypeModule = require(parent.Parent.Enums.InputType)
local useInputTypeModule = require(parent.useInputType)

return function() --[[ line: 11 | named "useIsGamepad" ]]
	-- upvalues: useInputTypeModule (ref), inputTypeModule (ref)
	return useInputTypeModule() == inputTypeModule.Gamepad
end