local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local expChatSharedModule = require(parent.ExpChatShared)
local shouldRenderTextChannelInDefaultWindow = expChatSharedModule.shouldRenderTextChannelInDefaultWindow
local getTextChannelDisplayMode = expChatSharedModule.getTextChannelDisplayMode
local sharedFlagsModule = require(parent.SharedFlags)
local var1 = expChatSharedModule.Logger:new("ExpChat/Reducers/" .. script.Name)
local actions = expChat.Actions
local localTextChannelParticipantAddedModule = require(actions.LocalTextChannelParticipantAdded)
local localTextChannelParticipantRemoved = expChatSharedModule.Actions.LocalTextChannelParticipantRemoved
local textChannelRemoved = expChatSharedModule.Actions.TextChannelRemoved
local targetTextChannelPropertyChanged = expChatSharedModule.Actions.TargetTextChannelPropertyChanged
local textChatChannelSelected = expChatSharedModule.Actions.TextChatChannelSelected
local incomingMessageReceivedModule = require(actions.IncomingMessageReceived)
local universeChatSystemMessageAddedModule = require(actions.UniverseChatSystemMessageAdded)
local universeChatChannelAddedModule = require(actions.UniverseChatChannelAdded)
local universeChatChannelSelected = expChatSharedModule.Actions.UniverseChatChannelSelected
local friendsChatChannelAddedModule = require(actions.FriendsChatChannelAdded)
local friendsChatChannelRemovedModule = require(actions.FriendsChatChannelRemoved)
local friendsChatChannelSelected = expChatSharedModule.Actions.FriendsChatChannelSelected
local friendsChatTabNameModule = require(parent.FriendsChat.FriendsChatTabName)
local markChannelUnreadForSystemMessageModule = require(actions.MarkChannelUnreadForSystemMessage)
local markChannelUnreadForIncomingMessageModule = require(actions.MarkChannelUnreadForIncomingMessage)
local setChannelUnreadStatusModule = require(actions.SetChannelUnreadStatus)
local fFlagExpChatUnreadTabIndicatorV2WindowModule = require(expChat.Flags.FFlagExpChatUnreadTabIndicatorV2Window)
local getFFlagExpChatFixChannelTabsMidExperienceToggleModule = require(expChat.Flags.getFFlagExpChatFixChannelTabsMidExperienceToggle)
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagExpChatFriendsTabRequireDefaultChannels = sharedFlagsModule.FFlagExpChatFriendsTabRequireDefaultChannels
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local getFFlagExpChatSuppressWelcomeMessageTabUnread = expChatSharedModule.Flags.GetFFlagExpChatSuppressWelcomeMessageTabUnread
local channelTabsConfigurationEnabledModule = require(actions.ChannelTabsConfigurationEnabled)
local shouldSuppressUnreadForTabMetadataModule = require(expChat.shouldSuppressUnreadForTabMetadata)
local isGlobalTabFirstModule = require(expChat.isGlobalTabFirst)
local getDefaultTabNameModule = require(expChat.getDefaultTabName)
local fFlagExpChatGlobalTabDefaultModule = require(expChat.Flags.FFlagExpChatGlobalTabDefault)
local t = {
	selectedTabName = nil,
	channelTabsConfigurationEnabled = false,
	hasUserSelectedTab = false,
	allChannelTabs = {}
}

local function insertTabAndReorder(p1, p2)
	-- upvalues: dictionary (ref)
	local t = { [p2.Name] = p2 }
	
	for i, v in p1 do
		t = dictionary.join(t, {
			[i] = dictionary.set(p1[i], "TabIndex", if v.TabIndex < p2.TabIndex then v.TabIndex else v.TabIndex + 1)
		})
	end
	return t
end

local function _(p3)
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref)
	return if fFlagExpChatEnableFriendsTab then p3[friendsChatTabNameModule] ~= nil else false
end

local _ = function(p3)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref)
	return (if p3.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and p3.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else p3[friendsChatTabNameModule] ~= nil then 1 else 0)
end

local _ = function(p3)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref)
	return (if p3.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and p3.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else p3[friendsChatTabNameModule] ~= nil then 1 else 0) + 1
end

