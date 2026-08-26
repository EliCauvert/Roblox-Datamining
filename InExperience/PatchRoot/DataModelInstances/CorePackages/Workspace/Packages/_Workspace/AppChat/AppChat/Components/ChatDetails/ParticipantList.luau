local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local socialLibrariesModule = require(appChat.SocialLibraries)
local cryoModule = require(parent.Cryo)
local dataHydrationModule = require(parent.DataHydration)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local userModel = require(parent.UserLib).Models.UserModel
local memo = reactModule.memo
local useLocalization = require(parent.Localization).Hooks.useLocalization
local loggerModule = require(script.Parent.Logger)
local presenceSortComparator = socialLibrariesModule.Utils.presenceSortComparator
local sortedList = socialLibrariesModule.Components.SortedList
local participantEntryRightFrameModule = require(script.Parent.ParticipantEntryRightFrame)
local participantEntryModule = require(script.Parent.ParticipantEntry)
local fFlagAppChatParticipantDialogGamepadFocusModule = require(appChat.Flags.FFlagAppChatParticipantDialogGamepadFocus)
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local getFFlagAppChatParticipantDialogFoundationMenuModule = require(appChat.Flags.getFFlagAppChatParticipantDialogFoundationMenu)
local var1 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceEnums.PresenceType else nil
local var2 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceStore.get() else nil
local var3 = if fFlagAppChatPresenceStoreMigrationModule then {
	[var1.Offline] = userModel.PresenceType.OFFLINE,
	[var1.Online] = userModel.PresenceType.ONLINE,
	[var1.InGame] = userModel.PresenceType.IN_GAME,
	[var1.InStudio] = userModel.PresenceType.IN_STUDIO
} else nil
local t = {
	entryHeight = 64,
	pendingKey = "Feature.Chat.Label.Pending",
	invitedKey = "Feature.SettingsHub.Label.Invited",
	LayoutOrder = 0,
	entries = {},
	onEntryActivated = function(_, _)
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onEntryActivated was not passed to ParticipantList")
	end,
	sortComparator = presenceSortComparator
}

function ParticipantList(p1)
	-- upvalues: cryoModule (ref), t (ref), getFFlagAppChatParticipantDialogFoundationMenuModule (ref), reactModule (ref), useLocalization (ref), fFlagAppChatPresenceStoreMigrationModule (ref), signalsModule (ref), var2 (ref), var3 (ref), signalsReactModule (ref), fFlagAppChatParticipantDialogGamepadFocusModule (ref), participantEntryModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), participantEntryRightFrameModule (ref), sortedList (ref)
	local var4 = cryoModule.Dictionary.join(t, p1)
	local onEntryActivated = var4.onEntryActivated or t.onEntryActivated
	local var5 = getFFlagAppChatParticipantDialogFoundationMenuModule()
	local var6 = if var5 then reactModule.useRef({}) else nil
	local var7 = useLocalization({
		pendingLabelText = var4.pendingKey,
		invitedLabelText = var4.invitedKey
	})
	local var8 = if fFlagAppChatPresenceStoreMigrationModule then signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var4 (ref), var2 (copy), var3 (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var4 (copy), var2 (copy), var3 (copy)
			local t = {}
			
			for i, v in pairs(var4.entries) do
				local var9 = tostring(v.id)
				local var10 = var2.GetPresenceByUserId(var9).data(p2)
				
				if var10 then
					t[var9] = var3[var10.userPresenceType]
				end
			end
			return t
		end)
	end, { var4.entries })) else nil
	
	local _ = function(p2)
		-- upvalues: var6 (write), reactModule (copy)
		if var6 == nil then
			return nil
		elseif var6.current[p2] == nil then
			var6.current[p2] = reactModule.createRef()
		end
		return var6.current[p2]
	end
	
	local var9 = function(p2, _)
		-- upvalues: var7 (ref), var5 (ref), var6 (write), reactModule (copy), var4 (ref), fFlagAppChatParticipantDialogGamepadFocusModule (copy), onEntryActivated (ref), participantEntryModule (copy)
		local var10 = tostring(p2.id)
		local t = {
			userId = p2.id,
			statusText = if p2.metadata and p2.metadata.isInvited then var7.invitedLabelText else nil
		}
		
		if var5 then
			local var11
			if var6 == nil then
				var11 = nil
			elseif var6.current[var10] == nil then
				var6.current[var10] = reactModule.createRef()
			end
			var11 = var6.current[var10]
			local var12 = var4.activeParticipantId == var10
			t.onActivated = if fFlagAppChatParticipantDialogGamepadFocusModule then function()
				-- upvalues: var12 (ref), onEntryActivated (copy), p2 (ref), var11 (ref)
				if not var12 then
					onEntryActivated(p2, var11)
				end
			end elseif var12 then nil else function()
				-- upvalues: onEntryActivated (copy), p2 (ref), var11 (ref)
				onEntryActivated(p2, var11)
			end
		else
			function t.onActivated()
				-- upvalues: onEntryActivated (copy), p2 (ref)
				onEntryActivated(p2, nil)
			end
		end
		return reactModule.createElement(participantEntryModule, t, p2.children)
	end
	
	local t_1 = {}
	
	for i, v in pairs(var4.entries) do
		local t_2 = {}
		
		if fFlagAppChatPresenceStoreMigrationModule then
			t_2.presence = if var8 then var8[tostring(v.id)] else nil
		end
		local var10 = not v.isLocalUser
		local isPending = v.metadata and v.metadata.isPending
		
		if not var10 and not isPending then
			table.insert(t_1, cryoModule.Dictionary.join(t_2, v))
			continue
		end
		local t_3 = {
			labelText = if isPending then var7.pendingLabelText else nil,
			shouldShowDots = var10,
			testId = if fFlagDebugAppChatEnableDomLocatorsModule and var10 then domLocatorsModule.chatDetailsParticipantMoreButton(v.displayName) else nil
		}
		
		if var5 and var10 then
			local var11
			local var12 = tostring(v.id)
			
			if var6 == nil then
				var11 = nil
			elseif var6.current[var12] == nil then
				var6.current[var12] = reactModule.createRef()
			end
			var11 = var6.current[var12]
			t_3.dotsRef = var11
			
			function t_3.onDotsActivated()
				-- upvalues: onEntryActivated (ref), v (ref), var11 (ref)
				onEntryActivated(v, var11)
			end
		else
			t_3.dotsRef = nil
			t_3.onDotsActivated = nil
		end
		t_2.children = {
			rightFrame = reactModule.createElement(participantEntryRightFrameModule, t_3)
		}
	end
	return reactModule.createElement(sortedList, {
		entries = t_1,
		entryHeight = var4.entryHeight,
		renderEntry = var9,
		sortComparator = var4.sortComparator,
		LayoutOrder = var4.LayoutOrder
	})
end

return memo(ParticipantList)