local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local t = { shareCount = 0, hasShared = false }

return function()
	-- upvalues: createSignal (ref), createComputed (ref), t (ref), cryoModule (ref)
	local var1, var2 = createSignal({})
	local t_1 = {}
	
	return {
		getShareInfoByMomentId = var1,
		getShareInfo = function(p1)
			-- upvalues: t_1 (ref), createComputed (copy), var1 (ref), t (copy)
			if t_1[p1] == nil then
				t_1[p1] = createComputed(function(p2)
					-- upvalues: var1 (copy), p1 (ref), t (copy)
					return var1(p2)[p1] or t
				end)
			end
			return t_1[p1]
		end,
		setBatchShareCounts = function(value)
			-- upvalues: var2 (ref)
			var2(function(p1)
				-- upvalues: value (ref)
				local cloned = table.clone(p1)
				
				for i, v in value do
					local var3 = p1[i]
					
					if var3 == nil or not var3.hasShared or v.hasShared then
						cloned[i] = v
					else
						cloned[i] = {
							hasShared = true,
							shareCount = math.max(var3.shareCount, v.shareCount)
						}
					end
				end
				return cloned
			end)
		end,
		setShareCount = function(value, p1, p2)
			-- upvalues: var2 (ref), cryoModule (copy)
			var2(function(p3)
				-- upvalues: cryoModule (copy), value (ref), p1 (ref), p2 (ref)
				return cryoModule.Dictionary.union(p3, { [value] = { shareCount = p1, hasShared = p2 } })
			end)
		end,
		markShared = function(p1)
			-- upvalues: var1 (ref), t (copy), var2 (ref), cryoModule (copy)
			local var3 = var1(false)
			local var4 = var3[p1] or t
			
			if var4.hasShared then
				return
			end
			var2(cryoModule.Dictionary.union(var3, {
				[p1] = { hasShared = true, shareCount = var4.shareCount + 1 }
			}))
		end,
		clear = function()
			-- upvalues: var2 (ref), t_1 (ref)
			var2({})
			table.clear(t_1)
		end
	}
end