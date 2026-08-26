local parent = script.Parent.Parent
local reactModule = require(parent.React)
local reactGlobalsModule = require(parent.ReactGlobals)
local warnOnceModule = require(script.Parent.warnOnce)

return function(p1)
	-- upvalues: reactGlobalsModule (ref), warnOnceModule (ref), reactModule (ref)
	if reactGlobalsModule.__DEV__ and reactGlobalsModule.__COMPAT_WARNINGS__ then
		warnOnceModule("oneChild", "You likely don't need this at all! If you were assigning children via `React.oneChild(someChildren)`, you can simply use `someChildren` directly.")
	end
	if not p1 then
		return nil
	end
	local var1, var2 = next(p1)
	
	if not var2 then
		return nil
	elseif next(p1, var1) then
		error("Expected at most one child, had more than one child.", 2)
	end
	return reactModule.Children.only(var2)
end