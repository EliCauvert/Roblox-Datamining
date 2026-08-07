local parent = script.Parent.Parent
local reactModule = require(parent.React)
local reactGlobalsModule = require(parent.ReactGlobals)
local warnOnceModule = require(script.Parent.warnOnce)

return function(p0) --[[ line: 22 | named "oneChild" ]]
	-- upvalues: reactGlobalsModule (ref), warnOnceModule (ref), reactModule (ref)
	if reactGlobalsModule.__DEV__ and reactGlobalsModule.__COMPAT_WARNINGS__ then
		warnOnceModule("oneChild", "You likely don't need this at all! If you were assigning children via `React.oneChild(someChildren)`, you can simply use `someChildren` directly.")
	end
	if not p0 then
		return nil
	end
	local var3, var4 = next(p0)
	
	if not var4 then
		return nil
	elseif next(p0, var3) then
		error("Expected at most one child, had more than one child.", 2)
	end
	return reactModule.Children.only(var4)
end