local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)

return function(p1, p2)
	-- upvalues: reactModule (ref), cryoModule (ref)
	local var1 = reactModule.createContext(function()
		-- upvalues: cryoModule (copy), p2 (ref)
		return cryoModule.Dictionary.union({}, p2)
	end)
	
	return {
		Context = var1,
		Provider = function(p3)
			-- upvalues: reactModule (copy), p1 (ref), cryoModule (copy), var1 (ref)
			local var2 = reactModule.useContext(p1)
			
			return reactModule.createElement(var1.Provider, {
				value = reactModule.useCallback(function()
					-- upvalues: p3 (ref), cryoModule (copy), var2 (ref)
					local value = p3.value
					
					if typeof(value) == "function" then
						value = value()
					end
					return cryoModule.Dictionary.union(var2(), value)
				end, { var2, p3.value })
			}, p3.children)
		end
	}
end