-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local loggerModule = require(foundation.Utility.Logger)
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Utility.Plugin.StudioUri)
local _ = require(foundation.Components.Types)

return reactModule.createContext({
	anchor = nil,
	anchorUri = nil,
	isOpen = false,
	testId = "",
	setAnchor = function(_) --[[ line: 13 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("No PopoverProvider found for Popover")
	end,
	setAnchorUri = function(_) --[[ line: 17 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("No PopoverProvider found for Popover")
	end
})