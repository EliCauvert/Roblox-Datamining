local signalsModule = require(script:FindFirstAncestor("GameDetail").Parent.Signals)
local ageCheckUpsellDismissedDataModule = require(script.Parent.AgeCheckUpsellDismissedData)
local t = {}

local function _(p0)
	-- upvalues: t (ref), signalsModule (ref)
	local var3 = t[p0]
	
	if not var3 then
		local var4, var5 = signalsModule.createSignal(false)
		var3 = { get = var4, set = var5 }
		t[p0] = var3
	end
	return var3
end

return {
	getIsAgeCheckUpsellRendered = function(p1, p2)
		-- upvalues: ageCheckUpsellDismissedDataModule (ref), t (ref), signalsModule (ref)
		if p2 == nil or p2 == "" then
			return false
		elseif ageCheckUpsellDismissedDataModule.getIsAgeCheckUpsellDismissed(p1) then
			return false
		end
		local var6 = t[p2]
		
		if not var6 then
			local var7, var8 = signalsModule.createSignal(false)
			var6 = { get = var7, set = var8 }
			t[p2] = var6
		end
		return var6.get(p1)
	end,
	setAgeCheckUpsellRendered = function(value, p3)
		-- upvalues: t (ref), signalsModule (ref)
		if value == nil or value == "" then return end
		local var9 = t[value]
		
		if not var9 then
			local var10, var11 = signalsModule.createSignal(false)
			var9 = { get = var10, set = var11 }
			t[value] = var9
		end
		var9.set(p3)
	end
}