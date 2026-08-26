local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local reactModule = require(parent.React)
local warnOnceModule = require(script.Parent.warnOnce)

return function(p1)
	-- upvalues: reactGlobalsModule (ref), warnOnceModule (ref), reactModule (ref)
	if reactGlobalsModule.__DEV__ and reactGlobalsModule.__COMPAT_WARNINGS__ then
		warnOnceModule("createFragment", "Please instead use:\n\tReact.createElement(React.Fragment, ...)")
	end
	return reactModule.createElement(reactModule.Fragment, nil, p1)
end