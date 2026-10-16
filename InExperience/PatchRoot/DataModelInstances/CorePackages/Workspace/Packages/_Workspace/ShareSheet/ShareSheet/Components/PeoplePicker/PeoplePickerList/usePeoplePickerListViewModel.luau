local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UserProfileModule = require(Parent.DataHydration.UserProfile)
local ShareSheetConstantsModule = require(ShareSheet.ShareSheetConstants)
local ConversationUtilsModule = require(ShareSheet.Utils.ConversationUtils)
local FilterConversationsByQueryModule = require(ShareSheet.Utils.filterConversationsByQuery)
local FormatPeoplePickerUserInfoModule = require(ShareSheet.Utils.formatPeoplePickerUserInfo)
local _ = require(ShareSheet.Types)
local Players = game:GetService("Players")

local function _(p1) --[[ Line: 57 | Named "getUserInfoResult" ]]
	-- upvalues: UserProfileModule (copy)
	return if p1 == nil or p1 == "" then nil else UserProfileModule.getAndFetchUserInfo(p1)
end

local _ = function(p1, p2) --[[ Line: 61 | Named "readUserInfo" ]]
	if p1 == nil then
		return nil, false
	else
		return p1.info(p2), p1.status(p2) == "NotReady"
	end
end

local function getDisplayNames(p1, List, UseMemoResult, DisplayName) --[[ Line: 68 ]]
	-- upvalues: ConversationUtilsModule (copy), FormatPeoplePickerUserInfoModule (copy)
	local DescriptionsByConversationId = {}
	local DisplayNamesByConversationId = {}
	local IsLoading = false
	local LoadingConversationIds = {}
	
	for _, value in List do
		local DisplayName1 = ConversationUtilsModule.getDisplayName(value)
		local UseMemoResultEntry = UseMemoResult[value.id]
		
		if UseMemoResultEntry then
			local Primary = UseMemoResultEntry.primary
			local InfoResult = nil
			local IsNotReady = nil
			
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
			local List1 = {}
			
			if InfoResult then
				table.insert(List1, InfoResult)
			else
				table.insert(List1, config)
			end
			if UseMemoResultEntry.second ~= nil then
				if InfoResult1 then
					table.insert(List1, InfoResult1)
				else
					table.insert(List1, config)
				end
			end
			if DisplayName1 == "" then
				if IsNotReady2 then
					LoadingConversationIds[value.id] = true
				else
					DisplayName1 = FormatPeoplePickerUserInfoModule.formatTitle(List1)
				end
			end
			if not IsNotReady2 then
				DescriptionsByConversationId[value.id] = FormatPeoplePickerUserInfoModule.formatDescription(List1)
			end
		end
		DisplayNamesByConversationId[value.id] = DisplayName1
	end
	return {
		descriptionsByConversationId = DescriptionsByConversationId,
		displayNamesByConversationId = DisplayNamesByConversationId,
		isLoading = IsLoading,
		loadingConversationIds = LoadingConversationIds
	}
end

local function useConversationDisplayNames(Conversations, p2, DisplayName) --[[ Line: 123 ]]
	-- upvalues: ReactModule (copy), ConversationUtilsModule (copy), UserProfileModule (copy), SignalsModule (copy), getDisplayNames (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 128 ]]
		-- upvalues: Conversations (copy), ConversationUtilsModule (upval), p2 (copy), UserProfileModule (upval)
		local t = {}
		
		for _, conversation in Conversations do
			local ParticipantUserIds, ParticipantUserIds2 = ConversationUtilsModule.getParticipantUserIds(conversation, p2)
			t[conversation.id] = {
				primary = if ParticipantUserIds == nil or ParticipantUserIds == "" then nil else UserProfileModule.getAndFetchUserInfo(ParticipantUserIds),
				second = if ParticipantUserIds2 == nil or ParticipantUserIds2 == "" then nil else UserProfileModule.getAndFetchUserInfo(ParticipantUserIds2)
			}
		end
		return t
	end, { Conversations, p2 })
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 140 ]]
		-- upvalues: SignalsModule (upval), getDisplayNames (upval), Conversations (copy), UseMemoResult (copy), DisplayName (copy)
		return SignalsModule.createComputed(function(p3) --[[ Line: 141 ]]
			-- upvalues: getDisplayNames (upval), Conversations (upval), UseMemoResult (upval), DisplayName (upval)
			return (getDisplayNames(p3, Conversations, UseMemoResult, DisplayName))
		end)
	end, { Conversations, DisplayName, UseMemoResult })))
end

return function(p3) --[[ Line: 149 | Named "usePeoplePickerListViewModel" ]]
	-- upvalues: Players (copy), UseLocalizationFunction (copy), useConversationDisplayNames (copy), ReactModule (copy), FilterConversationsByQueryModule (copy), ConversationUtilsModule (copy), ShareSheetConstantsModule (copy)
	local Text = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0)
	local UseConversationDisplayNamesResult = useConversationDisplayNames(p3.conversations, Text, UseLocalizationFunction({ unknownUser = "Feature.Chat.Label.UnknownUser" }).unknownUser)
	local DisplayNamesByConversationId = UseConversationDisplayNamesResult.displayNamesByConversationId
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 157 ]]
		-- upvalues: FilterConversationsByQueryModule (upval), p3 (copy), DisplayNamesByConversationId (copy), UseConversationDisplayNamesResult (copy)
		return FilterConversationsByQueryModule(p3.conversations, p3.debouncedQuery, DisplayNamesByConversationId, UseConversationDisplayNamesResult.descriptionsByConversationId)
	end, {
		DisplayNamesByConversationId,
		UseConversationDisplayNamesResult.descriptionsByConversationId,
		p3.conversations,
		p3.debouncedQuery
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 174 ]]
		-- upvalues: UseMemoResult (copy), ConversationUtilsModule (upval), Text (copy), UseConversationDisplayNamesResult (copy), DisplayNamesByConversationId (copy), p3 (copy)
		local Buffer = table.create(#UseMemoResult)
		
		for i, value in UseMemoResult do
			local Id = value.id
			local ParticipantUserIds, ParticipantUserIds2 = ConversationUtilsModule.getParticipantUserIds(value, Text)
			Buffer[i] = {
				description = UseConversationDisplayNamesResult.descriptionsByConversationId[Id],
				displayName = DisplayNamesByConversationId[Id],
				id = Id,
				isLoading = UseConversationDisplayNamesResult.loadingConversationIds[Id] == true,
				isSelected = p3.selectedConversationIds[Id] == true,
				primaryUserId = ParticipantUserIds,
				secondUserId = ParticipantUserIds2
			}
		end
		return Buffer
	end, {
		UseConversationDisplayNamesResult.descriptionsByConversationId,
		UseConversationDisplayNamesResult.loadingConversationIds,
		DisplayNamesByConversationId, Text, p3.selectedConversationIds, UseMemoResult
	})
	local IsLoading = p3.isLoading or UseConversationDisplayNamesResult.isLoading and #UseMemoResult1 == 0
	
	return {
		items = UseMemoResult1,
		shouldShowEmptyState = #UseMemoResult1 == 0 and not IsLoading,
		skeletonCount = if IsLoading then ShareSheetConstantsModule.FIntShareSheetNumAvatarSkeletons else 0
	}
end