local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local SignalsModule = require(Parent.Signals)
local TutilsModule = require(Parent.tutils)
local EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule = require(ExpChat.Flags.EngineFeatureExpChatGlobalChatEngineTelemetryEnabled)
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
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
	-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (copy), FFlagExpChatEnableFriendsTab (copy)
	return if Name == "RBXGeneral" then 1 elseif Name == "RBXGlobal" and GetFFlagTextChatEnableUniverseChatTabsFunction() then 2 elseif Name == "FriendsChat" and FFlagExpChatEnableFriendsTab then 3 else nil
end

return function()
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), TutilsModule (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy), reorderTabs (copy), EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (copy), Callback (ref)
	local Signal, Signal2 = CreateSignalFunction({ selectedTabName = nil, allChannelTabs = {} })
	
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
		handleIncomingOrOutgoingMessage = function(p2, p3, p4)
			-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), Signal2 (copy)
			if not GetFFlagTextChatEnableUniverseChatTabsFunction() and not p2.TextChannel or p3 then return end
			local Name = nil
			
			if GetFFlagTextChatEnableUniverseChatTabsFunction() then
				if p4 then
					Name = p4
				else
					if not p2.TextChannel then return end
					Name = p2.TextChannel.Name
				end
			end
			Signal2(function(Tbl)
				-- upvalues: GetFFlagTextChatEnableUniverseChatTabsFunction (upval), p2 (copy), Name (ref)
				local Copy = table.clone(Tbl)
				
				if not GetFFlagTextChatEnableUniverseChatTabsFunction() then
					local TextChannel = p2.TextChannel
					
					if TextChannel == nil then
						return Tbl
					end
					Name = TextChannel.Name
				end
				if Name == "RBXSystem" then
					Name = "RBXGeneral"
				end
				if Copy.allChannelTabs[Name] and Name ~= Copy.selectedTabName then
					Copy.allChannelTabs = table.clone(Copy.allChannelTabs)
					local Copy1 = table.clone(Copy.allChannelTabs[Name])
					Copy1.HasUnreadMessages = true
					Copy.allChannelTabs[Name] = Copy1
				end
				return Copy
			end)
		end,
		setSelectedTab = function(SelectedTabName)
			-- upvalues: Signal2 (copy)
			Signal2(function(Tbl)
				-- upvalues: SelectedTabName (copy)
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
		setTargetChannel = function(SelectedTabName, p2)
			-- upvalues: Signal2 (copy), reorderTabs (upval), EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval)
			Signal2(function(Tbl)
				-- upvalues: SelectedTabName (copy), p2 (copy), reorderTabs (upval), EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule (upval), GetFFlagTextChatEnableUniverseChatTabsFunction (upval)
				local Copy = table.clone(Tbl)
				
				if SelectedTabName and Copy.allChannelTabs[SelectedTabName] then
					local AllChannelTab = Copy.allChannelTabs[SelectedTabName]
					local config = {
						type = AllChannelTab.type,
						name = AllChannelTab.name,
						tabIndex = if p2 then 0 else AllChannelTab.tabIndex,
						HasUnreadMessages = AllChannelTab.type == "FriendsChat" and AllChannelTab.HasUnreadMessages
					}
					local Copy1 = table.clone(Copy.allChannelTabs)
					Copy1[AllChannelTab.name] = nil
					local Copy2 = table.clone((reorderTabs(Copy1)))
					Copy2[config.name] = config
					Copy.allChannelTabs = reorderTabs(Copy2)
					Copy.selectedTabName = AllChannelTab.name
					
					return Copy
				end
				if not EngineFeatureExpChatGlobalChatEngineTelemetryEnabledModule then
					Copy.selectedTabName = SelectedTabName
				elseif SelectedTabName then
					Copy.selectedTabName = SelectedTabName
					
					return Copy
				elseif not GetFFlagTextChatEnableUniverseChatTabsFunction() then
					Copy.selectedTabName = nil
					
					return Copy
				end
				return Copy
			end)
		end,
		addChannelTab = function(p2, p3)
			-- upvalues: Signal2 (copy), reorderTabs (upval), Callback (upval)
			local Name = p2.name
			Signal2(function(Tbl)
				-- upvalues: p3 (copy), p2 (copy), Name (copy), reorderTabs (upval), Callback (upval)
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
				local CallbackResult = Callback(Name)
				local CallbackResult1 = Callback(Copy.selectedTabName)
				
				if Copy.selectedTabName == nil then
					Copy.selectedTabName = if Copy.allChannelTabs.RBXGeneral then "RBXGeneral" else Name
					
					return Copy
				end
				if CallbackResult ~= nil and (CallbackResult1 == nil or CallbackResult < CallbackResult1) then
					Copy.selectedTabName = Name
				end
				return Copy
			end)
		end,
		removeChannelTab = function(SelectedTabName)
			-- upvalues: Signal2 (copy)
			Signal2(function(Tbl)
				-- upvalues: SelectedTabName (copy)
				local Copy = table.clone(Tbl)
				Copy.allChannelTabs = table.clone(Copy.allChannelTabs)
				Copy.allChannelTabs[SelectedTabName] = nil
				
				if Copy.selectedTabName == SelectedTabName then
					local TabIndex = 1e999
					local SelectedTabName1 = nil
					
					for i, allChannelTab in pairs(Copy.allChannelTabs) do
						if allChannelTab.tabIndex < TabIndex then
							TabIndex = allChannelTab.tabIndex
							SelectedTabName1 = i
						end
					end
					Copy.selectedTabName = SelectedTabName1
				end
				return Copy
			end)
		end,
		handleChannelRemoved = function(p4)
			-- upvalues: Signal2 (copy), reorderTabs (upval)
			Signal2(function(Tbl)
				-- upvalues: p4 (copy), reorderTabs (upval)
				local AllChannelTab = Tbl.allChannelTabs[p4]
				
				if AllChannelTab == nil then
					return Tbl
				end
				local Copy = table.clone(Tbl)
				local Copy1 = table.clone(Copy.allChannelTabs)
				Copy1[AllChannelTab.name] = nil
				Copy.allChannelTabs = reorderTabs(Copy1)
				
				if AllChannelTab.name == Copy.selectedTabName then
					Copy.selectedTabName = if Copy.allChannelTabs.RBXGeneral then "RBXGeneral" else nil
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
		markChannelUnread = function(SelectedTabName)
			-- upvalues: Signal2 (copy)
			Signal2(function(Tbl)
				-- upvalues: SelectedTabName (copy)
				local Copy = table.clone(Tbl)
				
				if Copy.allChannelTabs[SelectedTabName] and SelectedTabName ~= Copy.selectedTabName then
					Copy.allChannelTabs = table.clone(Copy.allChannelTabs)
					local Copy1 = table.clone(Copy.allChannelTabs[SelectedTabName])
					Copy1.HasUnreadMessages = true
					Copy.allChannelTabs[SelectedTabName] = Copy1
				end
				return Copy
			end)
		end,
		setChannelUnreadStatus = function(p4, HasUnreadMessages)
			-- upvalues: Signal2 (copy)
			Signal2(function(Tbl)
				-- upvalues: p4 (copy), HasUnreadMessages (copy)
				if Tbl.allChannelTabs[p4] == nil then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					Copy.allChannelTabs = table.clone(Copy.allChannelTabs)
					local Copy1 = table.clone(Copy.allChannelTabs[p4])
					Copy1.HasUnreadMessages = HasUnreadMessages
					Copy.allChannelTabs[p4] = Copy1
					
					return Copy
				end
			end)
		end
	}
end