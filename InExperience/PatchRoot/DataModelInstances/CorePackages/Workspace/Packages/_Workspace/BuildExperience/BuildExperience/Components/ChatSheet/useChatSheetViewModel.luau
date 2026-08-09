local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local useChatPlaytestFooterModule = require(buildExperience.Chat.useChatPlaytestFooter)
local useChatSessionCoreModule = require(buildExperience.Chat.useChatSessionCore)
local getCreatorAgentResumeStoreModule = require(buildExperience.Stores.GetCreatorAgentResumeStore)
local getCurrentExperienceProjectModule = require(buildExperience.utils.getCurrentExperienceProject)
local _ = require(script.Parent.ChatSheetView)

local function noop() --[[ line: 26 ]] end

return function(p0) --[[ line: 28 | named "useChatSheetViewModel" ]]
	-- upvalues: noop (ref), getCreatorAgentResumeStoreModule (ref), getCurrentExperienceProjectModule (ref), useChatSessionCoreModule (ref), useChatPlaytestFooterModule (ref), reactModule (ref)
	local onClose = p0.onClose or noop
	local var8 = p0.isOpen == nil or p0.isOpen
	local var9 = getCreatorAgentResumeStoreModule()
	local var10 = getCurrentExperienceProjectModule()
	local universeId = p0.universeId or var10.universeId
	local var12 = useChatSessionCoreModule({
		autoFocusComposer = false,
		universeId = universeId,
		placeId = p0.placeId or var10.placeId,
		sessionId = p0.sessionId,
		hydrateHistoryWhen = var8
	})
	local var13 = useChatPlaytestFooterModule(var12, "ChatSheetPlaytestCta")
	reactModule.useEffect(function() --[[ line: 45 ]]
		-- upvalues: var8 (ref), var9 (ref), universeId (ref), p0 (ref)
		if var8 then
			var9.setActiveTarget({ universeId = universeId, sessionId = p0.sessionId })
			
			return function() --[[ line: 54 ]]
				-- upvalues: var9 (copy)
				var9.setActiveTarget(nil)
			end
		end
		var9.setActiveTarget(nil)
	end, { var9, var8, universeId, p0.sessionId })
	
	return {
		isOpen = var8,
		onClose = onClose,
		snapPoints = p0.snapPoints,
		defaultSnapPointIndex = p0.defaultSnapPointIndex,
		messages = var12.messages,
		clockBinding = var12.clockBinding,
		onPlaytest = var13.onPlaytest,
		isPlaytestLoading = var13.isPlaytestLoading,
		scrollingFrameRef = var12.setScrollingFrame,
		composerText = var12.composerText,
		composerErrorText = var12.composerErrorText,
		onComposerChanged = var12.setComposerText,
		textBoxRef = var12.textBoxRef,
		isAssistantResponding = var12.isAssistantResponding,
		onSend = var12.sendMessage,
		onStop = var12.stopAssistantResponse
	}
end