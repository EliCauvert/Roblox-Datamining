local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local var1 = reactModule.createContext(nil)

return {
	LoaderContext = var1,
	LoaderProvider = function(p0)
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useRef({})
		local var3 = reactModule.useRef(p0.loaders)
		var3.current = p0.loaders
		reactModule.useEffect(function()
			-- upvalues: p0 (ref), var2 (ref)
			if not p0.open then
				var2.current = {}
			end
		end, { p0.open })
		
		return reactModule.createElement(var1.Provider, {
			value = reactModule.useRef({ registryRef = var3, cacheRef = var2 }).current
		}, p0.children)
	end,
	useLoaderContext = function()
		-- upvalues: reactModule (ref), var1 (ref)
		local var4 = reactModule.useContext(var1)
		
		if not var4 then
			error("useLoaderContext must be used within a <LoaderProvider>")
		end
		return var4
	end
}