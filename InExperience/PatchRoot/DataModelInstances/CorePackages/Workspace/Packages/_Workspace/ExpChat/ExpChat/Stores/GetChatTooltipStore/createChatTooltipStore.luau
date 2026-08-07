local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local displayModule = require(parent.Display)
local signalsModule = require(parent.Signals)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local createEffect = signalsModule.createEffect
local isUserChatEnabledModule = require(expChat.isUserChatEnabled)
local getChatStatusStoreModule = require(script.Parent.Parent.GetChatStatusStore)
local getPresetChatStoreModule = require(script.Parent.Parent.GetPresetChatStore)
local promptsApiModule = require(script.Parent.promptsApi)
local list = { "GlobalChatTooltip", "PresetChatTooltip" }
local t = {
	isEligible = false,
	isDismissed = false,
	shouldShow = false
}

return function() --[[ line: 90 ]]
	-- upvalues: createSignal (ref), createComputed (ref), displayModule (ref), getChatStatusStoreModule (ref), getPresetChatStoreModule (ref), isUserChatEnabledModule (ref), t (ref), list (ref), createEffect (ref), promptsApiModule (ref)
	local var9, var10 = createSignal(false)
	local var11, var12 = createSignal(false)
	local var13, var14 = createSignal(false)
	local var15 = createComputed(function(p0) --[[ line: 95 ]]
		-- upvalues: displayModule (copy)
		return displayModule.GetDisplayStore(p0).getViewportSize(p0).X >= 720
	end)
	local var16 = getChatStatusStoreModule(false)
	local var17 = getPresetChatStoreModule(false)
	local t_1 = {
		GlobalChatTooltip = function(p1) --[[ line: 110 ]]
			-- upvalues: isUserChatEnabledModule (copy), var16 (ref), var13 (ref)
			return isUserChatEnabledModule(var16.getChatStatus(p1)) and var13(p1)
		end,
		PresetChatTooltip = function(value) --[[ line: 113 ]]
			-- upvalues: var17 (ref)
			return var17.getIsEnabled(value) and var17.getAccessLevel(value) == "Enabled"
		end
	}
	local t_2 = {}
	
	local function ensureTooltip(p2) --[[ line: 123 ]]
		-- upvalues: t_2 (ref), createSignal (copy), t (copy), createComputed (copy)
		local var23 = t_2[p2]
		
		if var23 then
			return var23
		end
		local var24, var25 = createSignal(t)
		local t_1 = {
			getEntry = var24,
			setEntry = var25,
			getIsEligible = createComputed(function(p3) --[[ line: 134 ]]
				-- upvalues: var24 (ref)
				return var24(p3).isEligible
			end),
			getIsDismissed = createComputed(function(p4) --[[ line: 137 ]]
				-- upvalues: var24 (ref)
				return var24(p4).isDismissed
			end),
			getShouldShow = createComputed(function(p5) --[[ line: 140 ]]
				-- upvalues: var24 (ref)
				return var24(p5).shouldShow
			end)
		}
		t_2[p2] = t_1
		
		return t_1
	end
	
	for i, v in list do
		ensureTooltip(v)
	end
	local function _(value, p6, p7) --[[ line: 156 | named "setField" ]]
		-- upvalues: ensureTooltip (ref)
		ensureTooltip(value).setEntry(function(p8) --[[ line: 158 ]]
			-- upvalues: p6 (ref), p7 (ref)
			if p8[p6] == p7 then
				return p8
			end
			local cloned = table.clone(p8)
			cloned[p6] = p7
			
			return cloned
		end)
	end
	
	local _ = function(p9, p10) --[[ line: 170 | named "isTooltipValid" ]]
		-- upvalues: t_1 (ref), t_2 (ref)
		local var28 = t_1[p10]
		
		if var28 ~= nil and not var28(p9) then
			return false
		end
		local var29 = t_2[p10]
		
		if var29 == nil then
			return false
		end
		local entry = var29.getEntry(p9)
		
		return entry.isEligible and not entry.isDismissed
	end
	
	local var21, var22 = createSignal(nil)
	
	return {
		getIsChatWindowOpen = var9,
		setIsChatWindowOpen = var10,
		getIsChatInputBarVisible = var11,
		setIsChatInputBarVisible = var12,
		getIsScreenWideEnough = var15,
		setIsGlobalChatAvailable = var14,
		getActiveTooltipKey = var21,
		getIsEligible = function(p11) --[[ line: 229 ]]
			-- upvalues: ensureTooltip (ref)
			return ensureTooltip(p11).getIsEligible
		end,
		setIsEligible = function(value, p12) --[[ line: 232 ]]
			-- upvalues: ensureTooltip (ref)
			local var31 = "isEligible"
			ensureTooltip(value).setEntry(function(p13) --[[ line: 158 ]]
				-- upvalues: var31 (ref), p12 (ref)
				if p13[var31] == p12 then
					return p13
				end
				local cloned = table.clone(p13)
				cloned[var31] = p12
				
				return cloned
			end)
		end,
		getIsDismissed = function(p14) --[[ line: 235 ]]
			-- upvalues: ensureTooltip (ref)
			return ensureTooltip(p14).getIsDismissed
		end,
		setIsDismissed = function(value, p15) --[[ line: 238 ]]
			-- upvalues: ensureTooltip (ref)
			local var32 = "isDismissed"
			ensureTooltip(value).setEntry(function(p16) --[[ line: 158 ]]
				-- upvalues: var32 (ref), p15 (ref)
				if p16[var32] == p15 then
					return p16
				end
				local cloned = table.clone(p16)
				cloned[var32] = p15
				
				return cloned
			end)
		end,
		getShouldShow = function(p17) --[[ line: 241 ]]
			-- upvalues: ensureTooltip (ref)
			return ensureTooltip(p17).getShouldShow
		end,
		setShouldShow = function(value, p18) --[[ line: 244 ]]
			-- upvalues: ensureTooltip (ref)
			local var33 = "shouldShow"
			ensureTooltip(value).setEntry(function(p19) --[[ line: 158 ]]
				-- upvalues: var33 (ref), p18 (ref)
				if p19[var33] == p18 then
					return p19
				end
				local cloned = table.clone(p19)
				cloned[var33] = p18
				
				return cloned
			end)
		end,
		reportImpression = function(p20) --[[ line: 247 ]]
			-- upvalues: promptsApiModule (copy)
			promptsApiModule.reportImpression(p20)
		end,
		activeTooltipKeyEffect = createEffect(function(p21) --[[ line: 197 ]]
			-- upvalues: var21 (ref), t_1 (ref), t_2 (ref), list (copy), var22 (ref)
			local var34 = var21(false)
			
			if var34 ~= nil then
				local var36
				local var35 = t_1[var34]
				
				if var35 == nil or var35(p21) then
					local var37 = t_2[var34]
					
					if var37 == nil then
						var36 = false
					else
						local entry = var37.getEntry(p21)
						var36 = entry.isEligible and not entry.isDismissed
					end
				else
					var36 = false
				end
				if var36 then return end
			end
			for i, v in list do
				local var40
				local var39 = t_1[v]
				
				if var39 == nil or var39(p21) then
					local var41 = t_2[v]
					
					if var41 == nil then
						var40 = false
					else
						local entry = var41.getEntry(p21)
						var40 = entry.isEligible and not entry.isDismissed
					end
				else
					var40 = false
				end
				if var40 then
					if var34 ~= v then
						var22(v)
					end
					return
				end
			end
			if var34 ~= nil then
				var22(nil)
			end
		end)
	}
end