local ReactModule = require(script.Parent.Parent.React)
local _ = require(script.Parent.Message)
local Context = ReactModule.createContext(nil)

return {
	Context = Context,
	Provider = function(p1)
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.createElement(Context.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: p1 (copy)
				return { write = p1.upsertMessage, remove = p1.removeMessage }
			end, { p1.upsertMessage, p1.removeMessage })
		}, p1.children)
	end,
	useMessageWriter = function()
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}