local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useChatPlaytestFooterModule = require(buildExperience.Chat.useChatPlaytestFooter)
local useChatSessionCoreModule = require(buildExperience.Chat.useChatSessionCore)
local _ = require(buildExperience.Components.ChatSheet.ChatSheetView)
local _ = require(buildExperience.Components.ChatSheet.useChatSheetViewModel)
local getAssistantBuildStoreModule = require(buildExperience.Stores.GetAssistantBuildStore)
local getCreatorAgentResumeStoreModule = require(buildExperience.Stores.GetCreatorAgentResumeStore)
local getLibraryStoreModule = require(buildExperience.Stores.GetLibraryStore)
local getCurrentExperienceProjectModule = require(buildExperience.utils.getCurrentExperienceProject)
local useLibraryChatComposerModule = require(script.Parent.useLibraryChatComposer)
local chatTypesModule = require(buildExperience.Chat.chatTypes)

local function noop() end

return function(p1)
	-- upvalues: noop (ref), signalsReactModule (ref), getAssistantBuildStoreModule (ref), getCreatorAgentResumeStoreModule (ref), getCurrentExperienceProjectModule (ref), useChatSessionCoreModule (ref), getLibraryStoreModule (ref), useChatPlaytestFooterModule (ref), useLibraryChatComposerModule (ref), reactModule (ref), chatTypesModule (ref), foundationModule (ref)
	local onClose = p1.onClose or noop
	local var1 = p1.isOpen == nil or p1.isOpen
	local var2 = signalsReactModule.useSignalState(getAssistantBuildStoreModule().getIsDisabled)
	local var3 = getCreatorAgentResumeStoreModule()
	local var4 = getCurrentExperienceProjectModule()
	local universeId = p1.universeId or var4.universeId
	local var5 = useChatSessionCoreModule({
		autoFocusComposer = false,
		isLibraryChat = true,
		universeId = universeId,
		placeId = p1.placeId or var4.placeId,
		sessionId = p1.sessionId,
		hydrateHistoryWhen = var1,
		onPromptFailure = getLibraryStoreModule().reportPromptFailure
	})
	local var6 = useChatPlaytestFooterModule(var5, "ChatSheetPlaytestCta")
	local var7 = useLibraryChatComposerModule(var5, var1)
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
	local composerResourceAttachments = var5.composerResourceAttachments
	local removeComposerResourceAttachmentAtIndex = var5.removeComposerResourceAttachmentAtIndex
	local sendMessage = var5.sendMessage
	
	return {
		tracksExternalComposerText = true,
		allowsComposerTypingWhileResponding = true,
		reservesHandleSpace = true,
		isOpen = var1,
		onClose = onClose,
		sheetComponent = foundationModule.Sheet,
		snapPoints = p1.snapPoints,
		defaultSnapPointIndex = p1.defaultSnapPointIndex,
		messages = var5.messages,
		localToolActions = var5.localToolActions,
		clockBinding = var5.clockBinding,
		onPlaytest = var6.onPlaytest,
		isPlaytestLoading = var6.isPlaytestLoading,
		isHistoryLoading = var5.isHistoryLoading,
		scrollingFrameRef = var5.setScrollingFrame,
		composerText = var5.composerText,
		composerErrorText = var5.composerErrorText,
		onComposerChanged = var5.setComposerText,
		composerImages = var5.composerImages,
		onComposerImagesChanged = var5.setComposerImages,
		onRetryComposerImage = var5.retryComposerImage,
		composerResourceAttachments = var5.composerResourceAttachments,
		onRemoveComposerResourceAttachment = reactModule.useCallback(function(p2)
			-- upvalues: composerResourceAttachments (ref), removeComposerResourceAttachmentAtIndex (ref), getLibraryStoreModule (copy), chatTypesModule (copy)
			local var8 = composerResourceAttachments[p2]
			removeComposerResourceAttachmentAtIndex(p2)
			
			if var8 ~= nil then
				getLibraryStoreModule().reportChipEvent("Removed", { chatTypesModule.getResourceAttachmentUri(var8) })
			end
		end, {
			composerResourceAttachments,
			removeComposerResourceAttachmentAtIndex
		}),
		isComposerSendBlocked = var7,
		textBoxRef = var5.textBoxRef,
		isAssistantResponding = var5.isAssistantResponding,
		canStopAssistantResponse = var5.canStopAssistantResponse,
		canSendWhileResponding = var5.canSendWhileResponding,
		onSend = reactModule.useCallback(function(p2)
			-- upvalues: composerResourceAttachments (ref), chatTypesModule (copy), sendMessage (ref), getLibraryStoreModule (copy)
			local t = {}
			
			for i, v in composerResourceAttachments do
				table.insert(t, chatTypesModule.getResourceAttachmentUri(v))
			end
			local var8 = sendMessage(p2)
			
			if var8 and #t > 0 then
				getLibraryStoreModule().reportChipEvent("Sent", t)
			end
			return var8
		end, { composerResourceAttachments, sendMessage }),
		onStop = var5.stopAssistantResponse,
		onOpenChat = noop
	}
end