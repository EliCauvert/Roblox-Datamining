local parent = script:FindFirstAncestor("SocialExperienceJoin").Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local var1 = signalsModule.createComputed(function(_)
	-- upvalues: createSignal (ref), cryoModule (ref)
	local var2, var3 = createSignal({})
	local var4, var5 = createSignal(nil)
	
	return {
		getPlayabilityEntries = var2,
		getUserSettings = var4,
		setPlayabilityEntry = function(value, p1)
			-- upvalues: var2 (ref), var3 (ref), cryoModule (copy)
			if value and value ~= "" then
				var3(cryoModule.Dictionary.join(var2(false), { [value] = p1 }))
				
				return
			end
		end,
		setUserSettings = function(value)
			-- upvalues: var5 (ref)
			var5(value)
		end,
		clearPlayabilityEntry = function(p1)
			-- upvalues: var2 (ref), var3 (ref), cryoModule (copy)
			if not p1 or p1 == "" then return end
			local var6 = var2(false)
			
			if var6[p1] == nil then
				return
			end
			var3(cryoModule.Dictionary.join(var6, { [p1] = cryoModule.None }))
		end,
		clearCache = function(p1)
			-- upvalues: var2 (ref), var3 (ref), cryoModule (copy), var5 (ref)
			if p1 and p1 ~= "" then
				var3(cryoModule.Dictionary.join(var2(false), { [p1] = cryoModule.None }))
			else
				var3({})
			end
			var5(nil)
		end
	}
end)

return {
	get = function()
		-- upvalues: var1 (ref)
		return var1(false)
	end
}