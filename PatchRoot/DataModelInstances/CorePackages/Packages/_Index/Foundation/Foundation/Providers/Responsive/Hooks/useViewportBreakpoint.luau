-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Enums.Breakpoint)
local useBreakpointModule = require(foundation.Providers.Responsive.Hooks.useBreakpoint)
local useScreenModule = require(foundation.Providers.Overlay.useScreen)

return function() --[[ line: 9 | named "useViewportBreakpoint" ]]
	-- upvalues: useScreenModule (ref), useBreakpointModule (ref)
	return useBreakpointModule(useScreenModule())
end