local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseChatPlaytestFooterModule = require(BuildExperience.Chat.useChatPlaytestFooter)
local UseChatSessionCoreModule = require(BuildExperience.Chat.useChatSessionCore)
local _ = require(BuildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local GetAssistantBuildStoreModule = require(BuildExperience.Stores.GetAssistantBuildStore)
local GetCreatorAgentResumeStoreModule = require(BuildExperience.Stores.GetCreatorAgentResumeStore)
local GetCurrentExperienceProjectModule = require(BuildExperience.utils.getCurrentExperienceProject)
local _ = require(script.Parent.ChatSheetView)

local function noop() end

return function(p1)
	-- upvalues: noop (copy), GetAssistantBuildStoreModule (copy), SignalsReactModule (copy), GetCreatorAgentResumeStoreModule (copy), GetCurrentExperienceProjectModule (copy), UseChatSessionCoreModule (copy), UseChatPlaytestFooterModule (copy), ReactModule (copy)
	local OnClose = p1.onClose or noop
	local NoIsOpen = p1.isOpen == nil or p1.isOpen
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetAssistantBuildStoreModule().getIsDisabled)
	local CreatorAgentResumeStoreModule = GetCreatorAgentResumeStoreModule()
	local CurrentExperienceProjectModule = GetCurrentExperienceProjectModule()
	local UniverseId = p1.universeId or CurrentExperienceProjectModule.universeId
	local UseChatSessionCoreModuleResult = UseChatSessionCoreModule({
		autoFocusComposer = false,
		universeId = UniverseId,
		placeId = p1.placeId or CurrentExperienceProjectModule.placeId,
		sessionId = p1.sessionId,
		hydrateHistoryWhen = NoIsOpen
	})
	local ChatSheetPlaytestCta = UseChatPlaytestFooterModule(UseChatSessionCoreModuleResult, "ChatSheetPlaytestCta")
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
		clockBinding = UseChatSessionCoreModuleResult.clockBinding,
		onPlaytest = ChatSheetPlaytestCta.onPlaytest,
		isPlaytestLoading = ChatSheetPlaytestCta.isPlaytestLoading,
		scrollingFrameRef = UseChatSessionCoreModuleResult.setScrollingFrame,
		composerText = UseChatSessionCoreModuleResult.composerText,
		composerErrorText = UseChatSessionCoreModuleResult.composerErrorText,
		onComposerChanged = UseChatSessionCoreModuleResult.setComposerText,
		textBoxRef = UseChatSessionCoreModuleResult.textBoxRef,
		isAssistantResponding = UseChatSessionCoreModuleResult.isAssistantResponding,
		canStopAssistantResponse = UseChatSessionCoreModuleResult.canStopAssistantResponse,
		onSend = UseChatSessionCoreModuleResult.sendMessage,
		onStop = UseChatSessionCoreModuleResult.stopAssistantResponse,
		topBarPillMenuTarget = p1.topBarPillMenuTarget
	}
end