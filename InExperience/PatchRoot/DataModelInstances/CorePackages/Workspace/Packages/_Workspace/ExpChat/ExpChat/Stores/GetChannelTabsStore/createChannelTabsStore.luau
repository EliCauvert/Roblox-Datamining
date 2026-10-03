local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local signalsModule = require(parent.Signals)
local tutilsModule = require(parent.tutils)
local expChatSharedModule = require(parent.ExpChatShared)
local shouldRenderTextChannelInDefaultWindow = expChatSharedModule.shouldRenderTextChannelInDefaultWindow
local getTextChannelDisplayMode = expChatSharedModule.getTextChannelDisplayMode
local friendsChatTabNameModule = require(parent.FriendsChat.FriendsChatTabName)
local shouldSuppressUnreadForTabMetadataModule = require(expChat.shouldSuppressUnreadForTabMetadata)
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagExpChatFixChannelTabsMidExperienceToggleModule = require(expChat.Flags.getFFlagExpChatFixChannelTabsMidExperienceToggle)
local getFFlagTextChatEnableUniverseChatTabs = expChatSharedModule.Flags.GetFFlagTextChatEnableUniverseChatTabs
local getFFlagExpChatSuppressWelcomeMessageTabUnread = expChatSharedModule.Flags.GetFFlagExpChatSuppressWelcomeMessageTabUnread
local fFlagExpChatEnableFriendsTab = sharedFlagsModule.FFlagExpChatEnableFriendsTab
local fFlagExpChatFriendsTabRequireDefaultChannels = sharedFlagsModule.FFlagExpChatFriendsTabRequireDefaultChannels
local isGlobalTabFirstModule = require(expChat.isGlobalTabFirst)
local getDefaultTabNameModule = require(expChat.getDefaultTabName)
local fFlagExpChatGlobalTabDefaultModule = require(expChat.Flags.FFlagExpChatGlobalTabDefault)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local getFixedTabPriority = nil

local function reorderTabs(value)
	-- upvalues: getFixedTabPriority (write)
	local cloned = table.clone(value)
	local t = {}
	
	for i, v in pairs(cloned) do
		table.insert(t, v)
	end
	table.sort(t, function(p1, p2)
		-- upvalues: getFixedTabPriority (copy)
		local var1 = getFixedTabPriority(p1.name)
		local var2 = getFixedTabPriority(p2.name)
		
		return if var1 and var2 then var1 < var2 elseif var1 then true elseif var2 then false else p1.tabIndex < p2.tabIndex
	end)
	
	for i_1, v_1 in ipairs(t) do
		cloned[v_1.name] = {
			type = v_1.type,
			name = v_1.name,
			tabIndex = i_1,
			HasUnreadMessages = v_1.HasUnreadMessages
		}
	end
	return cloned
end

local function _(p1, p2)
	-- upvalues: reorderTabs (ref)
	local cloned = table.clone(p1)
	cloned[p2.name] = p2
	
	return reorderTabs(cloned)
end

local _ = function(p1, p2)
	-- upvalues: reorderTabs (ref)
	local cloned = table.clone(p1)
	cloned[p2.name] = nil
	
	return reorderTabs(cloned)
end

getFixedTabPriority = function(p1)
	-- upvalues: fFlagExpChatGlobalTabDefaultModule (ref), isGlobalTabFirstModule (ref), friendsChatTabNameModule (ref), fFlagExpChatEnableFriendsTab (ref), getFFlagTextChatEnableUniverseChatTabs (ref)
	return if fFlagExpChatGlobalTabDefaultModule and isGlobalTabFirstModule() then if p1 == "RBXGlobal" then 1 elseif p1 == "RBXGeneral" then 2 elseif p1 == friendsChatTabNameModule and fFlagExpChatEnableFriendsTab then 3 else nil elseif p1 == "RBXGeneral" then 1 elseif p1 == "RBXGlobal" and getFFlagTextChatEnableUniverseChatTabs() then 2 elseif p1 == friendsChatTabNameModule and fFlagExpChatEnableFriendsTab then 3 else nil
end

local function pruneNonSpecialTabs(value)
	-- upvalues: getFixedTabPriority (write), reorderTabs (ref)
	local t = {}
	
	for i, v in value do
		if getFixedTabPriority(i) ~= nil then
			t[i] = v
		end
	end
	return reorderTabs(t)
end

