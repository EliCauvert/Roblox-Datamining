local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Console = require(Parent.Shared).console
local ReactSymbols = require(Parent.Shared).ReactSymbols
local REACTPROVIDERTYPE = ReactSymbols.REACT_PROVIDER_TYPE
local REACTCONTEXTTYPE = ReactSymbols.REACT_CONTEXT_TYPE

return {
	createContext = function(_currentValue, _calculateChangedBits)
		-- upvalues: REACTCONTEXTTYPE (copy), REACTPROVIDERTYPE (copy), ReactGlobalsModule (copy), Console (copy)
		local config = {
			["$$typeof"] = REACTCONTEXTTYPE,
			_calculateChangedBits = _calculateChangedBits,
			_currentValue = _currentValue,
			_currentValue2 = _currentValue,
			_threadCount = 0,
			Provider = nil,
			Consumer = nil,
			displayName = nil,
			_currentRenderer = nil,
			_currentRenderer2 = nil
		}
		config.Provider = { ["$$typeof"] = REACTPROVIDERTYPE, _context = config }
		local Flag = false
		
		if ReactGlobalsModule.__DEV__ then
			local Consumer = {
				["$$typeof"] = REACTCONTEXTTYPE,
				_context = config,
				_calculateChangedBits = config._calculateChangedBits
			}
			setmetatable(Consumer, {
				__index = function(_, p1)
					-- upvalues: config (copy)
					return if p1 == "_currentValue" then config._currentValue elseif p1 == "_currentValue2" then config._currentValue2 elseif p1 == "_threadCount" then config._threadCount elseif p1 == "displayName" then config.displayName else nil
				end,
				__newindex = function(_, p1, _currentValue)
					-- upvalues: config (copy), Flag (ref), Console (upval)
					if p1 == "_currentValue" then
						config._currentValue = _currentValue
						
						return
					end
					if p1 == "_currentValue2" then
						config._currentValue2 = _currentValue
						
						return
					end
					if p1 == "_threadCount" then
						config._threadCount = _currentValue
						
						return
					end
					if p1 == "displayName" and not Flag then
						Console.warn("Setting `displayName` on Context.Consumer has no effect. " .. "You should set it directly on the context with Context.displayName = " .. _currentValue .. ".")
						Flag = true
					end
				end
			})
			config.Consumer = Consumer
		else
			config.Consumer = config
		end
		if ReactGlobalsModule.__DEV__ then
			config._currentRenderer = nil
			config._currentRenderer2 = nil
		end
		return config
	end
}