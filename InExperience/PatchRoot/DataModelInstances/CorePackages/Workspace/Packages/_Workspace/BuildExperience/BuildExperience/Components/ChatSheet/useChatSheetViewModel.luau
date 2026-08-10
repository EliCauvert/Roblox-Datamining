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

local function noop() --[[ line: 29 ]] end

return function(p0) --[[ line: 31 | named "useChatSheetViewModel" ]]
	-- upvalues: noop (ref), getAssistantBuildStoreModule (ref), signalsReactModule (ref), getCreatorAgentResumeStoreModule (ref), getCurrentExperienceProjectModule (ref), useChatSessionCoreModule (ref), useChatPlaytestFooterModule (ref), reactModule (ref)
	local onClose = p0.onClose or noop
	local var10 = p0.isOpen == nil or p0.isOpen
	local var11 = signalsReactModule.useSignalState(getAssistantBuildStoreModule().getIsDisabled)
	local var12 = getCreatorAgentResumeStoreModule()
	local var13 = getCurrentExperienceProjectModule()
	local universeId = p0.universeId or var13.universeId
	local var15 = useChatSessionCoreModule({
		autoFocusComposer = false,
		universeId = universeId,
		placeId = p0.placeId or var13.placeId,
		sessionId = p0.sessionId,
		hydrateHistoryWhen = var10
	})
	local var16 = useChatPlaytestFooterModule(var15, "ChatSheetPlaytestCta")
	reactModule.useEffect(function() --[[ line: 50 ]]
		-- upvalues: var10 (ref), var11 (ref), onClose (ref)
		if var10 and var11 then
			onClose()
		end
	end, { var10, var11, onClose })
	reactModule.useEffect(function() --[[ line: 56 ]]
		-- upvalues: var10 (ref), var12 (ref), universeId (ref), p0 (ref)
		if var10 then
			var12.setActiveTarget({ universeId = universeId, sessionId = p0.sessionId })
			
			return function() --[[ line: 65 ]]
				-- upvalues: var12 (copy)
				var12.setActiveTarget(nil)
			end
		end
		var12.setActiveTarget(nil)
	end, { var12, var10, universeId, p0.sessionId })
	
	return {
		isOpen = var10,
		onClose = onClose,
		snapPoints = p0.snapPoints,
		defaultSnapPointIndex = p0.defaultSnapPointIndex,
		messages = var15.messages,
		localToolActions = var15.localToolActions,
		clockBinding = var15.clockBinding,
		onPlaytest = var16.onPlaytest,
		isPlaytestLoading = var16.isPlaytestLoading,
		isHistoryLoading = var15.isHistoryLoading,
		scrollingFrameRef = var15.setScrollingFrame,
		composerText = var15.composerText,
		composerErrorText = var15.composerErrorText,
		onComposerChanged = var15.setComposerText,
		textBoxRef = var15.textBoxRef,
		isAssistantResponding = var15.isAssistantResponding,
		canStopAssistantResponse = var15.canStopAssistantResponse,
		canSendWhileResponding = var15.canSendWhileResponding,
		onSend = var15.sendMessage,
		onStop = var15.stopAssistantResponse,
		topBarPillMenuTarget = p0.topBarPillMenuTarget
	}
end