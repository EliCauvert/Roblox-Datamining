local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)

return function(p1, p2)
	-- upvalues: ReactModule (copy), CryoModule (copy)
	local Context = ReactModule.createContext(function()
		-- upvalues: CryoModule (upval), p2 (copy)
		return CryoModule.Dictionary.union({}, p2)
	end)
	
	return {
		Context = Context,
		Provider = function(p3)
			-- upvalues: ReactModule (upval), p1 (copy), CryoModule (upval), Context (copy)
			local UseContextResult = ReactModule.useContext(p1)
			
			return ReactModule.createElement(Context.Provider, {
				value = ReactModule.useCallback(function()
					-- upvalues: p3 (copy), CryoModule (upval), UseContextResult (copy)
					local ValueFunction = p3.value
					
					if typeof(ValueFunction) == "function" then
						ValueFunction = ValueFunction()
					end
					return CryoModule.Dictionary.union(UseContextResult(), ValueFunction)
				end, { UseContextResult, p3.value })
			}, p3.children)
		end
	}
end