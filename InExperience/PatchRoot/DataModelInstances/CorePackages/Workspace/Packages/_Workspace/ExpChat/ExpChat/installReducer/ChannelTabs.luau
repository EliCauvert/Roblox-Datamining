local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local ExpChatSharedModule = require(Parent.ExpChatShared)
local ShouldRenderTextChannelInDefaultWindowFunction = ExpChatSharedModule.shouldRenderTextChannelInDefaultWindow
local GetTextChannelDisplayModeFunction = ExpChatSharedModule.getTextChannelDisplayMode
local SharedFlagsModule = require(Parent.SharedFlags)
local NewResult = ExpChatSharedModule.Logger:new("ExpChat/Reducers/" .. script.Name)
local Actions = ExpChat.Actions
local FriendsChatTabNameModule = require(Parent.FriendsChat.FriendsChatTabName)
local FFlagExpChatUnreadTabIndicatorV2WindowModule = require(ExpChat.Flags.FFlagExpChatUnreadTabIndicatorV2Window)
local GetFFlagExpChatFixChannelTabsMidExperienceToggleModule = require(ExpChat.Flags.getFFlagExpChatFixChannelTabsMidExperienceToggle)
local FFlagExpChatEnableFriendsTab = SharedFlagsModule.FFlagExpChatEnableFriendsTab
local FFlagExpChatFriendsTabRequireDefaultChannels = SharedFlagsModule.FFlagExpChatFriendsTabRequireDefaultChannels
local GetFFlagTextChatEnableUniverseChatTabsFunction = ExpChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction = ExpChatSharedModule.Flags.GetFFlagExpChatSuppressWelcomeMessageTabUnread
local ShouldSuppressUnreadForTabMetadataModule = require(ExpChat.shouldSuppressUnreadForTabMetadata)
local IsGlobalTabFirstModule = require(ExpChat.isGlobalTabFirst)
local GetDefaultTabNameModule = require(ExpChat.getDefaultTabName)
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)

local function insertTabAndReorder(AllChannelTabs, JoinResult) --[[ Line: 72 ]]
	-- upvalues: Dictionary (copy)
	local JoinResult1 = { [JoinResult.Name] = JoinResult }
	
	for i, allChannelTab in AllChannelTabs do
		JoinResult1 = Dictionary.join(JoinResult1, {
			[i] = Dictionary.set(AllChannelTabs[i], "TabIndex", allChannelTab.TabIndex < JoinResult.TabIndex and allChannelTab.TabIndex or allChannelTab.TabIndex + 1)
		})
	end
	return JoinResult1
end

local function _(p1): boolean --[[ Line: 90 | Named "hasFriendsTab" ]]
	-- upvalues: FFlagExpChatEnableFriendsTab (copy), FriendsChatTabNameModule (copy)
	return if FFlagExpChatEnableFriendsTab then p1[FriendsChatTabNameModule] ~= nil else false
end

local _ = function(p1): number --[[ Line: 99 | Named "priorityTabCount" ]]
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatEnableFriendsTab (copy), FriendsChatTabNameModule (copy)
	local HasRBXGeneral = p1.RBXGeneral ~= nil
	local HasRBXGlobal: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and p1.RBXGlobal ~= nil
	local v1: boolean = if FFlagExpChatEnableFriendsTab then p1[FriendsChatTabNameModule] ~= nil else false
	
	return (if HasRBXGeneral then 1 else 0) + (if HasRBXGlobal then 1 else 0) + (if v1 then 1 else 0)
end

local _ = function(p1): number --[[ Line: 109 | Named "nextDeveloperTabIndex" ]]
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatEnableFriendsTab (copy), FriendsChatTabNameModule (copy)
	local HasRBXGeneral = p1.RBXGeneral ~= nil
	local HasRBXGlobal: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and p1.RBXGlobal ~= nil
	local v1: boolean = if FFlagExpChatEnableFriendsTab then p1[FriendsChatTabNameModule] ~= nil else false
	
	return (if HasRBXGeneral then 1 else 0) + (if HasRBXGlobal then 1 else 0) + (if v1 then 1 else 0) + 1
