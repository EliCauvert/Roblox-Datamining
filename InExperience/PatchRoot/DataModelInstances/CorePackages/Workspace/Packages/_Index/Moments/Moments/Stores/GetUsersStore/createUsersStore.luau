local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function()
	-- upvalues: createSignal (ref), createComputed (ref), cryoModule (ref)
	local var2, var3 = createSignal({})
	local t = {}
	local t_1 = {}
	
	return {
		getUsersByUserId = var2,
		getUserProfile = function(p0)
			-- upvalues: t (ref), createComputed (copy), var2 (ref), t_1 (ref)
			if t[p0] == nil then
				t[p0] = createComputed(function(p1)
					-- upvalues: var2 (copy), p0 (ref), t_1 (copy)
					return var2(p1)[p0] or t_1
				end)
			end
			return t[p0]
		end,
		updateUsername = function(p2, p3)
			-- upvalues: var2 (ref), var3 (ref), cryoModule (copy)
			local var6 = tostring(p2)
			local var7 = var2(false)
			var3(cryoModule.Dictionary.union(var7, {
				[var6] = cryoModule.Dictionary.union(var7[var6] or {}, { username = p3 })
			}))
		end,
		updateAvatar = function(p4, p5)
			-- upvalues: var2 (ref), var3 (ref), cryoModule (copy)
			local var8 = tostring(p4)
			local var9 = var2(false)
			var3(cryoModule.Dictionary.union(var9, {
				[var8] = cryoModule.Dictionary.union(var9[var8] or {}, { avatarThumbnailUri = p5 })
			}))
		end,
		updateMomentsCount = function(p6, p7)
			-- upvalues: var2 (ref), var3 (ref), cryoModule (copy)
			local var10 = tostring(p6)
			local var11 = var2(false)
			var3(cryoModule.Dictionary.union(var11, {
				[var10] = cryoModule.Dictionary.union(var11[var10] or {}, { momentsCount = p7 })
			}))
		end,
		invalidateMomentsCount = function(p8)
			-- upvalues: var2 (ref), var3 (ref), cryoModule (copy)
			local var12 = tostring(p8)
			local var13 = var2(false)
			local var14 = var13[var12]
			
			if var14 then
				var3(cryoModule.Dictionary.union(var13, {
					[var12] = cryoModule.Dictionary.join(var14, { momentsCount = cryoModule.None })
				}))
				
				return
			end
		end,
		updateUserInfo = function(p9, p10, p11)
			-- upvalues: var2 (ref), var3 (ref), cryoModule (copy)
			local var15 = tostring(p9)
			local var16 = var2(false)
			var3(cryoModule.Dictionary.union(var16, {
				[var15] = cryoModule.Dictionary.union(var16[var15] or {}, { displayName = p10, hasVerifiedBadge = p11 })
			}))
		end
	}
end