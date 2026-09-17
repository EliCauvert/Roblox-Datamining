local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local fFlagBuildExperienceInGameShell = require(parent.SharedFlags).FFlagBuildExperienceInGameShell
local var1 = if fFlagBuildExperienceInGameShell then require(parent.Display) else nil
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local roactUtilsModule = require(parent.RoactUtils)
local var2 = if fFlagBuildExperienceInGameShell then require(parent.SignalsReact) else nil
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local _ = require(buildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local chatSheetModule = require(buildExperience.Components.ChatSheet.ChatSheet)
local var3 = if fFlagBuildExperienceInGameShell then require(buildExperience.Components.ChatSheet.InGameBuildShell) else nil
local var4 = if fFlagBuildExperienceInGameShell then require(buildExperience.Stores.GetAssistantBuildStore) else nil
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)
local clientLogsCollectorModule = require(buildExperience.Chat.clientLogsCollector)
local fFlagBuildExperienceUserMessageHapticFeedbackModule = require(buildExperience.Flags.FFlagBuildExperienceUserMessageHapticFeedback)
local localizationProvider = localizationModule.LocalizationProvider
local var5 = if fFlagBuildExperienceUserMessageHapticFeedbackModule then require(parent.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider else nil

local function _(p1)
	-- upvalues: parent (ref)
	return require(parent.InExperienceLocales).Localization.new(p1)
end

local fIntInGameBuildChatSheetSnapPoint = game:DefineFastInt("FIntInGameBuildChatSheetSnapPoint", 50)

local function ConnectedChatSheet()
	-- upvalues: getPlayButtonStoreModule (ref), reactModule (ref), chatSheetModule (ref), fIntInGameBuildChatSheetSnapPoint (ref), fFlagBuildExperienceInGameShell (ref), var4 (ref), var1 (ref), var2 (ref), var3 (ref)
	local var6 = getPlayButtonStoreModule()
	local var7 = var6.useIsActive()
	local var8 = var6.useResumeTarget()
	local var9 = reactModule.createElement(chatSheetModule, {
		defaultSnapPointIndex = 1,
		isOpen = var7,
		onClose = reactModule.useCallback(function()
			-- upvalues: var6 (ref)
			var6.setIsActive(false)
		end, { var6 }),
		snapPoints = { fIntInGameBuildChatSheetSnapPoint / 100 },
		topBarPillMenuTarget = if var7 then {
			isNewGameTarget = false,
			universeId = game.GameId,
			placeId = game.PlaceId
		} else nil,
		universeId = if var8 then var8.universeId else nil,
		placeId = if var8 then var8.placeId else nil,
		sessionId = if var8 then var8.sessionId else nil
	})
	
	if fFlagBuildExperienceInGameShell then
		local displayStore = var1.GetDisplayStore(false)
		
		return reactModule.createElement(reactModule.Fragment, nil, {
			ChatSheet = var9,
			Shell = reactModule.createElement(var3, {
				isVisible = var2.useSignalState(var4().getIsOverlayVisible),
				onActivated = function()
					-- upvalues: var6 (ref)
					var6.setIsActive(true)
				end,
				onInsetsChanged = reactModule.useCallback(function(p1, p2, p3)
					-- upvalues: displayStore (ref)
					displayStore.setGuiInset(function(p4)
						-- upvalues: p1 (ref), p2 (ref), p3 (ref)
						return { left = p1, top = p4.top, right = p2, bottom = p3 }
					end)
				end, { displayStore })
			})
		})
	end
	return var9
end

local var6 = roactUtilsModule.Components.createLazyComponent(function()
	-- upvalues: ConnectedChatSheet (ref)
	return ConnectedChatSheet
end)

return function()
	-- upvalues: clientLogsCollectorModule (ref), fFlagBuildExperienceInGameShell (ref), coreGuiService (ref), reactRobloxModule (ref), localizationService (ref), parent (ref), reactModule (ref), foundationModule (ref), buildExperienceCompositionStyleSheetModule (ref), var6 (ref), fFlagBuildExperienceUserMessageHapticFeedbackModule (ref), var5 (ref), localizationProvider (ref)
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
	local var7 = reactRobloxModule.createRoot(buildExperienceChatSheet)
	local var8 = require(parent.InExperienceLocales).Localization.new(localizationService.RobloxLocaleId)
	local var9 = reactModule.createElement(foundationModule.FoundationProvider, {
		colorMode = foundationModule.Enums.ColorMode.Dark,
		overlayGui = { DisplayOrder = 9 }
	}, {
		CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
		Sheet = reactModule.createElement(var6)
	})
	
	if fFlagBuildExperienceUserMessageHapticFeedbackModule then
		var9 = reactModule.createElement(var5, nil, { FoundationProvider = var9 })
	end
	var7:render(reactModule.createElement(localizationProvider, { localization = var8 }, { ChatSheet = var9 }))
	
	return var7
end