local _ = function(p3, p4)
	-- upvalues: fFlagExpChatGlobalTabDefaultModule (ref), isGlobalTabFirstModule (ref)
	return if fFlagExpChatGlobalTabDefaultModule and isGlobalTabFirstModule() then if p3 == "RBXGlobal" then 1 elseif p4.RBXGlobal then 2 else 1 elseif p3 == "RBXGeneral" then 1 elseif p4.RBXGeneral then 2 else 1
end

local _ = function(p3)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref)
	return (if p3.RBXGeneral ~= nil then 1 else 0) + 1 + (if getFFlagTextChatEnableUniverseChatTabs() and p3.RBXGlobal ~= nil then 1 else 0)
end

local function removeTabAndReorder(p3, p4)
	-- upvalues: dictionary (ref)
	if p4 == nil then
		return p3
	end
	local t = {}
	
	for i, v in p3 do
		if i ~= p4.Name then
			t = dictionary.join(t, {
				[i] = dictionary.set(p3[i], "TabIndex", if v.TabIndex < p4.TabIndex then v.TabIndex else v.TabIndex - 1)
			})
		end
	end
	return t
end

local function removeChannelTab(p5, p6)
	-- upvalues: removeTabAndReorder (ref), fFlagExpChatGlobalTabDefaultModule (ref), getDefaultTabNameModule (ref), dictionary (ref)
	local var2 = p5.allChannelTabs[p6]
	
	if var2 == nil then
		return p5
	end
	local var3 = removeTabAndReorder(p5.allChannelTabs, var2)
	local var4 = if var2.Name == p5.selectedTabName then if fFlagExpChatGlobalTabDefaultModule then getDefaultTabNameModule(var3) elseif var3.RBXGeneral then "RBXGeneral" else nil else p5.selectedTabName
	
	return {
		allChannelTabs = if var4 and var3[var4] then dictionary.join(var3, {
			[var4] = dictionary.join(var3[var4], { HasUnreadMessages = false })
		}) else var3,
		selectedTabName = var4,
		channelTabsConfigurationEnabled = p5.channelTabsConfigurationEnabled,
		hasUserSelectedTab = if fFlagExpChatGlobalTabDefaultModule then p5.hasUserSelectedTab else nil
	}
end

local function onChannelRemoved(p5, p6)
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), removeTabAndReorder (ref), fFlagExpChatGlobalTabDefaultModule (ref), getDefaultTabNameModule (ref), dictionary (ref), removeChannelTab (ref)
	if fFlagExpChatEnableFriendsTab then
		return removeChannelTab(p5, p6.Name)
	end
	local name = p5.allChannelTabs[p6.Name]
	
	if name == nil then
		return p5
	end
	local var2 = removeTabAndReorder(p5.allChannelTabs, name)
	local var3 = if name.Name == p5.selectedTabName then if fFlagExpChatGlobalTabDefaultModule then getDefaultTabNameModule(var2) elseif var2.RBXGeneral then "RBXGeneral" else nil else p5.selectedTabName
	
	return {
		allChannelTabs = if var3 and var2[var3] then dictionary.join(var2, {
			[var3] = dictionary.join(var2[var3], { HasUnreadMessages = false })
		}) else var2,
		selectedTabName = var3,
		channelTabsConfigurationEnabled = p5.channelTabsConfigurationEnabled,
		hasUserSelectedTab = if fFlagExpChatGlobalTabDefaultModule then p5.hasUserSelectedTab else nil
	}
end

local function handleIncomingMessageReceived(a, b)
	-- upvalues: var1 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatSuppressWelcomeMessageTabUnread (ref), shouldSuppressUnreadForTabMetadataModule (ref), dictionary (ref)
	var1:trace("IncomingMessageReceived dispatched")
	local var2 = nil
	
	if getFFlagTextChatEnableUniverseChatTabs() and b.channelNameOverride then
		var2 = b.channelNameOverride
	elseif b.textChatMessage.TextChannel then
		var2 = if b.textChatMessage.TextChannel.Name == "RBXSystem" then "RBXGeneral" else b.textChatMessage.TextChannel.Name
	end
	local var3 = a.allChannelTabs[var2]
	
	return if var3 == nil then a elseif b.isSenderLocalPlayer or var3.Name == a.selectedTabName then a elseif getFFlagExpChatSuppressWelcomeMessageTabUnread() and shouldSuppressUnreadForTabMetadataModule(b.textChatMessage.Metadata) then a else dictionary.join(a, {
		allChannelTabs = dictionary.join(a.allChannelTabs, {
			[var3.Name] = dictionary.join(var3, { HasUnreadMessages = true })
		})
	})
