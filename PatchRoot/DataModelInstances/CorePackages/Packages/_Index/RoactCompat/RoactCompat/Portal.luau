-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:59 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactRobloxModule = require(parent.ReactRoblox)
local reactGlobalsModule = require(parent.ReactGlobals)
local warnOnceModule = require(script.Parent.warnOnce)

return function(p0) --[[ line: 23 | named "PortalComponent" ]]
	-- upvalues: reactGlobalsModule (ref), warnOnceModule (ref), reactRobloxModule (ref)
	if reactGlobalsModule.__DEV__ and reactGlobalsModule.__COMPAT_WARNINGS__ then
		warnOnceModule("Roact.Portal", "Please use the createPortal API on ReactRoblox instead")
	end
	return reactRobloxModule.createPortal(p0.children, p0.target)
end