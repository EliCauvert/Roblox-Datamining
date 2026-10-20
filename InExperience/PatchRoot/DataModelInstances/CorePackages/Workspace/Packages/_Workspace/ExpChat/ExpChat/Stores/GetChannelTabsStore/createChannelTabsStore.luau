local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local SignalsModule = require(Parent.Signals)
local TutilsModule = require(Parent.tutils)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local ShouldRenderTextChannelInDefaultWindowFunction = ExpChatSharedModule.shouldRenderTextChannelInDefaultWindow
local GetTextChannelDisplayModeFunction = ExpChatSharedModule.getTextChannelDisplayMode
local FriendsChatTabNameModule = require(Parent.FriendsChat.FriendsChatTabName)
local ShouldSuppressUnreadForTabMetadataModule = require(ExpChat.shouldSuppressUnreadForTabMetadata)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagExpChatFixChannelTabsMidExperienceToggleModule = require(ExpChat.Flags.getFFlagExpChatFixChannelTabsMidExperienceToggle)
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction = ExpChatSharedModule.Flags.GetFFlagExpChatSuppressWelcomeMessageTabUnread
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagExpChatFriendsTabRequireDefaultChannels = SharedFlagsModule.FFlagExpChatFriendsTabRequireDefaultChannels
local IsGlobalTabFirstModule = require(ExpChat.isGlobalTabFirst)
local GetDefaultTabNameModule = require(ExpChat.getDefaultTabName)
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local Callback = nil

local function reorderTabs(Tbl)
	-- upvalues: Callback (ref)
	local Copy = table.clone(Tbl)
	local List = {}
	
	for _, value in pairs(Copy) do
		table.insert(List, value)
	end
	table.sort(List, function(A, B): boolean
		-- upvalues: Callback (upval)
		local CallbackResult = Callback(A.name)
		local CallbackResult1 = Callback(B.name)
		
		return if CallbackResult and CallbackResult1 then CallbackResult < CallbackResult1 elseif CallbackResult then true else not CallbackResult1 and A.tabIndex < B.tabIndex
	end)
	
	for TabIndex, value1 in ipairs(List) do
		Copy[value1.name] = {
			type = value1.type,
			name = value1.name,
			tabIndex = TabIndex,
			HasUnreadMessages = value1.HasUnreadMessages
		}
	end
	return Copy
end

local function _(Tbl, p1)
	-- upvalues: reorderTabs (copy)
	local Copy = table.clone(Tbl)
	Copy[p1.name] = p1
	
	return (reorderTabs(Copy))
end

local _ = function(Tbl, p1)
	-- upvalues: reorderTabs (copy)
	local Copy = table.clone(Tbl)
	Copy[p1.name] = nil
	
	return (reorderTabs(Copy))
end

Callback = function(Name)
	-- upvalues: FFlagExpChatGlobalTabDefaultModule (copy), IsGlobalTabFirstModule (copy), FriendsChatTabNameModule (copy), FFlagExpChatEnableFriendsTab (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy)
	return if FFlagExpChatGlobalTabDefaultModule and IsGlobalTabFirstModule() then if Name == "RBXGlobal" then 1 elseif Name == "RBXGeneral" then 2 elseif Name == FriendsChatTabNameModule and FFlagExpChatEnableFriendsTab then 3 else nil elseif Name == "RBXGeneral" then 1 elseif Name == "RBXGlobal" and GetFFlagTextChatEnableUniverseChatTabsFunction() then 2 elseif Name == FriendsChatTabNameModule and FFlagExpChatEnableFriendsTab then 3 else nil
end

local function pruneNonSpecialTabs(AllChannelTabs)
	-- upvalues: Callback (ref), reorderTabs (copy)
	local t = {}
	
	for i, allChannelTab in AllChannelTabs do
		if Callback(i) ~= nil then
			t[i] = allChannelTab
		end
	end
	return (reorderTabs(t))
end

local _ = function(p1): boolean
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatFriendsTabRequireDefaultChannels (copy), FFlagExpChatEnableFriendsTab (copy)
	return if GetFFlagTextChatEnableUniverseChatTabsFunction() then not p1.channelTabsConfigurationEnabled else FFlagExpChatFriendsTabRequireDefaultChannels and (FFlagExpChatEnableFriendsTab and not p1.channelTabsConfigurationEnabled)
end

local function markTabUnread(Tbl, Name)
	local AllChannelTab = Tbl.allChannelTabs[Name]
	
	if AllChannelTab == nil or AllChannelTab.HasUnreadMessages or Name == Tbl.selectedTabName then
		return Tbl
	else
		local Copy = table.clone(Tbl)
		Copy.allChannelTabs = table.clone(Tbl.allChannelTabs)
		local Copy1 = table.clone(AllChannelTab)
		Copy1.HasUnreadMessages = true
		Copy.allChannelTabs[Name] = Copy1
		
		return Copy
	end
