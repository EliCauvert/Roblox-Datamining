local SignalsModule = require(script:FindFirstAncestor("GameDetail").Parent.Signals)
local AgeCheckUpsellDismissedDataModule = require(script.Parent.AgeCheckUpsellDismissedData)
local t = {}

local function _(Key) --[[ Line: 15 | Named "getOrCreate" ]]
	-- upvalues: t (copy), SignalsModule (copy)
	local Entry = t[Key]
	
	if not Entry then
		local Signal, Signal2 = SignalsModule.createSignal(false)
		Entry = { get = Signal, set = Signal2 }
		t[Key] = Entry
	end
	return Entry
end

return {
	getIsAgeCheckUpsellRendered = function(p1, Key) --[[ Line: 32 ]]
		-- upvalues: AgeCheckUpsellDismissedDataModule (copy), t (copy), SignalsModule (copy)
		if Key == nil or Key == "" then
			return false
		end
		if AgeCheckUpsellDismissedDataModule.getIsAgeCheckUpsellDismissed(p1) then
			return false
		end
		local Entry = t[Key]
		
		if not Entry then
			local Signal, Signal2 = SignalsModule.createSignal(false)
			Entry = { get = Signal, set = Signal2 }
			t[Key] = Entry
		end
		return Entry.get(p1)
	end,
	setAgeCheckUpsellRendered = function(Key, p1) --[[ Line: 25 ]]
		-- upvalues: t (copy), SignalsModule (copy)
		if Key == nil or Key == "" then return end
		local Entry = t[Key]
		
		if not Entry then
			local Signal, Signal2 = SignalsModule.createSignal(false)
			Entry = { get = Signal, set = Signal2 }
			t[Key] = Entry
		end
		Entry.set(p1)
	end
}