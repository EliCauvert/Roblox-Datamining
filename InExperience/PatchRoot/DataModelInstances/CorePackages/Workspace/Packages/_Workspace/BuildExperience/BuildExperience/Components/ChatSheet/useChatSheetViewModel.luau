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
local getModelLibraryStoreModule = require(buildExperience.Stores.GetModelLibraryStore)
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)
local getCurrentExperienceProjectModule = require(buildExperience.utils.getCurrentExperienceProject)
local _ = require(script.Parent.ChatSheetView)
local fFlagBuildExperienceAnalytics = require(parent.SharedFlags).FFlagBuildExperienceAnalytics
local fFlagBuildExperienceAssetLibrary = sharedFlagsModule.FFlagBuildExperienceAssetLibrary
local var1 = if fFlagBuildExperienceAssetLibrary then require(buildExperience.Components.CaptureMode.CaptureModeProtocol) else nil

local function noop() end

return function(p1)
	-- upvalues: noop (ref), getAssistantBuildStoreModule (ref), getPlayButtonStoreModule (ref), signalsReactModule (ref), getCreatorAgentResumeStoreModule (ref), getCurrentExperienceProjectModule (ref), useChatSessionCoreModule (ref), getModelLibraryStoreModule (ref), reactModule (ref), fFlagBuildExperienceAssetLibrary (ref), useChatPlaytestFooterModule (ref), fFlagBuildExperienceAnalytics (ref), var1 (ref)
	local onClose = p1.onClose or noop
	local var2 = p1.isOpen == nil or p1.isOpen
	local var3 = getPlayButtonStoreModule()
	local var4 = signalsReactModule.useSignalState(getAssistantBuildStoreModule().getIsDisabled)
	local var5 = getCreatorAgentResumeStoreModule()
	local var6 = getCurrentExperienceProjectModule()
	local universeId = p1.universeId or var6.universeId
	local var7 = useChatSessionCoreModule({
		autoFocusComposer = false,
		universeId = universeId,
		placeId = p1.placeId or var6.placeId,
		sessionId = p1.sessionId,
		hydrateHistoryWhen = var2
	})
	local var8 = getModelLibraryStoreModule()
	local var9 = signalsReactModule.useSignalState(var8.getChatReferenceRequest)
	local var10 = reactModule.useRef(0)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var10 (ref), var7 (ref)
		if var9 == nil or var9.token <= var10.current then return end
		var10.current = var9.token
		
		if var9.action == "Remove" then
			var7.removeComposerReferenceByPath(var9.reference.path)
		else
			var7.addComposerReference(var9.reference)
		end
		if var7.textBoxRef.current ~= nil then
			var7.textBoxRef.current.focus()
		end
	end, {
		var9,
		var7.addComposerReference,
		var7.removeComposerReferenceByPath,
		var7.textBoxRef
	})
	reactModule.useLayoutEffect(function()
		-- upvalues: fFlagBuildExperienceAssetLibrary (copy), var8 (ref), var7 (ref)
		if fFlagBuildExperienceAssetLibrary then
			var8.setChatComposerState({
				composerText = var7.composerText,
				composerErrorText = var7.composerErrorText,
				onComposerChanged = var7.setComposerText,
				images = var7.composerImages,
				onImagesChanged = var7.setComposerImages,
				onRetryImage = var7.retryComposerImage,
				references = var7.composerReferences,
				onAddReference = var7.addComposerReference,
				onRemoveReference = var7.removeComposerReference,
				onRemoveReferenceByPath = var7.removeComposerReferenceByPath,
				isImageSendBlocked = var7.isComposerSendBlocked,
				textBoxRef = var7.textBoxRef,
				isAssistantResponding = var7.isAssistantResponding,
				canStopAssistantResponse = var7.canStopAssistantResponse,
				canSendWhileResponding = var7.canSendWhileResponding,
				onSend = var7.sendMessage,
				onStop = var7.stopAssistantResponse
			})
			
			return
		end
	end, {
		var8, var7.composerText, var7.composerErrorText, var7.setComposerText,
		var7.composerImages, var7.setComposerImages, var7.retryComposerImage,
		var7.composerReferences, var7.addComposerReference,
		var7.removeComposerReference, var7.removeComposerReferenceByPath,
		var7.isComposerSendBlocked, var7.textBoxRef, var7.isAssistantResponding,
		var7.canStopAssistantResponse, var7.canSendWhileResponding,
		var7.sendMessage, var7.stopAssistantResponse
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagBuildExperienceAssetLibrary (copy), var8 (ref)
		if fFlagBuildExperienceAssetLibrary then
			return function()
				-- upvalues: var8 (copy)
				var8.setChatComposerState(nil)
			end
		end
	end, { var8 })
	local var11 = useChatPlaytestFooterModule(var7, "ChatSheetPlaytestCta")
	local var12 = noop
	
	if fFlagBuildExperienceAnalytics then
		local var13, var14 = reactModule.useState(nil)
		var12 = reactModule.useCallback(function(p2)
			-- upvalues: var7 (ref), var14 (ref)
			var7.setComposerText(p2)
			var14(p2)
		end, { var7.setComposerText })
		reactModule.useEffect(function()
			-- upvalues: var13 (ref), var7 (ref), var14 (ref)
			if var13 == nil then return end
			var7.setComposerText(var13)
			
			if var7.sendMessage() then
				var14(nil)
			end
		end, { var13, var7.sendMessage, var7.setComposerText })
	end
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var4 (ref), onClose (ref)
		if var2 and var4 then
			onClose()
		end
	end, { var2, var4, onClose })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var5 (ref), universeId (ref), p1 (ref)
		if var2 then
			var5.setActiveTarget({ universeId = universeId, sessionId = p1.sessionId })
			
			return function()
				-- upvalues: var5 (copy)
				var5.setActiveTarget(nil)
			end
		end
		var5.setActiveTarget(nil)
	end, { var5, var2, universeId, p1.sessionId })
	local var15 = nil
	
	if fFlagBuildExperienceAssetLibrary then
		local var16 = var1
		var15 = reactModule.useCallback(function()
			-- upvalues: var16 (ref), var7 (ref), var3 (ref)
			var16.beginCapture(function(p2)
				-- upvalues: var7 (copy), var3 (copy)
				if p2.status == "selected" and p2.path ~= nil then
					var7.addComposerReference({
						path = p2.path,
						displayName = p2.displayName or (p2.className or p2.path),
						className = p2.className
					})
					var3.setIsActive(true)
					
					if var7.textBoxRef.current ~= nil then
						var7.textBoxRef.current.focus()
					end
				end
			end, nil, true)
		end, { var7.addComposerReference, var7.textBoxRef, var3 })
	end
	return {
		isOpen = var2,
		onClose = onClose,
		snapPoints = p1.snapPoints,
		defaultSnapPointIndex = p1.defaultSnapPointIndex,
		messages = var7.messages,
		localToolActions = var7.localToolActions,
		clockBinding = var7.clockBinding,
		onPlaytest = var11.onPlaytest,
		isPlaytestLoading = var11.isPlaytestLoading,
		isHistoryLoading = var7.isHistoryLoading,
		scrollingFrameRef = var7.setScrollingFrame,
		composerText = var7.composerText,
		composerErrorText = var7.composerErrorText,
		onComposerChanged = var7.setComposerText,
		composerImages = var7.composerImages,
		onComposerImagesChanged = var7.setComposerImages,
		onRetryComposerImage = var7.retryComposerImage,
		composerReferences = if fFlagBuildExperienceAssetLibrary then var7.composerReferences else {},
		onRemoveComposerReference = if fFlagBuildExperienceAssetLibrary then var7.removeComposerReference else nil,
		isComposerSendBlocked = var7.isComposerSendBlocked,
		textBoxRef = var7.textBoxRef,
		isAssistantResponding = var7.isAssistantResponding,
		canStopAssistantResponse = var7.canStopAssistantResponse,
		canSendWhileResponding = var7.canSendWhileResponding,
		onSend = var7.sendMessage,
		onStop = var7.stopAssistantResponse,
		onOpenChat = var12,
		onOpenCaptureMode = var15,
		topBarPillMenuTarget = p1.topBarPillMenuTarget
	}
end