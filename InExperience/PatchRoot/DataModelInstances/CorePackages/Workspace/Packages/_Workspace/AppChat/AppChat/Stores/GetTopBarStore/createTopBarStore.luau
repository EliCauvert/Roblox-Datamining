local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)

return function()
	-- upvalues: signalsModule (ref), cryoModule (ref)
	local var1, var2 = signalsModule.createSignal({})
	local t = {}
	
	return {
		getScreenTopBar = function(p1)
			-- upvalues: t (ref), signalsModule (copy), var1 (ref)
			if t[p1] == nil then
				t[p1] = signalsModule.createComputed(function(p2)
					-- upvalues: var1 (copy), p1 (ref)
					return var1(p2)[p1] or {}
				end)
			end
			return t[p1]
		end,
		setScreenTopBar = function(value, p1)
			-- upvalues: var2 (ref), cryoModule (copy)
			var2(function(p2)
				-- upvalues: cryoModule (copy), value (ref), p1 (ref)
				return cryoModule.Dictionary.union(p2, {
					[value] = cryoModule.Dictionary.union(p2[value] or {}, p1)
				})
			end)
		end,
		clearScreenTopBar = function(p1)
			-- upvalues: var2 (ref), cryoModule (copy)
			var2(function(p2)
				-- upvalues: cryoModule (copy), p1 (ref)
				return cryoModule.Dictionary.union(p2, { [p1] = {} })
			end)
		end,
		resetStore = function()
			-- upvalues: var2 (ref)
			var2({})
		end
	}
end