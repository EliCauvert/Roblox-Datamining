local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.HeaderBarSlot)
local var2 = reactModule.createContext({ testId = "" })

return {
	Context = var2,
	Provider = function(p0)
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.createElement(var2.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: p0 (ref)
				return { testId = p0.testId, slot = p0.slot }
			end, { p0.testId, p0.slot })
		}, p0.children)
	end
}