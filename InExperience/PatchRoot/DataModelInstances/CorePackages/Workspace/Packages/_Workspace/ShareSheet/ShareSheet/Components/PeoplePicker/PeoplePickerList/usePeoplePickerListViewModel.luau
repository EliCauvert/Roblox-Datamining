local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local Array = require(Parent.LuauPolyfill).Array
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UserProfileModule = require(Parent.DataHydration.UserProfile)
local ShareSheetConstantsModule = require(ShareSheet.ShareSheetConstants)
local ConversationUtilsModule = require(ShareSheet.Utils.ConversationUtils)
local FilterConversationsByQueryModule = require(ShareSheet.Utils.filterConversationsByQuery)
local FormatPeoplePickerUserInfoModule = require(ShareSheet.Utils.formatPeoplePickerUserInfo)
local MatchesQueryModule = require(ShareSheet.Utils.matchesQuery)
local RecipientModule = require(ShareSheet.Recipients.Recipient)
local _ = require(ShareSheet.Types)
local Players = game:GetService("Players")

local function _(p1)
	-- upvalues: UserProfileModule (copy)
	return if p1 == nil or p1 == "" then nil else UserProfileModule.getAndFetchUserInfo(p1)
end

local _ = function(p1, p2)
	if p1 == nil then
		return nil, false
	else
		return p1.info(p2), p1.status(p2) == "NotReady"
	end
end

local _ = function(p1, p2): number
	-- upvalues: FFlagShareSheetFriendsSort (copy)
	return if FFlagShareSheetFriendsSort then #p2 else #p1
end

local _ = function(p1, p2, p3)
	-- upvalues: FFlagShareSheetFriendsSort (copy)
	local v1 = if FFlagShareSheetFriendsSort then nil else p1[p3]
	local v2 = if FFlagShareSheetFriendsSort then p2[p3] else nil
	
	if FFlagShareSheetFriendsSort then
		return v1, v2, v2.id
	else
		return v1, v2, v1.id
	end
end

local _ = function(p1, p2, p3)
	-- upvalues: FFlagShareSheetFriendsSort (copy), RecipientModule (copy), ConversationUtilsModule (copy)
	if FFlagShareSheetFriendsSort then
		local ParticipantIds = RecipientModule.getParticipantIds(p2, p3)
		
		return ParticipantIds[1] or p3, ParticipantIds[2]
	else
		return ConversationUtilsModule.getParticipantUserIds(p1, p3)
	end
end

local _ = function(p1, Text: string, p2, p3)
	-- upvalues: Array (copy), MatchesQueryModule (copy)
	if Text == "" then
		return p1
	else
		local Lowered = string.lower(Text)
		
		return Array.filter(p1, function(p4)
			-- upvalues: MatchesQueryModule (upval), Lowered (copy), p2 (copy), p3 (copy)
			return MatchesQueryModule(Lowered, p2[p4.id] or "", p3[p4.id] or "")
		end)
	end
end

