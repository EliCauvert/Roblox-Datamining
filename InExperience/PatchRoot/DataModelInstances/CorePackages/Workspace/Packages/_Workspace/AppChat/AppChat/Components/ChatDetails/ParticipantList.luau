local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SocialLibrariesModule = require(AppChat.SocialLibraries)
local CryoModule = require(Parent.Cryo)
local DataHydrationModule = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UserModel = require(Parent.UserLib).Models.UserModel
local MemoFunction = ReactModule.memo
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LoggerModule = require(script.Parent.Logger)
local SortedList = SocialLibrariesModule.Components.SortedList
local ParticipantEntryRightFrameModule = require(script.Parent.ParticipantEntryRightFrame)
local ParticipantEntryModule = require(script.Parent.ParticipantEntry)
local FFlagAppChatPresenceStoreMigrationModule = require(AppChat.Flags.FFlagAppChatPresenceStoreMigration)
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)
local PresenceType = if FFlagAppChatPresenceStoreMigrationModule then DataHydrationModule.Presence.PresenceEnums.PresenceType else nil
local GetResult = if FFlagAppChatPresenceStoreMigrationModule then DataHydrationModule.Presence.PresenceStore.get() else nil
local Config = if FFlagAppChatPresenceStoreMigrationModule then {
	[PresenceType.Offline] = UserModel.PresenceType.OFFLINE,
	[PresenceType.Online] = UserModel.PresenceType.ONLINE,
	[PresenceType.InGame] = UserModel.PresenceType.IN_GAME,
	[PresenceType.InStudio] = UserModel.PresenceType.IN_STUDIO
} else nil
local config = {
	entryHeight = 64,
	pendingKey = "Feature.Chat.Label.Pending",
	invitedKey = "Feature.SettingsHub.Label.Invited",
	LayoutOrder = 0,
	entries = {},
	onEntryActivated = function(_, _)
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("onEntryActivated was not passed to ParticipantList")
	end,
	sortComparator = SocialLibrariesModule.Utils.presenceSortComparator
}

function ParticipantList(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), UseLocalizationFunction (copy), FFlagAppChatPresenceStoreMigrationModule (copy), SignalsModule (copy), GetResult (copy), Config (copy), SignalsReactModule (copy), ParticipantEntryModule (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), ParticipantEntryRightFrameModule (copy), SortedList (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local OnEntryActivated = JoinResult.onEntryActivated or config.onEntryActivated
	local UseRefResult = ReactModule.useRef({})
	local UseLocalizationResult = UseLocalizationFunction({
		pendingLabelText = JoinResult.pendingKey,
		invitedLabelText = JoinResult.invitedKey
	})
	local UseSignalStateResult = if FFlagAppChatPresenceStoreMigrationModule then SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), JoinResult (copy), GetResult (upval), Config (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: JoinResult (upval), GetResult (upval), Config (upval)
			local t = {}
			
			for _, entry in pairs(JoinResult.entries) do
				local Text = tostring(entry.id)
				local DataResult = GetResult.GetPresenceByUserId(Text).data(p2)
				
				if DataResult then
					t[Text] = Config[DataResult.userPresenceType]
				end
			end
			return t
		end)
	end, { JoinResult.entries }))) else nil
	
	local function _(p2)
		-- upvalues: UseRefResult (copy), ReactModule (upval)
		if UseRefResult.current[p2] == nil then
			UseRefResult.current[p2] = ReactModule.createRef()
		end
		return UseRefResult.current[p2]
	end
	
	local function RenderEntry(p2, _)
		-- upvalues: UseLocalizationResult (copy), UseRefResult (copy), ReactModule (upval), JoinResult (copy), OnEntryActivated (copy), ParticipantEntryModule (upval)
		local IsInvited = p2.metadata and p2.metadata.isInvited
		local Text = tostring(p2.id)
		local config = {
			userId = p2.id,
			statusText = if IsInvited then UseLocalizationResult.invitedLabelText else nil
		}
		
		if UseRefResult.current[Text] == nil then
			UseRefResult.current[Text] = ReactModule.createRef()
		end
		local CurrentEntry = UseRefResult.current[Text]
		local IsActiveParticipantIdMatch = JoinResult.activeParticipantId == Text
		
		function config.onActivated()
			-- upvalues: IsActiveParticipantIdMatch (copy), OnEntryActivated (upval), p2 (copy), CurrentEntry (copy)
			if not IsActiveParticipantIdMatch then
				OnEntryActivated(p2, CurrentEntry)
			end
		end
		
		return ReactModule.createElement(ParticipantEntryModule, config, p2.children)
	end
	
	local Entries = {}
	
	for _, entry in pairs(JoinResult.entries) do
		local t = {}
		
		if FFlagAppChatPresenceStoreMigrationModule then
			t.presence = UseSignalStateResult and UseSignalStateResult[tostring(entry.id)] or nil
		end
		local NoIsLocalUser = not entry.isLocalUser
		local IsPending = entry.metadata and entry.metadata.isPending
		
		if NoIsLocalUser or IsPending then
			local config1 = {
				labelText = if IsPending then UseLocalizationResult.pendingLabelText else nil,
				shouldShowDots = NoIsLocalUser,
				testId = if FFlagDebugAppChatEnableDomLocatorsModule and NoIsLocalUser then DomLocatorsModule.chatDetailsParticipantMoreButton(entry.displayName) else nil
			}
			
			if NoIsLocalUser then
				local Text = tostring(entry.id)
				
				if UseRefResult.current[Text] == nil then
					UseRefResult.current[Text] = ReactModule.createRef()
				end
				local CurrentEntry = UseRefResult.current[Text]
				config1.dotsRef = CurrentEntry
				
				function config1.onDotsActivated()
					-- upvalues: OnEntryActivated (copy), entry (copy), CurrentEntry (copy)
					OnEntryActivated(entry, CurrentEntry)
				end
			else
				config1.dotsRef = nil
				config1.onDotsActivated = nil
			end
			t.children = {
				rightFrame = ReactModule.createElement(ParticipantEntryRightFrameModule, config1)
			}
		end
		table.insert(Entries, CryoModule.Dictionary.join(t, entry))
	end
	return ReactModule.createElement(SortedList, {
		entries = Entries,
		entryHeight = JoinResult.entryHeight,
		renderEntry = RenderEntry,
		sortComparator = JoinResult.sortComparator,
		LayoutOrder = JoinResult.LayoutOrder
	})
end

return MemoFunction(ParticipantList)