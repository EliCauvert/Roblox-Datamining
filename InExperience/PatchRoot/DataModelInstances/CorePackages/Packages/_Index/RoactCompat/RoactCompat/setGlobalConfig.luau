local reactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local warnOnceModule = require(script.Parent.warnOnce)

return function(_) --[[ line: 21 ]]
	-- upvalues: reactGlobalsModule (ref), warnOnceModule (ref)
	if reactGlobalsModule.__DEV__ and reactGlobalsModule.__COMPAT_WARNINGS__ then
		warnOnceModule("setGlobalConfig", "Roact 17 uses a `ReactGlobals.__DEV__` flag to enable development behavior. If you're seeing this warning, you already have it enabled. Please remove any redundant uses of `setGlobalConfig`.")
	end
end