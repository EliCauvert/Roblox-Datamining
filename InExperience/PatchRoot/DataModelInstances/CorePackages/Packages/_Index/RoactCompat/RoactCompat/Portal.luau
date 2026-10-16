local Parent = script.Parent.Parent
local ReactRobloxModule = require(Parent.ReactRoblox)
local ReactGlobalsModule = require(Parent.ReactGlobals)
local WarnOnceModule = require(script.Parent.warnOnce)

return function(p1) --[[ Line: 23 | Named "PortalComponent" ]]
	-- upvalues: ReactGlobalsModule (copy), WarnOnceModule (copy), ReactRobloxModule (copy)
	if ReactGlobalsModule.__DEV__ and ReactGlobalsModule.__COMPAT_WARNINGS__ then
		WarnOnceModule("Roact.Portal", "Please use the createPortal API on ReactRoblox instead")
	end
	return ReactRobloxModule.createPortal(p1.children, p1.target)
end