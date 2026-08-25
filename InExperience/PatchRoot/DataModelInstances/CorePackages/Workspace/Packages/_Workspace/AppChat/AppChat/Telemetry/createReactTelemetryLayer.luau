local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)

return function(p0, p1)
	-- upvalues: reactModule (ref), cryoModule (ref)
	local var2 = reactModule.createContext(function()
		-- upvalues: cryoModule (copy), p1 (ref)
		return cryoModule.Dictionary.union({}, p1)
	end)
	
	return {
		Context = var2,
		Provider = function(p2)
			-- upvalues: reactModule (copy), p0 (ref), cryoModule (copy), var2 (ref)
			local var3 = reactModule.useContext(p0)
			
			return reactModule.createElement(var2.Provider, {
				value = reactModule.useCallback(function()
					-- upvalues: p2 (ref), cryoModule (copy), var3 (ref)
					local value = p2.value
					
					if typeof(value) == "function" then
						value = value()
					end
					return cryoModule.Dictionary.union(var3(), value)
				end, { var3, p2.value })
			}, p2.children)
		end
	}
end