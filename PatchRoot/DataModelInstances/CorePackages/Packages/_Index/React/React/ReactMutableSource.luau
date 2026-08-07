-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:43:02 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local _ = require(parent.Shared)

return function(p0, p1) --[[ line: 18 | named "createMutableSource" ]]
	-- upvalues: reactGlobalsModule (ref)
	local t = {
		_workInProgressVersionPrimary = nil,
		_workInProgressVersionSecondary = nil,
		_getVersion = p1,
		_source = p0
	}
	
	if reactGlobalsModule.__DEV__ then
		t._currentPrimaryRenderer = nil
		t._currentSecondaryRenderer = nil
	end
	return t
end