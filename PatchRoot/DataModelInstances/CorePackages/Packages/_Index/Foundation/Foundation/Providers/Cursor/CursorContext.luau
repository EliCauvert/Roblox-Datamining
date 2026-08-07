-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:26 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local loggerModule = require(foundation.Utility.Logger)
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.CursorType)
local _ = require(foundation.Components.Types)

return reactModule.createContext({
	refCache = {},
	setMountedCursors = function(_) --[[ line: 12 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("No Cursor Provider found")
	end,
	getCursor = function(_) --[[ line: 15 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("No Cursor Provider found")
	end
})