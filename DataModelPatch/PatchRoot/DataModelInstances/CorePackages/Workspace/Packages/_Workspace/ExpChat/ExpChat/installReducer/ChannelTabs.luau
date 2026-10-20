local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local ExpChatSharedModule = require(Parent.ExpChatShared)
local SharedFlagsModule = require(Parent.SharedFlags)
local NewResult = ExpChatSharedModule.Logger:new("ExpChat/Reducers/" .. script.Name)
local Actions = ExpChat.Actions
local FFlagExpChatUnreadTabIndicatorV2WindowModule = require(ExpChat.Flags.FFlagExpChatUnreadTabIndicatorV2Window)
local GetFFlagExpChatFixChannelTabsMidExperienceToggleModule = require(ExpChat.Flags.getFFlagExpChatFixChannelTabsMidExperienceToggle)
local FFlagExpChatUseMessagesStore = SharedFlagsModule.FFlagExpChatUseMessagesStore
local FFlagExpChatChannelTabRefactor = SharedFlagsModule.FFlagExpChatChannelTabRefactor
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction = ExpChatSharedModule.Flags.GetFFlagExpChatSuppressWelcomeMessageTabUnread
local ShouldSuppressUnreadForTabMetadataModule = require(ExpChat.shouldSuppressUnreadForTabMetadata)

local function insertTabAndReorder(AllChannelTabs, JoinResult)
	-- upvalues: Dictionary (copy)
	local JoinResult1 = { [JoinResult.Name] = JoinResult }
	
	for i, allChannelTab in AllChannelTabs do
		JoinResult1 = Dictionary.join(JoinResult1, {
			[i] = Dictionary.set(AllChannelTabs[i], "TabIndex", allChannelTab.TabIndex < JoinResult.TabIndex and allChannelTab.TabIndex or allChannelTab.TabIndex + 1)
		})
	end
	return JoinResult1
end

local function _(p1): boolean
	-- upvalues: FFlagExpChatEnableFriendsTab (copy)
	return if FFlagExpChatEnableFriendsTab then p1.FriendsChat ~= nil else false
end

local _ = function(p1): number
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatEnableFriendsTab (copy)
	local HasRBXGeneral = p1.RBXGeneral ~= nil
	local HasRBXGlobal: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and p1.RBXGlobal ~= nil
	local HasFriendsChat: boolean = if FFlagExpChatEnableFriendsTab then p1.FriendsChat ~= nil else false
	
	return (if HasRBXGeneral then 1 else 0) + (if HasRBXGlobal then 1 else 0) + (if HasFriendsChat then 1 else 0)
end

local _ = function(p1): number
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatEnableFriendsTab (copy)
	local HasRBXGeneral = p1.RBXGeneral ~= nil
	local HasRBXGlobal: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and p1.RBXGlobal ~= nil
	local HasFriendsChat: boolean = if FFlagExpChatEnableFriendsTab then p1.FriendsChat ~= nil else false
	
	return (if HasRBXGeneral then 1 else 0) + (if HasRBXGlobal then 1 else 0) + (if HasFriendsChat then 1 else 0) + 1
end

local function removeTabAndReorder(AllChannelTabs, AllChannelTab)
	-- upvalues: Dictionary (copy)
	if AllChannelTab == nil then
		return AllChannelTabs
	end
	local JoinResult = {}
	
	for i, allChannelTab in AllChannelTabs do
		if i ~= AllChannelTab.Name then
			JoinResult = Dictionary.join(JoinResult, {
				[i] = Dictionary.set(AllChannelTabs[i], "TabIndex", allChannelTab.TabIndex < AllChannelTab.TabIndex and allChannelTab.TabIndex or allChannelTab.TabIndex - 1)
			})
		end
	end
	return JoinResult
end

