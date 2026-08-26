local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local var1 = reactModule.createContext(nil)

return {
	LoaderContext = var1,
	LoaderProvider = function(p1)
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useRef({})
		local var3 = reactModule.useRef(p1.loaders)
		var3.current = p1.loaders
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var2 (ref)
			if not p1.open then
				var2.current = {}
			end
		end, { p1.open })
		
		return reactModule.createElement(var1.Provider, {
			value = reactModule.useRef({ registryRef = var3, cacheRef = var2 }).current
		}, p1.children)
	end,
	useLoaderContext = function()
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		
		if not var2 then
			error("useLoaderContext must be used within a <LoaderProvider>")
		end
		return var2
	end
}