local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local expChatSharedModule = require(parent.ExpChatShared)
local sharedFlagsModule = require(parent.SharedFlags)
local var4 = expChatSharedModule.Logger:new("ExpChat/Reducers/" .. script.Name)
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

local function insertTabAndReorder(p0, p1) --[[ line: 64 ]]
	-- upvalues: dictionary (ref)
	local t = { [p1.Name] = p1 }
	
	for i, v in p0 do
		t = dictionary.join(t, {
			[i] = dictionary.set(p0[i], "TabIndex", if v.TabIndex < p1.TabIndex then v.TabIndex else v.TabIndex + 1)
		})
	end
	return t
end

local function _(p2) --[[ line: 82 | named "hasFriendsTab" ]]
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref)
	return if fFlagExpChatEnableFriendsTab then p2[friendsChatTabNameModule] ~= nil else false
end

local _ = function(p3) --[[ line: 91 | named "priorityTabCount" ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref)
	return (if p3.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and p3.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else p3[friendsChatTabNameModule] ~= nil then 1 else 0)
end

local _ = function(p4) --[[ line: 101 | named "nextDeveloperTabIndex" ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref)
	return (if p4.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and p4.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else p4[friendsChatTabNameModule] ~= nil then 1 else 0) + 1
end

local _ = function(p5) --[[ line: 105 | named "getFriendsTabIndex" ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref)
	return (if p5.RBXGeneral ~= nil then 1 else 0) + 1 + (if getFFlagTextChatEnableUniverseChatTabs() and p5.RBXGlobal ~= nil then 1 else 0)
end

local function removeTabAndReorder(p6, p7) --[[ line: 111 ]]
	-- upvalues: dictionary (ref)
	if p7 == nil then
		return p6
	end
	local t = {}
	
	for i, v in p6 do
		if i ~= p7.Name then
			t = dictionary.join(t, {
				[i] = dictionary.set(p6[i], "TabIndex", if v.TabIndex < p7.TabIndex then v.TabIndex else v.TabIndex - 1)
			})
		end
	end
	return t
end

local function removeChannelTab(p8, p9) --[[ line: 135 ]]
	-- upvalues: removeTabAndReorder (ref), dictionary (ref)
	local var30 = p8.allChannelTabs[p9]
	
	if var30 == nil then
		return p8
	end
	local var31 = removeTabAndReorder(p8.allChannelTabs, var30)
	local var32 = if var30.Name == p8.selectedTabName then if var31.RBXGeneral then "RBXGeneral" else nil else p8.selectedTabName
	
	return {
		allChannelTabs = if var32 and var31[var32] then dictionary.join(var31, {
			[var32] = dictionary.join(var31[var32], { HasUnreadMessages = false })
		}) else var31,
		selectedTabName = var32,
		channelTabsConfigurationEnabled = p8.channelTabsConfigurationEnabled
	}
end

local function onChannelRemoved(p10, p11) --[[ line: 160 ]]
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), removeTabAndReorder (ref), dictionary (ref), removeChannelTab (ref)
	if fFlagExpChatEnableFriendsTab then
		return removeChannelTab(p10, p11.Name)
	end
	local name = p10.allChannelTabs[p11.Name]
	
	if name == nil then
		return p10
	end
	local var33 = removeTabAndReorder(p10.allChannelTabs, name)
	local var34 = if name.Name == p10.selectedTabName then if var33.RBXGeneral then "RBXGeneral" else nil else p10.selectedTabName
	
	return {
		allChannelTabs = if var34 and var33[var34] then dictionary.join(var33, {
			[var34] = dictionary.join(var33[var34], { HasUnreadMessages = false })
		}) else var33,
		selectedTabName = var34,
		channelTabsConfigurationEnabled = p10.channelTabsConfigurationEnabled
	}
end

local function handleIncomingMessageReceived(a, b) --[[ line: 189 ]]
	-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatSuppressWelcomeMessageTabUnread (ref), shouldSuppressUnreadForTabMetadataModule (ref), dictionary (ref)
	var4:trace("IncomingMessageReceived dispatched")
	local var35 = nil
	
	if getFFlagTextChatEnableUniverseChatTabs() and b.channelNameOverride then
		var35 = b.channelNameOverride
	elseif b.textChatMessage.TextChannel then
		var35 = if b.textChatMessage.TextChannel.Name == "RBXSystem" then "RBXGeneral" else b.textChatMessage.TextChannel.Name
	end
	local var36 = a.allChannelTabs[var35]
	
	return if var36 == nil then a elseif b.isSenderLocalPlayer or var36.Name == a.selectedTabName then a elseif getFFlagExpChatSuppressWelcomeMessageTabUnread() and shouldSuppressUnreadForTabMetadataModule(b.textChatMessage.Metadata) then a else dictionary.join(a, {
		allChannelTabs = dictionary.join(a.allChannelTabs, {
			[var36.Name] = dictionary.join(var36, { HasUnreadMessages = true })
		})
	})
end

local function handleUniverseChatSystemMessageAdded(p12, p13) --[[ line: 230 ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatSuppressWelcomeMessageTabUnread (ref), shouldSuppressUnreadForTabMetadataModule (ref), dictionary (ref)
	if not getFFlagTextChatEnableUniverseChatTabs() then
		return p12
	end
	local channelNameOverride = p12.allChannelTabs[p13.channelNameOverride]
	
	return if channelNameOverride == nil then p12 elseif channelNameOverride.Name == p12.selectedTabName then p12 elseif getFFlagExpChatSuppressWelcomeMessageTabUnread() and shouldSuppressUnreadForTabMetadataModule(p13.metadata or "") then p12 else dictionary.join(p12, {
		allChannelTabs = dictionary.join(p12.allChannelTabs, {
			[channelNameOverride.Name] = dictionary.join(channelNameOverride, { HasUnreadMessages = true })
		})
	})
end

local function pruneNonSpecialTabs(value) --[[ line: 263 ]]
	-- upvalues: dictionary (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref)
	local t = {}
	local var38 = value.RBXGeneral ~= nil
	
	if var38 then
		t.RBXGeneral = dictionary.set(value.RBXGeneral, "TabIndex", 1)
	end
	if value.RBXGlobal ~= nil then
		t.RBXGlobal = dictionary.set(value.RBXGlobal, "TabIndex", if var38 then 2 else 1)
	end
	if if not fFlagExpChatEnableFriendsTab then false else value[friendsChatTabNameModule] ~= nil then
		t[friendsChatTabNameModule] = value[friendsChatTabNameModule]
	end
	return t
end

local function selectTextChannelTabByName(p14, p15, p16) --[[ line: 287 ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref), dictionary (ref), insertTabAndReorder (ref), removeTabAndReorder (ref)
	if p15 and p14.allChannelTabs[p15] then
		local var39 = p14.allChannelTabs[p15]
		local tabIndex = var39.TabIndex
		
		if p16 then
			if var39.Name == "RBXGeneral" then
				tabIndex = 1
			elseif getFFlagTextChatEnableUniverseChatTabs() and var39.Name == "RBXGlobal" then
				tabIndex = if p14.allChannelTabs.RBXGeneral then 2 else 1
			else
				local allChannelTabs = p14.allChannelTabs
				tabIndex = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else allChannelTabs[friendsChatTabNameModule] ~= nil then 1 else 0) + 1
			end
		end
		return dictionary.join(p14, {
			allChannelTabs = insertTabAndReorder(removeTabAndReorder(p14.allChannelTabs, var39), dictionary.join(var39, { HasUnreadMessages = false, TabIndex = tabIndex })),
			selectedTabName = var39.Name
		})
	else
		return if getFFlagTextChatEnableUniverseChatTabs() and not p14.channelTabsConfigurationEnabled then p14 else dictionary.join(p14, { selectedTabName = p15 })
	end
end

return roduxModule.createReducer(t, {
	[channelTabsConfigurationEnabledModule.name] = function(p17, p18) --[[ line: 325 ]]
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (ref), dictionary (ref), pruneNonSpecialTabs (ref)
		if not getFFlagTextChatEnableUniverseChatTabs() then
			return p17
		elseif not getFFlagExpChatFixChannelTabsMidExperienceToggleModule() or p18.enabled then
			return dictionary.join(p17, { channelTabsConfigurationEnabled = p18.enabled })
		end
		local var40 = pruneNonSpecialTabs(p17.allChannelTabs)
		local selectedTabName = p17.selectedTabName
		
		if selectedTabName == nil or var40[selectedTabName] == nil then
			selectedTabName = if var40.RBXGeneral then "RBXGeneral" elseif var40.RBXGlobal then "RBXGlobal" else nil
		end
		if selectedTabName and var40[selectedTabName] then
			var40 = dictionary.join(var40, {
				[selectedTabName] = dictionary.join(var40[selectedTabName], { HasUnreadMessages = false })
			})
		end
		return {
			channelTabsConfigurationEnabled = false,
			allChannelTabs = var40,
			selectedTabName = selectedTabName
		}
	end,
	[localTextChannelParticipantAddedModule.name] = function(p19, p20) --[[ line: 360 ]]
		-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref), insertTabAndReorder (ref), dictionary (ref)
		local name = p20.textChannel.Name
		var4:trace("LocalTextChannelParticipantAdded dispatched: {}", name)
		
		if p19.allChannelTabs[name] ~= nil or name == "RBXSystem" then
			return p19
		elseif getFFlagTextChatEnableUniverseChatTabs() and not p19.channelTabsConfigurationEnabled and name ~= "RBXGeneral" then
			return p19
		end
		local var41
		local _ = nil
		
		if name == "RBXGeneral" then
			var41 = 1
		elseif getFFlagTextChatEnableUniverseChatTabs() and name == "RBXGlobal" then
			var41 = if p19.allChannelTabs.RBXGeneral then 2 else 1
		else
			local allChannelTabs = p19.allChannelTabs
			var41 = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else allChannelTabs[friendsChatTabNameModule] ~= nil then 1 else 0) + 1
		end
		local var42 = insertTabAndReorder(p19.allChannelTabs, {
			HasUnreadMessages = false,
			Name = name,
			TabIndex = var41,
			Type = "TextChat"
		})
		
		if getFFlagTextChatEnableUniverseChatTabs() then
			local selectedTabName = p19.selectedTabName
			
			if selectedTabName == "RBXGlobal" and name == "RBXGeneral" then
				selectedTabName = "RBXGeneral"
			elseif fFlagExpChatEnableFriendsTab and selectedTabName == friendsChatTabNameModule and (name == "RBXGeneral" or name == "RBXGlobal") then
				selectedTabName = name
			end
			return dictionary.join(p19, {
				allChannelTabs = var42,
				selectedTabName = selectedTabName
			})
		else
			return if fFlagExpChatEnableFriendsTab and name == "RBXGeneral" and p19.selectedTabName == friendsChatTabNameModule then dictionary.join(p19, { selectedTabName = "RBXGeneral", allChannelTabs = var42 }) else dictionary.join(p19, { allChannelTabs = var42 })
		end
	end,
	[localTextChannelParticipantRemoved.name] = function(p21, p22) --[[ line: 431 ]]
		-- upvalues: var4 (ref), onChannelRemoved (ref)
		var4:trace("LocalTextChannelParticipantRemoved dispatched: {}", p22.textChannel.Name)
		
		return onChannelRemoved(p21, p22.textChannel)
	end,
	[textChannelRemoved.name] = function(p23, p24) --[[ line: 439 ]]
		-- upvalues: var4 (ref), onChannelRemoved (ref)
		var4:trace("TextChannelRemoved dispatched: {}", p24.textChannel.Name)
		
		return onChannelRemoved(p23, p24.textChannel)
	end,
	[targetTextChannelPropertyChanged.name] = function(p25, p26) --[[ line: 444 ]]
		-- upvalues: var4 (ref), selectTextChannelTabByName (ref)
		var4:trace("TargetTextChannelPropertyChanged dispatched")
		
		return selectTextChannelTabByName(p25, if p26.textChannel then p26.textChannel.Name else nil, p26.shouldReorderTabs)
	end,
	[textChatChannelSelected.name] = function(p27, p28) --[[ line: 454 ]]
		-- upvalues: var4 (ref), selectTextChannelTabByName (ref)
		var4:trace("TextChatChannelSelected dispatched: {}", p28.channelName)
		
		return selectTextChannelTabByName(p27, p28.channelName, p28.shouldReorderTabs)
	end,
	[incomingMessageReceivedModule.name] = handleIncomingMessageReceived,
	[markChannelUnreadForIncomingMessageModule.name] = if fFlagExpChatUseMessagesStore and fFlagExpChatUnreadTabIndicatorV2WindowModule then handleIncomingMessageReceived else nil,
	[universeChatSystemMessageAddedModule.name] = handleUniverseChatSystemMessageAdded,
	[markChannelUnreadForSystemMessageModule.name] = if fFlagExpChatUseMessagesStore and fFlagExpChatUnreadTabIndicatorV2WindowModule then handleUniverseChatSystemMessageAdded else nil,
	[universeChatChannelAddedModule.name] = function(p29, p30) --[[ line: 476 ]]
		-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), insertTabAndReorder (ref), fFlagExpChatEnableFriendsTab (ref), friendsChatTabNameModule (ref), dictionary (ref)
		var4:trace("UniverseChatChannelAdded dispatched: {}", p30.channelName)
		
		if p29.allChannelTabs[p30.channelName] ~= nil then
			return p29
		end
		local var44
		local var43 = insertTabAndReorder(p29.allChannelTabs, {
			HasUnreadMessages = false,
			Name = p30.channelName,
			TabIndex = if getFFlagTextChatEnableUniverseChatTabs() and p30.channelName == "RBXGlobal" then if p29.allChannelTabs.RBXGeneral then 2 else 1 else p30.tabIndex,
			Type = "UniverseChat"
		})
		local _ = nil
		
		if getFFlagTextChatEnableUniverseChatTabs() then
			var44 = p29.selectedTabName
			
			if var44 == nil then
				var44 = if var43.RBXGeneral then "RBXGeneral" else p30.channelName
			elseif fFlagExpChatEnableFriendsTab and var44 == friendsChatTabNameModule then
				var44 = p30.channelName
			end
		else
			var44 = p29.selectedTabName or p30.channelName
		end
		return dictionary.join(p29, { allChannelTabs = var43, selectedTabName = var44 })
	end,
	[friendsChatChannelAddedModule.name] = function(p31, p32) --[[ line: 515 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), insertTabAndReorder (ref), dictionary (ref)
		if not fFlagExpChatEnableFriendsTab then
			return p31
		end
		var4:trace("FriendsChatChannelAdded dispatched: {}", p32.channelName)
		
		if p31.allChannelTabs[p32.channelName] ~= nil then
			return p31
		end
		local t = {
			HasUnreadMessages = false,
			Type = "FriendsChat",
			Name = p32.channelName
		}
		local allChannelTabs = p31.allChannelTabs
		t.TabIndex = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + 1 + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0)
		local var46 = insertTabAndReorder(p31.allChannelTabs, t)
		local selectedTabName = p31.selectedTabName
		
		if selectedTabName == nil then
			selectedTabName = if var46.RBXGeneral then "RBXGeneral" else p32.channelName
		end
		return dictionary.join(p31, {
			allChannelTabs = var46,
			selectedTabName = selectedTabName
		})
	end,
	[friendsChatChannelRemovedModule.name] = function(p33, p34) --[[ line: 544 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var4 (ref), removeChannelTab (ref)
		if fFlagExpChatEnableFriendsTab then
			var4:trace("FriendsChatChannelRemoved dispatched: {}", p34.channelName)
			
			return removeChannelTab(p33, p34.channelName)
		end
		return p33
	end,
	[friendsChatChannelSelected.name] = function(p35, p36) --[[ line: 552 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var4 (ref), dictionary (ref)
		if fFlagExpChatEnableFriendsTab then
			var4:trace("FriendsChatChannelSelected dispatched: {}", p36.channelName)
			
			return dictionary.join(p35, { selectedTabName = p36.channelName })
		end
		return p35
	end,
	[setChannelUnreadStatusModule.name] = function(p37, p38) --[[ line: 564 ]]
		-- upvalues: dictionary (ref)
		local channelName = p37.allChannelTabs[p38.channelName]
		
		return if channelName == nil then p37 else dictionary.join(p37, {
			allChannelTabs = dictionary.join(p37.allChannelTabs, {
				[p38.channelName] = dictionary.join(channelName, { HasUnreadMessages = p38.hasUnreadMessages })
			})
		})
	end,
	[universeChatChannelSelected.name] = function(p39, p40) --[[ line: 579 ]]
		-- upvalues: var4 (ref), dictionary (ref)
		var4:trace("UniverseChatChannelSelected dispatched: {}", p40.channelName)
		local channelName = p39.allChannelTabs[p40.channelName]
		
		return if channelName == nil then dictionary.join(p39, { selectedTabName = p40.channelName }) else dictionary.join(p39, {
			allChannelTabs = dictionary.join(p39.allChannelTabs, {
				[p40.channelName] = dictionary.join(channelName, { HasUnreadMessages = false })
			}),
			selectedTabName = p40.channelName
		})
	end
})