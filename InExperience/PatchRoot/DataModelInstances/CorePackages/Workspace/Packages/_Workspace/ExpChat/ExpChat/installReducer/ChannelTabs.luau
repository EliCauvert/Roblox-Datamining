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
local friendsChatChannelRemovedModule = require(actions.FriendsChatChannelRemoved)
local friendsChatChannelSelected = expChatSharedModule.Actions.FriendsChatChannelSelected
local markChannelUnreadForSystemMessageModule = require(actions.MarkChannelUnreadForSystemMessage)
local markChannelUnreadForIncomingMessageModule = require(actions.MarkChannelUnreadForIncomingMessage)
local setChannelUnreadStatusModule = require(actions.SetChannelUnreadStatus)
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
	local var28 = p8.allChannelTabs[p9]
	
	if var28 == nil then
		return p8
	end
	local var29 = removeTabAndReorder(p8.allChannelTabs, var28)
	local var30 = if var28.Name == p8.selectedTabName then if var29.RBXGeneral then "RBXGeneral" else nil else p8.selectedTabName
	
	return {
		allChannelTabs = if var30 and var29[var30] then dictionary.join(var29, {
			[var30] = dictionary.join(var29[var30], { HasUnreadMessages = false })
		}) else var29,
		selectedTabName = var30,
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
	local var31 = removeTabAndReorder(p10.allChannelTabs, name)
	local var32 = if name.Name == p10.selectedTabName then if var31.RBXGeneral then "RBXGeneral" else nil else p10.selectedTabName
	
	return {
		allChannelTabs = if var32 and var31[var32] then dictionary.join(var31, {
			[var32] = dictionary.join(var31[var32], { HasUnreadMessages = false })
		}) else var31,
		selectedTabName = var32,
		channelTabsConfigurationEnabled = p10.channelTabsConfigurationEnabled
	}
end

local function handleIncomingMessageReceived(a, b) --[[ line: 188 ]]
	-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatSuppressWelcomeMessageTabUnread (ref), shouldSuppressUnreadForTabMetadataModule (ref), dictionary (ref)
	var4:trace("IncomingMessageReceived dispatched")
	local var33 = nil
	
	if getFFlagTextChatEnableUniverseChatTabs() and b.channelNameOverride then
		var33 = b.channelNameOverride
	elseif b.textChatMessage.TextChannel then
		var33 = if b.textChatMessage.TextChannel.Name == "RBXSystem" then "RBXGeneral" else b.textChatMessage.TextChannel.Name
	end
	local var34 = a.allChannelTabs[var33]
	
	return if var34 == nil then a elseif b.isSenderLocalPlayer or var34.Name == a.selectedTabName then a elseif getFFlagExpChatSuppressWelcomeMessageTabUnread() and shouldSuppressUnreadForTabMetadataModule(b.textChatMessage.Metadata) then a else dictionary.join(a, {
		allChannelTabs = dictionary.join(a.allChannelTabs, {
			[var34.Name] = dictionary.join(var34, { HasUnreadMessages = true })
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
	local var36 = value.RBXGeneral ~= nil
	
	if var36 then
		t.RBXGeneral = dictionary.set(value.RBXGeneral, "TabIndex", 1)
	end
	if value.RBXGlobal ~= nil then
		t.RBXGlobal = dictionary.set(value.RBXGlobal, "TabIndex", if var36 then 2 else 1)
	end
	if if not fFlagExpChatEnableFriendsTab then false else value.FriendsChat ~= nil then
		t.FriendsChat = value.FriendsChat
	end
	return t
end

return roduxModule.createReducer(t, {
	[channelTabsConfigurationEnabledModule.name] = function(p14, p15) --[[ line: 283 ]]
		-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (ref), dictionary (ref), pruneNonSpecialTabs (ref)
		if not getFFlagTextChatEnableUniverseChatTabs() then
			return p14
		elseif not getFFlagExpChatFixChannelTabsMidExperienceToggleModule() or p15.enabled then
			return dictionary.join(p14, { channelTabsConfigurationEnabled = p15.enabled })
		end
		local var37 = pruneNonSpecialTabs(p14.allChannelTabs)
		local selectedTabName = p14.selectedTabName
		
		if selectedTabName == nil or var37[selectedTabName] == nil then
			selectedTabName = if var37.RBXGeneral then "RBXGeneral" elseif var37.RBXGlobal then "RBXGlobal" else nil
		end
		if selectedTabName and var37[selectedTabName] then
			var37 = dictionary.join(var37, {
				[selectedTabName] = dictionary.join(var37[selectedTabName], { HasUnreadMessages = false })
			})
		end
		return {
			channelTabsConfigurationEnabled = false,
			allChannelTabs = var37,
			selectedTabName = selectedTabName
		}
	end,
	[localTextChannelParticipantAddedModule.name] = function(p16, p17) --[[ line: 318 ]]
		-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), fFlagExpChatChannelTabRefactor (ref), insertTabAndReorder (ref), dictionary (ref)
		local name = p17.textChannel.Name
		var4:trace("LocalTextChannelParticipantAdded dispatched: {}", name)
		
		if p16.allChannelTabs[name] ~= nil or name == "RBXSystem" then
			return p16
		elseif getFFlagTextChatEnableUniverseChatTabs() and not p16.channelTabsConfigurationEnabled and name ~= "RBXGeneral" then
			return p16
		end
		local var38
		local _ = nil
		
		if name == "RBXGeneral" then
			var38 = 1
		elseif getFFlagTextChatEnableUniverseChatTabs() and name == "RBXGlobal" then
			var38 = if p16.allChannelTabs.RBXGeneral then 2 else 1
		else
			local allChannelTabs = p16.allChannelTabs
			var38 = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else allChannelTabs.FriendsChat ~= nil then 1 else 0) + 1
		end
		local t = { HasUnreadMessages = false, Name = name, TabIndex = var38 }
		
		if fFlagExpChatChannelTabRefactor then
			t.Type = "TextChat"
		end
		local var40 = insertTabAndReorder(p16.allChannelTabs, t)
		
		if getFFlagTextChatEnableUniverseChatTabs() then
			local selectedTabName = p16.selectedTabName
			
			if selectedTabName == "RBXGlobal" and name == "RBXGeneral" then
				selectedTabName = "RBXGeneral"
			elseif fFlagExpChatEnableFriendsTab and selectedTabName == "FriendsChat" and (name == "RBXGeneral" or name == "RBXGlobal") then
				selectedTabName = name
			end
			return dictionary.join(p16, {
				allChannelTabs = var40,
				selectedTabName = selectedTabName
			})
		else
			return if fFlagExpChatEnableFriendsTab and name == "RBXGeneral" and p16.selectedTabName == "FriendsChat" then dictionary.join(p16, { selectedTabName = "RBXGeneral", allChannelTabs = var40 }) else dictionary.join(p16, { allChannelTabs = var40 })
		end
	end,
	[localTextChannelParticipantRemoved.name] = function(p18, p19) --[[ line: 387 ]]
		-- upvalues: var4 (ref), onChannelRemoved (ref)
		var4:trace("LocalTextChannelParticipantRemoved dispatched: {}", p19.textChannel.Name)
		
		return onChannelRemoved(p18, p19.textChannel)
	end,
	[textChannelRemoved.name] = function(p20, p21) --[[ line: 395 ]]
		-- upvalues: var4 (ref), onChannelRemoved (ref)
		var4:trace("TextChannelRemoved dispatched: {}", p21.textChannel.Name)
		
		return onChannelRemoved(p20, p21.textChannel)
	end,
	[targetTextChannelPropertyChanged.name] = function(p22, p23) --[[ line: 400 ]]
		-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatEnableFriendsTab (ref), dictionary (ref), insertTabAndReorder (ref), removeTabAndReorder (ref)
		var4:trace("TargetTextChannelPropertyChanged dispatched")
		
		if p23.textChannel and p22.allChannelTabs[p23.textChannel.Name] then
			local name = p22.allChannelTabs[p23.textChannel.Name]
			local tabIndex = name.TabIndex
			
			if p23.shouldReorderTabs then
				if name.Name == "RBXGeneral" then
					tabIndex = 1
				elseif getFFlagTextChatEnableUniverseChatTabs() and name.Name == "RBXGlobal" then
					tabIndex = if p22.allChannelTabs.RBXGeneral then 2 else 1
				else
					local allChannelTabs = p22.allChannelTabs
					tabIndex = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0) + (if if not fFlagExpChatEnableFriendsTab then false else allChannelTabs.FriendsChat ~= nil then 1 else 0) + 1
				end
			end
			return dictionary.join(p22, {
				allChannelTabs = insertTabAndReorder(removeTabAndReorder(p22.allChannelTabs, name), dictionary.join(name, { HasUnreadMessages = false, TabIndex = tabIndex })),
				selectedTabName = name.Name
			})
		else
			return if getFFlagTextChatEnableUniverseChatTabs() and not p22.channelTabsConfigurationEnabled then p22 else dictionary.join(p22, {
				selectedTabName = if p23.textChannel then p23.textChannel.Name else nil
			})
		end
	end,
	[incomingMessageReceivedModule.name] = handleIncomingMessageReceived,
	[markChannelUnreadForIncomingMessageModule.name] = if fFlagExpChatUseMessagesStore and fFlagExpChatUnreadTabIndicatorV2WindowModule then handleIncomingMessageReceived else nil,
	[universeChatSystemMessageAddedModule.name] = handleUniverseChatSystemMessageAdded,
	[markChannelUnreadForSystemMessageModule.name] = if fFlagExpChatUseMessagesStore and fFlagExpChatUnreadTabIndicatorV2WindowModule then handleUniverseChatSystemMessageAdded else nil,
	[universeChatChannelAddedModule.name] = function(p24, p25) --[[ line: 458 ]]
		-- upvalues: var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatChannelTabRefactor (ref), insertTabAndReorder (ref), fFlagExpChatEnableFriendsTab (ref), dictionary (ref)
		var4:trace("UniverseChatChannelAdded dispatched: {}", p25.channelName)
		
		if p24.allChannelTabs[p25.channelName] ~= nil then
			return p24
		end
		local t = {
			HasUnreadMessages = false,
			Name = p25.channelName,
			TabIndex = if getFFlagTextChatEnableUniverseChatTabs() and p25.channelName == "RBXGlobal" then if p24.allChannelTabs.RBXGeneral then 2 else 1 else p25.tabIndex
		}
		
		if fFlagExpChatChannelTabRefactor then
			t.Type = "UniverseChat"
		end
		local selectedTabName
		local var42 = insertTabAndReorder(p24.allChannelTabs, t)
		local _ = nil
		
		if getFFlagTextChatEnableUniverseChatTabs() then
			selectedTabName = p24.selectedTabName
			
			if selectedTabName == nil then
				selectedTabName = if var42.RBXGeneral then "RBXGeneral" else p25.channelName
			elseif fFlagExpChatEnableFriendsTab and selectedTabName == "FriendsChat" then
				selectedTabName = p25.channelName
			end
		else
			selectedTabName = p24.selectedTabName or p25.channelName
		end
		return dictionary.join(p24, {
			allChannelTabs = var42,
			selectedTabName = selectedTabName
		})
	end,
	[friendsChatChannelAddedModule.name] = function(p26, p27) --[[ line: 499 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var4 (ref), getFFlagTextChatEnableUniverseChatTabs (ref), insertTabAndReorder (ref), dictionary (ref)
		if not fFlagExpChatEnableFriendsTab then
			return p26
		end
		var4:trace("FriendsChatChannelAdded dispatched: {}", p27.channelName)
		
		if p26.allChannelTabs[p27.channelName] ~= nil then
			return p26
		end
		local t = {
			HasUnreadMessages = false,
			Type = "FriendsChat",
			Name = p27.channelName
		}
		local allChannelTabs = p26.allChannelTabs
		t.TabIndex = (if allChannelTabs.RBXGeneral ~= nil then 1 else 0) + 1 + (if getFFlagTextChatEnableUniverseChatTabs() and allChannelTabs.RBXGlobal ~= nil then 1 else 0)
		local var44 = insertTabAndReorder(p26.allChannelTabs, t)
		local selectedTabName = p26.selectedTabName
		
		if selectedTabName == nil then
			selectedTabName = if var44.RBXGeneral then "RBXGeneral" else p27.channelName
		end
		return dictionary.join(p26, {
			allChannelTabs = var44,
			selectedTabName = selectedTabName
		})
	end,
	[friendsChatChannelRemovedModule.name] = function(p28, p29) --[[ line: 528 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var4 (ref), removeChannelTab (ref)
		if fFlagExpChatEnableFriendsTab then
			var4:trace("FriendsChatChannelRemoved dispatched: {}", p29.channelName)
			
			return removeChannelTab(p28, p29.channelName)
		end
		return p28
	end,
	[friendsChatChannelSelected.name] = function(p30, p31) --[[ line: 536 ]]
		-- upvalues: fFlagExpChatEnableFriendsTab (ref), var4 (ref), dictionary (ref)
		if fFlagExpChatEnableFriendsTab then
			var4:trace("FriendsChatChannelSelected dispatched: {}", p31.channelName)
			
			return dictionary.join(p30, { selectedTabName = p31.channelName })
		end
		return p30
	end,
	[setChannelUnreadStatusModule.name] = function(p32, p33) --[[ line: 548 ]]
		-- upvalues: dictionary (ref)
		local channelName = p32.allChannelTabs[p33.channelName]
		
		return if channelName == nil then p32 else dictionary.join(p32, {
			allChannelTabs = dictionary.join(p32.allChannelTabs, {
				[p33.channelName] = dictionary.join(channelName, { HasUnreadMessages = p33.hasUnreadMessages })
			})
		})
	end,
	[universeChatChannelSelected.name] = function(p34, p35) --[[ line: 563 ]]
		-- upvalues: var4 (ref), dictionary (ref)
		var4:trace("UniverseChatChannelSelected dispatched: {}", p35.channelName)
		local channelName = p34.allChannelTabs[p35.channelName]
		
		return if channelName == nil then dictionary.join(p34, { selectedTabName = p35.channelName }) else dictionary.join(p34, {
			allChannelTabs = dictionary.join(p34.allChannelTabs, {
				[p35.channelName] = dictionary.join(channelName, { HasUnreadMessages = false })
			}),
			selectedTabName = p35.channelName
		})
	end
})