local function getDisplayNames(p1, p2, p3, UseMemoResult, DisplayName)
	-- upvalues: FFlagShareSheetFriendsSort (copy), RecipientModule (copy), ConversationUtilsModule (copy), FormatPeoplePickerUserInfoModule (copy)
	local DescriptionsByConversationId = {}
	local DisplayNamesByConversationId = {}
	local IsLoading = false
	local LoadingConversationIds = {}
	local v1 = 1
	local CountP17: number = if FFlagShareSheetFriendsSort then #p3 else #p2
	for i = v1, CountP17 do
		local v2 = if FFlagShareSheetFriendsSort then nil else p2[i]
		local v3 = if FFlagShareSheetFriendsSort then p3[i] else nil
		local Id = if FFlagShareSheetFriendsSort then v3.id else v2.id
		local Name = if FFlagShareSheetFriendsSort then RecipientModule.getName(v3) else ConversationUtilsModule.getDisplayName(v2)
		local UseMemoResultEntry = UseMemoResult[Id]
		
		if UseMemoResultEntry then
			local Primary = UseMemoResultEntry.primary
			local IsNotReady = nil
			local InfoResult = nil
			
			if Primary == nil then
				InfoResult = nil
				IsNotReady = false
			else
				InfoResult = Primary.info(p1)
				IsNotReady = Primary.status(p1) == "NotReady"
			end
			local Second = UseMemoResultEntry.second
			local InfoResult1 = nil
			local IsNotReady1 = nil
			
			if Second == nil then
				InfoResult1 = nil
				IsNotReady1 = false
			else
				InfoResult1 = Second.info(p1)
				IsNotReady1 = Second.status(p1) == "NotReady"
			end
			local IsNotReady2: boolean = IsNotReady or IsNotReady1
			
			if IsNotReady2 then
				IsLoading = true
			end
			local config = { displayName = DisplayName }
			local List = {}
			
			if InfoResult then
				table.insert(List, InfoResult)
			else
				table.insert(List, config)
			end
			if UseMemoResultEntry.second ~= nil then
				if InfoResult1 then
					table.insert(List, InfoResult1)
				else
					table.insert(List, config)
				end
			end
			if Name == "" then
				if IsNotReady2 then
					LoadingConversationIds[Id] = true
				else
					Name = FormatPeoplePickerUserInfoModule.formatTitle(List)
				end
			end
			if not IsNotReady2 then
				DescriptionsByConversationId[Id] = FormatPeoplePickerUserInfoModule.formatDescription(List)
			end
		end
		DisplayNamesByConversationId[Id] = Name
	end
	return {
		descriptionsByConversationId = DescriptionsByConversationId,
		displayNamesByConversationId = DisplayNamesByConversationId,
		isLoading = IsLoading,
		loadingConversationIds = LoadingConversationIds
	}
end

local function useConversationDisplayNames(Conversations, Recipients, p4, DisplayName)
	-- upvalues: ReactModule (copy), FFlagShareSheetFriendsSort (copy), RecipientModule (copy), ConversationUtilsModule (copy), UserProfileModule (copy), SignalsModule (copy), getDisplayNames (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Conversations (copy), Recipients (copy), FFlagShareSheetFriendsSort (upval), p4 (copy), RecipientModule (upval), ConversationUtilsModule (upval), UserProfileModule (upval)
		local t = {}
		local v4 = 1
		local CountRecipients: number = if FFlagShareSheetFriendsSort then #Recipients else #Conversations
		for i = v4, CountRecipients do
			local Conversation = if FFlagShareSheetFriendsSort then nil else Conversations[i]
			local Recipient = if FFlagShareSheetFriendsSort then Recipients[i] else nil
			local Id = if FFlagShareSheetFriendsSort then Recipient.id else Conversation.id
			local ParticipantId = nil
			local ParticipantId1 = nil
			
			if FFlagShareSheetFriendsSort then
				local ParticipantIds = RecipientModule.getParticipantIds(Recipient, p4)
				ParticipantId = ParticipantIds[1] or p4
				ParticipantId1 = ParticipantIds[2]
			else
				ParticipantId, ParticipantId1 = ConversationUtilsModule.getParticipantUserIds(Conversation, p4)
			end
			t[Id] = {
				primary = if ParticipantId == nil or ParticipantId == "" then nil else UserProfileModule.getAndFetchUserInfo(ParticipantId),
				second = if ParticipantId1 == nil or ParticipantId1 == "" then nil else UserProfileModule.getAndFetchUserInfo(ParticipantId1)
			}
		end
		return t
	end, { Conversations, p4, Recipients })
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), getDisplayNames (upval), Conversations (copy), Recipients (copy), UseMemoResult (copy), DisplayName (copy)
		return SignalsModule.createComputed(function(p5)
			-- upvalues: getDisplayNames (upval), Conversations (upval), Recipients (upval), UseMemoResult (upval), DisplayName (upval)
			return (getDisplayNames(p5, Conversations, Recipients, UseMemoResult, DisplayName))
		end)
	end, { Conversations, Recipients, DisplayName, UseMemoResult })))
end

