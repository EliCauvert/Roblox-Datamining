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
local incomingMessageReceivedModule = require(actions.IncomingMessageReceived)
local universeChatSystemMessageAddedModule = require(actions.UniverseChatSystemMessageAdded)
local universeChatChannelAddedModule = require(actions.UniverseChatChannelAdded)
local universeChatChannelSelected = expChatSharedModule.Actions.UniverseChatChannelSelected
local friendsChatChannelAddedModule = require(actions.FriendsChatChannelAdded)
local friendsChatChannelSelected = expChatSharedModule.Actions.FriendsChatChannelSelected
local markChannelUnreadForSystemMessageModule = require(actions.MarkChannelUnreadForSystemMessage)
local markChannelUnreadForIncomingMessageModule = require(actions.MarkChannelUnreadForIncomingMessage)
local fFlagExpChatUnreadTabIndicatorV2WindowModule = require(expChat.Flags.FFlagExpChatUnreadTabIndicatorV2Window)
local getFFlagExpChatFixChannelTabsMidExperienceToggleModule = require(expChat.Flags.getFFlagExpChatFixChannelTabsMidExperienceToggle)
local fFlagExpChatUseMessagesStore = sharedFlagsModule.FFlagExpChatUseMessagesStore
local fFlagExpChatChannelTabRefactor = sharedFlagsModule.FFlagExpChatChannelTabRefactor
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

local function insertTabAndReorder(p0, p1) --[[ line: 61 ]]
	-- upvalues: dictionary (ref)
	local t = { [p1.Name] = p1 }
	
	for i, v in p0 do
		t = dictionary.join(t, {
			[i] = dictionary.set(p0[i], "TabIndex", if v.TabIndex < p1.TabIndex then v.TabIndex else v.TabIndex + 1)
		})
	end
	return t
end

local function removeTabAndReorder(p2, p3) --[[ line: 79 ]]
	-- upvalues: dictionary (ref)
	if p3 == nil then
		return p2
	end
	local t = {}
	
	for i, v in p2 do
		if i ~= p3.Name then
			t = dictionary.join(t, {
				[i] = dictionary.set(p2[i], "TabIndex", if v.TabIndex < p3.TabIndex then v.TabIndex else v.TabIndex - 1)
			})
		end
	end
	return t
end

local function onChannelRemoved(p4, p5) --[[ line: 103 ]]
	-- upvalues: removeTabAndReorder (ref), dictionary (ref)
	local name = p4.allChannelTabs[p5.Name]
	
	if name == nil then
		return p4
	end
	local var25 = removeTabAndReorder(p4.allChannelTabs, name)
	local var26 = if name.Name == p4.selectedTabName then if var25.RBXGeneral then "RBXGeneral" else nil else p4.selectedTabName
	
	return {
		allChannelTabs = if var26 and var25[var26] then dictionary.join(var25, {
			[var26] = dictionary.join(var25[var26], { HasUnreadMessages = false })
		}) else var25,
		selectedTabName = var26,
		channelTabsConfigurationEnabled = p4.channelTabsConfigurationEnabled
	}
end

local function handleIncomingMessageReceived(a, b) --[[ line: 128 ]]
	-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatSuppressWelcomeMessageTabUnread (ref), shouldSuppressUnreadForTabMetadataModule (ref), dictionary (ref)
	var4:trace("IncomingMessageReceived dispatched")
	local var27 = nil
	
	if getFFlagTextChatEnableUniverseChatTabs() and b.channelNameOverride then
		var27 = b.channelNameOverride
	elseif b.textChatMessage.TextChannel then
		var27 = if b.textChatMessage.TextChannel.Name == "RBXSystem" then "RBXGeneral" else b.textChatMessage.TextChannel.Name
	end
	local var28 = a.allChannelTabs[var27]
	
	return if var28 == nil then a elseif b.isSenderLocalPlayer or var28.Name == a.selectedTabName then a elseif getFFlagExpChatSuppressWelcomeMessageTabUnread() and shouldSuppressUnreadForTabMetadataModule(b.textChatMessage.Metadata) then a else dictionary.join(a, {
		allChannelTabs = dictionary.join(a.allChannelTabs, {
			[var28.Name] = dictionary.join(var28, { HasUnreadMessages = true })
		})
	})