local function onChannelRemoved(p1, TextChannel)
	-- upvalues: removeTabAndReorder (copy), Dictionary (copy)
	local AllChannelTab = p1.allChannelTabs[TextChannel.Name]
	
	if AllChannelTab == nil then
		return p1
	else
		local RemoveTabAndReorderResult = removeTabAndReorder(p1.allChannelTabs, AllChannelTab)
		local RBXGeneral = if AllChannelTab.Name == p1.selectedTabName then if RemoveTabAndReorderResult.RBXGeneral then "RBXGeneral" else nil else p1.selectedTabName
		local RemoveTabAndReorderResultEntry = RBXGeneral and RemoveTabAndReorderResult[RBXGeneral]
		
		return {
			allChannelTabs = if RemoveTabAndReorderResultEntry then Dictionary.join(RemoveTabAndReorderResult, {
				[RBXGeneral] = Dictionary.join(RemoveTabAndReorderResult[RBXGeneral], { HasUnreadMessages = false })
			}) else RemoveTabAndReorderResult,
			selectedTabName = RBXGeneral,
			channelTabsConfigurationEnabled = p1.channelTabsConfigurationEnabled
		}
	end
end

local function handleIncomingMessageReceived(p1, p2)
	-- upvalues: NewResult (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction (copy), ShouldSuppressUnreadForTabMetadataModule (copy), Dictionary (copy)
	NewResult:trace("IncomingMessageReceived dispatched")
	local AllChannelTab = p1.allChannelTabs[if GetFFlagTextChatEnableUniverseChatTabsFunction() and p2.channelNameOverride then p2.channelNameOverride elseif p2.textChatMessage.TextChannel then if p2.textChatMessage.TextChannel.Name == "RBXSystem" then "RBXGeneral" else p2.textChatMessage.TextChannel.Name else nil]
	
	return if AllChannelTab == nil then p1 elseif p2.isSenderLocalPlayer or AllChannelTab.Name == p1.selectedTabName then p1 elseif GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() and ShouldSuppressUnreadForTabMetadataModule(p2.textChatMessage.Metadata) then p1 else Dictionary.join(p1, {
		allChannelTabs = Dictionary.join(p1.allChannelTabs, {
			[AllChannelTab.Name] = Dictionary.join(AllChannelTab, { HasUnreadMessages = true })
		})
	})
end

local function handleUniverseChatSystemMessageAdded(p3, p4)
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction (copy), ShouldSuppressUnreadForTabMetadataModule (copy), Dictionary (copy)
	if GetFFlagTextChatEnableUniverseChatTabsFunction() then
		local AllChannelTab = p3.allChannelTabs[p4.channelNameOverride]
		
		return if AllChannelTab == nil then p3 elseif AllChannelTab.Name == p3.selectedTabName then p3 elseif GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() and ShouldSuppressUnreadForTabMetadataModule(p4.metadata or "") then p3 else Dictionary.join(p3, {
			allChannelTabs = Dictionary.join(p3.allChannelTabs, {
				[AllChannelTab.Name] = Dictionary.join(AllChannelTab, { HasUnreadMessages = true })
			})
		})
	else
		return p3
	end
end

local function pruneNonSpecialTabs(AllChannelTabs)
	-- upvalues: Dictionary (copy), FFlagExpChatEnableFriendsTab (copy)
	local t = {}
	local HasRBXGeneral = AllChannelTabs.RBXGeneral ~= nil
	
	if HasRBXGeneral then
		t.RBXGeneral = Dictionary.set(AllChannelTabs.RBXGeneral, "TabIndex", 1)
	end
	if AllChannelTabs.RBXGlobal ~= nil then
		t.RBXGlobal = Dictionary.set(AllChannelTabs.RBXGlobal, "TabIndex", if HasRBXGeneral then 2 else 1)
	end
	if if FFlagExpChatEnableFriendsTab then AllChannelTabs.FriendsChat ~= nil else false then
		t.FriendsChat = AllChannelTabs.FriendsChat
	end
	return t
end

return require(Parent.Rodux).createReducer({
	selectedTabName = nil,
	channelTabsConfigurationEnabled = false,
	allChannelTabs = {}
}, {
	[require(Actions.ChannelTabsConfigurationEnabled).name] = function(p3, p4)
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), GetFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), Dictionary (copy), pruneNonSpecialTabs (copy)
		if not GetFFlagTextChatEnableUniverseChatTabsFunction() then
			return p3
		end
		if not GetFFlagExpChatFixChannelTabsMidExperienceToggleModule() or p4.enabled then
			return Dictionary.join(p3, { channelTabsConfigurationEnabled = p4.enabled })
		end
		local PruneNonSpecialTabsResult = pruneNonSpecialTabs(p3.allChannelTabs)
		local SelectedTabName = p3.selectedTabName
		
		if SelectedTabName == nil or PruneNonSpecialTabsResult[SelectedTabName] == nil then
			SelectedTabName = if PruneNonSpecialTabsResult.RBXGeneral then "RBXGeneral" elseif PruneNonSpecialTabsResult.RBXGlobal then "RBXGlobal" else nil
		end
		if SelectedTabName and PruneNonSpecialTabsResult[SelectedTabName] then
			PruneNonSpecialTabsResult = Dictionary.join(PruneNonSpecialTabsResult, {
				[SelectedTabName] = Dictionary.join(PruneNonSpecialTabsResult[SelectedTabName], { HasUnreadMessages = false })
			})
		end
		return {
			channelTabsConfigurationEnabled = false,
			allChannelTabs = PruneNonSpecialTabsResult,
			selectedTabName = SelectedTabName
		}
	end,
	[require(Actions.LocalTextChannelParticipantAdded).name] = function(p3, p4)
		-- upvalues: NewResult (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatEnableFriendsTab (copy), FFlagExpChatChannelTabRefactor (copy), insertTabAndReorder (copy), Dictionary (copy)
		local Name = p4.textChannel.Name
		NewResult:trace("LocalTextChannelParticipantAdded dispatched: {}", Name)
		
		if p3.allChannelTabs[Name] ~= nil or Name == "RBXSystem" then
			return p3
		end
		if GetFFlagTextChatEnableUniverseChatTabsFunction() and not p3.channelTabsConfigurationEnabled and Name ~= "RBXGeneral" then
			return p3
		end
		local TabIndex = nil
		if Name == "RBXGeneral" then
			TabIndex = 1
		elseif GetFFlagTextChatEnableUniverseChatTabsFunction() and Name == "RBXGlobal" then
			TabIndex = if p3.allChannelTabs.RBXGeneral then 2 else 1
		else
			local AllChannelTabs = p3.allChannelTabs
			local HasRBXGeneral = AllChannelTabs.RBXGeneral ~= nil
			local HasRBXGlobal: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and AllChannelTabs.RBXGlobal ~= nil
			local HasFriendsChat: boolean = if FFlagExpChatEnableFriendsTab then AllChannelTabs.FriendsChat ~= nil else false
			TabIndex = (if HasRBXGeneral then 1 else 0) + (if HasRBXGlobal then 1 else 0) + (if HasFriendsChat then 1 else 0) + 1
		end
		local config = {
			HasUnreadMessages = false,
			Name = Name,
			TabIndex = TabIndex
		}
		
		if FFlagExpChatChannelTabRefactor then
			config.Type = "TextChat"
		end
		local InsertTabAndReorderResult = insertTabAndReorder(p3.allChannelTabs, config)
		
		if not GetFFlagTextChatEnableUniverseChatTabsFunction() then
			return if FFlagExpChatEnableFriendsTab and Name == "RBXGeneral" and p3.selectedTabName == "FriendsChat" then Dictionary.join(p3, {
				selectedTabName = "RBXGeneral",
				allChannelTabs = InsertTabAndReorderResult
			}) else Dictionary.join(p3, { allChannelTabs = InsertTabAndReorderResult })
		end
		local SelectedTabName = p3.selectedTabName
		
		if SelectedTabName == "RBXGlobal" and Name == "RBXGeneral" then
			SelectedTabName = "RBXGeneral"
		elseif FFlagExpChatEnableFriendsTab and SelectedTabName == "FriendsChat" and (Name == "RBXGeneral" or Name == "RBXGlobal") then
			SelectedTabName = Name
		end
		return Dictionary.join(p3, {
			allChannelTabs = InsertTabAndReorderResult,
			selectedTabName = SelectedTabName
		})
	end,
	[ExpChatSharedModule.Actions.LocalTextChannelParticipantRemoved.name] = function(p3, p4)
		-- upvalues: NewResult (copy), onChannelRemoved (copy)
		NewResult:trace("LocalTextChannelParticipantRemoved dispatched: {}", p4.textChannel.Name)
		
		return (onChannelRemoved(p3, p4.textChannel))
	end,
	[ExpChatSharedModule.Actions.TextChannelRemoved.name] = function(p3, p4)
		-- upvalues: NewResult (copy), onChannelRemoved (copy)
		NewResult:trace("TextChannelRemoved dispatched: {}", p4.textChannel.Name)
		
		return (onChannelRemoved(p3, p4.textChannel))
	end,
	[ExpChatSharedModule.Actions.TargetTextChannelPropertyChanged.name] = function(p3, p4)
		-- upvalues: NewResult (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatEnableFriendsTab (copy), Dictionary (copy), insertTabAndReorder (copy), removeTabAndReorder (copy)
		NewResult:trace("TargetTextChannelPropertyChanged dispatched")
		
		if not p4.textChannel or not p3.allChannelTabs[p4.textChannel.Name] then
			return if GetFFlagTextChatEnableUniverseChatTabsFunction() and not p3.channelTabsConfigurationEnabled then p3 else Dictionary.join(p3, {
				selectedTabName = if p4.textChannel then p4.textChannel.Name else nil
			})
		end
		local AllChannelTab = p3.allChannelTabs[p4.textChannel.Name]
		local TabIndex = AllChannelTab.TabIndex
		
		if p4.shouldReorderTabs then
			if AllChannelTab.Name == "RBXGeneral" then
				TabIndex = 1
			elseif GetFFlagTextChatEnableUniverseChatTabsFunction() and AllChannelTab.Name == "RBXGlobal" then
				TabIndex = if p3.allChannelTabs.RBXGeneral then 2 else 1
			else
				local AllChannelTabs = p3.allChannelTabs
				local HasRBXGeneral = AllChannelTabs.RBXGeneral ~= nil
				local HasRBXGlobal: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and AllChannelTabs.RBXGlobal ~= nil
				local HasFriendsChat: boolean = if FFlagExpChatEnableFriendsTab then AllChannelTabs.FriendsChat ~= nil else false
				TabIndex = (if HasRBXGeneral then 1 else 0) + (if HasRBXGlobal then 1 else 0) + (if HasFriendsChat then 1 else 0) + 1
			end
		end
		return Dictionary.join(p3, {
			allChannelTabs = insertTabAndReorder(removeTabAndReorder(p3.allChannelTabs, AllChannelTab), (Dictionary.join(AllChannelTab, { HasUnreadMessages = false, TabIndex = TabIndex }))),
			selectedTabName = AllChannelTab.Name
		})
	end,
	[require(Actions.IncomingMessageReceived).name] = handleIncomingMessageReceived,
	[require(Actions.MarkChannelUnreadForIncomingMessage).name] = if FFlagExpChatUseMessagesStore and FFlagExpChatUnreadTabIndicatorV2WindowModule then handleIncomingMessageReceived else nil,
	[require(Actions.UniverseChatSystemMessageAdded).name] = handleUniverseChatSystemMessageAdded,
	[require(Actions.MarkChannelUnreadForSystemMessage).name] = if FFlagExpChatUseMessagesStore and FFlagExpChatUnreadTabIndicatorV2WindowModule then handleUniverseChatSystemMessageAdded else nil,
	[require(Actions.UniverseChatChannelAdded).name] = function(p3, p4)
		-- upvalues: NewResult (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatChannelTabRefactor (copy), insertTabAndReorder (copy), FFlagExpChatEnableFriendsTab (copy), Dictionary (copy)
		NewResult:trace("UniverseChatChannelAdded dispatched: {}", p4.channelName)
		
		if p3.allChannelTabs[p4.channelName] ~= nil then
			return p3
		end
		local config = {
			HasUnreadMessages = false,
			Name = p4.channelName,
			TabIndex = if GetFFlagTextChatEnableUniverseChatTabsFunction() and p4.channelName == "RBXGlobal" then if p3.allChannelTabs.RBXGeneral then 2 else 1 else p4.tabIndex
		}
		
		if FFlagExpChatChannelTabRefactor then
			config.Type = "UniverseChat"
		end
		local InsertTabAndReorderResult = insertTabAndReorder(p3.allChannelTabs, config)
		local SelectedTabName = nil
		
		if GetFFlagTextChatEnableUniverseChatTabsFunction() then
			SelectedTabName = p3.selectedTabName
			
			if SelectedTabName == nil then
				SelectedTabName = if InsertTabAndReorderResult.RBXGeneral then "RBXGeneral" else p4.channelName
			elseif FFlagExpChatEnableFriendsTab and SelectedTabName == "FriendsChat" then
				SelectedTabName = p4.channelName
			end
		else
			SelectedTabName = p3.selectedTabName or p4.channelName
		end
		return Dictionary.join(p3, {
			allChannelTabs = InsertTabAndReorderResult,
			selectedTabName = SelectedTabName
		})
	end,
	[require(Actions.FriendsChatChannelAdded).name] = function(p3, p4)
		-- upvalues: FFlagExpChatEnableFriendsTab (copy), NewResult (copy), insertTabAndReorder (copy), Dictionary (copy)
		if not FFlagExpChatEnableFriendsTab then
			return p3
		end
		NewResult:trace("FriendsChatChannelAdded dispatched: {}", p4.channelName)
		
		if p3.allChannelTabs[p4.channelName] ~= nil then
			return p3
		end
		local InsertTabAndReorderResult = insertTabAndReorder(p3.allChannelTabs, {
			HasUnreadMessages = false,
			Type = "FriendsChat",
			Name = p4.channelName,
			TabIndex = p4.tabIndex
		})
		local SelectedTabName = p3.selectedTabName
		
		if SelectedTabName == nil then
			SelectedTabName = if InsertTabAndReorderResult.RBXGeneral then "RBXGeneral" else p4.channelName
		end
		return Dictionary.join(p3, {
			allChannelTabs = InsertTabAndReorderResult,
			selectedTabName = SelectedTabName
		})
	end,
	[ExpChatSharedModule.Actions.FriendsChatChannelSelected.name] = function(p3, p4)
		-- upvalues: FFlagExpChatEnableFriendsTab (copy), NewResult (copy), Dictionary (copy)
		if FFlagExpChatEnableFriendsTab then
			NewResult:trace("FriendsChatChannelSelected dispatched: {}", p4.channelName)
			
			return Dictionary.join(p3, { selectedTabName = p4.channelName })
		else
			return p3
		end
	end,
	[require(Actions.SetChannelUnreadStatus).name] = function(p3, p4)
		-- upvalues: Dictionary (copy)
		local AllChannelTab = p3.allChannelTabs[p4.channelName]
		
		return if AllChannelTab == nil then p3 else Dictionary.join(p3, {
			allChannelTabs = Dictionary.join(p3.allChannelTabs, {
				[p4.channelName] = Dictionary.join(AllChannelTab, { HasUnreadMessages = p4.hasUnreadMessages })
			})
		})
	end,
	[ExpChatSharedModule.Actions.UniverseChatChannelSelected.name] = function(p3, p4)
		-- upvalues: NewResult (copy), Dictionary (copy)
		NewResult:trace("UniverseChatChannelSelected dispatched: {}", p4.channelName)
		local AllChannelTab = p3.allChannelTabs[p4.channelName]
		
		return if AllChannelTab == nil then Dictionary.join(p3, { selectedTabName = p4.channelName }) else Dictionary.join(p3, {
			allChannelTabs = Dictionary.join(p3.allChannelTabs, {
				[p4.channelName] = Dictionary.join(AllChannelTab, { HasUnreadMessages = false })
			}),
			selectedTabName = p4.channelName
		})
	end
})