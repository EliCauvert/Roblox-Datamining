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
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local var10 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local var11 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(buildExperience.Telemetry.useScrollPerformanceTracker) else nil
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function ChatSheetContent(p0) --[[ line: 59 ]]
	-- upvalues: reactModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var11 (ref), var10 (ref)
	local var13 = reactModule.useRef(nil)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var11("LuaApp_Build_Chat_Scroll", var13)
	end
	return reactModule.createElement(var10.Content, {
		scrollingFrameRef = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then reactModule.useCallback(function(p1) --[[ line: 69 ]]
			-- upvalues: var13 (ref), p0 (ref)
			var13.current = p1
			p0.setScrollingFrame(p1)
		end, { p0.setScrollingFrame }) else p0.setScrollingFrame
	}, p0.children)
end

return function(p2) --[[ line: 81 | named "ChatSheetView" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), useTokens (ref), chatMessageListModule (ref), reactModule (ref), buildEmptyStateModule (ref), view (ref), var10 (ref), ChatSheetContent (ref), chatActionsModule (ref), buildPillMenuPortalModule (ref)
	return reactModule.createElement(var10.Root, {
		isOpen = p2.isOpen,
		snapPoints = p2.snapPoints,
		defaultSnapPointIndex = p2.defaultSnapPointIndex,
		onClose = p2.onClose
	}, {
		Content = reactModule.createElement(ChatSheetContent, { setScrollingFrame = p2.scrollingFrameRef }, {
			MessageList = reactModule.createElement(view, {
				testId = "ChatSheet.MessageList",
				layout = {
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, useTokens().Size.Size_800)
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
		Actions = reactModule.createElement(var10.Actions, nil, {
			Footer = reactModule.createElement(chatActionsModule, {
				composerText = p2.composerText,
				composerErrorText = p2.composerErrorText,
				onComposerChanged = p2.onComposerChanged,
				placeholder = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
					composerPlaceholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
				}) else nil).composerPlaceholder else localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER,
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
			target = p2.topBarPillMenuTarget
		})
	})
end