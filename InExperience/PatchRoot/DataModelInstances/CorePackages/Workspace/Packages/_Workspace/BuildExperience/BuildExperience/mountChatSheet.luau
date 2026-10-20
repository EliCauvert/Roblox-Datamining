local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagBuildExperienceInGameShell = SharedFlagsModule.FFlagBuildExperienceInGameShell
local FFlagBuildExperienceChatResourceAttachments = SharedFlagsModule.FFlagBuildExperienceInstanceSelection and (FFlagBuildExperienceInGameShell and SharedFlagsModule.FFlagBuildExperienceChatResourceAttachments)
local FFlagBuildExperienceChatImageAttachmentsModule = require(BuildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local IsImageAttachmentSupportedModule = if SharedFlagsModule.FFlagBuildExperienceInGameCaptureToChat and FFlagBuildExperienceChatImageAttachmentsModule then require(BuildExperience.utils.isImageAttachmentSupported) else nil
local IsImageAttachmentSupportedModule1 = SharedFlagsModule.FFlagBuildExperienceInGameCaptureToChat and (FFlagBuildExperienceChatImageAttachmentsModule and IsImageAttachmentSupportedModule())
local DisplayModule = if FFlagBuildExperienceInGameShell then require(Parent.Display) else nil
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local SignalsReactModule = if FFlagBuildExperienceInGameShell then require(Parent.SignalsReact) else nil
local BuildExperienceCompositionStyleSheetModule = require(BuildExperience.Components.BuildExperienceCompositionStyleSheet)
local _ = require(BuildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local BuildModeLaunchModule = require(Parent.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local ChatSheetModule = require(BuildExperience.Components.ChatSheet.ChatSheet)
local InGameBuildShellModule = if FFlagBuildExperienceInGameShell then require(BuildExperience.Components.ChatSheet.InGameBuildShell) else nil
local InstanceSelectionProtocolModule = if FFlagBuildExperienceChatResourceAttachments then require(BuildExperience.Components.ChatSheet.InstanceSelectionProtocol) else nil
local LibraryTypesModule = if FFlagBuildExperienceChatResourceAttachments then require(BuildExperience.Components.Library.LibraryTypes) else nil
local ClientDataModelCollectorModule = if FFlagBuildExperienceChatResourceAttachments then require(BuildExperience.Chat.clientDataModelCollector) else nil
local UseCaptureToChatModule = require(BuildExperience.Components.ChatSheet.useCaptureToChat)
local GetAssistantBuildStoreModule = if FFlagBuildExperienceInGameShell then require(BuildExperience.Stores.GetAssistantBuildStore) else nil
local GetPlayButtonStoreModule = require(BuildExperience.Stores.GetPlayButtonStore)
local LibraryThemeProviderModule = require(BuildExperience.Components.Library.LibraryThemeProvider)
local TeamCreateUtilsModule = require(Parent.BuildExperiencePlaytestLaunch.teamCreateUtils)
local TrackBuildOpenSafetyServiceModule = require(BuildExperience.utils.trackBuildOpenSafetyService)
local FFlagReportBuildUIVisibilityModule = require(BuildExperience.Flags.FFlagReportBuildUIVisibility)
local ClientLogsCollectorModule = require(BuildExperience.Chat.clientLogsCollector)
local FFlagBuildExperienceUserMessageHapticFeedbackModule = require(BuildExperience.Flags.FFlagBuildExperienceUserMessageHapticFeedback)
local FFlagBuildExperienceChatSheetReversedContentModule = require(BuildExperience.Flags.FFlagBuildExperienceChatSheetReversedContent)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local AppInteractionFeedbackProvider = if FFlagBuildExperienceUserMessageHapticFeedbackModule then require(Parent.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider else nil

local function _(p1)
	-- upvalues: Parent (copy)
	return require(Parent.InExperienceLocales).Localization.new(p1)
end

local FIntInGameBuildChatSheetSnapPoint: number = game:DefineFastInt("FIntInGameBuildChatSheetSnapPoint", 50)
local list = { FIntInGameBuildChatSheetSnapPoint / 100 }
local list1 = { FIntInGameBuildChatSheetSnapPoint / 100, 1 }

local function beginInstanceSelection()
	-- upvalues: InstanceSelectionProtocolModule (copy), ClientDataModelCollectorModule (copy), GetPlayButtonStoreModule (copy), LibraryTypesModule (copy)
	InstanceSelectionProtocolModule.beginSelection(function(p1)
		-- upvalues: ClientDataModelCollectorModule (upval), GetPlayButtonStoreModule (upval), LibraryTypesModule (upval)
		if p1.status ~= "selected" or p1.path == nil or p1.className == nil then return end
		local ResolveInstancePathResult = ClientDataModelCollectorModule.resolveInstancePath(p1.path, p1.className)
		
		if ResolveInstancePathResult ~= nil then
			local PlayButtonStoreModule = GetPlayButtonStoreModule()
			PlayButtonStoreModule.setPendingResourceAttachment(LibraryTypesModule.toResourceAttachment({
				path = ResolveInstancePathResult,
				displayName = p1.displayName or ResolveInstancePathResult,
				className = p1.className
			}))
			PlayButtonStoreModule.setIsActive(true)
			
			return
		end
	end)
end

local function ConnectedChatSheet(p1)
	-- upvalues: GetPlayButtonStoreModule (copy), IsImageAttachmentSupportedModule1 (copy), UseCaptureToChatModule (copy), TeamCreateUtilsModule (copy), BuildModeLaunchModule (copy), FFlagReportBuildUIVisibilityModule (copy), TrackBuildOpenSafetyServiceModule (copy), ReactModule (copy), BuildExperience (copy), ChatSheetModule (copy), list (copy), FFlagBuildExperienceChatSheetReversedContentModule (copy), list1 (copy), FIntInGameBuildChatSheetSnapPoint (copy), FFlagBuildExperienceInGameShell (copy), GetAssistantBuildStoreModule (copy), DisplayModule (copy), SignalsReactModule (copy), InGameBuildShellModule (copy), FFlagBuildExperienceChatResourceAttachments (copy), beginInstanceSelection (copy)
	local PlayButtonStoreModule = GetPlayButtonStoreModule()
	local UseIsActiveResult = PlayButtonStoreModule.useIsActive()
	local UseCaptureToChatModuleResult = if IsImageAttachmentSupportedModule1 then UseCaptureToChatModule(function()
		-- upvalues: PlayButtonStoreModule (copy)
		PlayButtonStoreModule.setIsActive(true)
	end, p1.takeCapture) else nil
	local IsViewer = TeamCreateUtilsModule.isViewer()
	local config = {
		isNewGameTarget = false,
		universeId = game.GameId,
		placeId = game.PlaceId
	}
	local UseResumeTargetResult = PlayButtonStoreModule.useResumeTarget()
	local ChatSessionId = if IsViewer and UseResumeTargetResult == nil then BuildModeLaunchModule:getChatSessionId(game.PlaceId) elseif UseResumeTargetResult then UseResumeTargetResult.sessionId else nil
	
	if FFlagReportBuildUIVisibilityModule then
		TrackBuildOpenSafetyServiceModule(UseIsActiveResult)
	end
	local Element = ReactModule.createElement(if IsViewer then require(BuildExperience.Components.Library.LibraryChatSheet) else ChatSheetModule, {
		defaultSnapPointIndex = 1,
		isOpen = UseIsActiveResult,
		onClose = ReactModule.useCallback(function()
			-- upvalues: PlayButtonStoreModule (copy)
			PlayButtonStoreModule.setIsActive(false)
		end, { PlayButtonStoreModule }),
		snapPoints = if IsViewer then list elseif FFlagBuildExperienceChatSheetReversedContentModule then list1 else { FIntInGameBuildChatSheetSnapPoint / 100 },
		topBarPillMenuTarget = if UseIsActiveResult and not IsViewer then config else nil,
		universeId = if UseResumeTargetResult then UseResumeTargetResult.universeId else nil,
		placeId = if UseResumeTargetResult then UseResumeTargetResult.placeId else nil,
		sessionId = ChatSessionId,
		captureToAttach = if UseCaptureToChatModuleResult == nil then nil else UseCaptureToChatModuleResult.captureToAttach,
		onCaptureAttached = if UseCaptureToChatModuleResult == nil then nil else UseCaptureToChatModuleResult.onCaptureAttached
	})
	
	if FFlagBuildExperienceInGameShell then
		local DisplayStore = DisplayModule.GetDisplayStore(false)
		
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			ChatSheet = Element,
			Shell = ReactModule.createElement(InGameBuildShellModule, {
				isVisible = SignalsReactModule.useSignalState(GetAssistantBuildStoreModule().getIsOverlayVisible),
				isLibraryMode = IsViewer,
				onActivated = function()
					-- upvalues: PlayButtonStoreModule (copy)
					PlayButtonStoreModule.setIsActive(true)
				end,
				onCaptureActivated = if UseCaptureToChatModuleResult == nil then nil else UseCaptureToChatModuleResult.onCaptureActivated,
				onInsetsChanged = ReactModule.useCallback(function(Left, Right, Bottom)
					-- upvalues: DisplayStore (copy)
					DisplayStore.setGuiInset(function(p2)
						-- upvalues: Left (copy), Right (copy), Bottom (copy)
						return {
							left = Left,
							top = p2.top,
							right = Right,
							bottom = Bottom
						}
					end)
				end, { DisplayStore }),
				onSelectionActivated = if FFlagBuildExperienceChatResourceAttachments and not IsViewer then beginInstanceSelection else nil
			})
		})
	else
		return Element
	end
end

local LazyComponent = require(Parent.RoactUtils).Components.createLazyComponent(function()
	-- upvalues: ConnectedChatSheet (copy)
	return ConnectedChatSheet
end)

return function(p1)
	-- upvalues: ClientLogsCollectorModule (copy), FFlagBuildExperienceInGameShell (copy), CoreGui (copy), ReactRobloxModule (copy), LocalizationService (copy), Parent (copy), ReactModule (copy), BuildExperienceCompositionStyleSheetModule (copy), LazyComponent (copy), TeamCreateUtilsModule (copy), LibraryThemeProviderModule (copy), FoundationModule (copy), FFlagBuildExperienceUserMessageHapticFeedbackModule (copy), AppInteractionFeedbackProvider (copy), LocalizationProvider (copy)
	ClientLogsCollectorModule.startServerLogCollection()
	local BuildExperienceChatSheet = Instance.new("ScreenGui")
	BuildExperienceChatSheet.Name = "BuildExperienceChatSheet"
	BuildExperienceChatSheet.IgnoreGuiInset = true
	BuildExperienceChatSheet.ResetOnSpawn = false
	
	if FFlagBuildExperienceInGameShell then
		BuildExperienceChatSheet.ClipToDeviceSafeArea = false
		BuildExperienceChatSheet.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
		BuildExperienceChatSheet.ScreenInsets = Enum.ScreenInsets.None
	end
	BuildExperienceChatSheet.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	BuildExperienceChatSheet.Parent = CoreGui
	BuildExperienceChatSheet.DisplayOrder = 9
	local Root = ReactRobloxModule.createRoot(BuildExperienceChatSheet)
	local NewResult = require(Parent.InExperienceLocales).Localization.new(LocalizationService.RobloxLocaleId)
	local config = {
		CompositionStyleSheet = ReactModule.createElement(BuildExperienceCompositionStyleSheetModule),
		Sheet = ReactModule.createElement(LazyComponent, p1)
	}
	local Element = if TeamCreateUtilsModule.isViewer() then ReactModule.createElement(LibraryThemeProviderModule, { displayOrder = 9 }, config) else ReactModule.createElement(FoundationModule.FoundationProvider, {
		colorMode = FoundationModule.Enums.ColorMode.Dark,
		overlayGui = { DisplayOrder = 9 }
	}, config)
	
	if FFlagBuildExperienceUserMessageHapticFeedbackModule then
		Element = ReactModule.createElement(AppInteractionFeedbackProvider, nil, { FoundationProvider = Element })
	end
	Root:render(ReactModule.createElement(LocalizationProvider, { localization = NewResult }, { ChatSheet = Element }))
	
	return Root
end