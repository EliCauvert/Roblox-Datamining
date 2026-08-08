local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local buildEmptyStateModule = require(buildExperience.Components.BuildEmptyState.BuildEmptyState)
local buildPillMenuPortalModule = require(buildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local chatActionsModule = require(buildExperience.Components.Chat.ChatActions)
local chatMessageListModule = require(buildExperience.Components.Chat.ChatMessageList)
local _ = require(buildExperience.Chat.chatTypes)
local _ = require(buildExperience.Chat.useChatSessionCore)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local var9 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local var10 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(buildExperience.Telemetry.useScrollPerformanceTracker) else nil
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function ChatSheetContent(p0) --[[ line: 55 ]]
	-- upvalues: reactModule (ref), fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var10 (ref), var9 (ref)
	local var12 = reactModule.useRef(nil)
	
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var10("LuaApp_Build_Chat_Scroll", var12)
	end
	return reactModule.createElement(var9.Content, {
		scrollingFrameRef = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then reactModule.useCallback(function(p1) --[[ line: 65 ]]
			-- upvalues: var12 (ref), p0 (ref)
			var12.current = p1
			p0.setScrollingFrame(p1)
		end, { p0.setScrollingFrame }) else p0.setScrollingFrame
	}, p0.children)
end

return function(p2) --[[ line: 77 | named "ChatSheetView" ]]
	-- upvalues: useTokens (ref), chatMessageListModule (ref), reactModule (ref), buildEmptyStateModule (ref), view (ref), var9 (ref), ChatSheetContent (ref), chatActionsModule (ref), localizationStringsModule (ref), buildPillMenuPortalModule (ref)
	return reactModule.createElement(var9.Root, {
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
		Actions = reactModule.createElement(var9.Actions, nil, {
			Footer = reactModule.createElement(chatActionsModule, {
				composerText = p2.composerText,
				composerErrorText = p2.composerErrorText,
				onComposerChanged = p2.onComposerChanged,
				placeholder = localizationStringsModule.CHAT_COMPOSER_PLACEHOLDER,
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