end

local function handleUniverseChatSystemMessageAdded(p5, p6)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatSuppressWelcomeMessageTabUnread (ref), shouldSuppressUnreadForTabMetadataModule (ref), dictionary (ref)
	if not getFFlagTextChatEnableUniverseChatTabs() then
		return p5
	end
	local channelNameOverride = p5.allChannelTabs[p6.channelNameOverride]
	
	return if channelNameOverride == nil then p5 elseif channelNameOverride.Name == p5.selectedTabName then p5 elseif getFFlagExpChatSuppressWelcomeMessageTabUnread() and shouldSuppressUnreadForTabMetadataModule(p6.metadata or "") then p5 else dictionary.join(p5, {
		allChannelTabs = dictionary.join(p5.allChannelTabs, {
			[channelNameOverride.Name] = dictionary.join(channelNameOverride, { HasUnreadMessages = true })
		})
	})
end

local function pruneNonSpecialTabs(value)
	-- upvalues: fFlagExpChatGlobalTabDefaultModule (ref), dictionary (ref), isGlobalTabFirstModule (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref)
	local t = {}
	local var2 = value.RBXGeneral ~= nil
	
	if var2 then
		if fFlagExpChatGlobalTabDefaultModule then
			t.RBXGeneral = dictionary.set(value.RBXGeneral, "TabIndex", if fFlagExpChatGlobalTabDefaultModule and isGlobalTabFirstModule() then if value.RBXGlobal then 2 else 1 else 1)
		else
			t.RBXGeneral = dictionary.set(value.RBXGeneral, "TabIndex", 1)
		end
	end
	if value.RBXGlobal ~= nil then
		if fFlagExpChatGlobalTabDefaultModule then
			t.RBXGlobal = dictionary.set(value.RBXGlobal, "TabIndex", if fFlagExpChatGlobalTabDefaultModule and isGlobalTabFirstModule() then 1 elseif value.RBXGeneral then 2 else 1)
		else
			t.RBXGlobal = dictionary.set(value.RBXGlobal, "TabIndex", if var2 then 2 else 1)
		end
	end
	if if not fFlagExpChatEnableFriendsTab then false else value[friendsChatTabNameModule] ~= nil then
		t[friendsChatTabNameModule] = value[friendsChatTabNameModule]
	end
	return t
end

local _ = function(p5)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatFriendsTabRequireDefaultChannels (ref), fFlagExpChatEnableFriendsTab (ref)
	local var2
	if not getFFlagTextChatEnableUniverseChatTabs() then
		var2 = fFlagExpChatFriendsTabRequireDefaultChannels and (fFlagExpChatEnableFriendsTab and not p5.channelTabsConfigurationEnabled)
	end
	return var2
end

local function selectTextChannelTabByName(p5, p6, p7)
	-- upvalues: fFlagExpChatGlobalTabDefaultModule (ref), isGlobalTabFirstModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref), dictionary (ref), insertTabAndReorder (ref), removeTabAndReorder (ref), fFlagExpChatFriendsTabRequireDefaultChannels (ref)
	local var2
	if p6 and p5.allChannelTabs[p6] then
		local var3 = p5.allChannelTabs[p6]
		local tabIndex = var3.TabIndex
		
		if p7 then
			if var3.Name == "RBXGeneral" then
				tabIndex = if fFlagExpChatGlobalTabDefaultModule then if fFlagExpChatGlobalTabDefaultModule and isGlobalTabFirstModule() then if p5.allChannelTabs.RBXGlobal then 2 else 1 else 1 else 1
			elseif not getFFlagTextChatEnableUniverseChatTabs() or var3.Name ~= "RBXGlobal" then
				local allChannelTabs = p5.allChannelTabs
				tabIndex = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else allChannelTabs[friendsChatTabNameModule] ~= nil then 1 else 0) + 1
			tabIndex = if fFlagExpChatGlobalTabDefaultModule then if fFlagExpChatGlobalTabDefaultModule and isGlobalTabFirstModule() then 1 elseif p5.allChannelTabs.RBXGeneral then 2 else 1 elseif p5.allChannelTabs.RBXGeneral then 2 else 1
		end
		return dictionary.join(p5, {
			allChannelTabs = insertTabAndReorder(removeTabAndReorder(p5.allChannelTabs, var3), dictionary.join(var3, { HasUnreadMessages = false, TabIndex = tabIndex })),
			selectedTabName = var3.Name
		})
	elseif not getFFlagTextChatEnableUniverseChatTabs() then
		var2 = fFlagExpChatFriendsTabRequireDefaultChannels and (fFlagExpChatEnableFriendsTab and not p5.channelTabsConfigurationEnabled)
	end
	return if var2 then p5 else dictionary.join(p5, { selectedTabName = p6 })
