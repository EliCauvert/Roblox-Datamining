local parent = script:FindFirstAncestor("Moments").Parent
local signalsModule = require(parent.Signals)
local cryoModule = require(parent.Cryo)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function()
	-- upvalues: createSignal (ref), createComputed (ref), cryoModule (ref)
	local var1, var2 = createSignal({})
	local t = {}
	local t_1 = {}
	
	return {
		getUsersByUserId = var1,
		getUserProfile = function(p1)
			-- upvalues: t (ref), createComputed (copy), var1 (ref), t_1 (ref)
			if t[p1] == nil then
				t[p1] = createComputed(function(p2)
					-- upvalues: var1 (copy), p1 (ref), t_1 (copy)
					return var1(p2)[p1] or t_1
				end)
			end
			return t[p1]
		end,
		updateUsername = function(p1, p2)
			-- upvalues: var1 (ref), var2 (ref), cryoModule (copy)
			local var3 = tostring(p1)
			local var4 = var1(false)
			var2(cryoModule.Dictionary.union(var4, {
				[var3] = cryoModule.Dictionary.union(var4[var3] or {}, { username = p2 })
			}))
		end,
		updateAvatar = function(p1, p2)
			-- upvalues: var1 (ref), var2 (ref), cryoModule (copy)
			local var3 = tostring(p1)
			local var4 = var1(false)
			var2(cryoModule.Dictionary.union(var4, {
				[var3] = cryoModule.Dictionary.union(var4[var3] or {}, { avatarThumbnailUri = p2 })
			}))
		end,
		updateMomentsCount = function(p1, p2)
			-- upvalues: var1 (ref), var2 (ref), cryoModule (copy)
			local var3 = tostring(p1)
			local var4 = var1(false)
			var2(cryoModule.Dictionary.union(var4, {
				[var3] = cryoModule.Dictionary.union(var4[var3] or {}, { momentsCount = p2 })
			}))
		end,
		invalidateMomentsCount = function(p1)
			-- upvalues: var1 (ref), var2 (ref), cryoModule (copy)
			local var3 = tostring(p1)
			local var4 = var1(false)
			local var5 = var4[var3]
			
			if var5 then
				var2(cryoModule.Dictionary.union(var4, {
					[var3] = cryoModule.Dictionary.join(var5, { momentsCount = cryoModule.None })
				}))
				
				return
			end
		end,
		updateUserInfo = function(p1, p2, p3)
			-- upvalues: var1 (ref), var2 (ref), cryoModule (copy)
			local var3 = tostring(p1)
			local var4 = var1(false)
			var2(cryoModule.Dictionary.union(var4, {
				[var3] = cryoModule.Dictionary.union(var4[var3] or {}, { displayName = p2, hasVerifiedBadge = p3 })
			}))
		end
	}
end