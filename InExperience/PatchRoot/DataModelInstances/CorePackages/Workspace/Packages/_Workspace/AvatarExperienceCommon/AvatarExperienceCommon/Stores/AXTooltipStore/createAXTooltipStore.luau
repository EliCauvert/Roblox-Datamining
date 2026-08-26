local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local signalsModule = require(avatarExperienceCommon.Parent.Signals)
local constantsModule = require(avatarExperienceCommon.Constants)
local safeAppStorageServiceModule = require(avatarExperienceCommon.Lib.SafeAppStorageService)
local AXTooltipAllowedTooltips = game:DefineFastString("AXTooltipAllowedTooltips", "")
local AXTooltipUseMemStorage = game:DefineFastFlag("AXTooltipUseMemStorage", false)
local AXTooltipMaxNumberOfTimesSeen = game:DefineFastInt("AXTooltipMaxNumberOfTimesSeen", 2)

local function deserializeSeenTooltips(p1)
	local t = {}
	
	for i, v in p1:split(",") do
		t[v] = if t[v] then t[v] + 1 else 1
	end
	return t
end

local function serializeSeenTooltips(p2)
	-- upvalues: AXTooltipMaxNumberOfTimesSeen (ref)
	local t = {}
	
	for i, v in p2 do
		for _ = 1, math.min(AXTooltipMaxNumberOfTimesSeen, v) do
			table.insert(t, i)
		end
	end
	return table.concat(t, ",")
end

return function()
	-- upvalues: AXTooltipAllowedTooltips (ref), safeAppStorageServiceModule (ref), constantsModule (ref), AXTooltipUseMemStorage (ref), deserializeSeenTooltips (ref), AXTooltipMaxNumberOfTimesSeen (ref), serializeSeenTooltips (ref), signalsModule (ref)
	local var1 = AXTooltipAllowedTooltips:split(",")
	local var2 = deserializeSeenTooltips(safeAppStorageServiceModule.getItem(constantsModule.AX_TOOLTIP_STORAGE_KEY, AXTooltipUseMemStorage))
	local t = {}
	local t_1 = {}
	
	for i, v in var1 do
		local var3 = var2[v] or 0
		
		if var3 < AXTooltipMaxNumberOfTimesSeen then
			t[v] = true
		end
		t_1[v] = var3
	end
	safeAppStorageServiceModule.setItem(constantsModule.AX_TOOLTIP_STORAGE_KEY, serializeSeenTooltips(t_1), AXTooltipUseMemStorage)
	safeAppStorageServiceModule.flush()
	local var4, var5 = signalsModule.createSignal(t)
	local var6, var7 = signalsModule.createSignal(t_1)
	local t_2 = {}
	
	return {
		getIsTooltipAllowedToBeShown = function(value)
			-- upvalues: t_2 (ref), signalsModule (copy), var4 (ref)
			if t_2[value] == nil then
				t_2[value] = signalsModule.createComputed(function(p3)
					-- upvalues: var4 (copy), value (ref)
					return var4(p3)[value] == true
				end)
			end
			return t_2[value]
		end,
		dismissTooltip = function(p3, p4)
			-- upvalues: var4 (ref), var5 (ref), var6 (ref), AXTooltipMaxNumberOfTimesSeen (copy), safeAppStorageServiceModule (copy), constantsModule (copy), serializeSeenTooltips (copy), AXTooltipUseMemStorage (copy), var7 (ref)
			local cloned = table.clone(var4(false))
			
			if cloned[p3] ~= true then return end
			cloned[p3] = false
			var5(cloned)
			local var8 = var6(false)
			local var9 = var8[p3] or 0
			
			if p4 and AXTooltipMaxNumberOfTimesSeen > var9 then
				var8[p3] = var9 + 1
			else
				var8[p3] = AXTooltipMaxNumberOfTimesSeen
			end
			safeAppStorageServiceModule.setItem(constantsModule.AX_TOOLTIP_STORAGE_KEY, serializeSeenTooltips(var8), AXTooltipUseMemStorage)
			safeAppStorageServiceModule.flush()
			var7(var8)
		end
	}
end