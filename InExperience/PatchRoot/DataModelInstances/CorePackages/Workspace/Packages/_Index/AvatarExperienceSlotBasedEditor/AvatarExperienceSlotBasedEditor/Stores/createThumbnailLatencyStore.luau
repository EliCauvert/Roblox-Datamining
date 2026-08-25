local signalsModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	local var3, var4 = signalsModule.createSignal(nil)
	local var5, var6 = signalsModule.createSignal({})
	local t = {}
	
	return {
		getStartTime = var1,
		getEndTime = var3,
		getThumbnailMap = var5,
		getAnyLoaded = signalsModule.createComputed(function(p0)
			-- upvalues: var5 (ref)
			for i, v in var5(p0) do
				if v then
					return true
				end
			end
			return false
		end),
		getIsLoaded = function(p1)
			-- upvalues: t (ref), signalsModule (copy), var5 (ref)
			local var8 = t[p1]
			
			if var8 then
				return var8
			end
			local var9 = signalsModule.createComputed(function(p2)
				-- upvalues: var5 (copy), p1 (ref)
				return var5(p2)[p1] == true
			end)
			t[p1] = var9
			
			return var9
		end,
		startTracking = function()
			-- upvalues: var2 (ref), var4 (ref), var6 (ref)
			var2(os.clock())
			var4(nil)
			var6({})
		end,
		appendThumbnail = function(p3)
			-- upvalues: var5 (ref), var6 (ref)
			local var10 = var5(false)
			
			if var10[p3] == nil then
				local cloned = table.clone(var10)
				cloned[p3] = false
				var6(cloned)
				
				return
			end
		end,
		setThumbnailLoaded = function(value)
			-- upvalues: var5 (ref), var6 (ref)
			local var12 = var5(false)
			
			if var12[value] == true then
				return
			end
			local cloned = table.clone(var12)
			cloned[value] = true
			var6(cloned)
		end,
		endTracking = function()
			-- upvalues: var4 (ref)
			var4(os.clock())
		end
	}
end