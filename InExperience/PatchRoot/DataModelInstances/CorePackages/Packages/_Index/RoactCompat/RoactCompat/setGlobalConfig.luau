local ReactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local WarnOnceModule = require(script.Parent.warnOnce)

return function(_) --[[ Line: 21 ]]
	-- upvalues: ReactGlobalsModule (copy), WarnOnceModule (copy)
	if ReactGlobalsModule.__DEV__ and ReactGlobalsModule.__COMPAT_WARNINGS__ then
		WarnOnceModule("setGlobalConfig", "Roact 17 uses a `ReactGlobals.__DEV__` flag to enable development behavior. If you're seeing this warning, you already have it enabled. Please remove any redundant uses of `setGlobalConfig`.")
	end
end