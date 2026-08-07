-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:02 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.DialogSize)
local dialogContextModule = require(script.Parent.DialogContext)

return function() --[[ line: 23 | named "useDialog" ]]
	-- upvalues: reactModule (ref), dialogContextModule (ref)
	return reactModule.useContext(dialogContextModule)
end