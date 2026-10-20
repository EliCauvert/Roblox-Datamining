local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseChatPlaytestFooterModule = require(BuildExperience.Chat.useChatPlaytestFooter)
local UseChatSessionCoreModule = require(BuildExperience.Chat.useChatSessionCore)
local _ = require(BuildExperience.Components.ChatSheet.ChatSheetView)
local _ = require(BuildExperience.Components.ChatSheet.useChatSheetViewModel)
local GetAssistantBuildStoreModule = require(BuildExperience.Stores.GetAssistantBuildStore)
local GetCreatorAgentResumeStoreModule = require(BuildExperience.Stores.GetCreatorAgentResumeStore)
local GetLibraryStoreModule = require(BuildExperience.Stores.GetLibraryStore)
local GetCurrentExperienceProjectModule = require(BuildExperience.utils.getCurrentExperienceProject)
local UseLibraryChatComposerModule = require(script.Parent.useLibraryChatComposer)
local ChatTypesModule = require(BuildExperience.Chat.chatTypes)
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)

local function noop() end

return function(p1)
	-- upvalues: noop (copy), SignalsReactModule (copy), GetAssistantBuildStoreModule (copy), GetCreatorAgentResumeStoreModule (copy), GetCurrentExperienceProjectModule (copy), UseChatSessionCoreModule (copy), GetLibraryStoreModule (copy), UseChatPlaytestFooterModule (copy), UseLibraryChatComposerModule (copy), ReactModule (copy), ChatTypesModule (copy), FoundationModule (copy), FFlagBuildExperienceAnswerFormModule (copy)
	local OnClose = p1.onClose or noop
	local NoIsOpen = p1.isOpen == nil or p1.isOpen
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetAssistantBuildStoreModule().getIsDisabled)
	local CreatorAgentResumeStoreModule = GetCreatorAgentResumeStoreModule()
	local CurrentExperienceProjectModule = GetCurrentExperienceProjectModule()
	local UniverseId = p1.universeId or CurrentExperienceProjectModule.universeId
	local UseChatSessionCoreModuleResult = UseChatSessionCoreModule({
		autoFocusComposer = false,
		isLibraryChat = true,
		universeId = UniverseId,
		placeId = p1.placeId or CurrentExperienceProjectModule.placeId,
		sessionId = p1.sessionId,
		hydrateHistoryWhen = NoIsOpen,
		onPromptFailure = GetLibraryStoreModule().reportPromptFailure
	})
	local ChatSheetPlaytestCta = UseChatPlaytestFooterModule(UseChatSessionCoreModuleResult, "ChatSheetPlaytestCta")
	local UseLibraryChatComposerModuleResult = UseLibraryChatComposerModule(UseChatSessionCoreModuleResult, NoIsOpen)
	ReactModule.useEffect(function()
		-- upvalues: NoIsOpen (copy), UseSignalStateResult (copy), OnClose (copy)
		if NoIsOpen and UseSignalStateResult then
			OnClose()
		end
	end, { NoIsOpen, UseSignalStateResult, OnClose })
	ReactModule.useEffect(function()
		-- upvalues: NoIsOpen (copy), CreatorAgentResumeStoreModule (copy), UniverseId (copy), p1 (copy)
		if not NoIsOpen then
			CreatorAgentResumeStoreModule.setActiveTarget(nil)
			
			return
		end
		CreatorAgentResumeStoreModule.setActiveTarget({ universeId = UniverseId, sessionId = p1.sessionId })
		
		return function()
			-- upvalues: CreatorAgentResumeStoreModule (upval)
			CreatorAgentResumeStoreModule.setActiveTarget(nil)
		end
	end, {
		CreatorAgentResumeStoreModule,
		NoIsOpen,
		UniverseId,
		p1.sessionId
	})
	local ComposerResourceAttachments = UseChatSessionCoreModuleResult.composerResourceAttachments
	local RemoveComposerResourceAttachmentAtIndexFunction = UseChatSessionCoreModuleResult.removeComposerResourceAttachmentAtIndex
	local SendMessageFunction = UseChatSessionCoreModuleResult.sendMessage
	
	return {
		isOpen = NoIsOpen,
		onClose = OnClose,
		sheetComponent = FoundationModule.Sheet,
		snapPoints = p1.snapPoints,
		defaultSnapPointIndex = p1.defaultSnapPointIndex,
		messages = UseChatSessionCoreModuleResult.messages,
		localToolActions = UseChatSessionCoreModuleResult.localToolActions,
		answerForm = if FFlagBuildExperienceAnswerFormModule then UseChatSessionCoreModuleResult.answerForm else nil,
		onSubmitAnswerText = if FFlagBuildExperienceAnswerFormModule then UseChatSessionCoreModuleResult.submitAnswerText else nil,
		clockBinding = UseChatSessionCoreModuleResult.clockBinding,
		onPlaytest = ChatSheetPlaytestCta.onPlaytest,
		isPlaytestLoading = ChatSheetPlaytestCta.isPlaytestLoading,
		isHistoryLoading = UseChatSessionCoreModuleResult.isHistoryLoading,
		scrollingFrameRef = UseChatSessionCoreModuleResult.setScrollingFrame,
		anchorScrollToInstance = UseChatSessionCoreModuleResult.anchorScrollToInstance,
		composerText = UseChatSessionCoreModuleResult.composerText,
		composerErrorText = UseChatSessionCoreModuleResult.composerErrorText,
		onComposerChanged = UseChatSessionCoreModuleResult.setComposerText,
		composerImages = UseChatSessionCoreModuleResult.composerImages,
		onComposerImagesChanged = UseChatSessionCoreModuleResult.setComposerImages,
		onRetryComposerImage = UseChatSessionCoreModuleResult.retryComposerImage,
		composerResourceAttachments = UseChatSessionCoreModuleResult.composerResourceAttachments,
		onRemoveComposerResourceAttachment = ReactModule.useCallback(function(p2)
			-- upvalues: ComposerResourceAttachments (copy), RemoveComposerResourceAttachmentAtIndexFunction (copy), GetLibraryStoreModule (upval), ChatTypesModule (upval)
			local ComposerResourceAttachment = ComposerResourceAttachments[p2]
			RemoveComposerResourceAttachmentAtIndexFunction(p2)
			
			if ComposerResourceAttachment ~= nil then
				GetLibraryStoreModule().reportChipEvent("Removed", {
					ChatTypesModule.getResourceAttachmentUri(ComposerResourceAttachment)
				})
			end
		end, {
			ComposerResourceAttachments,
			RemoveComposerResourceAttachmentAtIndexFunction
		}),
		onActivateComposerResourceAttachment = ReactModule.useCallback(function(p2)
			-- upvalues: ComposerResourceAttachments (copy), GetLibraryStoreModule (upval), ChatTypesModule (upval)
			local ComposerResourceAttachment = ComposerResourceAttachments[p2]
			
			if ComposerResourceAttachment ~= nil then
				GetLibraryStoreModule().reportChipEvent("Activated", {
					ChatTypesModule.getResourceAttachmentUri(ComposerResourceAttachment)
				})
			end
		end, { ComposerResourceAttachments }),
		isComposerSendBlocked = UseLibraryChatComposerModuleResult,
		tracksExternalComposerText = true,
		textBoxRef = UseChatSessionCoreModuleResult.textBoxRef,
		isAssistantResponding = UseChatSessionCoreModuleResult.isAssistantResponding,
		canStopAssistantResponse = UseChatSessionCoreModuleResult.canStopAssistantResponse,
		canSendWhileResponding = UseChatSessionCoreModuleResult.canSendWhileResponding,
		allowsComposerTypingWhileResponding = true,
		reservesHandleSpace = true,
		onSend = ReactModule.useCallback(function(p2)
			-- upvalues: ComposerResourceAttachments (copy), ChatTypesModule (upval), SendMessageFunction (copy), GetLibraryStoreModule (upval)
			local List = {}
			
			for _, composerResourceAttachment in ComposerResourceAttachments do
				table.insert(List, ChatTypesModule.getResourceAttachmentUri(composerResourceAttachment))
			end
			local SendMessageResult = SendMessageFunction(p2)
			
			if SendMessageResult and #List > 0 then
				GetLibraryStoreModule().reportChipEvent("Sent", List)
			end
			return SendMessageResult
		end, { ComposerResourceAttachments, SendMessageFunction }),
		onStop = UseChatSessionCoreModuleResult.stopAssistantResponse,
		onOpenChat = noop
	}
end