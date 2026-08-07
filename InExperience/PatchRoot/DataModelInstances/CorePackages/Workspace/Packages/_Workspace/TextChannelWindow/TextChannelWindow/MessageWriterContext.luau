local reactModule = require(script.Parent.Parent.React)
local _ = require(script.Parent.Message)
local var1 = reactModule.createContext(nil)

return {
	Context = var1,
	Provider = function(p0) --[[ line: 19 ]]
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.createElement(var1.Provider, {
			value = reactModule.useMemo(function() --[[ line: 21 ]]
				-- upvalues: p0 (ref)
				return { write = p0.upsertMessage, remove = p0.removeMessage }
			end, { p0.upsertMessage, p0.removeMessage })
		}, p0.children)
	end,
	useMessageWriter = function() --[[ line: 31 ]]
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end
}