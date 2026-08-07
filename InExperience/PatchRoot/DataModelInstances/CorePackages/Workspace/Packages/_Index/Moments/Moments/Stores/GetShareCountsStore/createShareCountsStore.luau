local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local t = { shareCount = 0, hasShared = false }

return function() --[[ line: 29 | named "createShareCountsStore" ]]
	-- upvalues: createSignal (ref), createComputed (ref), t (ref), cryoModule (ref)
	local var3, var4 = createSignal({})
	local t_1 = {}
	
	return {
		getShareInfoByMomentId = var3,
		getShareInfo = function(p0) --[[ line: 34 ]]
			-- upvalues: t_1 (ref), createComputed (copy), var3 (ref), t (copy)
			if t_1[p0] == nil then
				t_1[p0] = createComputed(function(p1) --[[ line: 36 ]]
					-- upvalues: var3 (copy), p0 (ref), t (copy)
					return var3(p1)[p0] or t
				end)
			end
			return t_1[p0]
		end,
		setBatchShareCounts = function(value) --[[ line: 43 ]]
			-- upvalues: var4 (ref)
			var4(function(p2) --[[ line: 44 ]]
				-- upvalues: value (ref)
				local cloned = table.clone(p2)
				
				for i, v in value do
					local var7 = p2[i]
					
					if var7 == nil or not var7.hasShared or v.hasShared then
						cloned[i] = v
					else
						cloned[i] = {
							hasShared = true,
							shareCount = math.max(var7.shareCount, v.shareCount)
						}
					end
				end
				return cloned
			end)
		end,
		setShareCount = function(value, p3, p4) --[[ line: 61 ]]
			-- upvalues: var4 (ref), cryoModule (copy)
			var4(function(p5) --[[ line: 62 ]]
				-- upvalues: cryoModule (copy), value (ref), p3 (ref), p4 (ref)
				return cryoModule.Dictionary.union(p5, { [value] = { shareCount = p3, hasShared = p4 } })
			end)
		end,
		markShared = function(p6) --[[ line: 72 ]]
			-- upvalues: var3 (ref), t (copy), var4 (ref), cryoModule (copy)
			local var8 = var3(false)
			local var9 = var8[p6] or t
			
			if var9.hasShared then
				return
			end
			var4(cryoModule.Dictionary.union(var8, {
				[p6] = { hasShared = true, shareCount = var9.shareCount + 1 }
			}))
		end,
		clear = function() --[[ line: 86 ]]
			-- upvalues: var4 (ref), t_1 (ref)
			var4({})
			table.clear(t_1)
		end
	}
end