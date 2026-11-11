local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local Context = ReactModule.createContext(nil)

return {
	LoaderContext = Context,
	LoaderProvider = function(p1)
		-- upvalues: ReactModule (copy), Context (copy)
		local UseRefResult = ReactModule.useRef({})
		local UseRefResult1 = ReactModule.useRef(p1.loaders)
		UseRefResult1.current = p1.loaders
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseRefResult (copy)
			if not p1.open then
				UseRefResult.current = {}
			end
		end, { p1.open })
		
		return ReactModule.createElement(Context.Provider, {
			value = ReactModule.useRef({ registryRef = UseRefResult1, cacheRef = UseRefResult }).current
		}, p1.children)
	end,
	useLoaderContext = function()
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		if not UseContextResult then
			error("useLoaderContext must be used within a <LoaderProvider>")
		end
		return UseContextResult
	end
}