local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local DisplayModule = require(Parent.Display)
local SignalsModule = require(Parent.Signals)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local CreateEffectFunction = SignalsModule.createEffect
local IsUserChatEnabledModule = require(ExpChat.isUserChatEnabled)
local GetChatStatusStoreModule = require(script.Parent.Parent.GetChatStatusStore)
local GetPresetChatStoreModule = require(script.Parent.Parent.GetPresetChatStore)
local PromptsApiModule = require(script.Parent.promptsApi)
local list = { "GlobalChatTooltip", "PresetChatTooltip" }
local config = {
	isEligible = false,
	isDismissed = false,
	shouldShow = false
}

return function()
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), DisplayModule (copy), GetChatStatusStoreModule (copy), GetPresetChatStoreModule (copy), IsUserChatEnabledModule (copy), config (copy), list (copy), CreateEffectFunction (copy), PromptsApiModule (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Computed = CreateComputedFunction(function(p1): boolean
		-- upvalues: DisplayModule (upval)
		return DisplayModule.GetDisplayStore(p1).getViewportSize(p1).X >= 720
	end)
	local ChatStatusStoreModule = GetChatStatusStoreModule(false)
	local PresetChatStoreModule = GetPresetChatStoreModule(false)
	local config1 = {
		GlobalChatTooltip = function(p1)
			-- upvalues: IsUserChatEnabledModule (upval), ChatStatusStoreModule (copy), Signal3 (copy)
			return IsUserChatEnabledModule(ChatStatusStoreModule.getChatStatus(p1)) and Signal3(p1)
		end,
		PresetChatTooltip = function(p1): boolean
			-- upvalues: PresetChatStoreModule (copy)
			return PresetChatStoreModule.getIsEnabled(p1) and PresetChatStoreModule.getAccessLevel(p1) == "Enabled"
		end
	}
	local t = {}
	
	local function ensureTooltip(Key)
		-- upvalues: t (copy), CreateSignalFunction (upval), config (upval), CreateComputedFunction (upval)
		local Entry = t[Key]
		
		if Entry then
			return Entry
		else
			local Signal, Signal2 = CreateSignalFunction(config)
			local config1 = {
				getEntry = Signal,
				setEntry = Signal2,
				getIsEligible = CreateComputedFunction(function(p1)
					-- upvalues: Signal (copy)
					return Signal(p1).isEligible
				end),
				getIsDismissed = CreateComputedFunction(function(p1)
					-- upvalues: Signal (copy)
					return Signal(p1).isDismissed
				end),
				getShouldShow = CreateComputedFunction(function(p1)
					-- upvalues: Signal (copy)
					return Signal(p1).shouldShow
				end)
			}
			t[Key] = config1
			
			return config1
		end
	end
	
	for _, value in list do
		ensureTooltip(value)
	end
	local function _(p1, p2, p3)
		-- upvalues: ensureTooltip (copy)
		ensureTooltip(p1).setEntry(function(Tbl)
			-- upvalues: p2 (copy), p3 (copy)
			if Tbl[p2] == p3 then
				return Tbl
			else
				local Copy = table.clone(Tbl)
				Copy[p2] = p3
				
				return Copy
			end
		end)
	end
	
	local _ = function(p1, p2): boolean
		-- upvalues: config1 (copy), t (copy)
		local Entry = config1[p2]
		
		if Entry ~= nil and not Entry(p1) then
			return false
		end
		local Entry1 = t[p2]
		
		if Entry1 == nil then
			return false
		else
			local Entry11 = Entry1.getEntry(p1)
			
			return Entry11.isEligible and not Entry11.isDismissed
		end
	end
	
	local Signal4, Signal2_3 = CreateSignalFunction(nil)
	
	return {
		getIsChatWindowOpen = Signal,
		setIsChatWindowOpen = Signal2,
		getIsChatInputBarVisible = Signal1,
		setIsChatInputBarVisible = Signal2_1,
		getIsScreenWideEnough = Computed,
		setIsGlobalChatAvailable = Signal2_2,
		getActiveTooltipKey = Signal4,
		getIsEligible = function(p1)
			-- upvalues: ensureTooltip (copy)
			return ensureTooltip(p1).getIsEligible
		end,
		setIsEligible = function(p1, p2)
			-- upvalues: ensureTooltip (copy)
			local v1 = "isEligible"
			ensureTooltip(p1).setEntry(function(Tbl)
				-- upvalues: v1 (copy), p2 (copy)
				if Tbl[v1] == p2 then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					Copy[v1] = p2
					
					return Copy
				end
			end)
		end,
		getIsDismissed = function(p1)
			-- upvalues: ensureTooltip (copy)
			return ensureTooltip(p1).getIsDismissed
		end,
		setIsDismissed = function(p1, p2)
			-- upvalues: ensureTooltip (copy)
			local v1 = "isDismissed"
			ensureTooltip(p1).setEntry(function(Tbl)
				-- upvalues: v1 (copy), p2 (copy)
				if Tbl[v1] == p2 then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					Copy[v1] = p2
					
					return Copy
				end
			end)
		end,
		getShouldShow = function(p1)
			-- upvalues: ensureTooltip (copy)
			return ensureTooltip(p1).getShouldShow
		end,
		setShouldShow = function(p1, p2)
			-- upvalues: ensureTooltip (copy)
			local v1 = "shouldShow"
			ensureTooltip(p1).setEntry(function(Tbl)
				-- upvalues: v1 (copy), p2 (copy)
				if Tbl[v1] == p2 then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					Copy[v1] = p2
					
					return Copy
				end
			end)
		end,
		reportImpression = function(p1)
			-- upvalues: PromptsApiModule (upval)
			PromptsApiModule.reportImpression(p1)
		end,
		activeTooltipKeyEffect = CreateEffectFunction(function(p1)
			-- upvalues: Signal4 (copy), config1 (copy), t (copy), list (upval), Signal2_3 (copy)
			local SignalResult = Signal4(false)
			
			if SignalResult ~= nil then
				local Entry = config1[SignalResult]
				local NoIsDismissed = nil
				
				if Entry == nil or Entry(p1) then
					local Entry1 = t[SignalResult]
					
					if Entry1 == nil then
						NoIsDismissed = false
					else
						local Entry11 = Entry1.getEntry(p1)
						NoIsDismissed = Entry11.isEligible and not Entry11.isDismissed
					end
				else
					NoIsDismissed = false
				end
				if NoIsDismissed then return end
			end
			for _, value in list do
				local Entry = config1[value]
				local NoIsDismissed = nil
				
				if Entry == nil or Entry(p1) then
					local Entry2 = t[value]
					
					if Entry2 == nil then
						NoIsDismissed = false
					else
						local Entry21 = Entry2.getEntry(p1)
						NoIsDismissed = Entry21.isEligible and not Entry21.isDismissed
					end
				else
					NoIsDismissed = false
				end
				if NoIsDismissed then
					if SignalResult ~= value then
						Signal2_3(value)
					end
					return
				end
			end
			if SignalResult ~= nil then
				Signal2_3(nil)
			end
		end)
	}
end