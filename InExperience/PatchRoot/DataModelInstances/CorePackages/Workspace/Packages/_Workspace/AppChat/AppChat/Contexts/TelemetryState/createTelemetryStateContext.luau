local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)

return function(p1) --[[ Line: 18 | Named "createStateContext" ]]
	-- upvalues: ReactModule (copy), CryoModule (copy)
	local Context = ReactModule.createContext({
		get = function() --[[ Line: 20 ]]
			-- upvalues: CryoModule (upval), p1 (copy)
			return CryoModule.Dictionary.union({}, p1)
		end,
		set = function() --[[ Line: 23 ]] end
	})
	
	return {
		Provider = Context.Provider,
		useClearState = function() --[[ Line: 28 ]]
			-- upvalues: ReactModule (upval), Context (copy), p1 (copy)
			local SetFunction = ReactModule.useContext(Context).set
			
			return ReactModule.useCallback(function() --[[ Line: 30 ]]
				-- upvalues: SetFunction (copy), p1 (upval)
				SetFunction(p1)
			end, { SetFunction })
		end,
		useGetState = function() --[[ Line: 34 ]]
			-- upvalues: ReactModule (upval), Context (copy)
			return ReactModule.useContext(Context).get
		end,
		useMergeState = function() --[[ Line: 37 ]]
			-- upvalues: ReactModule (upval), Context (copy), CryoModule (upval)
			local SetFunction = ReactModule.useContext(Context).set
			
			return ReactModule.useCallback(function(p2) --[[ Line: 39 ]]
				-- upvalues: SetFunction (copy), CryoModule (upval)
				SetFunction(function(p3) --[[ Line: 40 ]]
					-- upvalues: CryoModule (upval), p2 (copy)
					return CryoModule.Dictionary.join(p3, p2)
				end)
			end, { SetFunction })
		end,
		useSetState = function() --[[ Line: 45 ]]
			-- upvalues: ReactModule (upval), Context (copy)
			return ReactModule.useContext(Context).set
		end
	}
end