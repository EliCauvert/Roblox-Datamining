local reactModule = require(script.Parent.Parent.React)
local _ = require(script.Parent.Message)
local var1 = reactModule.createContext(nil)

return {
	Context = var1,
	Provider = function(p0)
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.createElement(var1.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: p0 (ref)
				return { write = p0.upsertMessage, remove = p0.removeMessage }
			end, { p0.upsertMessage, p0.removeMessage })
		}, p0.children)
	end,
	useMessageWriter = function()
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end
}