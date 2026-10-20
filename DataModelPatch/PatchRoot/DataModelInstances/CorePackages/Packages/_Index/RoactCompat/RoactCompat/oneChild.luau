local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local ReactGlobalsModule = require(Parent.ReactGlobals)
local WarnOnceModule = require(script.Parent.warnOnce)

return function(p1)
	-- upvalues: ReactGlobalsModule (copy), WarnOnceModule (copy), ReactModule (copy)
	if ReactGlobalsModule.__DEV__ and ReactGlobalsModule.__COMPAT_WARNINGS__ then
		WarnOnceModule("oneChild", "You likely don't need this at all! If you were assigning children via `React.oneChild(someChildren)`, you can simply use `someChildren` directly.")
	end
	if not p1 then
		return nil
	end
	local Key, Value = next(p1)
	
	if not Value then
		return nil
	end
	if next(p1, Key) then
		error("Expected at most one child, had more than one child.", 2)
	end
	return ReactModule.Children.only(Value)
end