local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.HeaderBarSlot)
local var1 = reactModule.createContext({ testId = "" })

return {
	Context = var1,
	Provider = function(p1)
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.createElement(var1.Provider, {
			value = reactModule.useMemo(function()
				-- upvalues: p1 (ref)
				return { testId = p1.testId, slot = p1.slot }
			end, { p1.testId, p1.slot })
		}, p1.children)
	end
}