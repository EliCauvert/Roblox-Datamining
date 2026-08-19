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
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local var11 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local var12 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(buildExperience.Telemetry.useScrollPerformanceTracker) else nil
local dialogSize = foundationModule.Enums.DialogSize
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function ChatSheetContent(p0) --[[ line: 61 ]]
	-- upvalues: reactModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var12 (ref), var11 (ref)
	local var14 = reactModule.useRef(nil)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var12("LuaApp_Build_Chat_Scroll", var14)
	end
	return reactModule.createElement(var11.Content, {
		scrollingFrameRef = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then reactModule.useCallback(function(p1) --[[ line: 71 ]]
			-- upvalues: var14 (ref), p0 (ref)
			var14.current = p1
			p0.setScrollingFrame(p1)
		end, { p0.setScrollingFrame }) else p0.setScrollingFrame
	}, p0.children)
end

return function(p2) --[[ line: 83 | named "ChatSheetView" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), fFlagBuildDesktopReadinessModule (ref), reactModule (ref), chatMessageListModule (ref), buildEmptyStateModule (ref), view (ref), var11 (ref), dialogSize (ref), ChatSheetContent (ref), chatActionsModule (ref), buildPillMenuPortalModule (ref)
	local var15 = if fFlagBuildLocalization then useLocalization({
		composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	}) else nil
	local var16 = useTokens()
	local var17 = nil
	local var18 = nil
	
	if fFlagBuildDesktopReadinessModule then
		local var19, var20 = reactModule.useState(nil)
		var17 = var19
		var18 = var20
	end
	return reactModule.createElement(var11.Root, {
		ref = var18,
		isOpen = p2.isOpen,
		snapPoints = p2.snapPoints,
		defaultSnapPointIndex = p2.defaultSnapPointIndex,
		size = if fFlagBuildDesktopReadinessModule then dialogSize.Large else nil,
		onClose = p2.onClose
	}, {
		Content = reactModule.createElement(ChatSheetContent, { setScrollingFrame = p2.scrollingFrameRef }, {
			MessageList = reactModule.createElement(view, {
				testId = "ChatSheet.MessageList",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, var16.Size.Size_800)
				},
				tag = {
					["size-full"] = #p2.messages == 0,
					["size-full-0 auto-y"] = #p2.messages > 0
				}
			}, chatMessageListModule({
				messages = p2.messages,
				clockBinding = p2.clockBinding,
				localToolActions = p2.localToolActions,
				emptyState = reactModule.createElement(buildEmptyStateModule),
				isHistoryLoading = p2.isHistoryLoading,
				onPlaytest = p2.onPlaytest,
				isPlaytestLoading = p2.isPlaytestLoading
			}))
		}),
		Actions = reactModule.createElement(var11.Actions, nil, {
			Footer = reactModule.createElement(chatActionsModule, {
				composerText = p2.composerText,
				composerErrorText = p2.composerErrorText,
				onComposerChanged = p2.onComposerChanged,
				placeholder = if fFlagBuildLocalization then var15.composerPlaceholder else localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER,
				textBoxRef = p2.textBoxRef,
				isAssistantResponding = p2.isAssistantResponding,
				canStopAssistantResponse = p2.canStopAssistantResponse,
				canSendWhileResponding = p2.canSendWhileResponding,
				onSend = p2.onSend,
				onStop = p2.onStop
			})
		}),
		TopBarPillMenu = if p2.topBarPillMenuTarget ~= nil then nil else reactModule.createElement(buildPillMenuPortalModule, {
			testId = "build-pill-menu",
			sheet = var17,
			target = p2.topBarPillMenuTarget
		})
	})
end