local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local Radius = FoundationModule.Enums.Radius
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local FFlagShareSheetPeoplePickerEnabledModule = require(ShareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)
local RecipientModule = require(ShareSheet.Recipients.Recipient)
local ShareSheetConstantsModule = require(ShareSheet.ShareSheetConstants)
local ShareSheetRowModule = require(script.Parent.ShareSheetRow)
local ShareSheetItemContainerModule = require(script.Parent.ShareSheetItemContainer)
local ConversationUtilsModule = if FFlagShareSheetPeoplePickerEnabledModule then require(ShareSheet.Utils.ConversationUtils) else nil
local Players = game:GetService("Players")
local _ = require(ShareSheet.Types)

local function _(List, p1)
	local List1 = {}
	
	for _, value in List do
		if value ~= p1 then
			table.insert(List1, value)
		end
	end
	return List1
end

local function createSkeletonItems()
	-- upvalues: ShareSheetConstantsModule (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local Elements = {}
	
	for i = 1, ShareSheetConstantsModule.FIntShareSheetNumAvatarSkeletons do
		Elements[`Skeleton{i}`] = ReactModule.createElement(View, {
			tag = "col align-x-center gap-small size-1700-0 auto-y",
			LayoutOrder = i
		}, {
			Avatar = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "size-full-1700",
				testId = "share-sheet-avatar-skeleton-container"
			}, {
				Skeleton = ReactModule.createElement(Skeleton, {
					testId = "share-sheet-avatar-skeleton",
					radius = Radius.Circle
				})
			}),
			Text = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "size-full-400",
				testId = "share-sheet-text-skeleton-container"
			}, {
				Skeleton = ReactModule.createElement(Skeleton, {
					testId = "share-sheet-text-skeleton",
					radius = Radius.Medium
				})
			})
		})
	end
	return Elements
end

local function ShareSheetConversationItem(Frame)
	-- upvalues: ReactModule (copy), FFlagShareSheetPeoplePickerEnabledModule (copy), ConversationUtilsModule (copy), ShareSheetItemContainerModule (copy)
	local Conversation = Frame.conversation
	local Id = Conversation.id
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Frame (copy), Id (copy)
		Frame.onConversationActivated(Id)
	end, { Id, Frame.onConversationActivated })
	local DisplayName = nil
	local ParticipantUserIds = nil
	local ParticipantUserIds2 = nil
	
	if FFlagShareSheetPeoplePickerEnabledModule then
		ParticipantUserIds, ParticipantUserIds2 = ConversationUtilsModule.getParticipantUserIds(Conversation, Frame.localUserId)
		DisplayName = ConversationUtilsModule.getDisplayName(Conversation)
	else
		local LocalUserId = Frame.localUserId
		local List = {}
		
		for _, value in Conversation.participants or {} do
			if value ~= LocalUserId then
				table.insert(List, value)
			end
		end
		ParticipantUserIds = List[1] or Frame.localUserId
		ParticipantUserIds2 = if #List >= 2 then List[2] else nil
		local TitleForViewer = Conversation.titleForViewer
		DisplayName = if TitleForViewer and TitleForViewer ~= "" then TitleForViewer else Conversation.title or ""
	end
	return ReactModule.createElement(ShareSheetItemContainerModule, {
		primaryUserId = ParticipantUserIds,
		secondUserId = ParticipantUserIds2,
		isSelected = Frame.isSelected,
		label = DisplayName,
		onActivated = UseResult,
		LayoutOrder = Frame.LayoutOrder
	})
end

local function ShareSheetRecipientItem(Frame)
	-- upvalues: ReactModule (copy), RecipientModule (copy), SignalsModule (copy), SignalsReactModule (copy), ShareSheetItemContainerModule (copy)
	local Id = Frame.recipient.id
	local ParticipantIds = RecipientModule.getParticipantIds(Frame.recipient, Frame.localUserId)
	
	return ReactModule.createElement(ShareSheetItemContainerModule, {
		primaryUserId = ParticipantIds[1] or Frame.localUserId,
		secondUserId = ParticipantIds[2],
		isSelected = Frame.isSelected,
		label = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), RecipientModule (upval), Frame (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: RecipientModule (upval), Frame (upval)
				return RecipientModule.getName(Frame.recipient, p2)
			end)
		end, { Frame.recipient }))),
		onActivated = ReactModule.useCallback(function()
			-- upvalues: Frame (copy), Id (copy)
			Frame.onConversationActivated(Id)
		end, { Id, Frame.onConversationActivated }),
		LayoutOrder = Frame.LayoutOrder
	})
end

return function(Frame)
	-- upvalues: Players (copy), FFlagShareSheetPeoplePickerEnabledModule (copy), UseLocalizationFunction (copy), FFlagShareSheetFriendsSort (copy), createSkeletonItems (copy), ReactModule (copy), ShareSheetRecipientItem (copy), ShareSheetConversationItem (copy), ShareSheetItemContainerModule (copy), IconName (copy), ShareSheetRowModule (copy)
	local Text = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0)
	local UseLocalizationResult = if FFlagShareSheetPeoplePickerEnabledModule then UseLocalizationFunction({ more = "CommonUI.Features.Label.More" }) else nil
	local Elements = {}
	local IsLoading = if FFlagShareSheetFriendsSort then Frame.eligibleRecipients.isLoading else Frame.conversationEligibility.isLoading
	
	if Frame.isLoading or IsLoading then
		Elements = createSkeletonItems()
	else
		local CountRecipients = nil
		if FFlagShareSheetFriendsSort then
			local Recipients = Frame.eligibleRecipients.recipients
			
			for LayoutOrder, recipient in Recipients do
				Elements[recipient.id] = ReactModule.createElement(ShareSheetRecipientItem, {
					recipient = recipient,
					isSelected = Frame.selectedConversationIds[recipient.id] == true,
					localUserId = Text,
					onConversationActivated = Frame.onConversationActivated,
					LayoutOrder = LayoutOrder
				})
			end
			CountRecipients = #Recipients
		else
			local EligibleConversations = Frame.conversationEligibility.eligibleConversations
			
			for LayoutOrder1, eligibleConversation in EligibleConversations do
				local Id = eligibleConversation.id
				Elements[Id] = ReactModule.createElement(ShareSheetConversationItem, {
					conversation = eligibleConversation,
					isSelected = Frame.selectedConversationIds[Id] == true,
					localUserId = Text,
					onConversationActivated = Frame.onConversationActivated,
					LayoutOrder = LayoutOrder1
				})
			end
			CountRecipients = #EligibleConversations
		end
		if FFlagShareSheetPeoplePickerEnabledModule then
			Elements.More = ReactModule.createElement(ShareSheetItemContainerModule, {
				icon = IconName.ThreeDotsHorizontal,
				label = UseLocalizationResult.more,
				onActivated = Frame.onMoreActivated,
				LayoutOrder = CountRecipients + 1
			})
		end
	end
	return ReactModule.createElement(ShareSheetRowModule, { LayoutOrder = Frame.LayoutOrder }, Elements)
end