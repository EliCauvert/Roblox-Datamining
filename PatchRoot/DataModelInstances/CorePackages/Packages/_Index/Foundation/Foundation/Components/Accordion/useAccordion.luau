-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:59 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.InputSize)
local _ = require(foundation.Components.Types)
local accordionContextModule = require(script.Parent.AccordionContext)

return function() --[[ line: 22 ]]
	-- upvalues: reactModule (ref), accordionContextModule (ref)
	return reactModule.useContext(accordionContextModule)
end