-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local overlayContextModule = require(script.Parent.OverlayContext)
local flagsModule = require(foundation.Utility.Flags)

return function() --[[ line: 10 | named "useOverlay" ]]
	-- upvalues: reactModule (ref), overlayContextModule (ref), flagsModule (ref)
	local var4 = reactModule.useContext(overlayContextModule)
	reactModule.useLayoutEffect(function() --[[ line: 13 ]]
		-- upvalues: var4 (ref)
		var4.requestOverlay()
	end, if flagsModule.FoundationOverlayKeyboardAwarenessHardened then { var4.requestOverlay } else {})
	
	return var4.instance
end