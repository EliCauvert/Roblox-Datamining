local parent = script:FindFirstAncestor("SocialExperienceJoin").Parent
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local var2 = signalsModule.createComputed(function(_)
	-- upvalues: createSignal (ref), cryoModule (ref)
	local var3, var4 = createSignal({})
	local var5, var6 = createSignal(nil)
	
	return {
		getPlayabilityEntries = var3,
		getUserSettings = var5,
		setPlayabilityEntry = function(value, p0)
			-- upvalues: var3 (ref), var4 (ref), cryoModule (copy)
			if value and value ~= "" then
				var4(cryoModule.Dictionary.join(var3(false), { [value] = p0 }))
				
				return
			end
		end,
		setUserSettings = function(value)
			-- upvalues: var6 (ref)
			var6(value)
		end,
		clearPlayabilityEntry = function(p1)
			-- upvalues: var3 (ref), var4 (ref), cryoModule (copy)
			if not p1 or p1 == "" then return end
			local var7 = var3(false)
			
			if var7[p1] == nil then
				return
			end
			var4(cryoModule.Dictionary.join(var7, { [p1] = cryoModule.None }))
		end,
		clearCache = function(p2)
			-- upvalues: var3 (ref), var4 (ref), cryoModule (copy), var6 (ref)
			if p2 and p2 ~= "" then
				var4(cryoModule.Dictionary.join(var3(false), { [p2] = cryoModule.None }))
			else
				var4({})
			end
			var6(nil)
		end
	}
end)

return {
	get = function()
		-- upvalues: var2 (ref)
		return var2(false)
	end
}