end

return roduxModule.createReducer(t, {
	[channelTabsConfigurationEnabledModule.name] = function(p8, p9)
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (ref), dictionary (ref), pruneNonSpecialTabs (ref), fFlagExpChatGlobalTabDefaultModule (ref), getDefaultTabNameModule (ref)
		if not getFFlagTextChatEnableUniverseChatTabs() then
			return p8
		elseif not getFFlagExpChatFixChannelTabsMidExperienceToggleModule() or p9.enabled then
			return dictionary.join(p8, { channelTabsConfigurationEnabled = p9.enabled })
		end
		local var4 = pruneNonSpecialTabs(p8.allChannelTabs)
		local selectedTabName = p8.selectedTabName
		
		if selectedTabName == nil or var4[selectedTabName] == nil then
			selectedTabName = if fFlagExpChatGlobalTabDefaultModule then getDefaultTabNameModule(var4) or (if var4.RBXGlobal then "RBXGlobal" else nil) elseif var4.RBXGeneral then "RBXGeneral" elseif var4.RBXGlobal then "RBXGlobal" else nil
		end
		if selectedTabName and var4[selectedTabName] then
			var4 = dictionary.join(var4, {
				[selectedTabName] = dictionary.join(var4[selectedTabName], { HasUnreadMessages = false })
			})
		end
		return {
			channelTabsConfigurationEnabled = false,
			allChannelTabs = var4,
			selectedTabName = selectedTabName,
			hasUserSelectedTab = if fFlagExpChatGlobalTabDefaultModule then p8.hasUserSelectedTab else nil
		}
	end,
	[localTextChannelParticipantAddedModule.name] = function(p8, p9)
		-- upvalues: var1 (ref), shouldRenderTextChannelInDefaultWindow (ref), getTextChannelDisplayMode (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatFriendsTabRequireDefaultChannels (ref), fFlagExpChatEnableFriendsTab (ref), fFlagExpChatGlobalTabDefaultModule (ref), isGlobalTabFirstModule (ref), friendsChatTabNameModule (ref), insertTabAndReorder (ref), dictionary (ref)
		local var4
		local name = p9.textChannel.Name
		var1:trace("LocalTextChannelParticipantAdded dispatched: {}", name)
		
		if p8.allChannelTabs[name] ~= nil or name == "RBXSystem" then
			return p8
		elseif not shouldRenderTextChannelInDefaultWindow(p9.textChannel, getTextChannelDisplayMode()) then
			return p8
		elseif not getFFlagTextChatEnableUniverseChatTabs() then
			var4 = fFlagExpChatFriendsTabRequireDefaultChannels and (fFlagExpChatEnableFriendsTab and not p8.channelTabsConfigurationEnabled)
		end
		if var4 and name ~= "RBXGeneral" then
			return p8
		end
		local var5
		local _ = nil
		
		if name == "RBXGeneral" then
			var5 = if fFlagExpChatGlobalTabDefaultModule then if fFlagExpChatGlobalTabDefaultModule and isGlobalTabFirstModule() then if p8.allChannelTabs.RBXGlobal then 2 else 1 else 1 else 1
		elseif not getFFlagTextChatEnableUniverseChatTabs() or name ~= "RBXGlobal" then
			local allChannelTabs = p8.allChannelTabs
			var5 = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else allChannelTabs[friendsChatTabNameModule] ~= nil then 1 else 0) + 1
		var5 = if fFlagExpChatGlobalTabDefaultModule then if fFlagExpChatGlobalTabDefaultModule and isGlobalTabFirstModule() then 1 elseif p8.allChannelTabs.RBXGeneral then 2 else 1 elseif p8.allChannelTabs.RBXGeneral then 2 else 1
		local var6 = insertTabAndReorder(p8.allChannelTabs, {
			HasUnreadMessages = false,
			Name = name,
			TabIndex = var5,
			Type = "TextChat"
		})
		
		if getFFlagTextChatEnableUniverseChatTabs() then
			local selectedTabName = p8.selectedTabName
			
			if selectedTabName == "RBXGlobal" and name == "RBXGeneral" and (not fFlagExpChatGlobalTabDefaultModule or not isGlobalTabFirstModule()) then
				selectedTabName = "RBXGeneral"
			elseif fFlagExpChatEnableFriendsTab and selectedTabName == friendsChatTabNameModule and (name == "RBXGeneral" or name == "RBXGlobal") then
				selectedTabName = name
			end
			return dictionary.join(p8, {
				allChannelTabs = var6,
				selectedTabName = selectedTabName
			})
		else
			return if fFlagExpChatEnableFriendsTab and name == "RBXGeneral" and p8.selectedTabName == friendsChatTabNameModule then dictionary.join(p8, { selectedTabName = "RBXGeneral", allChannelTabs = var6 }) else dictionary.join(p8, { allChannelTabs = var6 })
		end
	end,
	[localTextChannelParticipantRemoved.name] = function(p10, p11)
		-- upvalues: var1 (ref), onChannelRemoved (ref)
		var1:trace("LocalTextChannelParticipantRemoved dispatched: {}", p11.textChannel.Name)
		
		return onChannelRemoved(p10, p11.textChannel)
	end,
	[textChannelRemoved.name] = function(p10, p11)
		-- upvalues: var1 (ref), onChannelRemoved (ref)
		var1:trace("TextChannelRemoved dispatched: {}", p11.textChannel.Name)
		
		return onChannelRemoved(p10, p11.textChannel)
	end,
	[targetTextChannelPropertyChanged.name] = function(p10, p11)
		-- upvalues: var1 (ref), selectTextChannelTabByName (ref)
		var1:trace("TargetTextChannelPropertyChanged dispatched")
		
		return selectTextChannelTabByName(p10, if p11.textChannel then p11.textChannel.Name else nil, p11.shouldReorderTabs)
	end,
	[textChatChannelSelected.name] = function(p10, p11)
		-- upvalues: var1 (ref), fFlagExpChatGlobalTabDefaultModule (ref), selectTextChannelTabByName (ref), dictionary (ref)
		var1:trace("TextChatChannelSelected dispatched: {}", p11.channelName)
		
		return if fFlagExpChatGlobalTabDefaultModule then selectTextChannelTabByName(dictionary.join(p10, { hasUserSelectedTab = true }), p11.channelName, p11.shouldReorderTabs) else selectTextChannelTabByName(p10, p11.channelName, p11.shouldReorderTabs)
	end,
	[incomingMessageReceivedModule.name] = handleIncomingMessageReceived,
	[markChannelUnreadForIncomingMessageModule.name] = if fFlagExpChatUnreadTabIndicatorV2WindowModule then handleIncomingMessageReceived else nil,
	[universeChatSystemMessageAddedModule.name] = handleUniverseChatSystemMessageAdded,
	[markChannelUnreadForSystemMessageModule.name] = if fFlagExpChatUnreadTabIndicatorV2WindowModule then handleUniverseChatSystemMessageAdded else nil,
	[universeChatChannelAddedModule.name] = function(p10, p11)
		-- upvalues: var1 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatGlobalTabDefaultModule (ref), isGlobalTabFirstModule (ref), insertTabAndReorder (ref), getDefaultTabNameModule (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref), dictionary (ref)
		var1:trace("UniverseChatChannelAdded dispatched: {}", p11.channelName)
		
		if p10.allChannelTabs[p11.channelName] ~= nil then
			return p10
		end
		local tabIndex = p11.tabIndex
		
		if getFFlagTextChatEnableUniverseChatTabs() and p11.channelName == "RBXGlobal" then
			tabIndex = if fFlagExpChatGlobalTabDefaultModule then if fFlagExpChatGlobalTabDefaultModule and isGlobalTabFirstModule() then 1 elseif p10.allChannelTabs.RBXGeneral then 2 else 1 elseif p10.allChannelTabs.RBXGeneral then 2 else 1
		end
		local selectedTabName
		local var7 = insertTabAndReorder(p10.allChannelTabs, {
			HasUnreadMessages = false,
			Name = p11.channelName,
			TabIndex = tabIndex,
			Type = "UniverseChat"
		})
		local _ = nil
		
		if getFFlagTextChatEnableUniverseChatTabs() then
			selectedTabName = p10.selectedTabName
			
			if selectedTabName == nil then
				selectedTabName = if fFlagExpChatGlobalTabDefaultModule then getDefaultTabNameModule(var7) or p11.channelName elseif var7.RBXGeneral then "RBXGeneral" else p11.channelName
			elseif fFlagExpChatGlobalTabDefaultModule and isGlobalTabFirstModule() and (p11.channelName == "RBXGlobal" and not p10.hasUserSelectedTab) then
				selectedTabName = p11.channelName
			elseif fFlagExpChatEnableFriendsTab and selectedTabName == friendsChatTabNameModule then
				selectedTabName = p11.channelName
			end
		else
			selectedTabName = p10.selectedTabName or p11.channelName
		end
		return dictionary.join(p10, {
			allChannelTabs = var7,
			selectedTabName = selectedTabName
		})
	end,
	[friendsChatChannelAddedModule.name] = function(p10, p11)
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var1 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), insertTabAndReorder (ref), fFlagExpChatGlobalTabDefaultModule (ref), getDefaultTabNameModule (ref), dictionary (ref)
		if not fFlagExpChatEnableFriendsTab then
			return p10
		end
		var1:trace("FriendsChatChannelAdded dispatched: {}", p11.channelName)
		
		if p10.allChannelTabs[p11.channelName] ~= nil then
			return p10
		end
		local t = {
			HasUnreadMessages = false,
			Type = "FriendsChat",
			Name = p11.channelName
		}
		local allChannelTabs = p10.allChannelTabs
		t.TabIndex = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + 1 + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0)
		local var7 = insertTabAndReorder(p10.allChannelTabs, t)
		local selectedTabName = p10.selectedTabName
		
		if selectedTabName == nil then
			selectedTabName = if fFlagExpChatGlobalTabDefaultModule then getDefaultTabNameModule(var7) or p11.channelName elseif var7.RBXGeneral then "RBXGeneral" else p11.channelName
		end
		return dictionary.join(p10, {
			allChannelTabs = var7,
			selectedTabName = selectedTabName
		})
	end,
	[friendsChatChannelRemovedModule.name] = function(p10, p11)
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var1 (ref), removeChannelTab (ref)
		if fFlagExpChatEnableFriendsTab then
			var1:trace("FriendsChatChannelRemoved dispatched: {}", p11.channelName)
			
			return removeChannelTab(p10, p11.channelName)
		end
		return p10
	end,
	[friendsChatChannelSelected.name] = function(p10, p11)
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var1 (ref), dictionary (ref)
		if fFlagExpChatEnableFriendsTab then
			var1:trace("FriendsChatChannelSelected dispatched: {}", p11.channelName)
			
			return dictionary.join(p10, { selectedTabName = p11.channelName })
		end
		return p10
	end,
	[setChannelUnreadStatusModule.name] = function(p10, p11)
		-- upvalues: dictionary (ref)
		local channelName = p10.allChannelTabs[p11.channelName]
		
		return if channelName == nil then p10 else dictionary.join(p10, {
			allChannelTabs = dictionary.join(p10.allChannelTabs, {
				[p11.channelName] = dictionary.join(channelName, { HasUnreadMessages = p11.hasUnreadMessages })
			})
		})
	end,
	[universeChatChannelSelected.name] = function(p10, p11)
		-- upvalues: var1 (ref), fFlagExpChatGlobalTabDefaultModule (ref), dictionary (ref)
		var1:trace("UniverseChatChannelSelected dispatched: {}", p11.channelName)
		local channelName = p10.allChannelTabs[p11.channelName]
		
		return if channelName == nil then if fFlagExpChatGlobalTabDefaultModule then dictionary.join(p10, {
			selectedTabName = p11.channelName,
			hasUserSelectedTab = if p11.isUserInitiated then true else nil
		}) else dictionary.join(p10, { selectedTabName = p11.channelName }) else dictionary.join(p10, {
			allChannelTabs = dictionary.join(p10.allChannelTabs, {
				[p11.channelName] = dictionary.join(channelName, { HasUnreadMessages = false })
			}),
			selectedTabName = p11.channelName,
			hasUserSelectedTab = if fFlagExpChatGlobalTabDefaultModule and p11.isUserInitiated then true else nil
		})
	end
})