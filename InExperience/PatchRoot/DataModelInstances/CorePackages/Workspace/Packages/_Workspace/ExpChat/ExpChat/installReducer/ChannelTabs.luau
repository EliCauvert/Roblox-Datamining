local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local expChatSharedModule = require(parent.ExpChatShared)
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
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local getFFlagExpChatSuppressWelcomeMessageTabUnread = expChatSharedModule.Flags.GetFFlagExpChatSuppressWelcomeMessageTabUnread
local channelTabsConfigurationEnabledModule = require(actions.ChannelTabsConfigurationEnabled)
local shouldSuppressUnreadForTabMetadataModule = require(expChat.shouldSuppressUnreadForTabMetadata)
local t = {
	selectedTabName = nil,
	channelTabsConfigurationEnabled = false,
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
	-- upvalues: removeTabAndReorder (ref), dictionary (ref)
	local var2 = p5.allChannelTabs[p6]
	
	if var2 == nil then
		return p5
	end
	local var3 = removeTabAndReorder(p5.allChannelTabs, var2)
	local var4 = if var2.Name == p5.selectedTabName then if var3.RBXGeneral then "RBXGeneral" else nil else p5.selectedTabName
	
	return {
		allChannelTabs = if var4 and var3[var4] then dictionary.join(var3, {
			[var4] = dictionary.join(var3[var4], { HasUnreadMessages = false })
		}) else var3,
		selectedTabName = var4,
		channelTabsConfigurationEnabled = p5.channelTabsConfigurationEnabled
	}
end

local function onChannelRemoved(p5, p6)
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), removeTabAndReorder (ref), dictionary (ref), removeChannelTab (ref)
	if fFlagExpChatEnableFriendsTab then
		return removeChannelTab(p5, p6.Name)
	end
	local name = p5.allChannelTabs[p6.Name]
	
	if name == nil then
		return p5
	end
	local var2 = removeTabAndReorder(p5.allChannelTabs, name)
	local var3 = if name.Name == p5.selectedTabName then if var2.RBXGeneral then "RBXGeneral" else nil else p5.selectedTabName
	
	return {
		allChannelTabs = if var3 and var2[var3] then dictionary.join(var2, {
			[var3] = dictionary.join(var2[var3], { HasUnreadMessages = false })
		}) else var2,
		selectedTabName = var3,
		channelTabsConfigurationEnabled = p5.channelTabsConfigurationEnabled
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
	-- upvalues: dictionary (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref)
	local t = {}
	local var2 = value.RBXGeneral ~= nil
	
	if var2 then
		t.RBXGeneral = dictionary.set(value.RBXGeneral, "TabIndex", 1)
	end
	if value.RBXGlobal ~= nil then
		t.RBXGlobal = dictionary.set(value.RBXGlobal, "TabIndex", if var2 then 2 else 1)
	end
	if if not fFlagExpChatEnableFriendsTab then false else value[friendsChatTabNameModule] ~= nil then
		t[friendsChatTabNameModule] = value[friendsChatTabNameModule]
	end
	return t
end

local function selectTextChannelTabByName(p5, p6, p7)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref), dictionary (ref), insertTabAndReorder (ref), removeTabAndReorder (ref)
	if p6 and p5.allChannelTabs[p6] then
		local var2 = p5.allChannelTabs[p6]
		local tabIndex = var2.TabIndex
		
		if p7 then
			if var2.Name == "RBXGeneral" then
				tabIndex = 1
			elseif getFFlagTextChatEnableUniverseChatTabs() and var2.Name == "RBXGlobal" then
				tabIndex = if p5.allChannelTabs.RBXGeneral then 2 else 1
			else
				local allChannelTabs = p5.allChannelTabs
				tabIndex = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else allChannelTabs[friendsChatTabNameModule] ~= nil then 1 else 0) + 1
			end
		end
		return dictionary.join(p5, {
			allChannelTabs = insertTabAndReorder(removeTabAndReorder(p5.allChannelTabs, var2), dictionary.join(var2, { HasUnreadMessages = false, TabIndex = tabIndex })),
			selectedTabName = var2.Name
		})
	else
		return if getFFlagTextChatEnableUniverseChatTabs() and not p5.channelTabsConfigurationEnabled then p5 else dictionary.join(p5, { selectedTabName = p6 })
	end
end

