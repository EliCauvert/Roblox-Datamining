local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local useChatPlaytestFooterModule = require(buildExperience.Chat.useChatPlaytestFooter)
local useChatSessionCoreModule = require(buildExperience.Chat.useChatSessionCore)
local _ = require(buildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local getAssistantBuildStoreModule = require(buildExperience.Stores.GetAssistantBuildStore)
local getCreatorAgentResumeStoreModule = require(buildExperience.Stores.GetCreatorAgentResumeStore)
local getLibraryStoreModule = require(buildExperience.Stores.GetLibraryStore)
local getCurrentExperienceProjectModule = require(buildExperience.utils.getCurrentExperienceProject)
local _ = require(script.Parent.ChatSheetView)
local fFlagBuildExperienceAnalytics = require(parent.SharedFlags).FFlagBuildExperienceAnalytics
local fFlagBuildExperienceLibrary = sharedFlagsModule.FFlagBuildExperienceLibrary

local function noop() end

return function(p1)
	-- upvalues: noop (ref), getAssistantBuildStoreModule (ref), signalsReactModule (ref), getCreatorAgentResumeStoreModule (ref), getCurrentExperienceProjectModule (ref), useChatSessionCoreModule (ref), fFlagBuildExperienceLibrary (ref), getLibraryStoreModule (ref), reactModule (ref), useChatPlaytestFooterModule (ref), fFlagBuildExperienceAnalytics (ref)
	local onClose = p1.onClose or noop
	local var1 = p1.isOpen == nil or p1.isOpen
	local var2 = signalsReactModule.useSignalState(getAssistantBuildStoreModule().getIsDisabled)
	local var3 = getCreatorAgentResumeStoreModule()
	local var4 = getCurrentExperienceProjectModule()
	local universeId = p1.universeId or var4.universeId
	local var5 = useChatSessionCoreModule({
		autoFocusComposer = false,
		universeId = universeId,
		placeId = p1.placeId or var4.placeId,
		sessionId = p1.sessionId,
		hydrateHistoryWhen = var1
	})
	
	if fFlagBuildExperienceLibrary then
		local var6 = getLibraryStoreModule()
		local var7 = signalsReactModule.useSignalState(var6.getChatReferenceRequest)
		local var8 = reactModule.useRef(0)
		reactModule.useEffect(function()
			-- upvalues: var7 (ref), var8 (ref), var5 (ref)
			if var7 == nil or var7.token <= var8.current then return end
			var8.current = var7.token
			
			if var7.action == "Remove" then
				var5.removeComposerReferenceByPath(var7.reference.path)
			else
				var5.addComposerReference(var7.reference)
			end
			if var5.textBoxRef.current ~= nil then
				var5.textBoxRef.current.focus()
			end
		end, {
			var7,
			var5.addComposerReference,
			var5.removeComposerReferenceByPath,
			var5.textBoxRef
		})
		reactModule.useLayoutEffect(function()
			-- upvalues: fFlagBuildExperienceLibrary (copy), var6 (ref), var5 (ref)
			if fFlagBuildExperienceLibrary then
				var6.setChatComposerState({
					composerText = var5.composerText,
					composerErrorText = var5.composerErrorText,
					onComposerChanged = var5.setComposerText,
					images = var5.composerImages,
					onImagesChanged = var5.setComposerImages,
					onRetryImage = var5.retryComposerImage,
					references = var5.composerReferences,
					onAddReference = var5.addComposerReference,
					onRemoveReference = var5.removeComposerReference,
					onRemoveReferenceByPath = var5.removeComposerReferenceByPath,
					isImageSendBlocked = var5.isComposerSendBlocked,
					textBoxRef = var5.textBoxRef,
					isAssistantResponding = var5.isAssistantResponding,
					canStopAssistantResponse = var5.canStopAssistantResponse,
					canSendWhileResponding = var5.canSendWhileResponding,
					onSend = var5.sendMessage,
					onStop = var5.stopAssistantResponse
				})
				
				return
			end
		end, {
			var6, var5.composerText, var5.composerErrorText, var5.setComposerText,
			var5.composerImages, var5.setComposerImages, var5.retryComposerImage,
			var5.composerReferences, var5.addComposerReference,
			var5.removeComposerReference, var5.removeComposerReferenceByPath,
			var5.isComposerSendBlocked, var5.textBoxRef, var5.isAssistantResponding,
			var5.canStopAssistantResponse, var5.canSendWhileResponding,
			var5.sendMessage, var5.stopAssistantResponse
		})
		reactModule.useEffect(function()
			-- upvalues: fFlagBuildExperienceLibrary (copy), var6 (ref)
			if fFlagBuildExperienceLibrary then
				return function()
					-- upvalues: var6 (copy)
					var6.setChatComposerState(nil)
				end
			end
		end, { var6 })
	end
	local var9 = useChatPlaytestFooterModule(var5, "ChatSheetPlaytestCta")
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
		onPlaytest = var9.onPlaytest,
		isPlaytestLoading = var9.isPlaytestLoading,
		isHistoryLoading = var5.isHistoryLoading,
		scrollingFrameRef = var5.setScrollingFrame,
		composerText = var5.composerText,
		composerErrorText = var5.composerErrorText,
		onComposerChanged = var5.setComposerText,
		composerImages = var5.composerImages,
		onComposerImagesChanged = var5.setComposerImages,
		onRetryComposerImage = var5.retryComposerImage,
		composerReferences = if fFlagBuildExperienceLibrary then var5.composerReferences else {},
		onRemoveComposerReference = if fFlagBuildExperienceLibrary then var5.removeComposerReference else nil,
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