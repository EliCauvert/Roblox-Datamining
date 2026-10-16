local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local SignalsModule = require(AvatarExperienceCommon.Parent.Signals)
local ConstantsModule = require(AvatarExperienceCommon.Constants)
local SafeAppStorageServiceModule = require(AvatarExperienceCommon.Lib.SafeAppStorageService)
local AXTooltipAllowedTooltips = game:DefineFastString("AXTooltipAllowedTooltips", "")
local AXTooltipUseMemStorage = game:DefineFastFlag("AXTooltipUseMemStorage", false)
local AXTooltipMaxNumberOfTimesSeen = game:DefineFastInt("AXTooltipMaxNumberOfTimesSeen", 2)

local function deserializeSeenTooltips(Text: string) --[[ Line: 30 ]]
	local t = {}
	
	for _, value in Text:split(",") do
		t[value] = if t[value] then t[value] + 1 else 1
	end
	return t
end

local function serializeSeenTooltips(AXTooltipMaxNumberOfTimesSeens): string --[[ Line: 42 ]]
	-- upvalues: AXTooltipMaxNumberOfTimesSeen (copy)
	local List = {}
	
	for i, aXTooltipMaxNumberOfTimesSeen in AXTooltipMaxNumberOfTimesSeens do
		for _ = 1, math.min(AXTooltipMaxNumberOfTimesSeen, aXTooltipMaxNumberOfTimesSeen) do
			table.insert(List, i)
		end
	end
	return table.concat(List, ",")
end

return function() --[[ Line: 54 | Named "createAXTooltipStore" ]]
	-- upvalues: AXTooltipAllowedTooltips (copy), SafeAppStorageServiceModule (copy), ConstantsModule (copy), AXTooltipUseMemStorage (copy), deserializeSeenTooltips (copy), AXTooltipMaxNumberOfTimesSeen (copy), serializeSeenTooltips (copy), SignalsModule (copy)
	local v1 = AXTooltipAllowedTooltips:split(",")
	local DeserializeSeenTooltipsResult = deserializeSeenTooltips((SafeAppStorageServiceModule.getItem(ConstantsModule.AX_TOOLTIP_STORAGE_KEY, AXTooltipUseMemStorage)))
	local t = {}
	local t1 = {}
	
	for _, value in v1 do
		local DeserializeSeenTooltipsResultEntry = DeserializeSeenTooltipsResult[value] or 0
		
		if DeserializeSeenTooltipsResultEntry < AXTooltipMaxNumberOfTimesSeen then
			t[value] = true
		end
		t1[value] = DeserializeSeenTooltipsResultEntry
	end
	SafeAppStorageServiceModule.setItem(ConstantsModule.AX_TOOLTIP_STORAGE_KEY, serializeSeenTooltips(t1), AXTooltipUseMemStorage)
	SafeAppStorageServiceModule.flush()
	local Signal, Signal2 = SignalsModule.createSignal(t)
	local Signal1, Signal2_1 = SignalsModule.createSignal(t1)
	local t2 = {}
	
	return {
		getIsTooltipAllowedToBeShown = function(Key) --[[ Line: 87 ]]
			-- upvalues: t2 (copy), SignalsModule (upval), Signal (copy)
			if t2[Key] == nil then
				t2[Key] = SignalsModule.createComputed(function(p1): boolean --[[ Line: 89 ]]
					-- upvalues: Signal (upval), Key (copy)
					return Signal(p1)[Key] == true
				end)
			end
			return t2[Key]
		end,
		dismissTooltip = function(Key, p1) --[[ Line: 97 ]]
			-- upvalues: Signal (copy), Signal2 (copy), Signal1 (copy), AXTooltipMaxNumberOfTimesSeen (upval), SafeAppStorageServiceModule (upval), ConstantsModule (upval), serializeSeenTooltips (upval), AXTooltipUseMemStorage (upval), Signal2_1 (copy)
			local Copy = table.clone(Signal(false))
			
			if Copy[Key] ~= true then return end
			Copy[Key] = false
			Signal2(Copy)
			local SignalResult = Signal1(false)
			local SignalResultEntry = SignalResult[Key] or 0
			
			if p1 and AXTooltipMaxNumberOfTimesSeen > SignalResultEntry then
				SignalResult[Key] = SignalResultEntry + 1
			else
				SignalResult[Key] = AXTooltipMaxNumberOfTimesSeen
			end
			SafeAppStorageServiceModule.setItem(ConstantsModule.AX_TOOLTIP_STORAGE_KEY, serializeSeenTooltips(SignalResult), AXTooltipUseMemStorage)
			SafeAppStorageServiceModule.flush()
			Signal2_1(SignalResult)
		end
	}
end