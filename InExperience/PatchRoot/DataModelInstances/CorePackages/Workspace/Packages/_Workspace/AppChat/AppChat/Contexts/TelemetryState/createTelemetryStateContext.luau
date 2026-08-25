local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)

return function(p0)
	-- upvalues: reactModule (ref), cryoModule (ref)
	local var2 = reactModule.createContext({
		get = function()
			-- upvalues: cryoModule (copy), p0 (ref)
			return cryoModule.Dictionary.union({}, p0)
		end,
		set = function() end
	})
	
	return {
		Provider = var2.Provider,
		useClearState = function()
			-- upvalues: reactModule (copy), var2 (ref), p0 (ref)
			local set = reactModule.useContext(var2).set
			
			return reactModule.useCallback(function()
				-- upvalues: set (ref), p0 (copy)
				set(p0)
			end, { set })
		end,
		useGetState = function()
			-- upvalues: reactModule (copy), var2 (ref)
			return reactModule.useContext(var2).get
		end,
		useMergeState = function()
			-- upvalues: reactModule (copy), var2 (ref), cryoModule (copy)
			local set = reactModule.useContext(var2).set
			
			return reactModule.useCallback(function(p1)
				-- upvalues: set (ref), cryoModule (copy)
				set(function(p2)
					-- upvalues: cryoModule (copy), p1 (ref)
					return cryoModule.Dictionary.join(p2, p1)
				end)
			end, { set })
		end,
		useSetState = function()
			-- upvalues: reactModule (copy), var2 (ref)
			return reactModule.useContext(var2).set
		end
	}
end