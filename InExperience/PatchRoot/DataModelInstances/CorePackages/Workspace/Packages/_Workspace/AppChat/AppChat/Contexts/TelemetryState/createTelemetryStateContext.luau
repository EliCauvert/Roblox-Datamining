local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)

return function(p1)
	-- upvalues: ReactModule (copy), CryoModule (copy)
	local Context = ReactModule.createContext({
		get = function()
			-- upvalues: CryoModule (upval), p1 (copy)
			return CryoModule.Dictionary.union({}, p1)
		end,
		set = function() end
	})
	
	return {
		Provider = Context.Provider,
		useClearState = function()
			-- upvalues: ReactModule (upval), Context (copy), p1 (copy)
			local SetFunction = ReactModule.useContext(Context).set
			
			return ReactModule.useCallback(function()
				-- upvalues: SetFunction (copy), p1 (upval)
				SetFunction(p1)
			end, { SetFunction })
		end,
		useGetState = function()
			-- upvalues: ReactModule (upval), Context (copy)
			return ReactModule.useContext(Context).get
		end,
		useMergeState = function()
			-- upvalues: ReactModule (upval), Context (copy), CryoModule (upval)
			local SetFunction = ReactModule.useContext(Context).set
			
			return ReactModule.useCallback(function(p2)
				-- upvalues: SetFunction (copy), CryoModule (upval)
				SetFunction(function(p3)
					-- upvalues: CryoModule (upval), p2 (copy)
					return CryoModule.Dictionary.join(p3, p2)
				end)
			end, { SetFunction })
		end,
		useSetState = function()
			-- upvalues: ReactModule (upval), Context (copy)
			return ReactModule.useContext(Context).set
		end
	}
end