end

local function handleUniverseChatSystemMessageAdded(p6, p7) --[[ line: 169 ]]
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatSuppressWelcomeMessageTabUnread (ref), shouldSuppressUnreadForTabMetadataModule (ref), dictionary (ref)
	if not getFFlagTextChatEnableUniverseChatTabs() then
		return p6
	end
	local channelNameOverride = p6.allChannelTabs[p7.channelNameOverride]
	
	return if channelNameOverride == nil then p6 elseif channelNameOverride.Name == p6.selectedTabName then p6 elseif getFFlagExpChatSuppressWelcomeMessageTabUnread() and shouldSuppressUnreadForTabMetadataModule(p7.metadata or "") then p6 else dictionary.join(p6, {
		allChannelTabs = dictionary.join(p6.allChannelTabs, {
			[channelNameOverride.Name] = dictionary.join(channelNameOverride, { HasUnreadMessages = true })
		})
	})
end

local function pruneNonSpecialTabs(value) --[[ line: 202 ]]
	-- upvalues: dictionary (ref), fFlagExpChatEnableFriendsTab (ref)
	local t = {}
	local var30 = value.RBXGeneral ~= nil
	
	if var30 then
		t.RBXGeneral = dictionary.set(value.RBXGeneral, "TabIndex", 1)
	end
	if value.RBXGlobal ~= nil then
		t.RBXGlobal = dictionary.set(value.RBXGlobal, "TabIndex", if var30 then 2 else 1)
	end
	if fFlagExpChatEnableFriendsTab then
		for i, v in value do
			if v.Type == "FriendsChat" then
				t[i] = v
			end
		end
	end
	return t
end

