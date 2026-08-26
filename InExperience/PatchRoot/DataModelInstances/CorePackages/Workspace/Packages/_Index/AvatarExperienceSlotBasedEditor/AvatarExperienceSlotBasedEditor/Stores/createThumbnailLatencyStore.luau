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
		getAnyLoaded = signalsModule.createComputed(function(p1)
			-- upvalues: var5 (ref)
			for i, v in var5(p1) do
				if v then
					return true
				end
			end
			return false
		end),
		getIsLoaded = function(p2)
			-- upvalues: t (ref), signalsModule (copy), var5 (ref)
			local var7 = t[p2]
			
			if var7 then
				return var7
			end
			local var8 = signalsModule.createComputed(function(p3)
				-- upvalues: var5 (copy), p2 (ref)
				return var5(p3)[p2] == true
			end)
			t[p2] = var8
			
			return var8
		end,
		startTracking = function()
			-- upvalues: var2 (ref), var4 (ref), var6 (ref)
			var2(os.clock())
			var4(nil)
			var6({})
		end,
		appendThumbnail = function(p2)
			-- upvalues: var5 (ref), var6 (ref)
			local var7 = var5(false)
			
			if var7[p2] == nil then
				local cloned = table.clone(var7)
				cloned[p2] = false
				var6(cloned)
				
				return
			end
		end,
		setThumbnailLoaded = function(value)
			-- upvalues: var5 (ref), var6 (ref)
			local var7 = var5(false)
			
			if var7[value] == true then
				return
			end
			local cloned = table.clone(var7)
			cloned[value] = true
			var6(cloned)
		end,
		endTracking = function()
			-- upvalues: var4 (ref)
			var4(os.clock())
		end
	}
end