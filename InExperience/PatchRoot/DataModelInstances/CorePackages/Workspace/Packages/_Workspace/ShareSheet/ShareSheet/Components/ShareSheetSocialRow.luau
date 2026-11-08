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
local RecipientModule = require(ShareSheet.Recipients.Recipient)
local ShareSheetConstantsModule = require(ShareSheet.ShareSheetConstants)
local ShareSheetRowModule = require(script.Parent.ShareSheetRow)
local ShareSheetItemContainerModule = require(script.Parent.ShareSheetItemContainer)
local Players = game:GetService("Players")

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
			return SignalsModule.createComputed(function(p1)
				-- upvalues: RecipientModule (upval), Frame (upval)
				return RecipientModule.getName(Frame.recipient, p1)
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
	-- upvalues: Players (copy), UseLocalizationFunction (copy), createSkeletonItems (copy), ReactModule (copy), ShareSheetRecipientItem (copy), ShareSheetItemContainerModule (copy), IconName (copy), ShareSheetRowModule (copy)
	local Text = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0)
	local UseLocalizationResult = UseLocalizationFunction({ more = "CommonUI.Features.Label.More" })
	local Elements = {}
	
	if Frame.isLoading or Frame.socialRowRecipients.isLoading then
		Elements = createSkeletonItems()
	else
		local Recipients = Frame.socialRowRecipients.recipients
		
		for LayoutOrder, recipient in Recipients do
			Elements[recipient.id] = ReactModule.createElement(ShareSheetRecipientItem, {
				recipient = recipient,
				isSelected = Frame.selectedConversationIds[recipient.id] == true,
				localUserId = Text,
				onConversationActivated = Frame.onConversationActivated,
				LayoutOrder = LayoutOrder
			})
		end
		Elements.More = ReactModule.createElement(ShareSheetItemContainerModule, {
			icon = IconName.ThreeDotsHorizontal,
			label = UseLocalizationResult.more,
			onActivated = Frame.onMoreActivated,
			LayoutOrder = #Recipients + 1
		})
	end
	return ReactModule.createElement(ShareSheetRowModule, { LayoutOrder = Frame.LayoutOrder }, Elements)
end