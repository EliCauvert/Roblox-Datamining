local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local buildEmptyStateModule = require(buildExperience.Components.BuildEmptyState.BuildEmptyState)
local buildPillMenuPortalModule = require(buildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local chatActionsModule = require(buildExperience.Components.Chat.ChatActions)
local chatMessageListModule = require(buildExperience.Components.Chat.ChatMessageList)
local _ = require(buildExperience.Chat.chatTypes)
local _ = require(buildExperience.Chat.useChatSessionCore)
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local var1 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local useScrollPerformanceTrackerModule = require(buildExperience.Telemetry.useScrollPerformanceTracker)
local dialogSize = foundationModule.Enums.DialogSize
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function ChatSheetContent(p1)
	-- upvalues: reactModule (ref), useScrollPerformanceTrackerModule (ref), var1 (ref)
	local var2 = reactModule.useRef(nil)
	useScrollPerformanceTrackerModule("LuaApp_Build_Chat_Scroll", var2)
	
	return reactModule.createElement(var1.Content, {
		scrollingFrameRef = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref), p1 (ref)
			var2.current = p2
			p1.setScrollingFrame(p2)
		end, { p1.setScrollingFrame })
	}, p1.children)
end

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), useTokens (ref), fFlagBuildDesktopReadinessModule (ref), reactModule (ref), chatMessageListModule (ref), buildEmptyStateModule (ref), view (ref), var1 (ref), dialogSize (ref), ChatSheetContent (ref), chatActionsModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), buildPillMenuPortalModule (ref)
	local var2 = useLocalization({
		composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	})
	local var3 = useTokens()
	local var4 = nil
	local var5 = nil
	
	if fFlagBuildDesktopReadinessModule then
		local var6, var7 = reactModule.useState(nil)
		var4 = var6
		var5 = var7
	end
	return reactModule.createElement(var1.Root, {
		ref = var5,
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
					Padding = UDim.new(0, var3.Size.Size_800)
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
				placeholder = var2.composerPlaceholder,
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
			sheet = var4,
			target = p1.topBarPillMenuTarget,
			onOpenChat = p1.onOpenChat
		})
	})
end