return function(p5)
	-- upvalues: Players (copy), UseLocalizationFunction (copy), useConversationDisplayNames (copy), ReactModule (copy), FFlagShareSheetFriendsSort (copy), FilterConversationsByQueryModule (copy), Array (copy), MatchesQueryModule (copy), RecipientModule (copy), ConversationUtilsModule (copy), ShareSheetConstantsModule (copy)
	local Text = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0)
	local UseConversationDisplayNamesResult = useConversationDisplayNames(p5.conversations, p5.recipients, Text, UseLocalizationFunction({ unknownUser = "Feature.Chat.Label.UnknownUser" }).unknownUser)
	local DisplayNamesByConversationId = UseConversationDisplayNamesResult.displayNamesByConversationId
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagShareSheetFriendsSort (upval), FilterConversationsByQueryModule (upval), p5 (copy), DisplayNamesByConversationId (copy), UseConversationDisplayNamesResult (copy)
		return if FFlagShareSheetFriendsSort then nil else FilterConversationsByQueryModule(p5.conversations, p5.debouncedQuery, DisplayNamesByConversationId, UseConversationDisplayNamesResult.descriptionsByConversationId)
	end, {
		DisplayNamesByConversationId,
		UseConversationDisplayNamesResult.descriptionsByConversationId,
		p5.conversations,
		p5.debouncedQuery
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FFlagShareSheetFriendsSort (upval), p5 (copy), DisplayNamesByConversationId (copy), UseConversationDisplayNamesResult (copy), Array (upval), MatchesQueryModule (upval)
		if not FFlagShareSheetFriendsSort then
			return nil
		end
		local Recipients = p5.recipients
		local DebouncedQuery: string = p5.debouncedQuery
		local DescriptionsByConversationId = UseConversationDisplayNamesResult.descriptionsByConversationId
		
		if DebouncedQuery == "" then
			return Recipients
		else
			local Lowered = string.lower(DebouncedQuery)
			
			return (Array.filter(Recipients, function(p6)
				-- upvalues: MatchesQueryModule (upval), Lowered (copy), DisplayNamesByConversationId (copy), DescriptionsByConversationId (copy)
				return MatchesQueryModule(Lowered, DisplayNamesByConversationId[p6.id] or "", DescriptionsByConversationId[p6.id] or "")
			end))
		end
	end, {
		DisplayNamesByConversationId,
		UseConversationDisplayNamesResult.descriptionsByConversationId,
		p5.debouncedQuery,
		p5.recipients
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseMemoResult1 (copy), FFlagShareSheetFriendsSort (upval), Text (copy), RecipientModule (upval), ConversationUtilsModule (upval), UseConversationDisplayNamesResult (copy), DisplayNamesByConversationId (copy), p5 (copy)
		local CountUseMemoResult1: number = if FFlagShareSheetFriendsSort then #UseMemoResult1 else #UseMemoResult
		local Buffer = table.create(CountUseMemoResult1)
		
		for i = 1, CountUseMemoResult1 do
			local UseMemoResultEntry = if FFlagShareSheetFriendsSort then nil else UseMemoResult[i]
			local UseMemoResultEntry1 = if FFlagShareSheetFriendsSort then UseMemoResult1[i] else nil
			local Id = if FFlagShareSheetFriendsSort then UseMemoResultEntry1.id else UseMemoResultEntry.id
			local ParticipantId = nil
			local ParticipantId1 = nil
			
			if FFlagShareSheetFriendsSort then
				local ParticipantIds = RecipientModule.getParticipantIds(UseMemoResultEntry1, Text)
				ParticipantId = ParticipantIds[1] or Text
				ParticipantId1 = ParticipantIds[2]
			else
				ParticipantId, ParticipantId1 = ConversationUtilsModule.getParticipantUserIds(UseMemoResultEntry, Text)
			end
			Buffer[i] = {
				description = UseConversationDisplayNamesResult.descriptionsByConversationId[Id],
				displayName = DisplayNamesByConversationId[Id],
				id = Id,
				isLoading = UseConversationDisplayNamesResult.loadingConversationIds[Id] == true,
				isSelected = p5.selectedConversationIds[Id] == true,
				primaryUserId = ParticipantId,
				secondUserId = ParticipantId1
			}
		end
		return Buffer
	end, {
		UseConversationDisplayNamesResult.descriptionsByConversationId,
		UseConversationDisplayNamesResult.loadingConversationIds,
		DisplayNamesByConversationId, Text, p5.selectedConversationIds, UseMemoResult,
		UseMemoResult1
	})
	local IsLoading = p5.isLoading or UseConversationDisplayNamesResult.isLoading and #UseMemoResult2 == 0
	
	return {
		items = UseMemoResult2,
		shouldShowEmptyState = #UseMemoResult2 == 0 and not IsLoading,
		skeletonCount = if IsLoading then ShareSheetConstantsModule.FIntShareSheetNumAvatarSkeletons else 0
	}
end