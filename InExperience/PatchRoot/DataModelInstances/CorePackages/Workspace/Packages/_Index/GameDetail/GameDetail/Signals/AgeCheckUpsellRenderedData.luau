local signalsModule = require(script:FindFirstAncestor("GameDetail").Parent.Signals)
local ageCheckUpsellDismissedDataModule = require(script.Parent.AgeCheckUpsellDismissedData)
local t = {}

local function _(p1)
	-- upvalues: t (ref), signalsModule (ref)
	local var1 = t[p1]
	
	if not var1 then
		local var2, var3 = signalsModule.createSignal(false)
		var1 = { get = var2, set = var3 }
		t[p1] = var1
	end
	return var1
end

return {
	getIsAgeCheckUpsellRendered = function(p1, p2)
		-- upvalues: ageCheckUpsellDismissedDataModule (ref), t (ref), signalsModule (ref)
		if p2 == nil or p2 == "" then
			return false
		elseif ageCheckUpsellDismissedDataModule.getIsAgeCheckUpsellDismissed(p1) then
			return false
		end
		local var1 = t[p2]
		
		if not var1 then
			local var2, var3 = signalsModule.createSignal(false)
			var1 = { get = var2, set = var3 }
			t[p2] = var1
		end
		return var1.get(p1)
	end,
	setAgeCheckUpsellRendered = function(value, p1)
		-- upvalues: t (ref), signalsModule (ref)
		if value == nil or value == "" then return end
		local var1 = t[value]
		
		if not var1 then
			local var2, var3 = signalsModule.createSignal(false)
			var1 = { get = var2, set = var3 }
			t[value] = var1
		end
		var1.set(p1)
	end
}