return roduxModule.createReducer(t, {
	[channelTabsConfigurationEnabledModule.name] = function(p8, p9) --[[ line: 227 ]]
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (ref), dictionary (ref), pruneNonSpecialTabs (ref)
		if not getFFlagTextChatEnableUniverseChatTabs() then
			return p8
		elseif not getFFlagExpChatFixChannelTabsMidExperienceToggleModule() or p9.enabled then
			return dictionary.join(p8, { channelTabsConfigurationEnabled = p9.enabled })
		end
		local var31 = pruneNonSpecialTabs(p8.allChannelTabs)
		local selectedTabName = p8.selectedTabName
		
		if selectedTabName == nil or var31[selectedTabName] == nil then
			selectedTabName = if var31.RBXGeneral then "RBXGeneral" elseif var31.RBXGlobal then "RBXGlobal" else nil
		end
		if selectedTabName and var31[selectedTabName] then
			var31 = dictionary.join(var31, {
				[selectedTabName] = dictionary.join(var31[selectedTabName], { HasUnreadMessages = false })
			})
		end
		return {
			channelTabsConfigurationEnabled = false,
			allChannelTabs = var31,
			selectedTabName = selectedTabName
		}
	end,
	[localTextChannelParticipantAddedModule.name] = function(p10, p11) --[[ line: 262 ]]
		-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatChannelTabRefactor (ref), insertTabAndReorder (ref), dictionary (ref)
		local name = p11.textChannel.Name
		var4:trace("LocalTextChannelParticipantAdded dispatched: {}", name)
		
		if p10.allChannelTabs[name] ~= nil or name == "RBXSystem" then
			return p10
		elseif getFFlagTextChatEnableUniverseChatTabs() and not p10.channelTabsConfigurationEnabled and name ~= "RBXGeneral" then
			return p10
		end
		local _ = nil
		local t = {
			HasUnreadMessages = false,
			Name = name,
			TabIndex = if name == "RBXGeneral" then 1 elseif getFFlagTextChatEnableUniverseChatTabs() and name == "RBXGlobal" then if p10.allChannelTabs.RBXGeneral then 2 else 1 else (if p10.allChannelTabs.RBXGeneral ~= nil then 1 else 0) + 1 + (if if getFFlagTextChatEnableUniverseChatTabs() then p10.allChannelTabs.RBXGlobal ~= nil else getFFlagTextChatEnableUniverseChatTabs() then 1 else 0)
		}
		
		if fFlagExpChatChannelTabRefactor then
			t.Type = "TextChat"
		end
		local var33 = insertTabAndReorder(p10.allChannelTabs, t)
		
		if not getFFlagTextChatEnableUniverseChatTabs() then
			return dictionary.join(p10, { allChannelTabs = var33 })
		end
		local selectedTabName = p10.selectedTabName
		
		if selectedTabName == "RBXGlobal" and name == "RBXGeneral" then
			selectedTabName = "RBXGeneral"
		end
		return dictionary.join(p10, {
			allChannelTabs = var33,
			selectedTabName = selectedTabName
		})
	end,
	[localTextChannelParticipantRemoved.name] = function(p12, p13) --[[ line: 316 ]]
		-- upvalues: var4 (ref), onChannelRemoved (ref)
		var4:trace("LocalTextChannelParticipantRemoved dispatched: {}", p13.textChannel.Name)
		
		return onChannelRemoved(p12, p13.textChannel)
	end,
	[textChannelRemoved.name] = function(p14, p15) --[[ line: 324 ]]
		-- upvalues: var4 (ref), onChannelRemoved (ref)
		var4:trace("TextChannelRemoved dispatched: {}", p15.textChannel.Name)
		
		return onChannelRemoved(p14, p15.textChannel)
	end,
	[targetTextChannelPropertyChanged.name] = function(p16, p17) --[[ line: 329 ]]
		-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), dictionary (ref), insertTabAndReorder (ref), removeTabAndReorder (ref)
		var4:trace("TargetTextChannelPropertyChanged dispatched")
		
		if p17.textChannel and p16.allChannelTabs[p17.textChannel.Name] then
			local name = p16.allChannelTabs[p17.textChannel.Name]
			local tabIndex = name.TabIndex
			
			if p17.shouldReorderTabs then
				tabIndex = if name.Name == "RBXGeneral" then 1 elseif getFFlagTextChatEnableUniverseChatTabs() and name.Name == "RBXGlobal" then if p16.allChannelTabs.RBXGeneral then 2 else 1 else (if p16.allChannelTabs.RBXGeneral ~= nil then 1 else 0) + 1 + (if if getFFlagTextChatEnableUniverseChatTabs() then p16.allChannelTabs.RBXGlobal ~= nil else getFFlagTextChatEnableUniverseChatTabs() then 1 else 0)
			end
			return dictionary.join(p16, {
				allChannelTabs = insertTabAndReorder(removeTabAndReorder(p16.allChannelTabs, name), dictionary.join(name, { HasUnreadMessages = false, TabIndex = tabIndex })),
				selectedTabName = name.Name
			})
		else
			return if getFFlagTextChatEnableUniverseChatTabs() and not p16.channelTabsConfigurationEnabled then p16 else dictionary.join(p16, {
				selectedTabName = if p17.textChannel then p17.textChannel.Name else nil
			})
		end
	end,
	[incomingMessageReceivedModule.name] = handleIncomingMessageReceived,
	[markChannelUnreadForIncomingMessageModule.name] = if fFlagExpChatUseMessagesStore and fFlagExpChatUnreadTabIndicatorV2WindowModule then handleIncomingMessageReceived else nil,
	[universeChatSystemMessageAddedModule.name] = handleUniverseChatSystemMessageAdded,
	[markChannelUnreadForSystemMessageModule.name] = if fFlagExpChatUseMessagesStore and fFlagExpChatUnreadTabIndicatorV2WindowModule then handleUniverseChatSystemMessageAdded else nil,
	[universeChatChannelAddedModule.name] = function(p18, p19) --[[ line: 390 ]]
		-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatChannelTabRefactor (ref), insertTabAndReorder (ref), dictionary (ref)
		var4:trace("UniverseChatChannelAdded dispatched: {}", p19.channelName)
		
		if p18.allChannelTabs[p19.channelName] ~= nil then
			return p18
		end
		local t = {
			HasUnreadMessages = false,
			Name = p19.channelName,
			TabIndex = if getFFlagTextChatEnableUniverseChatTabs() and p19.channelName == "RBXGlobal" then if p18.allChannelTabs.RBXGeneral then 2 else 1 else p19.tabIndex
		}
		
		if fFlagExpChatChannelTabRefactor then
			t.Type = "UniverseChat"
		end
		local selectedTabName
		local var35 = insertTabAndReorder(p18.allChannelTabs, t)
		local _ = nil
		
		if getFFlagTextChatEnableUniverseChatTabs() then
			selectedTabName = p18.selectedTabName
			
			if selectedTabName == nil then
				selectedTabName = if var35.RBXGeneral then "RBXGeneral" else p19.channelName
			end
		else
			selectedTabName = p18.selectedTabName or p19.channelName
		end
		return dictionary.join(p18, {
			allChannelTabs = var35,
			selectedTabName = selectedTabName
		})
	end,
	[friendsChatChannelAddedModule.name] = function(p20, p21) --[[ line: 428 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var4 (ref), insertTabAndReorder (ref), dictionary (ref)
		if not fFlagExpChatEnableFriendsTab then
			return p20
		end
		var4:trace("FriendsChatChannelAdded dispatched: {}", p21.channelName)
		
		if p20.allChannelTabs[p21.channelName] ~= nil then
			return p20
		end
		local var36 = insertTabAndReorder(p20.allChannelTabs, {
			HasUnreadMessages = false,
			Type = "FriendsChat",
			Name = p21.channelName,
			TabIndex = p21.tabIndex
		})
		local selectedTabName = p20.selectedTabName
		
		if selectedTabName == nil then
			selectedTabName = if var36.RBXGeneral then "RBXGeneral" else p21.channelName
		end
		return dictionary.join(p20, {
			allChannelTabs = var36,
			selectedTabName = selectedTabName
		})
	end,
	[friendsChatChannelSelected.name] = function(p22, p23) --[[ line: 457 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var4 (ref), dictionary (ref)
		if not fFlagExpChatEnableFriendsTab then
			return p22
		end
		var4:trace("FriendsChatChannelSelected dispatched: {}", p23.channelName)
		local channelName = p22.allChannelTabs[p23.channelName]
		
		return if channelName == nil then dictionary.join(p22, { selectedTabName = p23.channelName }) else dictionary.join(p22, {
			allChannelTabs = dictionary.join(p22.allChannelTabs, {
				[p23.channelName] = dictionary.join(channelName, { HasUnreadMessages = false })
			}),
			selectedTabName = p23.channelName
		})
	end,
	[universeChatChannelSelected.name] = function(p24, p25) --[[ line: 476 ]]
		-- upvalues: var4 (ref), dictionary (ref)
		var4:trace("UniverseChatChannelSelected dispatched: {}", p25.channelName)
		local channelName = p24.allChannelTabs[p25.channelName]
		
		return if channelName == nil then dictionary.join(p24, { selectedTabName = p25.channelName }) else dictionary.join(p24, {
			allChannelTabs = dictionary.join(p24.allChannelTabs, {
				[p25.channelName] = dictionary.join(channelName, { HasUnreadMessages = false })
			}),
			selectedTabName = p25.channelName
		})
	end
})