local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagBuildExperienceInGameShell = sharedFlagsModule.FFlagBuildExperienceInGameShell
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
local useCaptureToChatModule = require(buildExperience.Components.ChatSheet.useCaptureToChat)
local var5 = if fFlagBuildExperienceInGameShell then require(buildExperience.Stores.GetAssistantBuildStore) else nil
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)
local teamCreateUtilsModule = require(parent.BuildExperiencePlaytestLaunch.teamCreateUtils)
local clientLogsCollectorModule = require(buildExperience.Chat.clientLogsCollector)
local fFlagBuildExperienceUserMessageHapticFeedbackModule = require(buildExperience.Flags.FFlagBuildExperienceUserMessageHapticFeedback)
local localizationProvider = localizationModule.LocalizationProvider
local var6 = if fFlagBuildExperienceUserMessageHapticFeedbackModule then require(parent.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider else nil

local function _(p1)
	-- upvalues: parent (ref)
	return require(parent.InExperienceLocales).Localization.new(p1)
end

local fIntInGameBuildChatSheetSnapPoint = game:DefineFastInt("FIntInGameBuildChatSheetSnapPoint", 50)
local list = { fIntInGameBuildChatSheetSnapPoint / 100 }

local function ConnectedChatSheet(p1)
	-- upvalues: getPlayButtonStoreModule (ref), var1 (ref), useCaptureToChatModule (ref), teamCreateUtilsModule (ref), buildModeLaunchModule (ref), reactModule (ref), buildExperience (ref), chatSheetModule (ref), list (ref), fIntInGameBuildChatSheetSnapPoint (ref), fFlagBuildExperienceInGameShell (ref), var5 (ref), var2 (ref), var3 (ref), var4 (ref)
	local var7 = getPlayButtonStoreModule()
	local var8 = var7.useIsActive()
	local var9 = if var1 then useCaptureToChatModule(function()
		-- upvalues: var7 (ref)
		var7.setIsActive(true)
	end, p1.takeCapture) else nil
	local var10 = teamCreateUtilsModule.isViewer()
	local t = {
		isNewGameTarget = false,
		universeId = game.GameId,
		placeId = game.PlaceId
	}
	local var11 = var7.useResumeTarget()
	local createElement = reactModule.createElement
	createElement = createElement(if var10 then require(buildExperience.Components.Library.LibraryChatSheet) else chatSheetModule, {
		defaultSnapPointIndex = 1,
		isOpen = var8,
		onClose = reactModule.useCallback(function()
			-- upvalues: var7 (ref)
			var7.setIsActive(false)
		end, { var7 }),
		snapPoints = if var10 then list else { fIntInGameBuildChatSheetSnapPoint / 100 },
		topBarPillMenuTarget = if var8 and not var10 then t else nil,
		universeId = if var11 then var11.universeId else nil,
		placeId = if var11 then var11.placeId else nil,
		sessionId = if var10 and var11 == nil then buildModeLaunchModule:getChatSessionId(game.PlaceId) elseif var11 then var11.sessionId else nil,
		captureToAttach = if var9 ~= nil then nil else var9.captureToAttach,
		onCaptureAttached = if var9 ~= nil then nil else var9.onCaptureAttached
	})
	
	if fFlagBuildExperienceInGameShell then
		local displayStore = var2.GetDisplayStore(false)
		
		return reactModule.createElement(reactModule.Fragment, nil, {
			ChatSheet = createElement,
			Shell = reactModule.createElement(var4, {
				isVisible = var3.useSignalState(var5().getIsOverlayVisible),
				onActivated = function()
					-- upvalues: var7 (ref)
					var7.setIsActive(true)
				end,
				onCaptureActivated = if var9 ~= nil then nil else var9.onCaptureActivated,
				onInsetsChanged = reactModule.useCallback(function(p2, p3, p4)
					-- upvalues: displayStore (ref)
					displayStore.setGuiInset(function(p5)
						-- upvalues: p2 (ref), p3 (ref), p4 (ref)
						return { left = p2, top = p5.top, right = p3, bottom = p4 }
					end)
				end, { displayStore })
			})
		})
	end
	return createElement
end

local var7 = roactUtilsModule.Components.createLazyComponent(function()
	-- upvalues: ConnectedChatSheet (ref)
	return ConnectedChatSheet
end)

return function(p1)
	-- upvalues: clientLogsCollectorModule (ref), fFlagBuildExperienceInGameShell (ref), coreGuiService (ref), reactRobloxModule (ref), localizationService (ref), parent (ref), reactModule (ref), foundationModule (ref), buildExperienceCompositionStyleSheetModule (ref), var7 (ref), fFlagBuildExperienceUserMessageHapticFeedbackModule (ref), var6 (ref), localizationProvider (ref)
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
	local var8 = reactRobloxModule.createRoot(buildExperienceChatSheet)
	local var9 = require(parent.InExperienceLocales).Localization.new(localizationService.RobloxLocaleId)
	local var10 = reactModule.createElement(foundationModule.FoundationProvider, {
		colorMode = foundationModule.Enums.ColorMode.Dark,
		overlayGui = { DisplayOrder = 9 }
	}, {
		CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
		Sheet = reactModule.createElement(var7, p1)
	})
	
	if fFlagBuildExperienceUserMessageHapticFeedbackModule then
		var10 = reactModule.createElement(var6, nil, { FoundationProvider = var10 })
	end
	var8:render(reactModule.createElement(localizationProvider, { localization = var9 }, { ChatSheet = var10 }))
	
	return var8
end