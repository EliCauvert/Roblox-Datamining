local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local _ = require(buildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local chatSheetModule = require(buildExperience.Components.ChatSheet.ChatSheet)
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)
local clientLogsCollectorModule = require(buildExperience.Chat.clientLogsCollector)
local fFlagBuildExperienceUserMessageHapticFeedbackModule = require(buildExperience.Flags.FFlagBuildExperienceUserMessageHapticFeedback)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local localizationProvider = localizationModule.LocalizationProvider
local var1 = if fFlagBuildExperienceUserMessageHapticFeedbackModule then require(parent.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider else nil

local function _(p1)
	-- upvalues: fFlagBuildLocalization (ref), parent (ref)
	return if fFlagBuildLocalization then require(parent.InExperienceLocales).Localization.new(p1) else require(parent.RobloxAppLocales).Localization.new(p1)
end

local fIntInGameBuildChatSheetSnapPoint = game:DefineFastInt("FIntInGameBuildChatSheetSnapPoint", 50)

local function ConnectedChatSheet()
	-- upvalues: getPlayButtonStoreModule (ref), reactModule (ref), chatSheetModule (ref), fIntInGameBuildChatSheetSnapPoint (ref)
	local var2 = getPlayButtonStoreModule()
	local var3 = var2.useIsActive()
	local var4 = var2.useResumeTarget()
	
	return reactModule.createElement(chatSheetModule, {
		defaultSnapPointIndex = 1,
		isOpen = var3,
		onClose = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2.setIsActive(false)
		end, { var2 }),
		snapPoints = { fIntInGameBuildChatSheetSnapPoint / 100 },
		topBarPillMenuTarget = if var3 then {
			isNewGameTarget = false,
			universeId = game.GameId,
			placeId = game.PlaceId
		} else nil,
		universeId = if var4 then var4.universeId else nil,
		placeId = if var4 then var4.placeId else nil,
		sessionId = if var4 then var4.sessionId else nil
	})
end

local var2 = roactUtilsModule.Components.createLazyComponent(function()
	-- upvalues: ConnectedChatSheet (ref)
	return ConnectedChatSheet
end)

return function()
	-- upvalues: clientLogsCollectorModule (ref), coreGuiService (ref), reactRobloxModule (ref), localizationService (ref), fFlagBuildLocalization (ref), parent (ref), reactModule (ref), foundationModule (ref), buildExperienceCompositionStyleSheetModule (ref), var2 (ref), fFlagBuildExperienceUserMessageHapticFeedbackModule (ref), var1 (ref), localizationProvider (ref)
	clientLogsCollectorModule.startServerLogCollection()
	local buildExperienceChatSheet = Instance.new("ScreenGui")
	buildExperienceChatSheet.Name = "BuildExperienceChatSheet"
	buildExperienceChatSheet.IgnoreGuiInset = true
	buildExperienceChatSheet.ResetOnSpawn = false
	buildExperienceChatSheet.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	buildExperienceChatSheet.Parent = coreGuiService
	buildExperienceChatSheet.DisplayOrder = 9
	local var3 = reactRobloxModule.createRoot(buildExperienceChatSheet)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var4 = if fFlagBuildLocalization then require(parent.InExperienceLocales).Localization.new(robloxLocaleId) else require(parent.RobloxAppLocales).Localization.new(robloxLocaleId)
	local var5 = reactModule.createElement(foundationModule.FoundationProvider, {
		colorMode = foundationModule.Enums.ColorMode.Dark,
		overlayGui = { DisplayOrder = 9 }
	}, {
		CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
		Sheet = reactModule.createElement(var2)
	})
	
	if fFlagBuildExperienceUserMessageHapticFeedbackModule then
		var5 = reactModule.createElement(var1, nil, { FoundationProvider = var5 })
	end
	var3:render(reactModule.createElement(localizationProvider, { localization = var4 }, { ChatSheet = var5 }))
	
	return var3
end