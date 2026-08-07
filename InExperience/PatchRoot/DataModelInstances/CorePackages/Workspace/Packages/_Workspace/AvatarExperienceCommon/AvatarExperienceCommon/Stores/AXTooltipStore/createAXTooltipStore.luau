local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local signalsModule = require(avatarExperienceCommon.Parent.Signals)
local constantsModule = require(avatarExperienceCommon.Constants)
local safeAppStorageServiceModule = require(avatarExperienceCommon.Lib.SafeAppStorageService)
local AXTooltipAllowedTooltips = game:DefineFastString("AXTooltipAllowedTooltips", "")
local AXTooltipUseMemStorage = game:DefineFastFlag("AXTooltipUseMemStorage", false)
local AXTooltipMaxNumberOfTimesSeen = game:DefineFastInt("AXTooltipMaxNumberOfTimesSeen", 2)

local function deserializeSeenTooltips(p0) --[[ line: 30 ]]
	local t = {}
	
	for i, v in p0:split(",") do
		t[v] = if t[v] then t[v] + 1 else 1
	end
	return t
end

local function serializeSeenTooltips(p1) --[[ line: 42 ]]
	-- upvalues: AXTooltipMaxNumberOfTimesSeen (ref)
	local t = {}
	
	for i, v in p1 do
		for _ = 1, math.min(AXTooltipMaxNumberOfTimesSeen, v) do
			table.insert(t, i)
		end
	end
	return table.concat(t, ",")
end

return function() --[[ line: 54 | named "createAXTooltipStore" ]]
	-- upvalues: AXTooltipAllowedTooltips (ref), safeAppStorageServiceModule (ref), constantsModule (ref), AXTooltipUseMemStorage (ref), deserializeSeenTooltips (ref), AXTooltipMaxNumberOfTimesSeen (ref), serializeSeenTooltips (ref), signalsModule (ref)
	local var11 = AXTooltipAllowedTooltips:split(",")
	local var12 = deserializeSeenTooltips(safeAppStorageServiceModule.getItem(constantsModule.AX_TOOLTIP_STORAGE_KEY, AXTooltipUseMemStorage))
	local t = {}
	local t_1 = {}
	
	for i, v in var11 do
		local var20 = var12[v] or 0
		
		if var20 < AXTooltipMaxNumberOfTimesSeen then
			t[v] = true
		end
		t_1[v] = var20
	end
	safeAppStorageServiceModule.setItem(constantsModule.AX_TOOLTIP_STORAGE_KEY, serializeSeenTooltips(t_1), AXTooltipUseMemStorage)
	safeAppStorageServiceModule.flush()
	local var15, var16 = signalsModule.createSignal(t)
	local var17, var18 = signalsModule.createSignal(t_1)
	local t_2 = {}
	
	return {
		getIsTooltipAllowedToBeShown = function(value) --[[ line: 87 ]]
			-- upvalues: t_2 (ref), signalsModule (copy), var15 (ref)
			if t_2[value] == nil then
				t_2[value] = signalsModule.createComputed(function(p2) --[[ line: 89 ]]
					-- upvalues: var15 (copy), value (ref)
					return var15(p2)[value] == true
				end)
			end
			return t_2[value]
		end,
		dismissTooltip = function(p3, p4) --[[ line: 97 ]]
			-- upvalues: var15 (ref), var16 (ref), var17 (ref), AXTooltipMaxNumberOfTimesSeen (copy), safeAppStorageServiceModule (copy), constantsModule (copy), serializeSeenTooltips (copy), AXTooltipUseMemStorage (copy), var18 (ref)
			local cloned = table.clone(var15(false))
			
			if cloned[p3] ~= true then return end
			cloned[p3] = false
			var16(cloned)
			local var22 = var17(false)
			local var23 = var22[p3] or 0
			
			if p4 and AXTooltipMaxNumberOfTimesSeen > var23 then
				var22[p3] = var23 + 1
			else
				var22[p3] = AXTooltipMaxNumberOfTimesSeen
			end
			safeAppStorageServiceModule.setItem(constantsModule.AX_TOOLTIP_STORAGE_KEY, serializeSeenTooltips(var22), AXTooltipUseMemStorage)
			safeAppStorageServiceModule.flush()
			var18(var22)
		end
	}
end