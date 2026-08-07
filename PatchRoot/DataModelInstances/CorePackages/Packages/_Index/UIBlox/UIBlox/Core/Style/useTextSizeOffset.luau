-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:03 2026 Pacific Standard Time.

local parent = script.Parent
local styleContextModule = require(parent.StyleContext)
local reactModule = require(parent.Parent.Parent.Parent.React)

return function() --[[ line: 13 | named "useTextSizeOffset" ]]
	-- upvalues: reactModule (ref), styleContextModule (ref)
	return reactModule.useContext(styleContextModule).derivedValues.textSizeOffset
end