end

local _ = function(p1, p2): number --[[ Line: 117 | Named "getPlatformTabIndex" ]]
	-- upvalues: FFlagExpChatGlobalTabDefaultModule (copy), IsGlobalTabFirstModule (copy)
	return if FFlagExpChatGlobalTabDefaultModule and IsGlobalTabFirstModule() then if p1 == "RBXGlobal" then 1 elseif p2.RBXGlobal then 2 else 1 elseif p1 == "RBXGeneral" then 1 elseif p2.RBXGeneral then 2 else 1
end

local _ = function(p1): number --[[ Line: 131 | Named "getFriendsTabIndex" ]]
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy)
	local HasRBXGeneral = p1.RBXGeneral ~= nil
	local HasRBXGlobal: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and p1.RBXGlobal ~= nil
	
	return (if HasRBXGeneral then 1 else 0) + 1 + (if HasRBXGlobal then 1 else 0)
end

local function removeTabAndReorder(AllChannelTabs, AllChannelTab) --[[ Line: 137 ]]
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

local function removeChannelTab(p1, ChannelName) --[[ Line: 161 ]]
	-- upvalues: removeTabAndReorder (copy), FFlagExpChatGlobalTabDefaultModule (copy), GetDefaultTabNameModule (copy), Dictionary (copy)
	local AllChannelTab = p1.allChannelTabs[ChannelName]
	
	if AllChannelTab == nil then
		return p1
	else
		local RemoveTabAndReorderResult = removeTabAndReorder(p1.allChannelTabs, AllChannelTab)
		local DefaultTabNameModule = if AllChannelTab.Name == p1.selectedTabName then if FFlagExpChatGlobalTabDefaultModule then GetDefaultTabNameModule(RemoveTabAndReorderResult) elseif RemoveTabAndReorderResult.RBXGeneral then "RBXGeneral" else nil else p1.selectedTabName
		local RemoveTabAndReorderResultEntry = DefaultTabNameModule and RemoveTabAndReorderResult[DefaultTabNameModule]
		
		return {
			allChannelTabs = if RemoveTabAndReorderResultEntry then Dictionary.join(RemoveTabAndReorderResult, {
				[DefaultTabNameModule] = Dictionary.join(RemoveTabAndReorderResult[DefaultTabNameModule], { HasUnreadMessages = false })
			}) else RemoveTabAndReorderResult,
			selectedTabName = DefaultTabNameModule,
			channelTabsConfigurationEnabled = p1.channelTabsConfigurationEnabled,
			hasUserSelectedTab = if FFlagExpChatGlobalTabDefaultModule then p1.hasUserSelectedTab else nil
		}
	end
end

local function onChannelRemoved(p1, TextChannel) --[[ Line: 189 ]]
	-- upvalues: FFlagExpChatEnableFriendsTab (copy), removeTabAndReorder (copy), FFlagExpChatGlobalTabDefaultModule (copy), GetDefaultTabNameModule (copy), Dictionary (copy), removeChannelTab (copy)
	if FFlagExpChatEnableFriendsTab then
		return (removeChannelTab(p1, TextChannel.Name))
	end
	local AllChannelTab = p1.allChannelTabs[TextChannel.Name]
	
	if AllChannelTab == nil then
		return p1
	else
		local RemoveTabAndReorderResult = removeTabAndReorder(p1.allChannelTabs, AllChannelTab)
		local DefaultTabNameModule = if AllChannelTab.Name == p1.selectedTabName then if FFlagExpChatGlobalTabDefaultModule then GetDefaultTabNameModule(RemoveTabAndReorderResult) elseif RemoveTabAndReorderResult.RBXGeneral then "RBXGeneral" else nil else p1.selectedTabName
		local RemoveTabAndReorderResultEntry = DefaultTabNameModule and RemoveTabAndReorderResult[DefaultTabNameModule]
		
		return {
			allChannelTabs = if RemoveTabAndReorderResultEntry then Dictionary.join(RemoveTabAndReorderResult, {
				[DefaultTabNameModule] = Dictionary.join(RemoveTabAndReorderResult[DefaultTabNameModule], { HasUnreadMessages = false })
			}) else RemoveTabAndReorderResult,
			selectedTabName = DefaultTabNameModule,
			channelTabsConfigurationEnabled = p1.channelTabsConfigurationEnabled,
			hasUserSelectedTab = if FFlagExpChatGlobalTabDefaultModule then p1.hasUserSelectedTab else nil
		}
	end
