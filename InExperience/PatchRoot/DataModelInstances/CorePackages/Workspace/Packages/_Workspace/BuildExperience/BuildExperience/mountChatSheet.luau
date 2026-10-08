local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagBuildExperienceInGameShell = sharedFlagsModule.FFlagBuildExperienceInGameShell
local fFlagBuildExperienceChatResourceAttachments = sharedFlagsModule.FFlagBuildExperienceInstanceSelection and (fFlagBuildExperienceInGameShell and sharedFlagsModule.FFlagBuildExperienceChatResourceAttachments)
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local var1 = sharedFlagsModule.FFlagBuildExperienceInGameCaptureToChat and (fFlagBuildExperienceChatImageAttachmentsModule and (if sharedFlagsModule.FFlagBuildExperienceInGameCaptureToChat and fFlagBuildExperienceChatImageAttachmentsModule then require(buildExperience.utils.isImageAttachmentSupported) else nil)())
local var2 = if fFlagBuildExperienceInGameShell then require(parent.Display) else nil
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local roactUtilsModule = require(parent.RoactUtils)
local var3 = if fFlagBuildExperienceInGameShell then require(parent.SignalsReact) else nil
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local _ = require(buildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local buildModeLaunchModule = require(parent.BuildExperiencePlaytestLaunch.BuildModeLaunch)
local chatSheetModule = require(buildExperience.Components.ChatSheet.ChatSheet)
local var4 = if fFlagBuildExperienceInGameShell then require(buildExperience.Components.ChatSheet.InGameBuildShell) else nil
local var5 = if fFlagBuildExperienceChatResourceAttachments then require(buildExperience.Components.ChatSheet.InstanceSelectionProtocol) else nil
local var6 = if fFlagBuildExperienceChatResourceAttachments then require(buildExperience.Components.Library.LibraryTypes) else nil
local var7 = if fFlagBuildExperienceChatResourceAttachments then require(buildExperience.Chat.clientDataModelCollector) else nil
local useCaptureToChatModule = require(buildExperience.Components.ChatSheet.useCaptureToChat)
local var8 = if fFlagBuildExperienceInGameShell then require(buildExperience.Stores.GetAssistantBuildStore) else nil
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)
local libraryThemeProviderModule = require(buildExperience.Components.Library.LibraryThemeProvider)
local teamCreateUtilsModule = require(parent.BuildExperiencePlaytestLaunch.teamCreateUtils)
local trackBuildOpenSafetyServiceModule = require(buildExperience.utils.trackBuildOpenSafetyService)
local fFlagReportBuildUIVisibilityModule = require(buildExperience.Flags.FFlagReportBuildUIVisibility)
local clientLogsCollectorModule = require(buildExperience.Chat.clientLogsCollector)
local fFlagBuildExperienceUserMessageHapticFeedbackModule = require(buildExperience.Flags.FFlagBuildExperienceUserMessageHapticFeedback)
local localizationProvider = localizationModule.LocalizationProvider
local var9 = if fFlagBuildExperienceUserMessageHapticFeedbackModule then require(parent.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider else nil

local function _(p1)
	-- upvalues: parent (ref)
	return require(parent.InExperienceLocales).Localization.new(p1)
end

local fIntInGameBuildChatSheetSnapPoint = game:DefineFastInt("FIntInGameBuildChatSheetSnapPoint", 50)
local list = { fIntInGameBuildChatSheetSnapPoint / 100 }

local function beginInstanceSelection()
	-- upvalues: var5 (ref), var7 (ref), getPlayButtonStoreModule (ref), var6 (ref)
	var5.beginSelection(function(p1)
		-- upvalues: var7 (copy), getPlayButtonStoreModule (copy), var6 (copy)
		if p1.status ~= "selected" or p1.path == nil or p1.className == nil then return end
		local var10 = var7.resolveInstancePath(p1.path, p1.className)
		
		if var10 == nil then
			return
		end
		local var11 = getPlayButtonStoreModule()
		var11.setPendingResourceAttachment(var6.toResourceAttachment({
			path = var10,
			displayName = p1.displayName or var10,
			className = p1.className
		}))
		var11.setIsActive(true)
	end)
end

local function ConnectedChatSheet(p1)
	-- upvalues: getPlayButtonStoreModule (ref), var1 (ref), useCaptureToChatModule (ref), teamCreateUtilsModule (ref), buildModeLaunchModule (ref), fFlagReportBuildUIVisibilityModule (ref), trackBuildOpenSafetyServiceModule (ref), reactModule (ref), buildExperience (ref), chatSheetModule (ref), list (ref), fIntInGameBuildChatSheetSnapPoint (ref), fFlagBuildExperienceInGameShell (ref), var8 (ref), var2 (ref), var3 (ref), var4 (ref), fFlagBuildExperienceChatResourceAttachments (ref), beginInstanceSelection (ref)
	local var10 = getPlayButtonStoreModule()
	local var11 = var10.useIsActive()
	local var12 = if var1 then useCaptureToChatModule(function()
		-- upvalues: var10 (ref)
		var10.setIsActive(true)
	end, p1.takeCapture) else nil
	local var13 = teamCreateUtilsModule.isViewer()
	local t = {
		isNewGameTarget = false,
		universeId = game.GameId,
		placeId = game.PlaceId
	}
	local var14 = var10.useResumeTarget()
	local var15 = if var13 and var14 == nil then buildModeLaunchModule:getChatSessionId(game.PlaceId) elseif var14 then var14.sessionId else nil
	
	if fFlagReportBuildUIVisibilityModule then
		trackBuildOpenSafetyServiceModule(var11)
	end
	local createElement = reactModule.createElement
	createElement = createElement(if var13 then require(buildExperience.Components.Library.LibraryChatSheet) else chatSheetModule, {
		defaultSnapPointIndex = 1,
		isOpen = var11,
		onClose = reactModule.useCallback(function()
			-- upvalues: var10 (ref)
			var10.setIsActive(false)
		end, { var10 }),
		snapPoints = if var13 then list else { fIntInGameBuildChatSheetSnapPoint / 100 },
		topBarPillMenuTarget = if var11 and not var13 then t else nil,
		universeId = if var14 then var14.universeId else nil,
		placeId = if var14 then var14.placeId else nil,
		sessionId = var15,
		captureToAttach = if var12 ~= nil then nil else var12.captureToAttach,
		onCaptureAttached = if var12 ~= nil then nil else var12.onCaptureAttached
	})
	
	if not fFlagBuildExperienceInGameShell then
		return createElement
	end
	local displayStore = var2.GetDisplayStore(false)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		ChatSheet = createElement,
		Shell = reactModule.createElement(var4, {
			isVisible = var3.useSignalState(var8().getIsOverlayVisible),
			isLibraryMode = var13,
			onActivated = function()
				-- upvalues: var10 (ref)
				var10.setIsActive(true)
			end,
			onCaptureActivated = if var12 ~= nil then nil else var12.onCaptureActivated,
			onInsetsChanged = reactModule.useCallback(function(p2, p3, p4)
				-- upvalues: displayStore (ref)
				displayStore.setGuiInset(function(p5)
					-- upvalues: p2 (ref), p3 (ref), p4 (ref)
					return { left = p2, top = p5.top, right = p3, bottom = p4 }
				end)
			end, { displayStore }),
			onSelectionActivated = if fFlagBuildExperienceChatResourceAttachments and not var13 then beginInstanceSelection else nil
		})
	})