end

local function isTargetChannelNoOp(p1, SelectedTabName, p2, p3): boolean
	-- upvalues: FFlagExpChatGlobalTabDefaultModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatFriendsTabRequireDefaultChannels (copy), FFlagExpChatEnableFriendsTab (copy), Callback (ref)
	if FFlagExpChatGlobalTabDefaultModule and p3 and not p1.hasUserSelectedTab then
		return false
	else
		local AllChannelTab = if SelectedTabName then p1.allChannelTabs[SelectedTabName] else nil
		
		return if AllChannelTab then not p2 and (p1.selectedTabName == SelectedTabName and (AllChannelTab.type == "FriendsChat" or not AllChannelTab.HasUnreadMessages)) else SelectedTabName == nil or ((if GetFFlagTextChatEnableUniverseChatTabsFunction() then not p1.channelTabsConfigurationEnabled else FFlagExpChatFriendsTabRequireDefaultChannels and (FFlagExpChatEnableFriendsTab and not p1.channelTabsConfigurationEnabled)) and Callback(SelectedTabName) == nil or p1.selectedTabName == SelectedTabName)
	end
end

return function()
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), TutilsModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction (copy), ShouldSuppressUnreadForTabMetadataModule (copy), markTabUnread (copy), isTargetChannelNoOp (copy), FFlagExpChatGlobalTabDefaultModule (copy), reorderTabs (copy), FFlagExpChatFriendsTabRequireDefaultChannels (copy), FFlagExpChatEnableFriendsTab (copy), Callback (ref), GetDefaultTabNameModule (copy), IsGlobalTabFirstModule (copy), ShouldRenderTextChannelInDefaultWindowFunction (copy), GetTextChannelDisplayModeFunction (copy), GetFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), pruneNonSpecialTabs (copy)
	local Signal, Signal2 = CreateSignalFunction({
		selectedTabName = nil,
		channelTabsConfigurationEnabled = false,
		hasUserSelectedTab = false,
		allChannelTabs = {}
	})
	
	return {
		getChannelTabsState = Signal,
		getSelectedTabName = CreateComputedFunction(function(p1)
			-- upvalues: Signal (copy)
			return Signal(p1).selectedTabName
		end),
		getUnreadChannels = CreateComputedFunction(function(p1)
			-- upvalues: Signal (copy)
			local t = {}
			
			for i, allChannelTab in pairs(Signal(p1).allChannelTabs) do
				if allChannelTab.HasUnreadMessages then
					t[i] = true
				end
			end
			return t
		end, TutilsModule.deepEqual),
		handleIncomingOrOutgoingMessage = function(TextChatMessage, p2, p3)
			-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction (upval), ShouldSuppressUnreadForTabMetadataModule (upval), Signal2 (copy), markTabUnread (upval)
			if not GetFFlagTextChatEnableUniverseChatTabsFunction() and not TextChatMessage.TextChannel or p2 then return end
			if GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() and ShouldSuppressUnreadForTabMetadataModule(TextChatMessage.Metadata) then return end
			local Name = nil
			
			if GetFFlagTextChatEnableUniverseChatTabsFunction() then
				if p3 then
					Name = p3
				else
					if not TextChatMessage.TextChannel then return end
					Name = TextChatMessage.TextChannel.Name
				end
			end
			Signal2(function(p4)
				-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), TextChatMessage (copy), Name (ref), markTabUnread (upval)
				if not GetFFlagTextChatEnableUniverseChatTabsFunction() then
					local TextChannel = TextChatMessage.TextChannel
					
					if TextChannel == nil then
						return p4
					end
					Name = TextChannel.Name
				end
				if Name == "RBXSystem" then
					Name = "RBXGeneral"
				end
				return (markTabUnread(p4, Name))
			end)
		end,
		setSelectedTab = function(SelectedTabName)
			-- upvalues: Signal2 (copy)
			Signal2(function(Tbl)
				-- upvalues: SelectedTabName (copy)
				local AllChannelTab = Tbl.allChannelTabs[SelectedTabName]
				
				if Tbl.selectedTabName == SelectedTabName and (AllChannelTab == nil or not AllChannelTab.HasUnreadMessages) then
					return Tbl
				end
				local Copy = table.clone(Tbl)
				Copy.selectedTabName = SelectedTabName
				
				if Copy.allChannelTabs[SelectedTabName] then
					Copy.allChannelTabs = table.clone(Copy.allChannelTabs)
					local Copy1 = table.clone(Copy.allChannelTabs[SelectedTabName])
					Copy1.HasUnreadMessages = false
					Copy.allChannelTabs[SelectedTabName] = Copy1
				end
				return Copy
			end)
		end,
		setTargetChannel = function(SelectedTabName, p2, p3)
			-- upvalues: Signal2 (copy), isTargetChannelNoOp (upval), FFlagExpChatGlobalTabDefaultModule (upval), reorderTabs (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), FFlagExpChatFriendsTabRequireDefaultChannels (upval), FFlagExpChatEnableFriendsTab (upval), Callback (upval)
			Signal2(function(Tbl)
				-- upvalues: isTargetChannelNoOp (upval), SelectedTabName (copy), p2 (copy), p3 (copy), FFlagExpChatGlobalTabDefaultModule (upval), reorderTabs (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), FFlagExpChatFriendsTabRequireDefaultChannels (upval), FFlagExpChatEnableFriendsTab (upval), Callback (upval)
				if isTargetChannelNoOp(Tbl, SelectedTabName, p2, p3) then
					return Tbl
				end
				local Copy = table.clone(Tbl)
				
				if FFlagExpChatGlobalTabDefaultModule and p3 then
					Copy.hasUserSelectedTab = true
				end
				if SelectedTabName and Copy.allChannelTabs[SelectedTabName] then
					local AllChannelTab = Copy.allChannelTabs[SelectedTabName]
					local config = {
						type = AllChannelTab.type,
						name = AllChannelTab.name,
						tabIndex = if p2 then 0 else AllChannelTab.tabIndex,
						HasUnreadMessages = AllChannelTab.type == "FriendsChat" and AllChannelTab.HasUnreadMessages
					}
					local Copy1 = table.clone(Copy.allChannelTabs)
					Copy1[config.name] = config
					Copy.allChannelTabs = reorderTabs(Copy1)
					Copy.selectedTabName = AllChannelTab.name
					
					return Copy
				elseif SelectedTabName == nil or (if GetFFlagTextChatEnableUniverseChatTabsFunction() then not Copy.channelTabsConfigurationEnabled else FFlagExpChatFriendsTabRequireDefaultChannels and (FFlagExpChatEnableFriendsTab and not Copy.channelTabsConfigurationEnabled)) and Callback(SelectedTabName) == nil then
					return Copy
				else
					Copy.selectedTabName = SelectedTabName
					
					return Copy
				end
			end)
		end,
		addChannelTab = function(p2, p3)
			-- upvalues: Signal2 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), FFlagExpChatFriendsTabRequireDefaultChannels (upval), FFlagExpChatEnableFriendsTab (upval), reorderTabs (upval), Callback (upval), FFlagExpChatGlobalTabDefaultModule (upval), GetDefaultTabNameModule (upval), IsGlobalTabFirstModule (upval)
			local Name = p2.name
			Signal2(function(Tbl)
				-- upvalues: Name (copy), p2 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), FFlagExpChatFriendsTabRequireDefaultChannels (upval), FFlagExpChatEnableFriendsTab (upval), p3 (copy), reorderTabs (upval), Callback (upval), FFlagExpChatGlobalTabDefaultModule (upval), GetDefaultTabNameModule (upval), IsGlobalTabFirstModule (upval)
				if Tbl.allChannelTabs[Name] ~= nil then
					return Tbl
				end
				if p2.type == "TextChat" and Name ~= "RBXGeneral" and (if GetFFlagTextChatEnableUniverseChatTabsFunction() then not Tbl.channelTabsConfigurationEnabled else FFlagExpChatFriendsTabRequireDefaultChannels and (FFlagExpChatEnableFriendsTab and not Tbl.channelTabsConfigurationEnabled)) then
					return Tbl
				end
				local Copy = table.clone(Tbl)
				local AllChannelTabs = Copy.allChannelTabs
				
				if p3 ~= nil then
					local t = {}
					
					for i, allChannelTab in Copy.allChannelTabs do
						if p3 <= allChannelTab.tabIndex then
							local Copy2 = table.clone(allChannelTab)
							Copy2.tabIndex = allChannelTab.tabIndex + 1
							t[i] = Copy2
						else
							t[i] = allChannelTab
						end
					end
					AllChannelTabs = t
				end
				local config = {
					HasUnreadMessages = false,
					type = p2.type,
					name = Name,
					tabIndex = p3 or 0
				}
				local Copy1 = table.clone(AllChannelTabs)
				Copy1[config.name] = config
				Copy.allChannelTabs = reorderTabs(Copy1)
				local v1 = Callback(Name)
				local v2 = Callback(Copy.selectedTabName)
				
				if Copy.selectedTabName ~= nil then
					if v1 ~= nil and v1 < (v2 or 1e999) and (not FFlagExpChatEnableFriendsTab or v2 ~= nil) and (not FFlagExpChatGlobalTabDefaultModule or not IsGlobalTabFirstModule() or Name ~= "RBXGlobal" or not Copy.hasUserSelectedTab) then
						Copy.selectedTabName = Name
					end
				elseif p2.type ~= "TextChat" then
					if FFlagExpChatGlobalTabDefaultModule then
						Copy.selectedTabName = GetDefaultTabNameModule(Copy.allChannelTabs) or Name
						
						return Copy
					else
						Copy.selectedTabName = if Copy.allChannelTabs.RBXGeneral then "RBXGeneral" else Name
						
						return Copy
					end
				end
				return Copy
			end)
		end,
		handleLocalTextChannelParticipantAdded = function(p4)
			-- upvalues: ShouldRenderTextChannelInDefaultWindowFunction (upval), GetTextChannelDisplayModeFunction (upval), Signal2 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), FFlagExpChatFriendsTabRequireDefaultChannels (upval), FFlagExpChatEnableFriendsTab (upval), reorderTabs (upval), Callback (upval), FFlagExpChatGlobalTabDefaultModule (upval), GetDefaultTabNameModule (upval), IsGlobalTabFirstModule (upval)
			if p4.Name == "RBXSystem" then return end
			if ShouldRenderTextChannelInDefaultWindowFunction(p4, GetTextChannelDisplayModeFunction()) then
				local config = { type = "TextChat", name = p4.Name }
				local Name = config.name
				local v1 = nil
				Signal2(function(Tbl)
					-- upvalues: Name (copy), config (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), FFlagExpChatFriendsTabRequireDefaultChannels (upval), FFlagExpChatEnableFriendsTab (upval), v1 (copy), reorderTabs (upval), Callback (upval), FFlagExpChatGlobalTabDefaultModule (upval), GetDefaultTabNameModule (upval), IsGlobalTabFirstModule (upval)
					if Tbl.allChannelTabs[Name] ~= nil then
						return Tbl
					end
					if config.type == "TextChat" and Name ~= "RBXGeneral" and (if GetFFlagTextChatEnableUniverseChatTabsFunction() then not Tbl.channelTabsConfigurationEnabled else FFlagExpChatFriendsTabRequireDefaultChannels and (FFlagExpChatEnableFriendsTab and not Tbl.channelTabsConfigurationEnabled)) then
						return Tbl
					end
					local Copy = table.clone(Tbl)
					local AllChannelTabs = Copy.allChannelTabs
					
					if v1 ~= nil then
						local t = {}
						
						for i, allChannelTab in Copy.allChannelTabs do
							if v1 <= allChannelTab.tabIndex then
								local Copy2 = table.clone(allChannelTab)
								Copy2.tabIndex = allChannelTab.tabIndex + 1
								t[i] = Copy2
							else
								t[i] = allChannelTab
							end
						end
						AllChannelTabs = t
					end
					local config = {
						HasUnreadMessages = false,
						type = config.type,
						name = Name,
						tabIndex = v1 or 0
					}
					local Copy1 = table.clone(AllChannelTabs)
					Copy1[config.name] = config
					Copy.allChannelTabs = reorderTabs(Copy1)
					local v2 = Callback(Name)
					local v3 = Callback(Copy.selectedTabName)
					
					if Copy.selectedTabName ~= nil then
						if v2 ~= nil and v2 < (v3 or 1e999) and (not FFlagExpChatEnableFriendsTab or v3 ~= nil) and (not FFlagExpChatGlobalTabDefaultModule or not IsGlobalTabFirstModule() or Name ~= "RBXGlobal" or not Copy.hasUserSelectedTab) then
							Copy.selectedTabName = Name
						end
					elseif config.type ~= "TextChat" then
						if FFlagExpChatGlobalTabDefaultModule then
							Copy.selectedTabName = GetDefaultTabNameModule(Copy.allChannelTabs) or Name
							
							return Copy
						else
							Copy.selectedTabName = if Copy.allChannelTabs.RBXGeneral then "RBXGeneral" else Name
							
							return Copy
						end
					end
					return Copy
				end)
				
				return
			end
		end,
		handleChannelRemoved = function(p5)
			-- upvalues: Signal2 (copy), reorderTabs (upval), FFlagExpChatGlobalTabDefaultModule (upval), GetDefaultTabNameModule (upval)
			Signal2(function(Tbl)
				-- upvalues: p5 (copy), reorderTabs (upval), FFlagExpChatGlobalTabDefaultModule (upval), GetDefaultTabNameModule (upval)
				local AllChannelTab = Tbl.allChannelTabs[p5]
				
				if AllChannelTab == nil then
					return Tbl
				end
				local Copy = table.clone(Tbl)
				local Copy1 = table.clone(Copy.allChannelTabs)
				Copy1[AllChannelTab.name] = nil
				Copy.allChannelTabs = reorderTabs(Copy1)
				
				if AllChannelTab.name == Copy.selectedTabName then
					if FFlagExpChatGlobalTabDefaultModule then
						Copy.selectedTabName = GetDefaultTabNameModule(Copy.allChannelTabs)
					else
						Copy.selectedTabName = if Copy.allChannelTabs.RBXGeneral then "RBXGeneral" else nil
					end
				end
				if Copy.selectedTabName and Copy.allChannelTabs[Copy.selectedTabName] then
					Copy.allChannelTabs = table.clone(Copy.allChannelTabs)
					local Copy2 = table.clone(Copy.allChannelTabs[Copy.selectedTabName])
					Copy2.HasUnreadMessages = false
					Copy.allChannelTabs[Copy.selectedTabName] = Copy2
				end
				return Copy
			end)
		end,
		markChannelUnread = function(p5)
			-- upvalues: Signal2 (copy), markTabUnread (upval)
			Signal2(function(p6)
				-- upvalues: markTabUnread (upval), p5 (copy)
				return (markTabUnread(p6, p5))
			end)
		end,
		setChannelUnreadStatus = function(p5, HasUnreadMessages)
			-- upvalues: Signal2 (copy)
			Signal2(function(Tbl)
				-- upvalues: p5 (copy), HasUnreadMessages (copy)
				local AllChannelTab = Tbl.allChannelTabs[p5]
				
				if AllChannelTab == nil or AllChannelTab.HasUnreadMessages == HasUnreadMessages then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					Copy.allChannelTabs = table.clone(Copy.allChannelTabs)
					local Copy1 = table.clone(Copy.allChannelTabs[p5])
					Copy1.HasUnreadMessages = HasUnreadMessages
					Copy.allChannelTabs[p5] = Copy1
					
					return Copy
				end
			end)
		end,
		setChannelTabsConfigurationEnabled = function(ChannelTabsConfigurationEnabled)
			-- upvalues: Signal2 (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (upval), GetFFlagExpChatFixChannelTabsMidExperienceToggleModule (upval), pruneNonSpecialTabs (upval), FFlagExpChatGlobalTabDefaultModule (upval), GetDefaultTabNameModule (upval)
			Signal2(function(Tbl)
				-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), GetFFlagExpChatFixChannelTabsMidExperienceToggleModule (upval), ChannelTabsConfigurationEnabled (copy), pruneNonSpecialTabs (upval), FFlagExpChatGlobalTabDefaultModule (upval), GetDefaultTabNameModule (upval)
				if not GetFFlagTextChatEnableUniverseChatTabsFunction() then
					return Tbl
				end
				if not GetFFlagExpChatFixChannelTabsMidExperienceToggleModule() or ChannelTabsConfigurationEnabled then
					local Copy = table.clone(Tbl)
					Copy.channelTabsConfigurationEnabled = ChannelTabsConfigurationEnabled
					
					return Copy
				end
				local PruneNonSpecialTabsResult = pruneNonSpecialTabs(Tbl.allChannelTabs)
				local SelectedTabName = Tbl.selectedTabName
				
				if SelectedTabName == nil or PruneNonSpecialTabsResult[SelectedTabName] == nil then
					SelectedTabName = if FFlagExpChatGlobalTabDefaultModule then GetDefaultTabNameModule(PruneNonSpecialTabsResult) or (if PruneNonSpecialTabsResult.RBXGlobal then "RBXGlobal" else nil) elseif PruneNonSpecialTabsResult.RBXGeneral then "RBXGeneral" elseif PruneNonSpecialTabsResult.RBXGlobal then "RBXGlobal" else nil
				end
				if SelectedTabName and PruneNonSpecialTabsResult[SelectedTabName] then
					PruneNonSpecialTabsResult[SelectedTabName].HasUnreadMessages = false
				end
				return {
					channelTabsConfigurationEnabled = false,
					allChannelTabs = PruneNonSpecialTabsResult,
					selectedTabName = SelectedTabName,
					hasUserSelectedTab = Tbl.hasUserSelectedTab
				}
			end)
		end
	}
end