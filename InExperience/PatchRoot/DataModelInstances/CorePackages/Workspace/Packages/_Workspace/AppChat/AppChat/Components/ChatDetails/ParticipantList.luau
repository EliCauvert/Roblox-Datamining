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
local fFlagAppChatPresenceStoreMigrationModule = require(appChat.Flags.FFlagAppChatPresenceStoreMigration)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local getFFlagAppChatParticipantDialogFoundationMenuModule = require(appChat.Flags.getFFlagAppChatParticipantDialogFoundationMenu)
local var14 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceEnums.PresenceType else nil
local var15 = if fFlagAppChatPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceStore.get() else nil
local var16 = if fFlagAppChatPresenceStoreMigrationModule then {
	[var14.Offline] = userModel.PresenceType.OFFLINE,
	[var14.Online] = userModel.PresenceType.ONLINE,
	[var14.InGame] = userModel.PresenceType.IN_GAME,
	[var14.InStudio] = userModel.PresenceType.IN_STUDIO
} else nil
local t = {
	entryHeight = 64,
	pendingKey = "Feature.Chat.Label.Pending",
	invitedKey = "Feature.SettingsHub.Label.Invited",
	LayoutOrder = 0,
	entries = {},
	onEntryActivated = function(_, _) --[[ line: 61 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onEntryActivated was not passed to ParticipantList")
	end,
	sortComparator = presenceSortComparator
}

function ParticipantList(p0) --[[ line: 74 ]]
	-- upvalues: cryoModule (ref), t (ref), getFFlagAppChatParticipantDialogFoundationMenuModule (ref), reactModule (ref), useLocalization (ref), fFlagAppChatPresenceStoreMigrationModule (ref), signalsModule (ref), var15 (ref), var16 (ref), signalsReactModule (ref), participantEntryModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), participantEntryRightFrameModule (ref), sortedList (ref)
	local var18 = cryoModule.Dictionary.join(t, p0)
	local onEntryActivated = var18.onEntryActivated or t.onEntryActivated
	local var20 = getFFlagAppChatParticipantDialogFoundationMenuModule()
	local var21 = if var20 then reactModule.useRef({}) else nil
	local var22 = useLocalization({
		pendingLabelText = var18.pendingKey,
		invitedLabelText = var18.invitedKey
	})
	local var23 = if fFlagAppChatPresenceStoreMigrationModule then signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 91 ]]
		-- upvalues: signalsModule (copy), var18 (ref), var15 (copy), var16 (copy)
		return signalsModule.createComputed(function(p1) --[[ line: 92 ]]
			-- upvalues: var18 (copy), var15 (copy), var16 (copy)
			local t = {}
			
			for i, v in pairs(var18.entries) do
				local var33 = tostring(v.id)
				local var34 = var15.GetPresenceByUserId(var33).data(p1)
				
				if var34 then
					t[var33] = var16[var34.userPresenceType]
				end
			end
			return t
		end)
	end, { var18.entries })) else nil
	
	local _ = function(p2) --[[ line: 108 ]]
		-- upvalues: var21 (write), reactModule (copy)
		if var21 == nil then
			return nil
		elseif var21.current[p2] == nil then
			var21.current[p2] = reactModule.createRef()
		end
		return var21.current[p2]
	end
	
	local var24 = function(p3, _) --[[ line: 120 ]]
		-- upvalues: var22 (ref), var20 (ref), var21 (write), reactModule (copy), var18 (ref), onEntryActivated (ref), participantEntryModule (copy)
		local var35 = tostring(p3.id)
		local t = {
			userId = p3.id,
			statusText = if p3.metadata and p3.metadata.isInvited then var22.invitedLabelText else nil
		}
		
		if var20 then
			local var37
			if var21 == nil then
				var37 = nil
			elseif var21.current[var35] == nil then
				var21.current[var35] = reactModule.createRef()
			end
			var37 = var21.current[var35]
			t.onActivated = if var18.activeParticipantId == var35 then nil else function() --[[ line: 133 ]]
				-- upvalues: onEntryActivated (copy), p3 (ref), var37 (ref)
				onEntryActivated(p3, var37)
			end
		else
			function t.onActivated() --[[ line: 137 ]]
				-- upvalues: onEntryActivated (copy), p3 (ref)
				onEntryActivated(p3, nil)
			end
		end
		return reactModule.createElement(participantEntryModule, t, p3.children)
	end
	
	local t_1 = {}
	
	for i, v in pairs(var18.entries) do
		local t_2 = {}
		
		if fFlagAppChatPresenceStoreMigrationModule then
			t_2.presence = if var23 then var23[tostring(v.id)] else nil
		end
		local var27 = not v.isLocalUser
		local isPending = v.metadata and v.metadata.isPending
		
		if not var27 and not isPending then
			table.insert(t_1, cryoModule.Dictionary.join(t_2, v))
			continue
		end
		local t_3 = {
			labelText = if isPending then var22.pendingLabelText else nil,
			shouldShowDots = var27,
			testId = if fFlagDebugAppChatEnableDomLocatorsModule and var27 then domLocatorsModule.chatDetailsParticipantMoreButton(v.displayName) else nil
		}
		
		if var20 and var27 then
			local var31
			local var30 = tostring(v.id)
			
			if var21 == nil then
				var31 = nil
			elseif var21.current[var30] == nil then
				var21.current[var30] = reactModule.createRef()
			end
			var31 = var21.current[var30]
			t_3.dotsRef = var31
			
			function t_3.onDotsActivated() --[[ line: 166 ]]
				-- upvalues: onEntryActivated (ref), v (ref), var31 (ref)
				onEntryActivated(v, var31)
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
		entryHeight = var18.entryHeight,
		renderEntry = var24,
		sortComparator = var18.sortComparator,
		LayoutOrder = var18.LayoutOrder
	})
end

return memo(ParticipantList)