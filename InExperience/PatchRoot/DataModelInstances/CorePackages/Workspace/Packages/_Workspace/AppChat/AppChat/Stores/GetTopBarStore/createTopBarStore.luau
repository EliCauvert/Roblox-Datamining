local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)

return function()
	-- upvalues: signalsModule (ref), cryoModule (ref)
	local var2, var3 = signalsModule.createSignal({})
	local t = {}
	
	return {
		getScreenTopBar = function(p0)
			-- upvalues: t (ref), signalsModule (copy), var2 (ref)
			if t[p0] == nil then
				t[p0] = signalsModule.createComputed(function(p1)
					-- upvalues: var2 (copy), p0 (ref)
					return var2(p1)[p0] or {}
				end)
			end
			return t[p0]
		end,
		setScreenTopBar = function(value, p2)
			-- upvalues: var3 (ref), cryoModule (copy)
			var3(function(p3)
				-- upvalues: cryoModule (copy), value (ref), p2 (ref)
				return cryoModule.Dictionary.union(p3, {
					[value] = cryoModule.Dictionary.union(p3[value] or {}, p2)
				})
			end)
		end,
		clearScreenTopBar = function(p4)
			-- upvalues: var3 (ref), cryoModule (copy)
			var3(function(p5)
				-- upvalues: cryoModule (copy), p4 (ref)
				return cryoModule.Dictionary.union(p5, { [p4] = {} })
			end)
		end,
		resetStore = function()
			-- upvalues: var3 (ref)
			var3({})
		end
	}
end