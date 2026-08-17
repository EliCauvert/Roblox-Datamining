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
local var15 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceEnums.PresenceType else nil
local var16 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceStore.get() else nil
local var17 = if fFlagAppChatPresenceStoreMigrationModule then {
	[var15.Offline] = userModel.PresenceType.OFFLINE,
	[var15.Online] = userModel.PresenceType.ONLINE,
	[var15.InGame] = userModel.PresenceType.IN_GAME,
	[var15.InStudio] = userModel.PresenceType.IN_STUDIO
} else nil
local t = {
	entryHeight = 64,
	pendingKey = "Feature.Chat.Label.Pending",
	invitedKey = "Feature.SettingsHub.Label.Invited",
	LayoutOrder = 0,
	entries = {},
	onEntryActivated = function(_, _) --[[ line: 62 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onEntryActivated was not passed to ParticipantList")
	end,
	sortComparator = presenceSortComparator
}

function ParticipantList(p0) --[[ line: 75 ]]
	-- upvalues: cryoModule (ref), t (ref), getFFlagAppChatParticipantDialogFoundationMenuModule (ref), reactModule (ref), useLocalization (ref), fFlagAppChatPresenceStoreMigrationModule (ref), signalsModule (ref), var16 (ref), var17 (ref), signalsReactModule (ref), fFlagAppChatParticipantDialogGamepadFocusModule (ref), participantEntryModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), participantEntryRightFrameModule (ref), sortedList (ref)
	local var19 = cryoModule.Dictionary.join(t, p0)
	local onEntryActivated = var19.onEntryActivated or t.onEntryActivated
	local var21 = getFFlagAppChatParticipantDialogFoundationMenuModule()
	local var22 = if var21 then reactModule.useRef({}) else nil
	local var23 = useLocalization({
		pendingLabelText = var19.pendingKey,
		invitedLabelText = var19.invitedKey
	})
	local var24 = if fFlagAppChatPresenceStoreMigrationModule then signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 92 ]]
		-- upvalues: signalsModule (copy), var19 (ref), var16 (copy), var17 (copy)
		return signalsModule.createComputed(function(p1) --[[ line: 93 ]]
			-- upvalues: var19 (copy), var16 (copy), var17 (copy)
			local t = {}
			
			for i, v in pairs(var19.entries) do
				local var34 = tostring(v.id)
				local var35 = var16.GetPresenceByUserId(var34).data(p1)
				
				if var35 then
					t[var34] = var17[var35.userPresenceType]
				end
			end
			return t
		end)
	end, { var19.entries })) else nil
	
	local _ = function(p2) --[[ line: 110 ]]
		-- upvalues: var22 (write), reactModule (copy)
		if var22 == nil then
			return nil
		elseif var22.current[p2] == nil then
			var22.current[p2] = reactModule.createRef()
		end
		return var22.current[p2]
	end
	
	local var25 = function(p3, _) --[[ line: 122 ]]
		-- upvalues: var23 (ref), var21 (ref), var22 (write), reactModule (copy), var19 (ref), fFlagAppChatParticipantDialogGamepadFocusModule (copy), onEntryActivated (ref), participantEntryModule (copy)
		local var36 = tostring(p3.id)
		local t = {
			userId = p3.id,
			statusText = if p3.metadata and p3.metadata.isInvited then var23.invitedLabelText else nil
		}
		
		if var21 then
			local var38
			if var22 == nil then
				var38 = nil
			elseif var22.current[var36] == nil then
				var22.current[var36] = reactModule.createRef()
			end
			var38 = var22.current[var36]
			local var39 = var19.activeParticipantId == var36
			t.onActivated = if fFlagAppChatParticipantDialogGamepadFocusModule then function() --[[ line: 134 ]]
				-- upvalues: var39 (ref), onEntryActivated (copy), p3 (ref), var38 (ref)
				if not var39 then
					onEntryActivated(p3, var38)
				end
			end elseif var39 then nil else function() --[[ line: 140 ]]
				-- upvalues: onEntryActivated (copy), p3 (ref), var38 (ref)
				onEntryActivated(p3, var38)
			end
		else
			function t.onActivated() --[[ line: 144 ]]
				-- upvalues: onEntryActivated (copy), p3 (ref)
				onEntryActivated(p3, nil)
			end
		end
		return reactModule.createElement(participantEntryModule, t, p3.children)
	end
	
	local t_1 = {}
	
	for i, v in pairs(var19.entries) do
		local t_2 = {}
		
		if fFlagAppChatPresenceStoreMigrationModule then
			t_2.presence = if var24 then var24[tostring(v.id)] else nil
		end
		local var28 = not v.isLocalUser
		local isPending = v.metadata and v.metadata.isPending
		
		if not var28 and not isPending then
			table.insert(t_1, cryoModule.Dictionary.join(t_2, v))
			continue
		end
		local t_3 = {
			labelText = if isPending then var23.pendingLabelText else nil,
			shouldShowDots = var28,
			testId = if fFlagDebugAppChatEnableDomLocatorsModule and var28 then domLocatorsModule.chatDetailsParticipantMoreButton(v.displayName) else nil
		}
		
		if var21 and var28 then
			local var32
			local var31 = tostring(v.id)
			
			if var22 == nil then
				var32 = nil
			elseif var22.current[var31] == nil then
				var22.current[var31] = reactModule.createRef()
			end
			var32 = var22.current[var31]
			t_3.dotsRef = var32
			
			function t_3.onDotsActivated() --[[ line: 173 ]]
				-- upvalues: onEntryActivated (ref), v (ref), var32 (ref)
				onEntryActivated(v, var32)
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
		entryHeight = var19.entryHeight,
		renderEntry = var25,
		sortComparator = var19.sortComparator,
		LayoutOrder = var19.LayoutOrder
	})
end

return memo(ParticipantList)