local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local socialLibrariesModule = require(appChat.SocialLibraries)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local useLocalization = require(parent.Localization).Hooks.useLocalization
local loggerModule = require(script.Parent.Logger)
local presenceSortComparator = socialLibrariesModule.Utils.presenceSortComparator
local sortedList = socialLibrariesModule.Components.SortedList
local participantEntryRightFrameModule = require(script.Parent.ParticipantEntryRightFrame)
local participantEntryModule = require(script.Parent.ParticipantEntry)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local getFFlagAppChatParticipantDialogFoundationMenuModule = require(appChat.Flags.getFFlagAppChatParticipantDialogFoundationMenu)
local t = {
	entryHeight = 64,
	pendingKey = "Feature.Chat.Label.Pending",
	invitedKey = "Feature.SettingsHub.Label.Invited",
	LayoutOrder = 0,
	entries = {},
	onEntryActivated = function(_, _) --[[ line: 36 ]]
		-- upvalues: loggerModule (ref)
		loggerModule:warning("onEntryActivated was not passed to ParticipantList")
	end,
	sortComparator = presenceSortComparator
}

function ParticipantList(p0) --[[ line: 49 ]]
	-- upvalues: cryoModule (ref), t (ref), getFFlagAppChatParticipantDialogFoundationMenuModule (ref), reactModule (ref), useLocalization (ref), participantEntryModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), domLocatorsModule (ref), participantEntryRightFrameModule (ref), sortedList (ref)
	local var11 = cryoModule.Dictionary.join(t, p0)
	local onEntryActivated = var11.onEntryActivated or t.onEntryActivated
	local var13 = getFFlagAppChatParticipantDialogFoundationMenuModule()
	local var14 = if var13 then reactModule.useRef({}) else nil
	local var15 = useLocalization({
		pendingLabelText = var11.pendingKey,
		invitedLabelText = var11.invitedKey
	})
	
	local _ = function(p1) --[[ line: 64 ]]
		-- upvalues: var14 (write), reactModule (copy)
		if var14 == nil then
			return nil
		elseif var14.current[p1] == nil then
			var14.current[p1] = reactModule.createRef()
		end
		return var14.current[p1]
	end
	
	local var16 = function(p2, _) --[[ line: 76 ]]
		-- upvalues: var15 (ref), var13 (ref), var14 (write), reactModule (copy), var11 (ref), onEntryActivated (ref), participantEntryModule (copy)
		local var24 = tostring(p2.id)
		local t = {
			userId = p2.id,
			statusText = if p2.metadata and p2.metadata.isInvited then var15.invitedLabelText else nil
		}
		
		if var13 then
			local var26
			if var14 == nil then
				var26 = nil
			elseif var14.current[var24] == nil then
				var14.current[var24] = reactModule.createRef()
			end
			var26 = var14.current[var24]
			t.onActivated = if var11.activeParticipantId == var24 then nil else function() --[[ line: 89 ]]
				-- upvalues: onEntryActivated (copy), p2 (ref), var26 (ref)
				onEntryActivated(p2, var26)
			end
		else
			function t.onActivated() --[[ line: 93 ]]
				-- upvalues: onEntryActivated (copy), p2 (ref)
				onEntryActivated(p2, nil)
			end
		end
		return reactModule.createElement(participantEntryModule, t, p2.children)
	end
	
	local t_1 = {}
	
	for i, v in pairs(var11.entries) do
		local t_2 = {}
		local var19 = not v.isLocalUser
		local isPending = v.metadata and v.metadata.isPending
		
		if not var19 and not isPending then
			table.insert(t_1, cryoModule.Dictionary.join(t_2, v))
			continue
		end
		local t_3 = {
			labelText = if isPending then var15.pendingLabelText else nil,
			shouldShowDots = var19,
			testId = if fFlagDebugAppChatEnableDomLocatorsModule and var19 then domLocatorsModule.chatDetailsParticipantMoreButton(v.displayName) else nil
		}
		
		if var13 and var19 then
			local var23
			local var22 = tostring(v.id)
			
			if var14 == nil then
				var23 = nil
			elseif var14.current[var22] == nil then
				var14.current[var22] = reactModule.createRef()
			end
			var23 = var14.current[var22]
			t_3.dotsRef = var23
			
			function t_3.onDotsActivated() --[[ line: 119 ]]
				-- upvalues: onEntryActivated (ref), v (ref), var23 (ref)
				onEntryActivated(v, var23)
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
		entryHeight = var11.entryHeight,
		renderEntry = var16,
		sortComparator = var11.sortComparator,
		LayoutOrder = var11.LayoutOrder
	})
end

return memo(ParticipantList)