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

return function()
	-- upvalues: createSignal (ref), createComputed (ref), displayModule (ref), getChatStatusStoreModule (ref), getPresetChatStoreModule (ref), isUserChatEnabledModule (ref), t (ref), list (ref), createEffect (ref), promptsApiModule (ref)
	local var1, var2 = createSignal(false)
	local var3, var4 = createSignal(false)
	local var5, var6 = createSignal(false)
	local var7 = createComputed(function(p1)
		-- upvalues: displayModule (copy)
		return displayModule.GetDisplayStore(p1).getViewportSize(p1).X >= 720
	end)
	local var8 = getChatStatusStoreModule(false)
	local var9 = getPresetChatStoreModule(false)
	local t_1 = {
		GlobalChatTooltip = function(p1)
			-- upvalues: isUserChatEnabledModule (copy), var8 (ref), var5 (ref)
			return isUserChatEnabledModule(var8.getChatStatus(p1)) and var5(p1)
		end,
		PresetChatTooltip = function(value)
			-- upvalues: var9 (ref)
			return var9.getIsEnabled(value) and var9.getAccessLevel(value) == "Enabled"
		end
	}
	local t_2 = {}
	
	local function ensureTooltip(p1)
		-- upvalues: t_2 (ref), createSignal (copy), t (copy), createComputed (copy)
		local var10 = t_2[p1]
		
		if var10 then
			return var10
		end
		local var11, var12 = createSignal(t)
		local t_1 = {
			getEntry = var11,
			setEntry = var12,
			getIsEligible = createComputed(function(p2)
				-- upvalues: var11 (ref)
				return var11(p2).isEligible
			end),
			getIsDismissed = createComputed(function(p2)
				-- upvalues: var11 (ref)
				return var11(p2).isDismissed
			end),
			getShouldShow = createComputed(function(p2)
				-- upvalues: var11 (ref)
				return var11(p2).shouldShow
			end)
		}
		t_2[p1] = t_1
		
		return t_1
	end
	
	for i, v in list do
		ensureTooltip(v)
	end
	local function _(value, p1, p2)
		-- upvalues: ensureTooltip (ref)
		ensureTooltip(value).setEntry(function(p3)
			-- upvalues: p1 (ref), p2 (ref)
			if p3[p1] == p2 then
				return p3
			end
			local cloned = table.clone(p3)
			cloned[p1] = p2
			
			return cloned
		end)
	end
	
	local _ = function(p1, p2)
		-- upvalues: t_1 (ref), t_2 (ref)
		local var10 = t_1[p2]
		
		if var10 ~= nil and not var10(p1) then
			return false
		end
		local var11 = t_2[p2]
		
		if var11 == nil then
			return false
		end
		local entry = var11.getEntry(p1)
		
		return entry.isEligible and not entry.isDismissed
	end
	
	local var10, var11 = createSignal(nil)
	
	return {
		getIsChatWindowOpen = var1,
		setIsChatWindowOpen = var2,
		getIsChatInputBarVisible = var3,
		setIsChatInputBarVisible = var4,
		getIsScreenWideEnough = var7,
		setIsGlobalChatAvailable = var6,
		getActiveTooltipKey = var10,
		getIsEligible = function(p1)
			-- upvalues: ensureTooltip (ref)
			return ensureTooltip(p1).getIsEligible
		end,
		setIsEligible = function(value, p1)
			-- upvalues: ensureTooltip (ref)
			local var12 = "isEligible"
			ensureTooltip(value).setEntry(function(p2)
				-- upvalues: var12 (ref), p1 (ref)
				if p2[var12] == p1 then
					return p2
				end
				local cloned = table.clone(p2)
				cloned[var12] = p1
				
				return cloned
			end)
		end,
		getIsDismissed = function(p1)
			-- upvalues: ensureTooltip (ref)
			return ensureTooltip(p1).getIsDismissed
		end,
		setIsDismissed = function(value, p1)
			-- upvalues: ensureTooltip (ref)
			local var12 = "isDismissed"
			ensureTooltip(value).setEntry(function(p2)
				-- upvalues: var12 (ref), p1 (ref)
				if p2[var12] == p1 then
					return p2
				end
				local cloned = table.clone(p2)
				cloned[var12] = p1
				
				return cloned
			end)
		end,
		getShouldShow = function(p1)
			-- upvalues: ensureTooltip (ref)
			return ensureTooltip(p1).getShouldShow
		end,
		setShouldShow = function(value, p1)
			-- upvalues: ensureTooltip (ref)
			local var12 = "shouldShow"
			ensureTooltip(value).setEntry(function(p2)
				-- upvalues: var12 (ref), p1 (ref)
				if p2[var12] == p1 then
					return p2
				end
				local cloned = table.clone(p2)
				cloned[var12] = p1
				
				return cloned
			end)
		end,
		reportImpression = function(p1)
			-- upvalues: promptsApiModule (copy)
			promptsApiModule.reportImpression(p1)
		end,
		activeTooltipKeyEffect = createEffect(function(p1)
			-- upvalues: var10 (ref), t_1 (ref), t_2 (ref), list (copy), var11 (ref)
			local var12 = var10(false)
			
			if var12 ~= nil then
				local var13
				local var14 = t_1[var12]
				
				if var14 == nil or var14(p1) then
					local var15 = t_2[var12]
					
					if var15 == nil then
						var13 = false
					else
						local entry = var15.getEntry(p1)
						var13 = entry.isEligible and not entry.isDismissed
					end
				else
					var13 = false
				end
				if var13 then return end
			end
			for i, v in list do
				local var16
				local var17 = t_1[v]
				
				if var17 == nil or var17(p1) then
					local var18 = t_2[v]
					
					if var18 == nil then
						var16 = false
					else
						local entry = var18.getEntry(p1)
						var16 = entry.isEligible and not entry.isDismissed
					end
				else
					var16 = false
				end
				if var16 then
					if var12 ~= v then
						var11(v)
					end
					return
				end
			end
			if var12 ~= nil then
				var11(nil)
			end
		end)
	}
end