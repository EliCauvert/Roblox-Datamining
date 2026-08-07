local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local reactSymbols = require(parent.Shared).ReactSymbols
local REACT_PROVIDER_TYPE = reactSymbols.REACT_PROVIDER_TYPE
local REACT_CONTEXT_TYPE = reactSymbols.REACT_CONTEXT_TYPE

return {
	createContext = function(p0, p1) --[[ line: 34 ]]
		-- upvalues: REACT_CONTEXT_TYPE (ref), REACT_PROVIDER_TYPE (ref), reactGlobalsModule (ref), console (ref)
		local t = {
			["$$typeof"] = REACT_CONTEXT_TYPE,
			_calculateChangedBits = p1,
			_currentValue = p0,
			_currentValue2 = p0,
			_threadCount = 0,
			Provider = nil,
			Consumer = nil,
			displayName = nil,
			_currentRenderer = nil,
			_currentRenderer2 = nil
		}
		t.Provider = { ["$$typeof"] = REACT_PROVIDER_TYPE, _context = t }
		local var2 = false
		
		if reactGlobalsModule.__DEV__ then
			local t_1 = {
				["$$typeof"] = REACT_CONTEXT_TYPE,
				_context = t,
				_calculateChangedBits = t._calculateChangedBits
			}
			setmetatable(t_1, {
				__index = function(_, p2) --[[ line: 79 ]]
					-- upvalues: t (ref)
					return if p2 == "_currentValue" then t._currentValue elseif p2 == "_currentValue2" then t._currentValue2 elseif p2 == "_threadCount" then t._threadCount elseif p2 == "displayName" then t.displayName else nil
				end,
				__newindex = function(_, p3, p4) --[[ line: 92 ]]
					-- upvalues: t (ref), var2 (write), console (copy)
					if p3 == "_currentValue" then
						t._currentValue = p4
						
						return
					elseif p3 == "_currentValue2" then
						t._currentValue2 = p4
						
						return
					elseif p3 == "_threadCount" then
						t._threadCount = p4
						
						return
					elseif p3 == "displayName" and not var2 then
						console.warn("Setting `displayName` on Context.Consumer has no effect. " .. "You should set it directly on the context with Context.displayName = " .. p4 .. ".")
						var2 = true
					end
				end
			})
			t.Consumer = t_1
		else
			t.Consumer = t
		end
		if reactGlobalsModule.__DEV__ then
			t._currentRenderer = nil
			t._currentRenderer2 = nil
		end
		return t
	end
}