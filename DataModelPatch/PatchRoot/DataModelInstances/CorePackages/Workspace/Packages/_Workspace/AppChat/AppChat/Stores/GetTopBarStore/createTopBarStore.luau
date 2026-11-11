local Parent = script:FindFirstAncestor("AppChat").Parent
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy), CryoModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local t = {}
	
	return {
		getScreenTopBar = function(Key)
			-- upvalues: t (copy), SignalsModule (upval), Signal (copy)
			if t[Key] == nil then
				t[Key] = SignalsModule.createComputed(function(p1)
					-- upvalues: Signal (upval), Key (copy)
					return Signal(p1)[Key] or {}
				end)
			end
			return t[Key]
		end,
		setScreenTopBar = function(p1, p2)
			-- upvalues: Signal2 (copy), CryoModule (upval)
			Signal2(function(p3)
				-- upvalues: CryoModule (upval), p1 (copy), p2 (copy)
				return CryoModule.Dictionary.union(p3, { [p1] = CryoModule.Dictionary.union(p3[p1] or {}, p2) })
			end)
		end,
		clearScreenTopBar = function(p1)
			-- upvalues: Signal2 (copy), CryoModule (upval)
			Signal2(function(p2)
				-- upvalues: CryoModule (upval), p1 (copy)
				return CryoModule.Dictionary.union(p2, { [p1] = {} })
			end)
		end,
		resetStore = function()
			-- upvalues: Signal2 (copy)
			Signal2({})
		end
	}
end