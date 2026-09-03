local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local divider = foundationModule.Divider
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)
local shareSheetSocialRowModule = require(script.Parent.ShareSheetSocialRow)
local shareSheetActionRowModule = require(script.Parent.ShareSheetActionRow)
local shareSendRowModule = require(script.Parent.ShareSendRow)

local function setContentScrollingFrameRef(value)
	if value then
		value.AutomaticSize = Enum.AutomaticSize.Y
		value.ScrollBarThickness = 0
	end
end

return function(p1)
	-- upvalues: reactModule (ref), shareSheetTelemetryModule (ref), sheet (ref), text (ref), setContentScrollingFrameRef (ref), view (ref), shareSheetSocialRowModule (ref), divider (ref), shareSendRowModule (ref), shareSheetActionRowModule (ref)
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		isOpen = p1.isOpen,
		onClose = reactModule.useCallback(function()
			-- upvalues: p1 (ref), shareSheetTelemetryModule (copy)
			p1.onCloseWithReason(shareSheetTelemetryModule.CloseReason.UserDismissed)
		end, { p1.onCloseWithReason })
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = p1.shareLabel
			})
		}),
		Content = reactModule.createElement(sheet.Content, {
			isContentFullBleed = true,
			scrollingFrameRef = setContentScrollingFrameRef
		}, {
			ContentLayout = reactModule.createElement(view, { tag = "col gap-xlarge size-full-0 auto-y" }, {
				SocialRow = if p1.shouldShowSocialRow then reactModule.createElement(shareSheetSocialRowModule, {
					LayoutOrder = 1,
					conversationEligibility = p1.conversationEligibility,
					isLoading = p1.isSocialRowLoading,
					onConversationActivated = p1.onConversationActivated,
					selectedConversationIds = p1.selectedConversationIds
				}) else nil,
				RowDivider = if p1.shouldShowSocialRow then reactModule.createElement(divider, { LayoutOrder = 2, testId = "share-sheet-row-divider" }) else nil,
				ActionsRow = if next(p1.selectedConversationIds) ~= nil or p1.isSending then reactModule.createElement(shareSendRowModule, {
					LayoutOrder = 3,
					isLoading = p1.isSending,
					label = p1.sendLabel,
					messagePlaceholder = p1.messagePlaceholder,
					onActivated = p1.onSendActivated,
					onFocusGained = p1.onComposerFocused
				}) else reactModule.createElement(shareSheetActionRowModule, {
					LayoutOrder = 3,
					canShare = p1.canShareLink,
					context = p1.context,
					telemetryId = p1.telemetryId,
					url = p1.url
				})
			})
		})
	})
end