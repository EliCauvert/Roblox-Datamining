-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:06 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.Orientation)
local optionSelectorGroupContextModule = require(script.Parent.OptionSelectorGroupContext)

return function() --[[ line: 11 ]]
	-- upvalues: reactModule (ref), optionSelectorGroupContextModule (ref)
	return reactModule.useContext(optionSelectorGroupContextModule)
end