end

local function handleIncomingMessageReceived(p1, p2) --[[ Line: 221 ]]
	-- upvalues: NewResult (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction (copy), ShouldSuppressUnreadForTabMetadataModule (copy), Dictionary (copy)
	NewResult:trace("IncomingMessageReceived dispatched")
	local AllChannelTab = p1.allChannelTabs[if GetFFlagTextChatEnableUniverseChatTabsFunction() and p2.channelNameOverride then p2.channelNameOverride elseif p2.textChatMessage.TextChannel then if p2.textChatMessage.TextChannel.Name == "RBXSystem" then "RBXGeneral" else p2.textChatMessage.TextChannel.Name else nil]
	
	return if AllChannelTab == nil then p1 elseif p2.isSenderLocalPlayer or AllChannelTab.Name == p1.selectedTabName then p1 elseif GetFFlagExpChatSuppressWelcomeMessageTabUnreadFunction() and ShouldSuppressUnreadForTabMetadataModule(p2.textChatMessage.Metadata) then p1 else Dictionary.join(p1, {
		allChannelTabs = Dictionary.join(p1.allChannelTabs, {
			[AllChannelTab.Name] = Dictionary.join(AllChannelTab, { HasUnreadMessages = true })
		})
	})
end

local function handleUniverseChatSystemMessageAdded(p3, p4) --[[ Line: 262 ]]
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

local function pruneNonSpecialTabs(AllChannelTabs) --[[ Line: 295 ]]
	-- upvalues: FFlagExpChatGlobalTabDefaultModule (copy), Dictionary (copy), IsGlobalTabFirstModule (copy), FFlagExpChatEnableFriendsTab (copy), FriendsChatTabNameModule (copy)
	local t = {}
	local HasRBXGeneral = AllChannelTabs.RBXGeneral ~= nil
	
	if HasRBXGeneral then
		if FFlagExpChatGlobalTabDefaultModule then
			t.RBXGeneral = Dictionary.set(AllChannelTabs.RBXGeneral, "TabIndex", if FFlagExpChatGlobalTabDefaultModule and IsGlobalTabFirstModule() and AllChannelTabs.RBXGlobal then 2 else 1)
		else
			t.RBXGeneral = Dictionary.set(AllChannelTabs.RBXGeneral, "TabIndex", 1)
		end
	end
	if AllChannelTabs.RBXGlobal ~= nil then
		if FFlagExpChatGlobalTabDefaultModule then
			t.RBXGlobal = Dictionary.set(AllChannelTabs.RBXGlobal, "TabIndex", if FFlagExpChatGlobalTabDefaultModule and IsGlobalTabFirstModule() then 1 elseif AllChannelTabs.RBXGeneral then 2 else 1)
		else
			t.RBXGlobal = Dictionary.set(AllChannelTabs.RBXGlobal, "TabIndex", if HasRBXGeneral then 2 else 1)
		end
	end
	if if FFlagExpChatEnableFriendsTab then AllChannelTabs[FriendsChatTabNameModule] ~= nil else false then
		t[FriendsChatTabNameModule] = AllChannelTabs[FriendsChatTabNameModule]
	end
	return t
end

local _ = function(p3): boolean --[[ Line: 340 | Named "isDefaultTabOnlyMode" ]]
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatFriendsTabRequireDefaultChannels (copy), FFlagExpChatEnableFriendsTab (copy)
	return if GetFFlagTextChatEnableUniverseChatTabsFunction() then not p3.channelTabsConfigurationEnabled else FFlagExpChatFriendsTabRequireDefaultChannels and (FFlagExpChatEnableFriendsTab and not p3.channelTabsConfigurationEnabled)
end

local function selectTextChannelTabByName(JoinResult, ChannelName, ShouldReorderTabs) --[[ Line: 347 ]]
	-- upvalues: FFlagExpChatGlobalTabDefaultModule (copy), IsGlobalTabFirstModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatEnableFriendsTab (copy), FriendsChatTabNameModule (copy), Dictionary (copy), insertTabAndReorder (copy), removeTabAndReorder (copy), FFlagExpChatFriendsTabRequireDefaultChannels (copy)
	if not ChannelName or not JoinResult.allChannelTabs[ChannelName] then
		local NoChannelTabsConfigurationEnabled: boolean = if GetFFlagTextChatEnableUniverseChatTabsFunction() then not JoinResult.channelTabsConfigurationEnabled else FFlagExpChatFriendsTabRequireDefaultChannels and (FFlagExpChatEnableFriendsTab and not JoinResult.channelTabsConfigurationEnabled)
		
		return if NoChannelTabsConfigurationEnabled then JoinResult else Dictionary.join(JoinResult, { selectedTabName = ChannelName })
	end
	local AllChannelTab = JoinResult.allChannelTabs[ChannelName]
	local TabIndex = AllChannelTab.TabIndex
	
	if ShouldReorderTabs then
		if AllChannelTab.Name == "RBXGeneral" then
			if FFlagExpChatGlobalTabDefaultModule then
				local AllChannelTabs = JoinResult.allChannelTabs
				TabIndex = if FFlagExpChatGlobalTabDefaultModule and IsGlobalTabFirstModule() and AllChannelTabs.RBXGlobal then 2 else 1
			else
				TabIndex = 1
			end
		elseif GetFFlagTextChatEnableUniverseChatTabsFunction() and AllChannelTab.Name == "RBXGlobal" then
			if FFlagExpChatGlobalTabDefaultModule then
				local AllChannelTabs = JoinResult.allChannelTabs
				TabIndex = if FFlagExpChatGlobalTabDefaultModule and IsGlobalTabFirstModule() then 1 elseif AllChannelTabs.RBXGeneral then 2 else 1
			else
				TabIndex = if JoinResult.allChannelTabs.RBXGeneral then 2 else 1
			end
		else
			local AllChannelTabs = JoinResult.allChannelTabs
			local HasRBXGeneral = AllChannelTabs.RBXGeneral ~= nil
			local HasRBXGlobal: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and AllChannelTabs.RBXGlobal ~= nil
			local HasAllChannelTab: boolean = if FFlagExpChatEnableFriendsTab then AllChannelTabs[FriendsChatTabNameModule] ~= nil else false
			TabIndex = (if HasRBXGeneral then 1 else 0) + (if HasRBXGlobal then 1 else 0) + (if HasAllChannelTab then 1 else 0) + 1
		end
	end
	return Dictionary.join(JoinResult, {
		allChannelTabs = insertTabAndReorder(removeTabAndReorder(JoinResult.allChannelTabs, AllChannelTab), (Dictionary.join(AllChannelTab, { HasUnreadMessages = false, TabIndex = TabIndex }))),
		selectedTabName = AllChannelTab.Name
	})
end

return require(Parent.Rodux).createReducer({
	selectedTabName = nil,
	channelTabsConfigurationEnabled = false,
	hasUserSelectedTab = false,
	allChannelTabs = {}
}, {
	[require(Actions.ChannelTabsConfigurationEnabled).name] = function(p3, p4) --[[ Line: 389 ]]
		-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), GetFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), Dictionary (copy), pruneNonSpecialTabs (copy), FFlagExpChatGlobalTabDefaultModule (copy), GetDefaultTabNameModule (copy)
		if not GetFFlagTextChatEnableUniverseChatTabsFunction() then
			return p3
		end
		if not GetFFlagExpChatFixChannelTabsMidExperienceToggleModule() or p4.enabled then
			return Dictionary.join(p3, { channelTabsConfigurationEnabled = p4.enabled })
		end
		local PruneNonSpecialTabsResult = pruneNonSpecialTabs(p3.allChannelTabs)
		local SelectedTabName = p3.selectedTabName
		
		if SelectedTabName == nil or PruneNonSpecialTabsResult[SelectedTabName] == nil then
			SelectedTabName = if FFlagExpChatGlobalTabDefaultModule then GetDefaultTabNameModule(PruneNonSpecialTabsResult) or (if PruneNonSpecialTabsResult.RBXGlobal then "RBXGlobal" else nil) elseif PruneNonSpecialTabsResult.RBXGeneral then "RBXGeneral" elseif PruneNonSpecialTabsResult.RBXGlobal then "RBXGlobal" else nil
		end
		if SelectedTabName and PruneNonSpecialTabsResult[SelectedTabName] then
			PruneNonSpecialTabsResult = Dictionary.join(PruneNonSpecialTabsResult, {
				[SelectedTabName] = Dictionary.join(PruneNonSpecialTabsResult[SelectedTabName], { HasUnreadMessages = false })
			})
		end
		return {
			channelTabsConfigurationEnabled = false,
			allChannelTabs = PruneNonSpecialTabsResult,
			selectedTabName = SelectedTabName,
			hasUserSelectedTab = if FFlagExpChatGlobalTabDefaultModule then p3.hasUserSelectedTab else nil
		}
	end,
	[require(Actions.LocalTextChannelParticipantAdded).name] = function(p3, p4) --[[ Line: 430 ]]
		-- upvalues: NewResult (copy), ShouldRenderTextChannelInDefaultWindowFunction (copy), GetTextChannelDisplayModeFunction (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatFriendsTabRequireDefaultChannels (copy), FFlagExpChatEnableFriendsTab (copy), FFlagExpChatGlobalTabDefaultModule (copy), IsGlobalTabFirstModule (copy), FriendsChatTabNameModule (copy), insertTabAndReorder (copy), Dictionary (copy)
		local Name = p4.textChannel.Name
		NewResult:trace("LocalTextChannelParticipantAdded dispatched: {}", Name)
		
		if p3.allChannelTabs[Name] ~= nil or Name == "RBXSystem" then
			return p3
		end
		if not ShouldRenderTextChannelInDefaultWindowFunction(p4.textChannel, GetTextChannelDisplayModeFunction()) then
			return p3
		end
		if (if GetFFlagTextChatEnableUniverseChatTabsFunction() then not p3.channelTabsConfigurationEnabled else FFlagExpChatFriendsTabRequireDefaultChannels and (FFlagExpChatEnableFriendsTab and not p3.channelTabsConfigurationEnabled)) and Name ~= "RBXGeneral" then
			return p3
		end
		local TabIndex = nil
		if Name == "RBXGeneral" then
			if FFlagExpChatGlobalTabDefaultModule then
				local AllChannelTabs = p3.allChannelTabs
				TabIndex = if FFlagExpChatGlobalTabDefaultModule and IsGlobalTabFirstModule() and AllChannelTabs.RBXGlobal then 2 else 1
			else
				TabIndex = 1
			end
		elseif GetFFlagTextChatEnableUniverseChatTabsFunction() and Name == "RBXGlobal" then
			if FFlagExpChatGlobalTabDefaultModule then
				local AllChannelTabs = p3.allChannelTabs
				TabIndex = if FFlagExpChatGlobalTabDefaultModule and IsGlobalTabFirstModule() then 1 elseif AllChannelTabs.RBXGeneral then 2 else 1
			else
				TabIndex = if p3.allChannelTabs.RBXGeneral then 2 else 1
			end
		else
			local AllChannelTabs = p3.allChannelTabs
			local HasRBXGeneral = AllChannelTabs.RBXGeneral ~= nil
			local HasRBXGlobal: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and AllChannelTabs.RBXGlobal ~= nil
			local HasAllChannelTab: boolean = if FFlagExpChatEnableFriendsTab then AllChannelTabs[FriendsChatTabNameModule] ~= nil else false
			TabIndex = (if HasRBXGeneral then 1 else 0) + (if HasRBXGlobal then 1 else 0) + (if HasAllChannelTab then 1 else 0) + 1
		end
		local InsertTabAndReorderResult = insertTabAndReorder(p3.allChannelTabs, {
			HasUnreadMessages = false,
			Name = Name,
			TabIndex = TabIndex,
			Type = "TextChat"
		})
		
		if not GetFFlagTextChatEnableUniverseChatTabsFunction() then
			return if FFlagExpChatEnableFriendsTab and Name == "RBXGeneral" and p3.selectedTabName == FriendsChatTabNameModule then Dictionary.join(p3, {
				selectedTabName = "RBXGeneral",
				allChannelTabs = InsertTabAndReorderResult
			}) else Dictionary.join(p3, { allChannelTabs = InsertTabAndReorderResult })
		end
		local SelectedTabName = p3.selectedTabName
		
		if SelectedTabName == "RBXGlobal" and Name == "RBXGeneral" and (not FFlagExpChatGlobalTabDefaultModule or not IsGlobalTabFirstModule()) then
			SelectedTabName = "RBXGeneral"
		elseif FFlagExpChatEnableFriendsTab and SelectedTabName == FriendsChatTabNameModule and (Name == "RBXGeneral" or Name == "RBXGlobal") then
			SelectedTabName = Name
		end
		return Dictionary.join(p3, {
			allChannelTabs = InsertTabAndReorderResult,
			selectedTabName = SelectedTabName
		})
	end,
	[ExpChatSharedModule.Actions.LocalTextChannelParticipantRemoved.name] = function(p3, p4) --[[ Line: 511 ]]
		-- upvalues: NewResult (copy), onChannelRemoved (copy)
		NewResult:trace("LocalTextChannelParticipantRemoved dispatched: {}", p4.textChannel.Name)
		
		return (onChannelRemoved(p3, p4.textChannel))
	end,
	[ExpChatSharedModule.Actions.TextChannelRemoved.name] = function(p3, p4) --[[ Line: 519 ]]
		-- upvalues: NewResult (copy), onChannelRemoved (copy)
		NewResult:trace("TextChannelRemoved dispatched: {}", p4.textChannel.Name)
		
		return (onChannelRemoved(p3, p4.textChannel))
	end,
	[ExpChatSharedModule.Actions.TargetTextChannelPropertyChanged.name] = function(p3, p4) --[[ Line: 524 ]]
		-- upvalues: NewResult (copy), selectTextChannelTabByName (copy)
		NewResult:trace("TargetTextChannelPropertyChanged dispatched")
		
		return selectTextChannelTabByName(p3, if p4.textChannel then p4.textChannel.Name else nil, p4.shouldReorderTabs)
	end,
	[ExpChatSharedModule.Actions.TextChatChannelSelected.name] = function(p3, p4) --[[ Line: 534 ]]
		-- upvalues: NewResult (copy), FFlagExpChatGlobalTabDefaultModule (copy), selectTextChannelTabByName (copy), Dictionary (copy)
		NewResult:trace("TextChatChannelSelected dispatched: {}", p4.channelName)
		
		return if FFlagExpChatGlobalTabDefaultModule then selectTextChannelTabByName(Dictionary.join(p3, { hasUserSelectedTab = true }), p4.channelName, p4.shouldReorderTabs) else selectTextChannelTabByName(p3, p4.channelName, p4.shouldReorderTabs)
	end,
	[require(Actions.IncomingMessageReceived).name] = handleIncomingMessageReceived,
	[require(Actions.MarkChannelUnreadForIncomingMessage).name] = if FFlagExpChatUnreadTabIndicatorV2WindowModule then handleIncomingMessageReceived else nil,
	[require(Actions.UniverseChatSystemMessageAdded).name] = handleUniverseChatSystemMessageAdded,
	[require(Actions.MarkChannelUnreadForSystemMessage).name] = if FFlagExpChatUnreadTabIndicatorV2WindowModule then handleUniverseChatSystemMessageAdded else nil,
	[require(Actions.UniverseChatChannelAdded).name] = function(p3, p4) --[[ Line: 562 ]]
		-- upvalues: NewResult (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatGlobalTabDefaultModule (copy), IsGlobalTabFirstModule (copy), insertTabAndReorder (copy), GetDefaultTabNameModule (copy), FFlagExpChatEnableFriendsTab (copy), FriendsChatTabNameModule (copy), Dictionary (copy)
		NewResult:trace("UniverseChatChannelAdded dispatched: {}", p4.channelName)
		
		if p3.allChannelTabs[p4.channelName] ~= nil then
			return p3
		end
		local TabIndex = p4.tabIndex
		
		if GetFFlagTextChatEnableUniverseChatTabsFunction() and p4.channelName == "RBXGlobal" then
			if FFlagExpChatGlobalTabDefaultModule then
				local AllChannelTabs = p3.allChannelTabs
				TabIndex = if FFlagExpChatGlobalTabDefaultModule and IsGlobalTabFirstModule() then 1 elseif AllChannelTabs.RBXGeneral then 2 else 1
			else
				TabIndex = if p3.allChannelTabs.RBXGeneral then 2 else 1
			end
		end
		local InsertTabAndReorderResult = insertTabAndReorder(p3.allChannelTabs, {
			HasUnreadMessages = false,
			Name = p4.channelName,
			TabIndex = TabIndex,
			Type = "UniverseChat"
		})
		local SelectedTabName = nil
		
		if GetFFlagTextChatEnableUniverseChatTabsFunction() then
			SelectedTabName = p3.selectedTabName
			
			if SelectedTabName == nil then
				SelectedTabName = if FFlagExpChatGlobalTabDefaultModule then GetDefaultTabNameModule(InsertTabAndReorderResult) or p4.channelName elseif InsertTabAndReorderResult.RBXGeneral then "RBXGeneral" else p4.channelName
			elseif FFlagExpChatGlobalTabDefaultModule and IsGlobalTabFirstModule() and p4.channelName == "RBXGlobal" and not p3.hasUserSelectedTab then
				SelectedTabName = p4.channelName
			elseif FFlagExpChatEnableFriendsTab and SelectedTabName == FriendsChatTabNameModule then
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
	[require(Actions.FriendsChatChannelAdded).name] = function(p3, p4) --[[ Line: 614 ]]
		-- upvalues: FFlagExpChatEnableFriendsTab (copy), NewResult (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), insertTabAndReorder (copy), FFlagExpChatGlobalTabDefaultModule (copy), GetDefaultTabNameModule (copy), Dictionary (copy)
		if not FFlagExpChatEnableFriendsTab then
			return p3
		end
		NewResult:trace("FriendsChatChannelAdded dispatched: {}", p4.channelName)
		
		if p3.allChannelTabs[p4.channelName] ~= nil then
			return p3
		end
		local config = {
			HasUnreadMessages = false,
			Type = "FriendsChat",
			Name = p4.channelName,
			TabIndex = (if HasRBXGeneral then 1 else 0) + 1 + (if HasRBXGlobal then 1 else 0)
		}
		local AllChannelTabs = p3.allChannelTabs
		local HasRBXGeneral = AllChannelTabs.RBXGeneral ~= nil
		local HasRBXGlobal: boolean = GetFFlagTextChatEnableUniverseChatTabsFunction() and AllChannelTabs.RBXGlobal ~= nil
		local InsertTabAndReorderResult = insertTabAndReorder(p3.allChannelTabs, config)
		local SelectedTabName = p3.selectedTabName
		
		if SelectedTabName == nil then
			SelectedTabName = if FFlagExpChatGlobalTabDefaultModule then GetDefaultTabNameModule(InsertTabAndReorderResult) or p4.channelName elseif InsertTabAndReorderResult.RBXGeneral then "RBXGeneral" else p4.channelName
		end
		return Dictionary.join(p3, {
			allChannelTabs = InsertTabAndReorderResult,
			selectedTabName = SelectedTabName
		})
	end,
	[require(Actions.FriendsChatChannelRemoved).name] = function(p3, p4) --[[ Line: 645 ]]
		-- upvalues: FFlagExpChatEnableFriendsTab (copy), NewResult (copy), removeChannelTab (copy)
		if FFlagExpChatEnableFriendsTab then
			NewResult:trace("FriendsChatChannelRemoved dispatched: {}", p4.channelName)
			
			return (removeChannelTab(p3, p4.channelName))
		else
			return p3
		end
	end,
	[ExpChatSharedModule.Actions.FriendsChatChannelSelected.name] = function(p3, p4) --[[ Line: 653 ]]
		-- upvalues: FFlagExpChatEnableFriendsTab (copy), NewResult (copy), Dictionary (copy)
		if FFlagExpChatEnableFriendsTab then
			NewResult:trace("FriendsChatChannelSelected dispatched: {}", p4.channelName)
			
			return Dictionary.join(p3, { selectedTabName = p4.channelName })
		else
			return p3
		end
	end,
	[require(Actions.SetChannelUnreadStatus).name] = function(p3, p4) --[[ Line: 665 ]]
		-- upvalues: Dictionary (copy)
		local AllChannelTab = p3.allChannelTabs[p4.channelName]
		
		return if AllChannelTab == nil then p3 else Dictionary.join(p3, {
			allChannelTabs = Dictionary.join(p3.allChannelTabs, {
				[p4.channelName] = Dictionary.join(AllChannelTab, { HasUnreadMessages = p4.hasUnreadMessages })
			})
		})
	end,
	[ExpChatSharedModule.Actions.UniverseChatChannelSelected.name] = function(p3, p4) --[[ Line: 680 ]]
		-- upvalues: NewResult (copy), FFlagExpChatGlobalTabDefaultModule (copy), Dictionary (copy)
		NewResult:trace("UniverseChatChannelSelected dispatched: {}", p4.channelName)
		local AllChannelTab = p3.allChannelTabs[p4.channelName]
		
		return if AllChannelTab == nil then if FFlagExpChatGlobalTabDefaultModule then Dictionary.join(p3, {
			selectedTabName = p4.channelName,
			hasUserSelectedTab = if p4.isUserInitiated then true else nil
		}) else Dictionary.join(p3, { selectedTabName = p4.channelName }) else Dictionary.join(p3, {
			allChannelTabs = Dictionary.join(p3.allChannelTabs, {
				[p4.channelName] = Dictionary.join(AllChannelTab, { HasUnreadMessages = false })
			}),
			selectedTabName = p4.channelName,
			hasUserSelectedTab = if FFlagExpChatGlobalTabDefaultModule and p4.isUserInitiated then true else nil
		})
	end
})