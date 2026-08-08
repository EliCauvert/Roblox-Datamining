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

local function insertTabAndReorder(p0, p1) --[[ line: 63 ]]
	-- upvalues: dictionary (ref)
	local t = { [p1.Name] = p1 }
	
	for i, v in p0 do
		t = dictionary.join(t, {
			[i] = dictionary.set(p0[i], "TabIndex", if v.TabIndex < p1.TabIndex then v.TabIndex else v.TabIndex + 1)
		})
	end
	return t
end

local function _(p2) --[[ line: 81 | named "hasFriendsTab" ]]
	-- upvalues: fFlagExpChatEnableFriendsTab (ref)
	return if fFlagExpChatEnableFriendsTab then p2.FriendsChat ~= nil else false
end

local _ = function(p3) --[[ line: 90 | named "priorityTabCount" ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref)
	return (if p3.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and p3.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else p3.FriendsChat ~= nil then 1 else 0)
end

local _ = function(p4) --[[ line: 100 | named "nextDeveloperTabIndex" ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref)
	return (if p4.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and p4.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else p4.FriendsChat ~= nil then 1 else 0) + 1
end

local _ = function(p5) --[[ line: 104 | named "getFriendsTabIndex" ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref)
	return (if p5.RBXGeneral ~= nil then 1 else 0) + 1 + (if getFFlagTextChatEnableUniverseChatTabs() and p5.RBXGlobal ~= nil then 1 else 0)
end

local function removeTabAndReorder(p6, p7) --[[ line: 110 ]]
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

local function removeChannelTab(p8, p9) --[[ line: 134 ]]
	-- upvalues: removeTabAndReorder (ref), dictionary (ref)
	local var29 = p8.allChannelTabs[p9]
	
	if var29 == nil then
		return p8
	end
	local var30 = removeTabAndReorder(p8.allChannelTabs, var29)
	local var31 = if var29.Name == p8.selectedTabName then if var30.RBXGeneral then "RBXGeneral" else nil else p8.selectedTabName
	
	return {
		allChannelTabs = if var31 and var30[var31] then dictionary.join(var30, {
			[var31] = dictionary.join(var30[var31], { HasUnreadMessages = false })
		}) else var30,
		selectedTabName = var31,
		channelTabsConfigurationEnabled = p8.channelTabsConfigurationEnabled
	}
end

local function onChannelRemoved(p10, p11) --[[ line: 159 ]]
	-- upvalues: fFlagExpChatEnableFriendsTab (ref), removeTabAndReorder (ref), dictionary (ref), removeChannelTab (ref)
	if fFlagExpChatEnableFriendsTab then
		return removeChannelTab(p10, p11.Name)
	end
	local name = p10.allChannelTabs[p11.Name]
	
	if name == nil then
		return p10
	end
	local var32 = removeTabAndReorder(p10.allChannelTabs, name)
	local var33 = if name.Name == p10.selectedTabName then if var32.RBXGeneral then "RBXGeneral" else nil else p10.selectedTabName
	
	return {
		allChannelTabs = if var33 and var32[var33] then dictionary.join(var32, {
			[var33] = dictionary.join(var32[var33], { HasUnreadMessages = false })
		}) else var32,
		selectedTabName = var33,
		channelTabsConfigurationEnabled = p10.channelTabsConfigurationEnabled
	}
end

local function handleIncomingMessageReceived(a, b) --[[ line: 188 ]]
	-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatSuppressWelcomeMessageTabUnread (ref), shouldSuppressUnreadForTabMetadataModule (ref), dictionary (ref)
	var4:trace("IncomingMessageReceived dispatched")
	local var34 = nil
	
	if getFFlagTextChatEnableUniverseChatTabs() and b.channelNameOverride then
		var34 = b.channelNameOverride
	elseif b.textChatMessage.TextChannel then
		var34 = if b.textChatMessage.TextChannel.Name == "RBXSystem" then "RBXGeneral" else b.textChatMessage.TextChannel.Name
	end
	local var35 = a.allChannelTabs[var34]
	
	return if var35 == nil then a elseif b.isSenderLocalPlayer or var35.Name == a.selectedTabName then a elseif getFFlagExpChatSuppressWelcomeMessageTabUnread() and shouldSuppressUnreadForTabMetadataModule(b.textChatMessage.Metadata) then a else dictionary.join(a, {
		allChannelTabs = dictionary.join(a.allChannelTabs, {
			[var35.Name] = dictionary.join(var35, { HasUnreadMessages = true })
		})
	})
end

local function handleUniverseChatSystemMessageAdded(p12, p13) --[[ line: 229 ]]
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

local function pruneNonSpecialTabs(value) --[[ line: 262 ]]
	-- upvalues: dictionary (ref), fFlagExpChatEnableFriendsTab (ref)
	local t = {}
	local var37 = value.RBXGeneral ~= nil
	
	if var37 then
		t.RBXGeneral = dictionary.set(value.RBXGeneral, "TabIndex", 1)
	end
	if value.RBXGlobal ~= nil then
		t.RBXGlobal = dictionary.set(value.RBXGlobal, "TabIndex", if var37 then 2 else 1)
	end
	if if not fFlagExpChatEnableFriendsTab then false else value.FriendsChat ~= nil then
		t.FriendsChat = value.FriendsChat
	end
	return t
end

local function selectTextChannelTabByName(p14, p15, p16) --[[ line: 286 ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), dictionary (ref), insertTabAndReorder (ref), removeTabAndReorder (ref)
	if p15 and p14.allChannelTabs[p15] then
		local var38 = p14.allChannelTabs[p15]
		local tabIndex = var38.TabIndex
		
		if p16 then
			if var38.Name == "RBXGeneral" then
				tabIndex = 1
			elseif getFFlagTextChatEnableUniverseChatTabs() and var38.Name == "RBXGlobal" then
				tabIndex = if p14.allChannelTabs.RBXGeneral then 2 else 1
			else
				local allChannelTabs = p14.allChannelTabs
				tabIndex = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else allChannelTabs.FriendsChat ~= nil then 1 else 0) + 1
			end
		end
		return dictionary.join(p14, {
			allChannelTabs = insertTabAndReorder(removeTabAndReorder(p14.allChannelTabs, var38), dictionary.join(var38, { HasUnreadMessages = false, TabIndex = tabIndex })),
			selectedTabName = var38.Name
		})
	else
		return if getFFlagTextChatEnableUniverseChatTabs() and not p14.channelTabsConfigurationEnabled then p14 else dictionary.join(p14, { selectedTabName = p15 })
	end
end

return roduxModule.createReducer(t, {
	[channelTabsConfigurationEnabledModule.name] = function(p17, p18) --[[ line: 324 ]]
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (ref), dictionary (ref), pruneNonSpecialTabs (ref)
		if not getFFlagTextChatEnableUniverseChatTabs() then
			return p17
		elseif not getFFlagExpChatFixChannelTabsMidExperienceToggleModule() or p18.enabled then
			return dictionary.join(p17, { channelTabsConfigurationEnabled = p18.enabled })
		end
		local var39 = pruneNonSpecialTabs(p17.allChannelTabs)
		local selectedTabName = p17.selectedTabName
		
		if selectedTabName == nil or var39[selectedTabName] == nil then
			selectedTabName = if var39.RBXGeneral then "RBXGeneral" elseif var39.RBXGlobal then "RBXGlobal" else nil
		end
		if selectedTabName and var39[selectedTabName] then
			var39 = dictionary.join(var39, {
				[selectedTabName] = dictionary.join(var39[selectedTabName], { HasUnreadMessages = false })
			})
		end
		return {
			channelTabsConfigurationEnabled = false,
			allChannelTabs = var39,
			selectedTabName = selectedTabName
		}
	end,
	[localTextChannelParticipantAddedModule.name] = function(p19, p20) --[[ line: 359 ]]
		-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), insertTabAndReorder (ref), dictionary (ref)
		local name = p20.textChannel.Name
		var4:trace("LocalTextChannelParticipantAdded dispatched: {}", name)
		
		if p19.allChannelTabs[name] ~= nil or name == "RBXSystem" then
			return p19
		elseif getFFlagTextChatEnableUniverseChatTabs() and not p19.channelTabsConfigurationEnabled and name ~= "RBXGeneral" then
			return p19
		end
		local var40
		local _ = nil
		
		if name == "RBXGeneral" then
			var40 = 1
		elseif getFFlagTextChatEnableUniverseChatTabs() and name == "RBXGlobal" then
			var40 = if p19.allChannelTabs.RBXGeneral then 2 else 1
		else
			local allChannelTabs = p19.allChannelTabs
			var40 = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else allChannelTabs.FriendsChat ~= nil then 1 else 0) + 1
		end
		local var41 = insertTabAndReorder(p19.allChannelTabs, {
			HasUnreadMessages = false,
			Name = name,
			TabIndex = var40,
			Type = "TextChat"
		})
		
		if getFFlagTextChatEnableUniverseChatTabs() then
			local selectedTabName = p19.selectedTabName
			
			if selectedTabName == "RBXGlobal" and name == "RBXGeneral" then
				selectedTabName = "RBXGeneral"
			elseif fFlagExpChatEnableFriendsTab and selectedTabName == "FriendsChat" and (name == "RBXGeneral" or name == "RBXGlobal") then
				selectedTabName = name
			end
			return dictionary.join(p19, {
				allChannelTabs = var41,
				selectedTabName = selectedTabName
			})
		else
			return if fFlagExpChatEnableFriendsTab and name == "RBXGeneral" and p19.selectedTabName == "FriendsChat" then dictionary.join(p19, { selectedTabName = "RBXGeneral", allChannelTabs = var41 }) else dictionary.join(p19, { allChannelTabs = var41 })
		end
	end,
	[localTextChannelParticipantRemoved.name] = function(p21, p22) --[[ line: 426 ]]
		-- upvalues: var4 (ref), onChannelRemoved (ref)
		var4:trace("LocalTextChannelParticipantRemoved dispatched: {}", p22.textChannel.Name)
		
		return onChannelRemoved(p21, p22.textChannel)
	end,
	[textChannelRemoved.name] = function(p23, p24) --[[ line: 434 ]]
		-- upvalues: var4 (ref), onChannelRemoved (ref)
		var4:trace("TextChannelRemoved dispatched: {}", p24.textChannel.Name)
		
		return onChannelRemoved(p23, p24.textChannel)
	end,
	[targetTextChannelPropertyChanged.name] = function(p25, p26) --[[ line: 439 ]]
		-- upvalues: var4 (ref), selectTextChannelTabByName (ref)
		var4:trace("TargetTextChannelPropertyChanged dispatched")
		
		return selectTextChannelTabByName(p25, if p26.textChannel then p26.textChannel.Name else nil, p26.shouldReorderTabs)
	end,
	[textChatChannelSelected.name] = function(p27, p28) --[[ line: 449 ]]
		-- upvalues: var4 (ref), selectTextChannelTabByName (ref)
		var4:trace("TextChatChannelSelected dispatched: {}", p28.channelName)
		
		return selectTextChannelTabByName(p27, p28.channelName, p28.shouldReorderTabs)
	end,
	[incomingMessageReceivedModule.name] = handleIncomingMessageReceived,
	[markChannelUnreadForIncomingMessageModule.name] = if fFlagExpChatUseMessagesStore and fFlagExpChatUnreadTabIndicatorV2WindowModule then handleIncomingMessageReceived else nil,
	[universeChatSystemMessageAddedModule.name] = handleUniverseChatSystemMessageAdded,
	[markChannelUnreadForSystemMessageModule.name] = if fFlagExpChatUseMessagesStore and fFlagExpChatUnreadTabIndicatorV2WindowModule then handleUniverseChatSystemMessageAdded else nil,
	[universeChatChannelAddedModule.name] = function(p29, p30) --[[ line: 471 ]]
		-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), insertTabAndReorder (ref), fFlagExpChatEnableFriendsTab (ref), dictionary (ref)
		var4:trace("UniverseChatChannelAdded dispatched: {}", p30.channelName)
		
		if p29.allChannelTabs[p30.channelName] ~= nil then
			return p29
		end
		local var43
		local var42 = insertTabAndReorder(p29.allChannelTabs, {
			HasUnreadMessages = false,
			Name = p30.channelName,
			TabIndex = if getFFlagTextChatEnableUniverseChatTabs() and p30.channelName == "RBXGlobal" then if p29.allChannelTabs.RBXGeneral then 2 else 1 else p30.tabIndex,
			Type = "UniverseChat"
		})
		local _ = nil
		
		if getFFlagTextChatEnableUniverseChatTabs() then
			var43 = p29.selectedTabName
			
			if var43 == nil then
				var43 = if var42.RBXGeneral then "RBXGeneral" else p30.channelName
			elseif fFlagExpChatEnableFriendsTab and var43 == "FriendsChat" then
				var43 = p30.channelName
			end
		else
			var43 = p29.selectedTabName or p30.channelName
		end
		return dictionary.join(p29, { allChannelTabs = var42, selectedTabName = var43 })
	end,
	[friendsChatChannelAddedModule.name] = function(p31, p32) --[[ line: 510 ]]
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
		local var45 = insertTabAndReorder(p31.allChannelTabs, t)
		local selectedTabName = p31.selectedTabName
		
		if selectedTabName == nil then
			selectedTabName = if var45.RBXGeneral then "RBXGeneral" else p32.channelName
		end
		return dictionary.join(p31, {
			allChannelTabs = var45,
			selectedTabName = selectedTabName
		})
	end,
	[friendsChatChannelRemovedModule.name] = function(p33, p34) --[[ line: 539 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var4 (ref), removeChannelTab (ref)
		if fFlagExpChatEnableFriendsTab then
			var4:trace("FriendsChatChannelRemoved dispatched: {}", p34.channelName)
			
			return removeChannelTab(p33, p34.channelName)
		end
		return p33
	end,
	[friendsChatChannelSelected.name] = function(p35, p36) --[[ line: 547 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var4 (ref), dictionary (ref)
		if fFlagExpChatEnableFriendsTab then
			var4:trace("FriendsChatChannelSelected dispatched: {}", p36.channelName)
			
			return dictionary.join(p35, { selectedTabName = p36.channelName })
		end
		return p35
	end,
	[setChannelUnreadStatusModule.name] = function(p37, p38) --[[ line: 559 ]]
		-- upvalues: dictionary (ref)
		local channelName = p37.allChannelTabs[p38.channelName]
		
		return if channelName == nil then p37 else dictionary.join(p37, {
			allChannelTabs = dictionary.join(p37.allChannelTabs, {
				[p38.channelName] = dictionary.join(channelName, { HasUnreadMessages = p38.hasUnreadMessages })
			})
		})
	end,
	[universeChatChannelSelected.name] = function(p39, p40) --[[ line: 574 ]]
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