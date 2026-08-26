local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)

return function(p1)
	-- upvalues: reactModule (ref), cryoModule (ref)
	local var1 = reactModule.createContext({
		get = function()
			-- upvalues: cryoModule (copy), p1 (ref)
			return cryoModule.Dictionary.union({}, p1)
		end,
		set = function() end
	})
	
	return {
		Provider = var1.Provider,
		useClearState = function()
			-- upvalues: reactModule (copy), var1 (ref), p1 (ref)
			local set = reactModule.useContext(var1).set
			
			return reactModule.useCallback(function()
				-- upvalues: set (ref), p1 (copy)
				set(p1)
			end, { set })
		end,
		useGetState = function()
			-- upvalues: reactModule (copy), var1 (ref)
			return reactModule.useContext(var1).get
		end,
		useMergeState = function()
			-- upvalues: reactModule (copy), var1 (ref), cryoModule (copy)
			local set = reactModule.useContext(var1).set
			
			return reactModule.useCallback(function(p2)
				-- upvalues: set (ref), cryoModule (copy)
				set(function(p3)
					-- upvalues: cryoModule (copy), p2 (ref)
					return cryoModule.Dictionary.join(p3, p2)
				end)
			end, { set })
		end,
		useSetState = function()
			-- upvalues: reactModule (copy), var1 (ref)
			return reactModule.useContext(var1).set
		end
	}
end