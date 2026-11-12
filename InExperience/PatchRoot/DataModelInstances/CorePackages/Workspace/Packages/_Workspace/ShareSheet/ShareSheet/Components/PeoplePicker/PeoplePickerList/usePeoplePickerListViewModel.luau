local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local Array = require(Parent.LuauPolyfill).Array
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UserProfileModule = require(Parent.DataHydration.UserProfile)
local ShareSheetConstantsModule = require(ShareSheet.ShareSheetConstants)
local FormatPeoplePickerUserInfoModule = require(ShareSheet.Utils.formatPeoplePickerUserInfo)
local MatchesQueryModule = require(ShareSheet.Utils.matchesQuery)
local RecipientModule = require(ShareSheet.Recipients.Recipient)
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

local _ = function(p1, p2)
	-- upvalues: RecipientModule (copy)
	local ParticipantIds = RecipientModule.getParticipantIds(p1, p2)
	
	return ParticipantIds[1] or p2, ParticipantIds[2]
end

local function filterRecipientsByQuery(Recipients, Text: string, DisplayNamesByConversationId, DescriptionsByConversationId)
	-- upvalues: Array (copy), MatchesQueryModule (copy)
	if Text == "" then
		return Recipients
	else
		local Lowered = string.lower(Text)
		
		return Array.filter(Recipients, function(p1)
			-- upvalues: MatchesQueryModule (upval), Lowered (copy), DisplayNamesByConversationId (copy), DescriptionsByConversationId (copy)
			return MatchesQueryModule(Lowered, DisplayNamesByConversationId[p1.id] or "", DescriptionsByConversationId[p1.id] or "")
		end)
	end
end

local function getDisplayNames(p1, List, UseMemoResult, DisplayName)
	-- upvalues: RecipientModule (copy), FormatPeoplePickerUserInfoModule (copy)
	local DescriptionsByConversationId = {}
	local DisplayNamesByConversationId = {}
	local IsLoading = false
	local LoadingConversationIds = {}
	
	for _, value in List do
		local Id = value.id
		local Name = RecipientModule.getName(value, p1)
		local UseMemoResultEntry = UseMemoResult[Id]
		
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
			if Name == "" then
				if IsNotReady2 then
					LoadingConversationIds[Id] = true
				else
					Name = FormatPeoplePickerUserInfoModule.formatTitle(List1)
				end
			end
			if not IsNotReady2 then
				DescriptionsByConversationId[Id] = FormatPeoplePickerUserInfoModule.formatDescription(List1)
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

local function useConversationDisplayNames(Recipients, p2, DisplayName)
	-- upvalues: ReactModule (copy), RecipientModule (copy), UserProfileModule (copy), SignalsModule (copy), getDisplayNames (copy), SignalsReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Recipients (copy), p2 (copy), RecipientModule (upval), UserProfileModule (upval)
		local t = {}
		
		for _, recipient in Recipients do
			local ParticipantIds = RecipientModule.getParticipantIds(recipient, p2)
			local ParticipantId = ParticipantIds[1] or p2
			local ParticipantId1 = ParticipantIds[2]
			t[recipient.id] = {
				primary = if ParticipantId == nil or ParticipantId == "" then nil else UserProfileModule.getAndFetchUserInfo(ParticipantId),
				second = if ParticipantId1 == nil or ParticipantId1 == "" then nil else UserProfileModule.getAndFetchUserInfo(ParticipantId1)
			}
		end
		return t
	end, { p2, Recipients })
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), getDisplayNames (upval), Recipients (copy), UseMemoResult (copy), DisplayName (copy)
		return SignalsModule.createComputed(function(p3)
			-- upvalues: getDisplayNames (upval), Recipients (upval), UseMemoResult (upval), DisplayName (upval)
			return (getDisplayNames(p3, Recipients, UseMemoResult, DisplayName))
		end)
	end, { Recipients, DisplayName, UseMemoResult })))
end

return function(p3)
	-- upvalues: Players (copy), UseLocalizationFunction (copy), useConversationDisplayNames (copy), ReactModule (copy), filterRecipientsByQuery (copy), RecipientModule (copy), ShareSheetConstantsModule (copy)
	local Text = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0)
	local UseConversationDisplayNamesResult = useConversationDisplayNames(p3.recipients, Text, UseLocalizationFunction({ unknownUser = "Feature.Chat.Label.UnknownUser" }).unknownUser)
	local DisplayNamesByConversationId = UseConversationDisplayNamesResult.displayNamesByConversationId
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: filterRecipientsByQuery (upval), p3 (copy), DisplayNamesByConversationId (copy), UseConversationDisplayNamesResult (copy)
		return filterRecipientsByQuery(p3.recipients, p3.filterQuery, DisplayNamesByConversationId, UseConversationDisplayNamesResult.descriptionsByConversationId)
	end, {
		DisplayNamesByConversationId,
		UseConversationDisplayNamesResult.descriptionsByConversationId,
		p3.filterQuery,
		p3.recipients
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), Text (copy), RecipientModule (upval), UseConversationDisplayNamesResult (copy), DisplayNamesByConversationId (copy), p3 (copy)
		local Buffer = table.create(#UseMemoResult)
		
		for i, value in UseMemoResult do
			local Id = value.id
			local ParticipantIds = RecipientModule.getParticipantIds(value, Text)
			Buffer[i] = {
				description = UseConversationDisplayNamesResult.descriptionsByConversationId[Id],
				displayName = DisplayNamesByConversationId[Id],
				id = Id,
				isLoading = UseConversationDisplayNamesResult.loadingConversationIds[Id] == true,
				isSelected = p3.selectedConversationIds[Id] == true,
				primaryUserId = ParticipantIds[1] or Text,
				secondUserId = ParticipantIds[2]
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