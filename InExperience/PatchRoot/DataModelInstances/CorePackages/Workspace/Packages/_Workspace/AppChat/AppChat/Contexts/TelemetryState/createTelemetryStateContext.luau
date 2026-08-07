local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)

return function(p0) --[[ line: 18 | named "createStateContext" ]]
	-- upvalues: reactModule (ref), cryoModule (ref)
	local var2 = reactModule.createContext({
		get = function() --[[ line: 20 ]]
			-- upvalues: cryoModule (copy), p0 (ref)
			return cryoModule.Dictionary.union({}, p0)
		end,
		set = function() --[[ line: 23 ]] end
	})
	
	return {
		Provider = var2.Provider,
		useClearState = function() --[[ line: 28 ]]
			-- upvalues: reactModule (copy), var2 (ref), p0 (ref)
			local set = reactModule.useContext(var2).set
			
			return reactModule.useCallback(function() --[[ line: 30 ]]
				-- upvalues: set (ref), p0 (copy)
				set(p0)
			end, { set })
		end,
		useGetState = function() --[[ line: 34 ]]
			-- upvalues: reactModule (copy), var2 (ref)
			return reactModule.useContext(var2).get
		end,
		useMergeState = function() --[[ line: 37 ]]
			-- upvalues: reactModule (copy), var2 (ref), cryoModule (copy)
			local set = reactModule.useContext(var2).set
			
			return reactModule.useCallback(function(p1) --[[ line: 39 ]]
				-- upvalues: set (ref), cryoModule (copy)
				set(function(p2) --[[ line: 40 ]]
					-- upvalues: cryoModule (copy), p1 (ref)
					return cryoModule.Dictionary.join(p2, p1)
				end)
			end, { set })
		end,
		useSetState = function() --[[ line: 45 ]]
			-- upvalues: reactModule (copy), var2 (ref)
			return reactModule.useContext(var2).set
		end
	}
end