end

local var10 = roactUtilsModule.Components.createLazyComponent(function()
	-- upvalues: ConnectedChatSheet (ref)
	return ConnectedChatSheet
end)

return function(p1)
	-- upvalues: clientLogsCollectorModule (ref), fFlagBuildExperienceInGameShell (ref), coreGuiService (ref), reactRobloxModule (ref), localizationService (ref), parent (ref), reactModule (ref), buildExperienceCompositionStyleSheetModule (ref), var10 (ref), teamCreateUtilsModule (ref), libraryThemeProviderModule (ref), foundationModule (ref), fFlagBuildExperienceUserMessageHapticFeedbackModule (ref), var9 (ref), localizationProvider (ref)
	clientLogsCollectorModule.startServerLogCollection()
	local buildExperienceChatSheet = Instance.new("ScreenGui")
	buildExperienceChatSheet.Name = "BuildExperienceChatSheet"
	buildExperienceChatSheet.IgnoreGuiInset = true
	buildExperienceChatSheet.ResetOnSpawn = false
	
	if fFlagBuildExperienceInGameShell then
		buildExperienceChatSheet.ClipToDeviceSafeArea = false
		buildExperienceChatSheet.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
		buildExperienceChatSheet.ScreenInsets = Enum.ScreenInsets.None
	end
	buildExperienceChatSheet.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	buildExperienceChatSheet.Parent = coreGuiService
	buildExperienceChatSheet.DisplayOrder = 9
	local var11 = reactRobloxModule.createRoot(buildExperienceChatSheet)
	local var12 = require(parent.InExperienceLocales).Localization.new(localizationService.RobloxLocaleId)
	local t = {
		CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
		Sheet = reactModule.createElement(var10, p1)
	}
	local var13 = if teamCreateUtilsModule.isViewer() then reactModule.createElement(libraryThemeProviderModule, { displayOrder = 9 }, t) else reactModule.createElement(foundationModule.FoundationProvider, {
		colorMode = foundationModule.Enums.ColorMode.Dark,
		overlayGui = { DisplayOrder = 9 }
	}, t)
	
	if fFlagBuildExperienceUserMessageHapticFeedbackModule then
		var13 = reactModule.createElement(var9, nil, { FoundationProvider = var13 })
	end
	var11:render(reactModule.createElement(localizationProvider, { localization = var12 }, { ChatSheet = var13 }))
	
	return var11
end