local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local ChatTypesModule = require(BuildExperience.Chat.chatTypes)
local FFlagBuildExperienceAnswerFormModule = require(BuildExperience.Flags.FFlagBuildExperienceAnswerForm)
local UseChatPlaytestFooterModule = require(BuildExperience.Chat.useChatPlaytestFooter)
local UseBuildPromptDraftModule = require(BuildExperience.Chat.useBuildPromptDraft)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local FFlagBuildExperienceDeveloperProductContextModule = require(BuildExperience.Flags.FFlagBuildExperienceDeveloperProductContext)
local UseChatSessionCoreModule = require(BuildExperience.Chat.useChatSessionCore)
local _ = require(BuildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local GetAssistantBuildStoreModule = require(BuildExperience.Stores.GetAssistantBuildStore)
local GetCreatorAgentResumeStoreModule = require(BuildExperience.Stores.GetCreatorAgentResumeStore)
local GetPlayButtonStoreModule = require(BuildExperience.Stores.GetPlayButtonStore)
local GetCurrentExperienceProjectModule = require(BuildExperience.utils.getCurrentExperienceProject)
local _ = require(script.Parent.ChatSheetView)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagBuildExperienceAnalytics = SharedFlagsModule.FFlagBuildExperienceAnalytics
local FFlagBuildExperienceChatResourceAttachments = SharedFlagsModule.FFlagBuildExperienceInstanceSelection and SharedFlagsModule.FFlagBuildExperienceChatResourceAttachments
local FFlagBuildExperienceChatImageAttachmentsModule = require(BuildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local FFlagBuildExperienceChatImageAttachmentsModule1 = SharedFlagsModule.FFlagBuildExperienceInGameCaptureToChat and FFlagBuildExperienceChatImageAttachmentsModule
local FFlagBuildCheckGamePermissionsModule = require(BuildExperience.Flags.FFlagBuildCheckGamePermissions)
local UseGamePermissionsModule = require(BuildExperience.useGamePermissions)

local function noop() end

return function(p1)
	-- upvalues: noop (copy), GetAssistantBuildStoreModule (copy), SignalsReactModule (copy), GetCreatorAgentResumeStoreModule (copy), GetCurrentExperienceProjectModule (copy), FFlagBuildCheckGamePermissionsModule (copy), UseGamePermissionsModule (copy), UseChatSessionCoreModule (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), UseBuildPromptDraftModule (copy), FFlagBuildExperienceDeveloperProductContextModule (copy), UseChatPlaytestFooterModule (copy), FFlagBuildExperienceChatResourceAttachments (copy), GetPlayButtonStoreModule (copy), ReactModule (copy), ChatTypesModule (copy), FFlagBuildExperienceChatImageAttachmentsModule1 (copy), FFlagBuildExperienceAnalytics (copy), FFlagBuildExperienceAnswerFormModule (copy)
	local OnClose = p1.onClose or noop
	local NoIsOpen = p1.isOpen == nil or p1.isOpen
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetAssistantBuildStoreModule().getIsDisabled)
	local CreatorAgentResumeStoreModule = GetCreatorAgentResumeStoreModule()
	local CurrentExperienceProjectModule = GetCurrentExperienceProjectModule()
	local UniverseId = p1.universeId or CurrentExperienceProjectModule.universeId
	local PlaceId = p1.placeId or CurrentExperienceProjectModule.placeId
	local ChatPermissions = nil
	local NoCanEditOnBuild = false
	local v1 = false
	
	if FFlagBuildCheckGamePermissionsModule then
		local UseGamePermissionsModuleResult, UseGamePermissionsModuleResult2 = UseGamePermissionsModule({ universeId = UniverseId })
		ChatPermissions = UseGamePermissionsModuleResult
		NoCanEditOnBuild = not UseGamePermissionsModuleResult.canEditOnBuild
		v1 = UseGamePermissionsModuleResult2
	end
	local UseChatSessionCoreModuleResult = UseChatSessionCoreModule({
		universeId = UniverseId,
		placeId = PlaceId,
		sessionId = p1.sessionId,
		autoFocusComposer = p1.autoFocusComposer == true,
		focusComposerWhen = NoIsOpen,
		hydrateHistoryWhen = NoIsOpen,
		sendMessageWhen = not NoCanEditOnBuild
	})
	
	if FFlagBuildExperienceMonetizationNativeUIModule then
		UseBuildPromptDraftModule(UniverseId, p1.sessionId, UseChatSessionCoreModuleResult.setComposerText, UseChatSessionCoreModuleResult.sendMessage, NoIsOpen and not UseSignalStateResult, if FFlagBuildExperienceDeveloperProductContextModule then UseChatSessionCoreModuleResult else nil)
	end
	local ChatSheetPlaytestCta = UseChatPlaytestFooterModule(UseChatSessionCoreModuleResult, "ChatSheetPlaytestCta")
	
	if FFlagBuildExperienceChatResourceAttachments then
		local PlayButtonStoreModule = GetPlayButtonStoreModule()
		local UseSignalStateResult1 = SignalsReactModule.useSignalState(PlayButtonStoreModule.getPendingResourceAttachment)
		ReactModule.useEffect(function()
			-- upvalues: UseSignalStateResult1 (copy), ChatTypesModule (upval), UseChatSessionCoreModuleResult (copy), PlayButtonStoreModule (copy)
			if UseSignalStateResult1 == nil then return end
			if UseChatSessionCoreModuleResult.findComposerResourceAttachmentIndexByUri((ChatTypesModule.getResourceAttachmentUri(UseSignalStateResult1))) == nil then
				UseChatSessionCoreModuleResult.addComposerResourceAttachment(UseSignalStateResult1)
			end
			PlayButtonStoreModule.setPendingResourceAttachment(nil)
		end, {
			UseSignalStateResult1,
			UseChatSessionCoreModuleResult.addComposerResourceAttachment,
			UseChatSessionCoreModuleResult.findComposerResourceAttachmentIndexByUri
		})
	end
	if FFlagBuildExperienceChatImageAttachmentsModule1 then
		local UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseRefResult (copy), UseChatSessionCoreModuleResult (copy)
			if p1.captureToAttach == nil or UseRefResult.current == p1.captureToAttach then return end
			UseRefResult.current = p1.captureToAttach
			local Copy = table.clone(UseChatSessionCoreModuleResult.composerImages)
			
			if #Copy >= 2 then
				table.remove(Copy, 1)
			end
			table.insert(Copy, { capture = p1.captureToAttach })
			UseChatSessionCoreModuleResult.setComposerImages(Copy)
			
			if p1.onCaptureAttached ~= nil then
				p1.onCaptureAttached()
			end
		end, {
			p1.captureToAttach,
			p1.onCaptureAttached,
			UseChatSessionCoreModuleResult.composerImages,
			UseChatSessionCoreModuleResult.setComposerImages
		})
	end
	local UseResult = noop
	
	if FFlagBuildExperienceAnalytics then
		local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
		UseResult = ReactModule.useCallback(function(p2)
			-- upvalues: UseChatSessionCoreModuleResult (copy), UseStateResult2 (copy)
			UseChatSessionCoreModuleResult.setComposerText(p2)
			UseStateResult2(p2)
		end, { UseChatSessionCoreModuleResult.setComposerText })
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult (copy), UseChatSessionCoreModuleResult (copy), UseStateResult2 (copy)
			if UseStateResult == nil then return end
			UseChatSessionCoreModuleResult.setComposerText(UseStateResult)
			
			if UseChatSessionCoreModuleResult.sendMessage() then
				UseStateResult2(nil)
			end
		end, {
			UseStateResult,
			UseChatSessionCoreModuleResult.sendMessage,
			UseChatSessionCoreModuleResult.setComposerText
		})
	end
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
	
	return {
		isOpen = NoIsOpen,
		onClose = OnClose,
		snapPoints = p1.snapPoints,
		defaultSnapPointIndex = p1.defaultSnapPointIndex,
		messages = UseChatSessionCoreModuleResult.messages,
		localToolActions = UseChatSessionCoreModuleResult.localToolActions,
		answerForm = if FFlagBuildExperienceAnswerFormModule then UseChatSessionCoreModuleResult.answerForm else nil,
		onSubmitAnswerText = if FFlagBuildExperienceAnswerFormModule then UseChatSessionCoreModuleResult.submitAnswerText else nil,
		clockBinding = UseChatSessionCoreModuleResult.clockBinding,
		onPlaytest = ChatSheetPlaytestCta.onPlaytest,
		isPlaytestLoading = ChatSheetPlaytestCta.isPlaytestLoading,
		isHistoryLoading = UseChatSessionCoreModuleResult.isHistoryLoading or v1,
		scrollingFrameRef = UseChatSessionCoreModuleResult.setScrollingFrame,
		anchorScrollToInstance = UseChatSessionCoreModuleResult.anchorScrollToInstance,
		composerText = UseChatSessionCoreModuleResult.composerText,
		composerErrorText = UseChatSessionCoreModuleResult.composerErrorText,
		onComposerChanged = UseChatSessionCoreModuleResult.setComposerText,
		composerImages = UseChatSessionCoreModuleResult.composerImages,
		onComposerImagesChanged = UseChatSessionCoreModuleResult.setComposerImages,
		onRetryComposerImage = UseChatSessionCoreModuleResult.retryComposerImage,
		composerResourceAttachments = UseChatSessionCoreModuleResult.composerResourceAttachments,
		onRemoveComposerResourceAttachment = UseChatSessionCoreModuleResult.removeComposerResourceAttachmentAtIndex,
		isComposerSendBlocked = UseChatSessionCoreModuleResult.isComposerSendBlocked,
		textBoxRef = UseChatSessionCoreModuleResult.textBoxRef,
		isAssistantResponding = UseChatSessionCoreModuleResult.isAssistantResponding,
		canStopAssistantResponse = UseChatSessionCoreModuleResult.canStopAssistantResponse,
		canSendWhileResponding = UseChatSessionCoreModuleResult.canSendWhileResponding,
		isChatReadOnly = NoCanEditOnBuild,
		chatPermissions = ChatPermissions,
		onSend = UseChatSessionCoreModuleResult.sendMessage,
		onStop = UseChatSessionCoreModuleResult.stopAssistantResponse,
		onOpenChat = UseResult,
		topBarPillMenuTarget = p1.topBarPillMenuTarget
	}
end