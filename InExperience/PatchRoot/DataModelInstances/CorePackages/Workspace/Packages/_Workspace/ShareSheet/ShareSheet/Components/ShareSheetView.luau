local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local divider = foundationModule.Divider
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local shareSheetSocialRowModule = require(script.Parent.ShareSheetSocialRow)
local shareSheetActionRowModule = require(script.Parent.ShareSheetActionRow)
local shareSendRowModule = require(script.Parent.ShareSendRow)

local function setContentScrollingFrameRef(value) --[[ line: 35 ]]
	if value then
		value.AutomaticSize = Enum.AutomaticSize.Y
		value.ScrollBarThickness = 0
	end
end

return function(p0) --[[ line: 42 | named "ShareSheetView" ]]
	-- upvalues: reactModule (ref), sheet (ref), text (ref), setContentScrollingFrameRef (ref), view (ref), shareSheetSocialRowModule (ref), divider (ref), shareSendRowModule (ref), shareSheetActionRowModule (ref)
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		isOpen = p0.isOpen,
		onClose = p0.onClose
	}, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Text = p0.shareLabel
			})
		}),
		Content = reactModule.createElement(sheet.Content, {
			isContentFullBleed = true,
			scrollingFrameRef = setContentScrollingFrameRef
		}, {
			ContentLayout = reactModule.createElement(view, { tag = "col gap-xlarge size-full-0 auto-y" }, {
				SocialRow = if p0.shouldShowSocialRow then reactModule.createElement(shareSheetSocialRowModule, {
					LayoutOrder = 1,
					conversationEligibility = p0.conversationEligibility,
					isLoading = p0.isSocialRowLoading,
					onConversationActivated = p0.onConversationActivated,
					selectedConversationIds = p0.selectedConversationIds
				}) else nil,
				RowDivider = if p0.shouldShowSocialRow then reactModule.createElement(divider, { LayoutOrder = 2, testId = "share-sheet-row-divider" }) else nil,
				ActionsRow = if next(p0.selectedConversationIds) ~= nil or p0.isSending then reactModule.createElement(shareSendRowModule, {
					LayoutOrder = 3,
					isLoading = p0.isSending,
					label = p0.sendLabel,
					messagePlaceholder = p0.messagePlaceholder,
					onActivated = p0.onSendActivated
				}) else reactModule.createElement(shareSheetActionRowModule, {
					LayoutOrder = 3,
					canShare = p0.canShareLink,
					context = p0.context,
					telemetryId = p0.telemetryId,
					url = p0.url
				})
			})
		})
	})
end