local _ = function(p1)
	-- upvalues: getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatFriendsTabRequireDefaultChannels (ref), fFlagExpChatEnableFriendsTab (ref)
	local var1
	if not getFFlagTextChatEnableUniverseChatTabs() then
		var1 = fFlagExpChatFriendsTabRequireDefaultChannels and (fFlagExpChatEnableFriendsTab and not p1.channelTabsConfigurationEnabled)
	end
	return var1
end

local function markTabUnread(p1, p2)
	local var1 = p1.allChannelTabs[p2]
	
	if var1 == nil or var1.HasUnreadMessages or p2 == p1.selectedTabName then
		return p1
	end
	local cloned = table.clone(p1)
	cloned.allChannelTabs = table.clone(p1.allChannelTabs)
	local cloned_1 = table.clone(var1)
	cloned_1.HasUnreadMessages = true
	cloned.allChannelTabs[p2] = cloned_1
	
	return cloned
end

local function isTargetChannelNoOp(p1, p2, p3, p4)
	-- upvalues: fFlagExpChatGlobalTabDefaultModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), fFlagExpChatFriendsTabRequireDefaultChannels (ref), fFlagExpChatEnableFriendsTab (ref), getFixedTabPriority (write)
	if fFlagExpChatGlobalTabDefaultModule and p4 and not p1.hasUserSelectedTab then
		return false
	end
	local var1 = if p2 then p1.allChannelTabs[p2] else nil
	
	if var1 then
		return not p3 and (p1.selectedTabName == p2 and (if var1.type ~= "FriendsChat" then not var1.HasUnreadMessages else true))
	end
	local var2 = true
	
	if p2 ~= nil then
		local var3
		if getFFlagTextChatEnableUniverseChatTabs() then
			var3 = not p1.channelTabsConfigurationEnabled
		else
			var3 = fFlagExpChatFriendsTabRequireDefaultChannels
			
			if var3 then
				var3 = fFlagExpChatEnableFriendsTab
				
				if var3 then
				end
			end
		end
		var2 = if var3 then true else p1.selectedTabName == p2
	end
	return var2
end

