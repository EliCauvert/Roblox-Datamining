local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagBuildExperienceInGameShell = SharedFlagsModule.FFlagBuildExperienceInGameShell
local FFlagBuildExperienceInGameShell1 = SharedFlagsModule.FFlagBuildExperienceInstanceSelection and FFlagBuildExperienceInGameShell
local IsImageAttachmentSupportedModule = if SharedFlagsModule.FFlagBuildExperienceInGameCaptureToChat then require(BuildExperience.utils.isImageAttachmentSupported) else nil
local IsImageAttachmentSupportedModule1 = SharedFlagsModule.FFlagBuildExperienceInGameCaptureToChat and IsImageAttachmentSupportedModule()
local FFlagBuildExperienceInGameShellComposer = SharedFlagsModule.FFlagBuildExperienceInGameShellComposer
local DisplayModule = if FFlagBuildExperienceInGameShell then require(Parent.Display) else nil
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local SignalsReactModule = if FFlagBuildExperienceInGameShell then require(Parent.SignalsReact) else nil
local BuildExperienceCompositionStyleSheetModule = require(BuildExperience.Components.BuildExperienceCompositionStyleSheet)
local _ = require(BuildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local BuildModeLaunchModule = require(Parent.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local ChatSheetModule = require(BuildExperience.Components.ChatSheet.ChatSheet)
local InGameBuildShellModule = if FFlagBuildExperienceInGameShell then require(BuildExperience.Components.ChatSheet.InGameBuildShell) else nil
local InstanceSelectionProtocolModule = if FFlagBuildExperienceInGameShell1 then require(BuildExperience.Components.ChatSheet.InstanceSelectionProtocol) else nil
local LibraryTypesModule = if FFlagBuildExperienceInGameShell1 then require(BuildExperience.Components.Library.LibraryTypes) else nil
local ClientDataModelCollectorModule = if FFlagBuildExperienceInGameShell1 then require(BuildExperience.Chat.clientDataModelCollector) else nil
local UseCaptureToChatModule = require(BuildExperience.Components.ChatSheet.useCaptureToChat)
local GetAssistantBuildStoreModule = if FFlagBuildExperienceInGameShell then require(BuildExperience.Stores.GetAssistantBuildStore) else nil
local GetPlayButtonStoreModule = require(BuildExperience.Stores.GetPlayButtonStore)
local LibraryThemeProviderModule = require(BuildExperience.Components.Library.LibraryThemeProvider)
local TeamCreateUtilsModule = require(Parent.BuildExperiencePlaytestLaunch.teamCreateUtils)
local TrackBuildOpenSafetyServiceModule = require(BuildExperience.utils.trackBuildOpenSafetyService)
local FFlagReportBuildUIVisibilityModule = require(BuildExperience.Flags.FFlagReportBuildUIVisibility)
local ClientLogsCollectorModule = require(BuildExperience.Chat.clientLogsCollector)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local LocalizationProvider = LocalizationModule.LocalizationProvider
local AppInteractionFeedbackProvider = require(Parent.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider

local function _(p1)
	-- upvalues: Parent (copy)
	return require(Parent.InExperienceLocales).Localization.new(p1)
end

local FIntInGameBuildChatSheetSnapPoint: number = game:DefineFastInt("FIntInGameBuildChatSheetSnapPoint", 50)
local list = { FIntInGameBuildChatSheetSnapPoint / 100 }
local list1 = { FIntInGameBuildChatSheetSnapPoint / 100, 1 }

local function beginInstanceSelection(p1, p2)
	-- upvalues: InstanceSelectionProtocolModule (copy), GetPlayButtonStoreModule (copy), ClientDataModelCollectorModule (copy), LibraryTypesModule (copy)
	return InstanceSelectionProtocolModule.beginSelection(function(p3)
		-- upvalues: p2 (copy), GetPlayButtonStoreModule (upval), ClientDataModelCollectorModule (upval), LibraryTypesModule (upval), p1 (copy)
		if p3.status == "selected" and p3.path ~= nil and p3.className ~= nil then
			local ResolveInstancePathResult = ClientDataModelCollectorModule.resolveInstancePath(p3.path, p3.className)
			
			if ResolveInstancePathResult ~= nil then
				local v1 = GetPlayButtonStoreModule()
				v1.setPendingResourceAttachment(LibraryTypesModule.toResourceAttachment({
					path = ResolveInstancePathResult,
					displayName = p3.displayName or ResolveInstancePathResult,
					className = p3.className
				}))
				
				if p1 ~= false then
					v1.setIsActive(true)
				end
				return
			elseif p2 == true then
				GetPlayButtonStoreModule().setIsActive(true)
			end
			return
		elseif p2 == true then
			GetPlayButtonStoreModule().setIsActive(true)
		end
	end)
end

local function ComposerPreviewShell(p1)
	-- upvalues: GetPlayButtonStoreModule (copy), SignalsReactModule (copy), LocalizationModule (copy), LocalizationStringsModule (copy)
	local PlayButtonStoreModule = GetPlayButtonStoreModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(PlayButtonStoreModule.getComposerDraftText)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(PlayButtonStoreModule.getComposerAttachmentCount)
	local UseLocalizationResult = LocalizationModule.Hooks.useLocalization({
		attachmentCount = if UseSignalStateResult1 == 1 then LocalizationStringsModule.CHAT_COMPOSER_ATTACHMENT_COUNT_SINGULAR else {
			LocalizationStringsModule.CHAT_COMPOSER_ATTACHMENT_COUNT,
			count = UseSignalStateResult1
		},
		placeholder = LocalizationStringsModule.CHAT_COMPOSER_PLACEHOLDER
	})
	
	return p1.renderShell(if p1.isLibraryMode then nil else {
		draftText = UseSignalStateResult,
		attachmentCount = UseSignalStateResult1,
		attachmentCountText = UseLocalizationResult.attachmentCount,
		placeholder = UseLocalizationResult.placeholder
	})
end

local function ConnectedChatSheet(p1)
	-- upvalues: GetPlayButtonStoreModule (copy), IsImageAttachmentSupportedModule1 (copy), UseCaptureToChatModule (copy), TeamCreateUtilsModule (copy), BuildModeLaunchModule (copy), FFlagReportBuildUIVisibilityModule (copy), TrackBuildOpenSafetyServiceModule (copy), ReactModule (copy), FFlagBuildExperienceInGameShellComposer (copy), FFlagBuildExperienceInGameShell1 (copy), InstanceSelectionProtocolModule (copy), ClientDataModelCollectorModule (copy), LibraryTypesModule (copy), BuildExperience (copy), ChatSheetModule (copy), list (copy), list1 (copy), FFlagBuildExperienceInGameShell (copy), GetAssistantBuildStoreModule (copy), DisplayModule (copy), SignalsReactModule (copy), InGameBuildShellModule (copy), beginInstanceSelection (copy), ComposerPreviewShell (copy)
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
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: PlayButtonStoreModule (copy)
		PlayButtonStoreModule.setIsActive(false)
	end, { PlayButtonStoreModule })
	local v1 = false
	local OnComposerActivated: (() -> ())? = nil
	local OnComposerSelectionActivated: (() -> ())? = nil
	local OnComposerSelectionActivated1: (() -> ())? = nil
	
	if FFlagBuildExperienceInGameShellComposer then
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		ReactModule.useEffect(function()
			-- upvalues: UseIsActiveResult (copy), UseStateResult2 (copy)
			if not UseIsActiveResult then
				UseStateResult2(false)
			end
		end, { UseIsActiveResult })
		v1 = UseStateResult
		
		OnComposerActivated = function()
			-- upvalues: UseStateResult2 (copy), PlayButtonStoreModule (copy)
			UseStateResult2(true)
			PlayButtonStoreModule.setIsActive(true)
		end
		
		if FFlagBuildExperienceInGameShell1 and not IsViewer then
			OnComposerSelectionActivated = function()
				-- upvalues: PlayButtonStoreModule (copy), InstanceSelectionProtocolModule (upval), GetPlayButtonStoreModule (upval), ClientDataModelCollectorModule (upval), LibraryTypesModule (upval)
				PlayButtonStoreModule.setIsActive(false)
				local v2 = true
				local v3 = true
				
				if not InstanceSelectionProtocolModule.beginSelection(function(p2)
					-- upvalues: v2 (copy), GetPlayButtonStoreModule (upval), ClientDataModelCollectorModule (upval), LibraryTypesModule (upval), v3 (copy)
					if p2.status == "selected" and p2.path ~= nil and p2.className ~= nil then
						local ResolveInstancePathResult = ClientDataModelCollectorModule.resolveInstancePath(p2.path, p2.className)
						
						if ResolveInstancePathResult ~= nil then
							local v4 = GetPlayButtonStoreModule()
							v4.setPendingResourceAttachment(LibraryTypesModule.toResourceAttachment({
								path = ResolveInstancePathResult,
								displayName = p2.displayName or ResolveInstancePathResult,
								className = p2.className
							}))
							
							if v3 ~= false then
								v4.setIsActive(true)
							end
							return
						elseif v2 == true then
							GetPlayButtonStoreModule().setIsActive(true)
						end
						return
					elseif v2 == true then
						GetPlayButtonStoreModule().setIsActive(true)
					end
				end) then
					PlayButtonStoreModule.setIsActive(true)
				end
			end
			
			OnComposerSelectionActivated1 = function()
				-- upvalues: InstanceSelectionProtocolModule (upval), GetPlayButtonStoreModule (upval), ClientDataModelCollectorModule (upval), LibraryTypesModule (upval)
				local Enabled = false
				local Enabled1 = false
				local _ = InstanceSelectionProtocolModule.beginSelection(function(p2)
					-- upvalues: Enabled (copy), GetPlayButtonStoreModule (upval), ClientDataModelCollectorModule (upval), LibraryTypesModule (upval), Enabled1 (copy)
					if p2.status == "selected" and p2.path ~= nil and p2.className ~= nil then
						local ResolveInstancePathResult = ClientDataModelCollectorModule.resolveInstancePath(p2.path, p2.className)
						
						if ResolveInstancePathResult ~= nil then
							local v2 = GetPlayButtonStoreModule()
							v2.setPendingResourceAttachment(LibraryTypesModule.toResourceAttachment({
								path = ResolveInstancePathResult,
								displayName = p2.displayName or ResolveInstancePathResult,
								className = p2.className
							}))
							
							if Enabled1 ~= false then
								v2.setIsActive(true)
							end
							return
						elseif Enabled == true then
							GetPlayButtonStoreModule().setIsActive(true)
						end
						return
					elseif Enabled == true then
						GetPlayButtonStoreModule().setIsActive(true)
					end
				end)
			end
		end
	end
	local Element = ReactModule.createElement(if IsViewer then require(BuildExperience.Components.Library.LibraryChatSheet) else ChatSheetModule, {
		defaultSnapPointIndex = 1,
		isOpen = UseIsActiveResult,
		onClose = UseResult,
		snapPoints = if IsViewer then list else list1,
		topBarPillMenuTarget = if UseIsActiveResult and not IsViewer then config else nil,
		universeId = if UseResumeTargetResult then UseResumeTargetResult.universeId else nil,
		placeId = if UseResumeTargetResult then UseResumeTargetResult.placeId else nil,
		sessionId = ChatSessionId,
		captureToAttach = if UseCaptureToChatModuleResult == nil then nil else UseCaptureToChatModuleResult.captureToAttach,
		onCaptureAttached = if UseCaptureToChatModuleResult == nil then nil else UseCaptureToChatModuleResult.onCaptureAttached,
		onComposerTextChanged = if FFlagBuildExperienceInGameShellComposer then PlayButtonStoreModule.setComposerDraftText else nil,
		onComposerAttachmentCountChanged = if FFlagBuildExperienceInGameShellComposer then PlayButtonStoreModule.setComposerAttachmentCount else nil,
		autoFocusComposer = if FFlagBuildExperienceInGameShellComposer then v1 else nil,
		onComposerSelectionActivated = OnComposerSelectionActivated,
		onComposerCaptureActivated = if FFlagBuildExperienceInGameShellComposer and UseCaptureToChatModuleResult ~= nil and not IsViewer then UseCaptureToChatModuleResult.onAutoAttachCaptureActivated else nil
	})
	
	if FFlagBuildExperienceInGameShell then
		local DisplayStore = DisplayModule.GetDisplayStore(false)
		local UseSignalStateResult = SignalsReactModule.useSignalState(GetAssistantBuildStoreModule().getIsOverlayVisible)
		local UseResult1 = ReactModule.useCallback(function(Left, Right, Bottom)
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
		end, { DisplayStore })
		
		local function renderShell(Composer)
			-- upvalues: ReactModule (upval), InGameBuildShellModule (upval), UseSignalStateResult (copy), IsViewer (copy), PlayButtonStoreModule (copy), OnComposerActivated (ref), FFlagBuildExperienceInGameShellComposer (upval), UseCaptureToChatModuleResult (ref), OnComposerSelectionActivated1 (ref), UseResult1 (copy), FFlagBuildExperienceInGameShell1 (upval), beginInstanceSelection (upval)
			return ReactModule.createElement(InGameBuildShellModule, {
				composer = Composer,
				isVisible = UseSignalStateResult,
				isLibraryMode = IsViewer,
				onActivated = function()
					-- upvalues: PlayButtonStoreModule (upval)
					PlayButtonStoreModule.setIsActive(true)
				end,
				onComposerActivated = OnComposerActivated,
				onComposerCaptureActivated = if FFlagBuildExperienceInGameShellComposer and UseCaptureToChatModuleResult ~= nil then UseCaptureToChatModuleResult.onAutoAttachCaptureActivated else nil,
				onComposerSelectionActivated = OnComposerSelectionActivated1,
				onCaptureActivated = if UseCaptureToChatModuleResult == nil then nil else UseCaptureToChatModuleResult.onCaptureActivated,
				onInsetsChanged = UseResult1,
				onSelectionActivated = if FFlagBuildExperienceInGameShell1 and not IsViewer then beginInstanceSelection else nil
			})
		end
		
		return ReactModule.createElement(ReactModule.Fragment, nil, {
			ChatSheet = Element,
			Shell = if FFlagBuildExperienceInGameShellComposer then ReactModule.createElement(ComposerPreviewShell, { isLibraryMode = IsViewer, renderShell = renderShell }) else renderShell(nil)
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
	-- upvalues: ClientLogsCollectorModule (copy), FFlagBuildExperienceInGameShell (copy), CoreGui (copy), ReactRobloxModule (copy), LocalizationService (copy), Parent (copy), ReactModule (copy), BuildExperienceCompositionStyleSheetModule (copy), LazyComponent (copy), TeamCreateUtilsModule (copy), LibraryThemeProviderModule (copy), FoundationModule (copy), AppInteractionFeedbackProvider (copy), LocalizationProvider (copy)
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
	local config = {
		CompositionStyleSheet = ReactModule.createElement(BuildExperienceCompositionStyleSheetModule),
		Sheet = ReactModule.createElement(LazyComponent, p1)
	}
	Root:render(ReactModule.createElement(LocalizationProvider, {
		localization = require(Parent.InExperienceLocales).Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		ChatSheet = ReactModule.createElement(AppInteractionFeedbackProvider, nil, {
			FoundationProvider = if TeamCreateUtilsModule.isViewer() then ReactModule.createElement(LibraryThemeProviderModule, { displayOrder = 9 }, config) else ReactModule.createElement(FoundationModule.FoundationProvider, {
				colorMode = FoundationModule.Enums.ColorMode.Dark,
				overlayGui = { DisplayOrder = 9 }
			}, config)
		})
	}))
	
	return Root
end