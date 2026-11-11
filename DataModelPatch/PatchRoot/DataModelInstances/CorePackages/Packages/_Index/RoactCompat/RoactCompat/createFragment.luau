local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local ReactModule = require(Parent.React)
local WarnOnceModule = require(script.Parent.warnOnce)

return function(p1)
	-- upvalues: ReactGlobalsModule (copy), WarnOnceModule (copy), ReactModule (copy)
	if ReactGlobalsModule.__DEV__ and ReactGlobalsModule.__COMPAT_WARNINGS__ then
		WarnOnceModule("createFragment", "Please instead use:\n\tReact.createElement(React.Fragment, ...)")
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, p1)
end