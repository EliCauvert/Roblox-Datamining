local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local chatTypesModule = require(buildExperience.Chat.chatTypes)
local useChatPlaytestFooterModule = require(buildExperience.Chat.useChatPlaytestFooter)
local useBuildPromptDraftModule = require(buildExperience.Chat.useBuildPromptDraft)
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local useChatSessionCoreModule = require(buildExperience.Chat.useChatSessionCore)
local _ = require(buildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local getAssistantBuildStoreModule = require(buildExperience.Stores.GetAssistantBuildStore)
local getCreatorAgentResumeStoreModule = require(buildExperience.Stores.GetCreatorAgentResumeStore)
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)
local getCurrentExperienceProjectModule = require(buildExperience.utils.getCurrentExperienceProject)
local _ = require(script.Parent.ChatSheetView)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagBuildExperienceAnalytics = sharedFlagsModule.FFlagBuildExperienceAnalytics
local fFlagBuildExperienceChatResourceAttachments = sharedFlagsModule.FFlagBuildExperienceInstanceSelection and sharedFlagsModule.FFlagBuildExperienceChatResourceAttachments
local fFlagBuildExperienceChatImageAttachments = sharedFlagsModule.FFlagBuildExperienceInGameCaptureToChat and require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)

local function noop() end

return function(p1)
	-- upvalues: noop (ref), getAssistantBuildStoreModule (ref), signalsReactModule (ref), getCreatorAgentResumeStoreModule (ref), getCurrentExperienceProjectModule (ref), useChatSessionCoreModule (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), useBuildPromptDraftModule (ref), useChatPlaytestFooterModule (ref), fFlagBuildExperienceChatResourceAttachments (ref), getPlayButtonStoreModule (ref), reactModule (ref), chatTypesModule (ref), fFlagBuildExperienceChatImageAttachments (ref), fFlagBuildExperienceAnalytics (ref)
	local onClose = p1.onClose or noop
	local var1 = p1.isOpen == nil or p1.isOpen
	local var2 = signalsReactModule.useSignalState(getAssistantBuildStoreModule().getIsDisabled)
	local var3 = getCreatorAgentResumeStoreModule()
	local var4 = getCurrentExperienceProjectModule()
	local universeId = p1.universeId or var4.universeId
	local var5 = useChatSessionCoreModule({
		universeId = universeId,
		placeId = p1.placeId or var4.placeId,
		sessionId = p1.sessionId,
		autoFocusComposer = p1.autoFocusComposer == true,
		focusComposerWhen = var1,
		hydrateHistoryWhen = var1
	})
	
	if fFlagBuildExperienceMonetizationNativeUIModule then
		useBuildPromptDraftModule(universeId, p1.sessionId, var5.setComposerText, var5.sendMessage, var1 and not var2)
	end
	local var6 = useChatPlaytestFooterModule(var5, "ChatSheetPlaytestCta")
	
	if fFlagBuildExperienceChatResourceAttachments then
		local var7 = getPlayButtonStoreModule()
		local var8 = signalsReactModule.useSignalState(var7.getPendingResourceAttachment)
		reactModule.useEffect(function()
			-- upvalues: var8 (ref), chatTypesModule (copy), var5 (ref), var7 (ref)
			if var8 == nil then return end
			if var5.findComposerResourceAttachmentIndexByUri(chatTypesModule.getResourceAttachmentUri(var8)) == nil then
				var5.addComposerResourceAttachment(var8)
			end
			var7.setPendingResourceAttachment(nil)
		end, {
			var8,
			var5.addComposerResourceAttachment,
			var5.findComposerResourceAttachmentIndexByUri
		})
	end
	if fFlagBuildExperienceChatImageAttachments then
		local var9 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var9 (ref), var5 (ref)
			if p1.captureToAttach == nil or var9.current == p1.captureToAttach then return end
			var9.current = p1.captureToAttach
			local cloned = table.clone(var5.composerImages)
			
			if #cloned >= 2 then
				table.remove(cloned, 1)
			end
			table.insert(cloned, { capture = p1.captureToAttach })
			var5.setComposerImages(cloned)
			
			if p1.onCaptureAttached ~= nil then
				p1.onCaptureAttached()
			end
		end, {
			p1.captureToAttach,
			p1.onCaptureAttached,
			var5.composerImages,
			var5.setComposerImages
		})
	end
	local var10 = noop
	
	if fFlagBuildExperienceAnalytics then
		local var11, var12 = reactModule.useState(nil)
		var10 = reactModule.useCallback(function(p2)
			-- upvalues: var5 (ref), var12 (ref)
			var5.setComposerText(p2)
			var12(p2)
		end, { var5.setComposerText })
		reactModule.useEffect(function()
			-- upvalues: var11 (ref), var5 (ref), var12 (ref)
			if var11 == nil then return end
			var5.setComposerText(var11)
			
			if var5.sendMessage() then
				var12(nil)
			end
		end, { var11, var5.sendMessage, var5.setComposerText })
	end
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), onClose (ref)
		if var1 and var2 then
			onClose()
		end
	end, { var1, var2, onClose })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref), universeId (ref), p1 (ref)
		if var1 then
			var3.setActiveTarget({ universeId = universeId, sessionId = p1.sessionId })
			
			return function()
				-- upvalues: var3 (copy)
				var3.setActiveTarget(nil)
			end
		end
		var3.setActiveTarget(nil)
	end, { var3, var1, universeId, p1.sessionId })
	
	return {
		isOpen = var1,
		onClose = onClose,
		snapPoints = p1.snapPoints,
		defaultSnapPointIndex = p1.defaultSnapPointIndex,
		messages = var5.messages,
		localToolActions = var5.localToolActions,
		clockBinding = var5.clockBinding,
		onPlaytest = var6.onPlaytest,
		isPlaytestLoading = var6.isPlaytestLoading,
		isHistoryLoading = var5.isHistoryLoading,
		scrollingFrameRef = var5.setScrollingFrame,
		anchorScrollToInstance = var5.anchorScrollToInstance,
		composerText = var5.composerText,
		composerErrorText = var5.composerErrorText,
		onComposerChanged = var5.setComposerText,
		composerImages = var5.composerImages,
		onComposerImagesChanged = var5.setComposerImages,
		onRetryComposerImage = var5.retryComposerImage,
		composerResourceAttachments = var5.composerResourceAttachments,
		onRemoveComposerResourceAttachment = var5.removeComposerResourceAttachmentAtIndex,
		isComposerSendBlocked = var5.isComposerSendBlocked,
		textBoxRef = var5.textBoxRef,
		isAssistantResponding = var5.isAssistantResponding,
		canStopAssistantResponse = var5.canStopAssistantResponse,
		canSendWhileResponding = var5.canSendWhileResponding,
		onSend = var5.sendMessage,
		onStop = var5.stopAssistantResponse,
		onOpenChat = var10,
		topBarPillMenuTarget = p1.topBarPillMenuTarget
	}
end