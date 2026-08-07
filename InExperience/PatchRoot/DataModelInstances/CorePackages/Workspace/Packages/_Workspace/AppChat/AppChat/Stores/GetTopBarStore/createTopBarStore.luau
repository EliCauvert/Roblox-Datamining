local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)

return function() --[[ line: 56 | named "createTopBarStore" ]]
	-- upvalues: signalsModule (ref), cryoModule (ref)
	local var2, var3 = signalsModule.createSignal({})
	local t = {}
	
	return {
		getScreenTopBar = function(p0) --[[ line: 61 ]]
			-- upvalues: t (ref), signalsModule (copy), var2 (ref)
			if t[p0] == nil then
				t[p0] = signalsModule.createComputed(function(p1) --[[ line: 63 ]]
					-- upvalues: var2 (copy), p0 (ref)
					return var2(p1)[p0] or {}
				end)
			end
			return t[p0]
		end,
		setScreenTopBar = function(value, p2) --[[ line: 71 ]]
			-- upvalues: var3 (ref), cryoModule (copy)
			var3(function(p3) --[[ line: 72 ]]
				-- upvalues: cryoModule (copy), value (ref), p2 (ref)
				return cryoModule.Dictionary.union(p3, {
					[value] = cryoModule.Dictionary.union(p3[value] or {}, p2)
				})
			end)
		end,
		clearScreenTopBar = function(p4) --[[ line: 80 ]]
			-- upvalues: var3 (ref), cryoModule (copy)
			var3(function(p5) --[[ line: 81 ]]
				-- upvalues: cryoModule (copy), p4 (ref)
				return cryoModule.Dictionary.union(p5, { [p4] = {} })
			end)
		end,
		resetStore = function() --[[ line: 88 ]]
			-- upvalues: var3 (ref)
			var3({})
		end
	}
end