return roduxModule.createReducer(t, {
	[channelTabsConfigurationEnabledModule.name] = function(p5, p6)
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (ref), dictionary (ref), pruneNonSpecialTabs (ref)
		if not getFFlagTextChatEnableUniverseChatTabs() then
			return p5
		elseif not getFFlagExpChatFixChannelTabsMidExperienceToggleModule() or p6.enabled then
			return dictionary.join(p5, { channelTabsConfigurationEnabled = p6.enabled })
		end
		local var2 = pruneNonSpecialTabs(p5.allChannelTabs)
		local selectedTabName = p5.selectedTabName
		
		if selectedTabName == nil or var2[selectedTabName] == nil then
			selectedTabName = if var2.RBXGeneral then "RBXGeneral" elseif var2.RBXGlobal then "RBXGlobal" else nil
		end
		if selectedTabName and var2[selectedTabName] then
			var2 = dictionary.join(var2, {
				[selectedTabName] = dictionary.join(var2[selectedTabName], { HasUnreadMessages = false })
			})
		end
		return {
			channelTabsConfigurationEnabled = false,
			allChannelTabs = var2,
			selectedTabName = selectedTabName
		}
	end,
	[localTextChannelParticipantAddedModule.name] = function(p5, p6)
		-- upvalues: var1 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref), insertTabAndReorder (ref), dictionary (ref)
		local name = p6.textChannel.Name
		var1:trace("LocalTextChannelParticipantAdded dispatched: {}", name)
		
		if p5.allChannelTabs[name] ~= nil or name == "RBXSystem" then
			return p5
		elseif getFFlagTextChatEnableUniverseChatTabs() and not p5.channelTabsConfigurationEnabled and name ~= "RBXGeneral" then
			return p5
		end
		local var2
		local _ = nil
		
		if name == "RBXGeneral" then
			var2 = 1
		elseif getFFlagTextChatEnableUniverseChatTabs() and name == "RBXGlobal" then
			var2 = if p5.allChannelTabs.RBXGeneral then 2 else 1
		else
			local allChannelTabs = p5.allChannelTabs
			var2 = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else allChannelTabs[friendsChatTabNameModule] ~= nil then 1 else 0) + 1
		end
		local var3 = insertTabAndReorder(p5.allChannelTabs, {
			HasUnreadMessages = false,
			Name = name,
			TabIndex = var2,
			Type = "TextChat"
		})
		
		if getFFlagTextChatEnableUniverseChatTabs() then
			local selectedTabName = p5.selectedTabName
			
			if selectedTabName == "RBXGlobal" and name == "RBXGeneral" then
				selectedTabName = "RBXGeneral"
			elseif fFlagExpChatEnableFriendsTab and selectedTabName == friendsChatTabNameModule and (name == "RBXGeneral" or name == "RBXGlobal") then
				selectedTabName = name
			end
			return dictionary.join(p5, {
				allChannelTabs = var3,
				selectedTabName = selectedTabName
			})
		else
			return if fFlagExpChatEnableFriendsTab and name == "RBXGeneral" and p5.selectedTabName == friendsChatTabNameModule then dictionary.join(p5, { selectedTabName = "RBXGeneral", allChannelTabs = var3 }) else dictionary.join(p5, { allChannelTabs = var3 })
		end
	end,
	[localTextChannelParticipantRemoved.name] = function(p5, p6)
		-- upvalues: var1 (ref), onChannelRemoved (ref)
		var1:trace("LocalTextChannelParticipantRemoved dispatched: {}", p6.textChannel.Name)
		
		return onChannelRemoved(p5, p6.textChannel)
	end,
	[textChannelRemoved.name] = function(p5, p6)
		-- upvalues: var1 (ref), onChannelRemoved (ref)
		var1:trace("TextChannelRemoved dispatched: {}", p6.textChannel.Name)
		
		return onChannelRemoved(p5, p6.textChannel)
	end,
	[targetTextChannelPropertyChanged.name] = function(p5, p6)
		-- upvalues: var1 (ref), selectTextChannelTabByName (ref)
		var1:trace("TargetTextChannelPropertyChanged dispatched")
		
		return selectTextChannelTabByName(p5, if p6.textChannel then p6.textChannel.Name else nil, p6.shouldReorderTabs)
	end,
	[textChatChannelSelected.name] = function(p5, p6)
		-- upvalues: var1 (ref), selectTextChannelTabByName (ref)
		var1:trace("TextChatChannelSelected dispatched: {}", p6.channelName)
		
		return selectTextChannelTabByName(p5, p6.channelName, p6.shouldReorderTabs)
	end,
	[incomingMessageReceivedModule.name] = handleIncomingMessageReceived,
	[markChannelUnreadForIncomingMessageModule.name] = if fFlagExpChatUseMessagesStore and fFlagExpChatUnreadTabIndicatorV2WindowModule then handleIncomingMessageReceived else nil,
	[universeChatSystemMessageAddedModule.name] = handleUniverseChatSystemMessageAdded,
	[markChannelUnreadForSystemMessageModule.name] = if fFlagExpChatUseMessagesStore and fFlagExpChatUnreadTabIndicatorV2WindowModule then handleUniverseChatSystemMessageAdded else nil,
	[universeChatChannelAddedModule.name] = function(p5, p6)
		-- upvalues: var1 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), insertTabAndReorder (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref), dictionary (ref)
		var1:trace("UniverseChatChannelAdded dispatched: {}", p6.channelName)
		
		if p5.allChannelTabs[p6.channelName] ~= nil then
			return p5
		end
		local var2
		local var3 = insertTabAndReorder(p5.allChannelTabs, {
			HasUnreadMessages = false,
			Name = p6.channelName,
			TabIndex = if getFFlagTextChatEnableUniverseChatTabs() and p6.channelName == "RBXGlobal" then if p5.allChannelTabs.RBXGeneral then 2 else 1 else p6.tabIndex,
			Type = "UniverseChat"
		})
		local _ = nil
		
		if getFFlagTextChatEnableUniverseChatTabs() then
			var2 = p5.selectedTabName
			
			if var2 == nil then
				var2 = if var3.RBXGeneral then "RBXGeneral" else p6.channelName
			elseif fFlagExpChatEnableFriendsTab and var2 == friendsChatTabNameModule then
				var2 = p6.channelName
			end
		else
			var2 = p5.selectedTabName or p6.channelName
		end
		return dictionary.join(p5, { allChannelTabs = var3, selectedTabName = var2 })
	end,
	[friendsChatChannelAddedModule.name] = function(p5, p6)
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var1 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), insertTabAndReorder (ref), dictionary (ref)
		if not fFlagExpChatEnableFriendsTab then
			return p5
		end
		var1:trace("FriendsChatChannelAdded dispatched: {}", p6.channelName)
		
		if p5.allChannelTabs[p6.channelName] ~= nil then
			return p5
		end
		local t = {
			HasUnreadMessages = false,
			Type = "FriendsChat",
			Name = p6.channelName
		}
		local allChannelTabs = p5.allChannelTabs
		t.TabIndex = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + 1 + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0)
		local var2 = insertTabAndReorder(p5.allChannelTabs, t)
		local selectedTabName = p5.selectedTabName
		
		if selectedTabName == nil then
			selectedTabName = if var2.RBXGeneral then "RBXGeneral" else p6.channelName
		end
		return dictionary.join(p5, {
			allChannelTabs = var2,
			selectedTabName = selectedTabName
		})
	end,
	[friendsChatChannelRemovedModule.name] = function(p5, p6)
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var1 (ref), removeChannelTab (ref)
		if fFlagExpChatEnableFriendsTab then
			var1:trace("FriendsChatChannelRemoved dispatched: {}", p6.channelName)
			
			return removeChannelTab(p5, p6.channelName)
		end
		return p5
	end,
	[friendsChatChannelSelected.name] = function(p5, p6)
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var1 (ref), dictionary (ref)
		if fFlagExpChatEnableFriendsTab then
			var1:trace("FriendsChatChannelSelected dispatched: {}", p6.channelName)
			
			return dictionary.join(p5, { selectedTabName = p6.channelName })
		end
		return p5
	end,
	[setChannelUnreadStatusModule.name] = function(p5, p6)
		-- upvalues: dictionary (ref)
		local channelName = p5.allChannelTabs[p6.channelName]
		
		return if channelName == nil then p5 else dictionary.join(p5, {
			allChannelTabs = dictionary.join(p5.allChannelTabs, {
				[p6.channelName] = dictionary.join(channelName, { HasUnreadMessages = p6.hasUnreadMessages })
			})
		})
	end,
	[universeChatChannelSelected.name] = function(p5, p6)
		-- upvalues: var1 (ref), dictionary (ref)
		var1:trace("UniverseChatChannelSelected dispatched: {}", p6.channelName)
		local channelName = p5.allChannelTabs[p6.channelName]
		
		return if channelName == nil then dictionary.join(p5, { selectedTabName = p6.channelName }) else dictionary.join(p5, {
			allChannelTabs = dictionary.join(p5.allChannelTabs, {
				[p6.channelName] = dictionary.join(channelName, { HasUnreadMessages = false })
			}),
			selectedTabName = p6.channelName
		})
	end
})