return function()
	-- upvalues: createSignal (ref), createComputed (ref), tutilsModule (ref), getFFlagTextChatEnableUniverseChatTabs (ref), getFFlagExpChatSuppressWelcomeMessageTabUnread (ref), shouldSuppressUnreadForTabMetadataModule (ref), markTabUnread (ref), isTargetChannelNoOp (ref), fFlagExpChatGlobalTabDefaultModule (ref), reorderTabs (ref), fFlagExpChatFriendsTabRequireDefaultChannels (ref), fFlagExpChatEnableFriendsTab (ref), getFixedTabPriority (write), getDefaultTabNameModule (ref), isGlobalTabFirstModule (ref), shouldRenderTextChannelInDefaultWindow (ref), getTextChannelDisplayMode (ref), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (ref), pruneNonSpecialTabs (ref)
	local var1, var2 = createSignal({
		selectedTabName = nil,
		channelTabsConfigurationEnabled = false,
		hasUserSelectedTab = false,
		allChannelTabs = {}
	})
	
	return {
		getChannelTabsState = var1,
		getSelectedTabName = createComputed(function(p1)
			-- upvalues: var1 (ref)
			return var1(p1).selectedTabName
		end),
		getUnreadChannels = createComputed(function(p1)
			-- upvalues: var1 (ref)
			local t = {}
			
			for i, v in pairs(var1(p1).allChannelTabs) do
				if v.HasUnreadMessages then
					t[i] = true
				end
			end
			return t
		end, tutilsModule.deepEqual),
		handleIncomingOrOutgoingMessage = function(a, b, p2)
			-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), getFFlagExpChatSuppressWelcomeMessageTabUnread (copy), shouldSuppressUnreadForTabMetadataModule (copy), var2 (ref), markTabUnread (copy)
			if not getFFlagTextChatEnableUniverseChatTabs() and not a.TextChannel or b then return end
			if getFFlagExpChatSuppressWelcomeMessageTabUnread() and shouldSuppressUnreadForTabMetadataModule(a.Metadata) then return end
			local name = nil
			
			if getFFlagTextChatEnableUniverseChatTabs() then
				if p2 then
					name = p2
				elseif a.TextChannel then
					name = a.TextChannel.Name
				else
					return
				end
			end
			var2(function(p3)
				-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), a (ref), name (write), markTabUnread (copy)
				if not getFFlagTextChatEnableUniverseChatTabs() then
					local textChannel = a.TextChannel
					
					if textChannel == nil then
						return p3
					end
					name = textChannel.Name
				end
				if name == "RBXSystem" then
					name = "RBXGeneral"
				end
				return markTabUnread(p3, name)
			end)
		end,
		setSelectedTab = function(value)
			-- upvalues: var2 (ref)
			var2(function(p2)
				-- upvalues: value (ref)
				local var3 = p2.allChannelTabs[value]
				
				if p2.selectedTabName == value and (var3 == nil or not var3.HasUnreadMessages) then
					return p2
				end
				local cloned = table.clone(p2)
				cloned.selectedTabName = value
				
				if cloned.allChannelTabs[value] then
					cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
					local cloned_1 = table.clone(cloned.allChannelTabs[value])
					cloned_1.HasUnreadMessages = false
					cloned.allChannelTabs[value] = cloned_1
				end
				return cloned
			end)
		end,
		setTargetChannel = function(value, p2, p3)
			-- upvalues: var2 (ref), isTargetChannelNoOp (copy), fFlagExpChatGlobalTabDefaultModule (copy), reorderTabs (copy), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatFriendsTabRequireDefaultChannels (copy), fFlagExpChatEnableFriendsTab (copy), getFixedTabPriority (copy)
			var2(function(p4)
				-- upvalues: isTargetChannelNoOp (copy), value (ref), p2 (ref), p3 (ref), fFlagExpChatGlobalTabDefaultModule (copy), reorderTabs (copy), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatFriendsTabRequireDefaultChannels (copy), fFlagExpChatEnableFriendsTab (copy), getFixedTabPriority (copy)
				if isTargetChannelNoOp(p4, value, p2, p3) then
					return p4
				end
				local cloned = table.clone(p4)
				
				if fFlagExpChatGlobalTabDefaultModule and p3 then
					cloned.hasUserSelectedTab = true
				end
				if value and cloned.allChannelTabs[value] then
					local var3 = cloned.allChannelTabs[value]
					local t = {
						type = var3.type,
						name = var3.name,
						tabIndex = if p2 then 0 else var3.tabIndex,
						HasUnreadMessages = var3.type == "FriendsChat" and var3.HasUnreadMessages
					}
					local cloned_1 = table.clone(cloned.allChannelTabs)
					cloned_1[t.name] = t
					cloned.allChannelTabs = reorderTabs(cloned_1)
					cloned.selectedTabName = var3.name
					
					return cloned
				elseif value ~= nil then
					local var4
					if not getFFlagTextChatEnableUniverseChatTabs() then
						var4 = fFlagExpChatFriendsTabRequireDefaultChannels and (fFlagExpChatEnableFriendsTab and not cloned.channelTabsConfigurationEnabled)
					end
					if var4 and getFixedTabPriority(value) == nil then
						return cloned
					else
						cloned.selectedTabName = value
						
						return cloned
					end
				end
			end)
		end,
		addChannelTab = function(p2, p3)
			-- upvalues: var2 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatFriendsTabRequireDefaultChannels (copy), fFlagExpChatEnableFriendsTab (copy), reorderTabs (copy), getFixedTabPriority (copy), fFlagExpChatGlobalTabDefaultModule (copy), getDefaultTabNameModule (copy), isGlobalTabFirstModule (copy)
			local name = p2.name
			var2(function(p4)
				-- upvalues: name (ref), p2 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatFriendsTabRequireDefaultChannels (copy), fFlagExpChatEnableFriendsTab (copy), p3 (ref), reorderTabs (copy), getFixedTabPriority (copy), fFlagExpChatGlobalTabDefaultModule (copy), getDefaultTabNameModule (copy), isGlobalTabFirstModule (copy)
				if p4.allChannelTabs[name] ~= nil then
					return p4
				elseif p2.type == "TextChat" and name ~= "RBXGeneral" then
					local var3
					if not getFFlagTextChatEnableUniverseChatTabs() then
						var3 = fFlagExpChatFriendsTabRequireDefaultChannels and (fFlagExpChatEnableFriendsTab and not p4.channelTabsConfigurationEnabled)
					end
					if var3 then
						return p4
					end
				end
				local cloned = table.clone(p4)
				local allChannelTabs = cloned.allChannelTabs
				
				if p3 ~= nil then
					local t = {}
					
					for i, v in cloned.allChannelTabs do
						if p3 <= v.tabIndex then
							local cloned_1 = table.clone(v)
							cloned_1.tabIndex = v.tabIndex + 1
							t[i] = cloned_1
						else
							t[i] = v
						end
					end
					allChannelTabs = t
				end
				local t = {
					HasUnreadMessages = false,
					type = p2.type,
					name = name,
					tabIndex = p3 or 0
				}
				local cloned_1 = table.clone(allChannelTabs)
				cloned_1[t.name] = t
				cloned.allChannelTabs = reorderTabs(cloned_1)
				local var4 = getFixedTabPriority(name)
				local var5 = getFixedTabPriority(cloned.selectedTabName)
				
				if cloned.selectedTabName == nil then
					if p2.type == "TextChat" then
						return cloned
					end
					if fFlagExpChatGlobalTabDefaultModule then
						cloned.selectedTabName = getDefaultTabNameModule(cloned.allChannelTabs) or name
						
						return cloned
					end
					cloned.selectedTabName = if cloned.allChannelTabs.RBXGeneral then "RBXGeneral" else name
					
					return cloned
				elseif var4 ~= nil and var4 < (var5 or 1e999) and (not fFlagExpChatEnableFriendsTab or var5 ~= nil) and (not fFlagExpChatGlobalTabDefaultModule or not isGlobalTabFirstModule() or (name ~= "RBXGlobal" or not cloned.hasUserSelectedTab)) then
					cloned.selectedTabName = name
				end
			end)
		end,
		handleLocalTextChannelParticipantAdded = function(p4)
			-- upvalues: shouldRenderTextChannelInDefaultWindow (copy), getTextChannelDisplayMode (copy), var2 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatFriendsTabRequireDefaultChannels (copy), fFlagExpChatEnableFriendsTab (copy), reorderTabs (copy), getFixedTabPriority (copy), fFlagExpChatGlobalTabDefaultModule (copy), getDefaultTabNameModule (copy), isGlobalTabFirstModule (copy)
			if p4.Name == "RBXSystem" then return end
			if shouldRenderTextChannelInDefaultWindow(p4, getTextChannelDisplayMode()) then
				local t = { type = "TextChat", name = p4.Name }
				local name = t.name
				local var3 = nil
				var2(function(p5)
					-- upvalues: name (ref), t (ref), getFFlagTextChatEnableUniverseChatTabs (copy), fFlagExpChatFriendsTabRequireDefaultChannels (copy), fFlagExpChatEnableFriendsTab (copy), var3 (ref), reorderTabs (copy), getFixedTabPriority (copy), fFlagExpChatGlobalTabDefaultModule (copy), getDefaultTabNameModule (copy), isGlobalTabFirstModule (copy)
					if p5.allChannelTabs[name] ~= nil then
						return p5
					elseif t.type == "TextChat" and name ~= "RBXGeneral" then
						local var4
						if not getFFlagTextChatEnableUniverseChatTabs() then
							var4 = fFlagExpChatFriendsTabRequireDefaultChannels and (fFlagExpChatEnableFriendsTab and not p5.channelTabsConfigurationEnabled)
						end
						if var4 then
							return p5
						end
					end
					local cloned = table.clone(p5)
					local allChannelTabs = cloned.allChannelTabs
					
					if var3 ~= nil then
						local t = {}
						
						for i, v in cloned.allChannelTabs do
							if var3 <= v.tabIndex then
								local cloned_1 = table.clone(v)
								cloned_1.tabIndex = v.tabIndex + 1
								t[i] = cloned_1
							else
								t[i] = v
							end
						end
						allChannelTabs = t
					end
					local t = {
						HasUnreadMessages = false,
						type = t.type,
						name = name,
						tabIndex = var3 or 0
					}
					local cloned_1 = table.clone(allChannelTabs)
					cloned_1[t.name] = t
					cloned.allChannelTabs = reorderTabs(cloned_1)
					local var5 = getFixedTabPriority(name)
					local var6 = getFixedTabPriority(cloned.selectedTabName)
					
					if cloned.selectedTabName == nil then
						if t.type == "TextChat" then
							return cloned
						end
						if fFlagExpChatGlobalTabDefaultModule then
							cloned.selectedTabName = getDefaultTabNameModule(cloned.allChannelTabs) or name
							
							return cloned
						end
						cloned.selectedTabName = if cloned.allChannelTabs.RBXGeneral then "RBXGeneral" else name
						
						return cloned
					elseif var5 ~= nil and var5 < (var6 or 1e999) and (not fFlagExpChatEnableFriendsTab or var6 ~= nil) and (not fFlagExpChatGlobalTabDefaultModule or not isGlobalTabFirstModule() or (name ~= "RBXGlobal" or not cloned.hasUserSelectedTab)) then
						cloned.selectedTabName = name
					end
				end)
				
				return
			end
		end,
		handleChannelRemoved = function(p5)
			-- upvalues: var2 (ref), reorderTabs (copy), fFlagExpChatGlobalTabDefaultModule (copy), getDefaultTabNameModule (copy)
			var2(function(p6)
				-- upvalues: p5 (ref), reorderTabs (copy), fFlagExpChatGlobalTabDefaultModule (copy), getDefaultTabNameModule (copy)
				local var4 = p6.allChannelTabs[p5]
				
				if var4 == nil then
					return p6
				end
				local cloned = table.clone(p6)
				local cloned_1 = table.clone(cloned.allChannelTabs)
				cloned_1[var4.name] = nil
				cloned.allChannelTabs = reorderTabs(cloned_1)
				
				if var4.name == cloned.selectedTabName then
					if fFlagExpChatGlobalTabDefaultModule then
						cloned.selectedTabName = getDefaultTabNameModule(cloned.allChannelTabs)
					else
						cloned.selectedTabName = if cloned.allChannelTabs.RBXGeneral then "RBXGeneral" else nil
					end
				end
				if cloned.selectedTabName and cloned.allChannelTabs[cloned.selectedTabName] then
					cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
					local cloned_2 = table.clone(cloned.allChannelTabs[cloned.selectedTabName])
					cloned_2.HasUnreadMessages = false
					cloned.allChannelTabs[cloned.selectedTabName] = cloned_2
				end
				return cloned
			end)
		end,
		markChannelUnread = function(p5)
			-- upvalues: var2 (ref), markTabUnread (copy)
			var2(function(p6)
				-- upvalues: markTabUnread (copy), p5 (ref)
				return markTabUnread(p6, p5)
			end)
		end,
		setChannelUnreadStatus = function(value, p5)
			-- upvalues: var2 (ref)
			var2(function(p6)
				-- upvalues: value (ref), p5 (ref)
				local var4 = p6.allChannelTabs[value]
				
				if var4 == nil or var4.HasUnreadMessages == p5 then
					return p6
				end
				local cloned = table.clone(p6)
				cloned.allChannelTabs = table.clone(cloned.allChannelTabs)
				local cloned_1 = table.clone(cloned.allChannelTabs[value])
				cloned_1.HasUnreadMessages = p5
				cloned.allChannelTabs[value] = cloned_1
				
				return cloned
			end)
		end,
		setChannelTabsConfigurationEnabled = function(value)
			-- upvalues: var2 (ref), getFFlagTextChatEnableUniverseChatTabs (copy), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), pruneNonSpecialTabs (copy), fFlagExpChatGlobalTabDefaultModule (copy), getDefaultTabNameModule (copy)
			var2(function(p5)
				-- upvalues: getFFlagTextChatEnableUniverseChatTabs (copy), getFFlagExpChatFixChannelTabsMidExperienceToggleModule (copy), value (ref), pruneNonSpecialTabs (copy), fFlagExpChatGlobalTabDefaultModule (copy), getDefaultTabNameModule (copy)
				if not getFFlagTextChatEnableUniverseChatTabs() then
					return p5
				elseif not getFFlagExpChatFixChannelTabsMidExperienceToggleModule() or value then
					local cloned = table.clone(p5)
					cloned.channelTabsConfigurationEnabled = value
					
					return cloned
				end
				local var4 = pruneNonSpecialTabs(p5.allChannelTabs)
				local selectedTabName = p5.selectedTabName
				
				if selectedTabName == nil or var4[selectedTabName] == nil then
					selectedTabName = if fFlagExpChatGlobalTabDefaultModule then getDefaultTabNameModule(var4) or (if var4.RBXGlobal then "RBXGlobal" else nil) elseif var4.RBXGeneral then "RBXGeneral" elseif var4.RBXGlobal then "RBXGlobal" else nil
				end
				if selectedTabName and var4[selectedTabName] then
					var4[selectedTabName].HasUnreadMessages = false
				end
				return {
					channelTabsConfigurationEnabled = false,
					allChannelTabs = var4,
					selectedTabName = selectedTabName,
					hasUserSelectedTab = p5.hasUserSelectedTab
				}
			end)
		end
	}
end