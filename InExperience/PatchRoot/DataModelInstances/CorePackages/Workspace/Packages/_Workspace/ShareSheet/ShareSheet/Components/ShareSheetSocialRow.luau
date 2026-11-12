local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local Array = require(Parent.LuauPolyfill).Array
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local Radius = FoundationModule.Enums.Radius
local FFlagShareSheetDesktopReadinessModule = require(ShareSheet.Flags.FFlagShareSheetDesktopReadiness)
local RecipientModule = require(ShareSheet.Recipients.Recipient)
local ShareSheetConstantsModule = require(ShareSheet.ShareSheetConstants)
local ShareSheetRowModule = require(script.Parent.ShareSheetRow)
local ShareSheetItemContainerModule = require(script.Parent.ShareSheetItemContainer)
local _ = require(script.Parent.getShareSheetRowLayout)
local Players = game:GetService("Players")

local function createSkeletonItems(p1)
	-- upvalues: FFlagShareSheetDesktopReadinessModule (copy), ShareSheetConstantsModule (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local Elements = {}
	local VisibleTileCount = if FFlagShareSheetDesktopReadinessModule then p1.rowLayout.visibleTileCount else ShareSheetConstantsModule.FIntShareSheetNumAvatarSkeletons
	for i = 1, VisibleTileCount do
		local TileWidth = if FFlagShareSheetDesktopReadinessModule then p1.rowLayout.getTileWidth(i) else nil
		Elements[`Skeleton{i}`] = ReactModule.createElement(View, {
			LayoutOrder = i,
			tag = {
				["col align-x-center gap-small auto-y"] = true,
				["size-1700-0"] = not FFlagShareSheetDesktopReadinessModule
			},
			Size = if FFlagShareSheetDesktopReadinessModule then UDim2.fromOffset(TileWidth, 0) else nil
		}, {
			Avatar = ReactModule.createElement(View, {
				LayoutOrder = 1,
				testId = "share-sheet-avatar-skeleton-container",
				tag = {
					["size-full-1700"] = not FFlagShareSheetDesktopReadinessModule
				},
				Size = if FFlagShareSheetDesktopReadinessModule then UDim2.fromOffset(TileWidth, TileWidth) else nil
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

local function getRecipientsToShow(Frame)
	-- upvalues: Array (copy)
	local Recipients = Frame.socialRowRecipients.recipients
	local MaxTileCountDelta = Frame.rowLayout.maxTileCount - 1 - #Array.filter(Recipients, function(p2): boolean
		-- upvalues: Frame (copy)
		return Frame.selectedConversationIds[p2.id] == true
	end)
	
	return Array.filter(Recipients, function(p2): boolean
		-- upvalues: Frame (copy), MaxTileCountDelta (ref)
		if Frame.selectedConversationIds[p2.id] == true then
			return true
		else
			MaxTileCountDelta -= 1
			
			return MaxTileCountDelta >= 0
		end
	end)
end

local function ShareSheetRecipientItem(Frame)
	-- upvalues: ReactModule (copy), RecipientModule (copy), SignalsModule (copy), SignalsReactModule (copy), ShareSheetItemContainerModule (copy), FFlagShareSheetDesktopReadinessModule (copy)
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
		width = if FFlagShareSheetDesktopReadinessModule then Frame.width else nil,
		LayoutOrder = Frame.LayoutOrder
	})
end

return function(Frame)
	-- upvalues: Players (copy), UseLocalizationFunction (copy), createSkeletonItems (copy), FFlagShareSheetDesktopReadinessModule (copy), getRecipientsToShow (copy), ReactModule (copy), ShareSheetRecipientItem (copy), ShareSheetItemContainerModule (copy), IconName (copy), ShareSheetRowModule (copy)
	local Text = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or 0)
	local UseLocalizationResult = UseLocalizationFunction({ more = "CommonUI.Features.Label.More" })
	local Elements = {}
	local VisibleTileCount = nil
	
	if Frame.isLoading or Frame.socialRowRecipients.isLoading then
		Elements = createSkeletonItems(if FFlagShareSheetDesktopReadinessModule then Frame else nil)
		VisibleTileCount = if FFlagShareSheetDesktopReadinessModule then Frame.rowLayout.visibleTileCount else nil
	else
		local RecipientsToShow = if FFlagShareSheetDesktopReadinessModule then getRecipientsToShow(Frame) else Frame.socialRowRecipients.recipients
		for LayoutOrder, Recipient in RecipientsToShow do
			Elements[Recipient.id] = ReactModule.createElement(ShareSheetRecipientItem, {
				recipient = Recipient,
				isSelected = Frame.selectedConversationIds[Recipient.id] == true,
				localUserId = Text,
				onConversationActivated = Frame.onConversationActivated,
				width = if FFlagShareSheetDesktopReadinessModule then Frame.rowLayout.getTileWidth(LayoutOrder) else nil,
				LayoutOrder = LayoutOrder
			})
		end
		VisibleTileCount = if FFlagShareSheetDesktopReadinessModule then #RecipientsToShow + 1 else nil
		Elements.More = ReactModule.createElement(ShareSheetItemContainerModule, {
			icon = IconName.ThreeDotsHorizontal,
			label = UseLocalizationResult.more,
			onActivated = Frame.onMoreActivated,
			width = if FFlagShareSheetDesktopReadinessModule then Frame.rowLayout.getTileWidth(VisibleTileCount) else nil,
			LayoutOrder = #RecipientsToShow + 1
		})
	end
	return ReactModule.createElement(ShareSheetRowModule, {
		LayoutOrder = Frame.LayoutOrder,
		margin = if FFlagShareSheetDesktopReadinessModule then Frame.rowLayout.margin else nil,
		gap = if FFlagShareSheetDesktopReadinessModule then Frame.rowLayout.gap else nil,
		isScrollingEnabled = if FFlagShareSheetDesktopReadinessModule then Frame.rowLayout.isScrollingEnabled(VisibleTileCount) else nil
	}, Elements)
end