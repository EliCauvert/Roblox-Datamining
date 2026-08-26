local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local buildEmptyStateModule = require(buildExperience.Components.BuildEmptyState.BuildEmptyState)
local buildPillMenuPortalModule = require(buildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local chatActionsModule = require(buildExperience.Components.Chat.ChatActions)
local chatMessageListModule = require(buildExperience.Components.Chat.ChatMessageList)
local _ = require(buildExperience.Chat.chatTypes)
local _ = require(buildExperience.Chat.useChatSessionCore)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local fFlagBuildExperienceUseFoundationSheetModule = require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local var1 = if fFlagBuildExperienceUseFoundationSheetModule then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local var2 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(buildExperience.Telemetry.useScrollPerformanceTracker) else nil
local dialogSize = foundationModule.Enums.DialogSize
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function ChatSheetContent(p1)
	-- upvalues: reactModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var2 (ref), var1 (ref)
	local var3 = reactModule.useRef(nil)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var2("LuaApp_Build_Chat_Scroll", var3)
	end
	return reactModule.createElement(var1.Content, {
		scrollingFrameRef = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then reactModule.useCallback(function(p2)
			-- upvalues: var3 (ref), p1 (ref)
			var3.current = p2
			p1.setScrollingFrame(p2)
		end, { p1.setScrollingFrame }) else p1.setScrollingFrame
	}, p1.children)
end

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), fFlagBuildDesktopReadinessModule (ref), reactModule (ref), chatMessageListModule (ref), buildEmptyStateModule (ref), view (ref), var1 (ref), dialogSize (ref), ChatSheetContent (ref), chatActionsModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), buildPillMenuPortalModule (ref)
	local var3 = if fFlagBuildLocalization then useLocalization({
		composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	}) else nil
	local var4 = useTokens()
	local var5 = nil
	local var6 = nil
	
	if fFlagBuildDesktopReadinessModule then
		local var7, var8 = reactModule.useState(nil)
		var5 = var7
		var6 = var8
	end
	return reactModule.createElement(var1.Root, {
		ref = var6,
		isOpen = p1.isOpen,
		snapPoints = p1.snapPoints,
		defaultSnapPointIndex = p1.defaultSnapPointIndex,
		size = if fFlagBuildDesktopReadinessModule then dialogSize.Large else nil,
		onClose = p1.onClose
	}, {
		Content = reactModule.createElement(ChatSheetContent, { setScrollingFrame = p1.scrollingFrameRef }, {
			MessageList = reactModule.createElement(view, {
				testId = "ChatSheet.MessageList",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, var4.Size.Size_800)
				},
				tag = {
					["size-full"] = #p1.messages == 0,
					["size-full-0 auto-y"] = #p1.messages > 0
				}
			}, chatMessageListModule({
				messages = p1.messages,
				clockBinding = p1.clockBinding,
				localToolActions = p1.localToolActions,
				emptyState = reactModule.createElement(buildEmptyStateModule),
				isHistoryLoading = p1.isHistoryLoading,
				onPlaytest = p1.onPlaytest,
				isPlaytestLoading = p1.isPlaytestLoading
			}))
		}),
		Actions = reactModule.createElement(var1.Actions, nil, {
			Footer = reactModule.createElement(chatActionsModule, {
				composerText = p1.composerText,
				composerErrorText = p1.composerErrorText,
				onComposerChanged = p1.onComposerChanged,
				images = if fFlagBuildExperienceChatImageAttachmentsModule then p1.composerImages else nil,
				onImagesChanged = if fFlagBuildExperienceChatImageAttachmentsModule then p1.onComposerImagesChanged else nil,
				onRetryImage = if fFlagBuildExperienceChatImageAttachmentsModule then p1.onRetryComposerImage else nil,
				isImageSendBlocked = if fFlagBuildExperienceChatImageAttachmentsModule then p1.isComposerSendBlocked else nil,
				placeholder = if fFlagBuildLocalization then var3.composerPlaceholder else localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER,
				textBoxRef = p1.textBoxRef,
				isAssistantResponding = p1.isAssistantResponding,
				canStopAssistantResponse = p1.canStopAssistantResponse,
				canSendWhileResponding = p1.canSendWhileResponding,
				onSend = p1.onSend,
				onStop = p1.onStop
			})
		}),
		TopBarPillMenu = if p1.topBarPillMenuTarget ~= nil then nil else reactModule.createElement(buildPillMenuPortalModule, {
			testId = "build-pill-menu",
			sheet = var5,
			target = p1.topBarPillMenuTarget,
			onOpenChat = p1.onOpenChat
		})
	})
end