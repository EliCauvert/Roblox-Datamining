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