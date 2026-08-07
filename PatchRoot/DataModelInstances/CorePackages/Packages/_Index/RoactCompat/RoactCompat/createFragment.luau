-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:59 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local reactModule = require(parent.React)
local warnOnceModule = require(script.Parent.warnOnce)

return function(p0) --[[ line: 22 ]]
	-- upvalues: reactGlobalsModule (ref), warnOnceModule (ref), reactModule (ref)
	if reactGlobalsModule.__DEV__ and reactGlobalsModule.__COMPAT_WARNINGS__ then
		warnOnceModule("createFragment", "Please instead use:\n\tReact.createElement(React.Fragment, ...)")
	end
	return reactModule.createElement(reactModule.Fragment, nil, p0)
end