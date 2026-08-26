local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useChatPlaytestFooterModule = require(buildExperience.Chat.useChatPlaytestFooter)
local useChatSessionCoreModule = require(buildExperience.Chat.useChatSessionCore)
local _ = require(buildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local getAssistantBuildStoreModule = require(buildExperience.Stores.GetAssistantBuildStore)
local getCreatorAgentResumeStoreModule = require(buildExperience.Stores.GetCreatorAgentResumeStore)
local getCurrentExperienceProjectModule = require(buildExperience.utils.getCurrentExperienceProject)
local _ = require(script.Parent.ChatSheetView)

local function noop() end

return function(p1)
	-- upvalues: noop (ref), getAssistantBuildStoreModule (ref), signalsReactModule (ref), getCreatorAgentResumeStoreModule (ref), getCurrentExperienceProjectModule (ref), useChatSessionCoreModule (ref), useChatPlaytestFooterModule (ref), reactModule (ref)
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
	local var6 = useChatPlaytestFooterModule(var5, "ChatSheetPlaytestCta")
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
		composerText = var5.composerText,
		composerErrorText = var5.composerErrorText,
		onComposerChanged = var5.setComposerText,
		textBoxRef = var5.textBoxRef,
		isAssistantResponding = var5.isAssistantResponding,
		canStopAssistantResponse = var5.canStopAssistantResponse,
		canSendWhileResponding = var5.canSendWhileResponding,
		onSend = var5.sendMessage,
		onStop = var5.stopAssistantResponse,
		topBarPillMenuTarget = p1.topBarPillMenuTarget
	}
end