-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:28 2026 Pacific Standard Time.

local textSizeOffsetContextModule = require(script.Parent.TextSizeOffsetContext)
local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function() --[[ line: 8 | named "useTextSizeOffset" ]]
	-- upvalues: reactModule (ref), textSizeOffsetContextModule (ref)
	return reactModule.useContext(textSizeOffsetContextModule)
end