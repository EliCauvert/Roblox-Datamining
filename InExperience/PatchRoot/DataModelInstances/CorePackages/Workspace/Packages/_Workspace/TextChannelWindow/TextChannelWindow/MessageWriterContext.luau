local reactModule = require(script.Parent.Parent.React)
local _ = require(script.Parent.Message)
local var1 = reactModule.createContext(nil)

return {
	Context = var1,
	Provider = function(p1)
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.createElement(var1.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: p1 (ref)
				return { write = p1.upsertMessage, remove = p1.removeMessage }
			end, { p1.upsertMessage, p1.removeMessage })
		}, p1.children)
	end,
	useMessageWriter = function()
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end
}