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
local var14 = if fFlagBuildExperienceUserMessageHapticFeedbackModule then require(parent.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider else nil

local function _(p0)
	-- upvalues: fFlagBuildLocalization (ref), parent (ref)
	return if fFlagBuildLocalization then require(parent.InExperienceLocales).Localization.new(p0) else require(parent.RobloxAppLocales).Localization.new(p0)
end

local fIntInGameBuildChatSheetSnapPoint = game:DefineFastInt("FIntInGameBuildChatSheetSnapPoint", 50)

local function ConnectedChatSheet()
	-- upvalues: getPlayButtonStoreModule (ref), reactModule (ref), chatSheetModule (ref), fIntInGameBuildChatSheetSnapPoint (ref)
	local var18 = getPlayButtonStoreModule()
	local var19 = var18.useIsActive()
	local var20 = var18.useResumeTarget()
	
	return reactModule.createElement(chatSheetModule, {
		defaultSnapPointIndex = 1,
		isOpen = var19,
		onClose = reactModule.useCallback(function()
			-- upvalues: var18 (ref)
			var18.setIsActive(false)
		end, { var18 }),
		snapPoints = { fIntInGameBuildChatSheetSnapPoint / 100 },
		topBarPillMenuTarget = if var19 then {
			isNewGameTarget = false,
			universeId = game.GameId,
			placeId = game.PlaceId
		} else nil,
		universeId = if var20 then var20.universeId else nil,
		placeId = if var20 then var20.placeId else nil,
		sessionId = if var20 then var20.sessionId else nil
	})
end

local var17 = roactUtilsModule.Components.createLazyComponent(function()
	-- upvalues: ConnectedChatSheet (ref)
	return ConnectedChatSheet
end)

return function()
	-- upvalues: clientLogsCollectorModule (ref), coreGuiService (ref), reactRobloxModule (ref), localizationService (ref), fFlagBuildLocalization (ref), parent (ref), reactModule (ref), foundationModule (ref), buildExperienceCompositionStyleSheetModule (ref), var17 (ref), fFlagBuildExperienceUserMessageHapticFeedbackModule (ref), var14 (ref), localizationProvider (ref)
	clientLogsCollectorModule.startServerLogCollection()
	local buildExperienceChatSheet = Instance.new("ScreenGui")
	buildExperienceChatSheet.Name = "BuildExperienceChatSheet"
	buildExperienceChatSheet.IgnoreGuiInset = true
	buildExperienceChatSheet.ResetOnSpawn = false
	buildExperienceChatSheet.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	buildExperienceChatSheet.Parent = coreGuiService
	buildExperienceChatSheet.DisplayOrder = 9
	local var22 = reactRobloxModule.createRoot(buildExperienceChatSheet)
	local robloxLocaleId = localizationService.RobloxLocaleId
	local var23 = if fFlagBuildLocalization then require(parent.InExperienceLocales).Localization.new(robloxLocaleId) else require(parent.RobloxAppLocales).Localization.new(robloxLocaleId)
	local var24 = reactModule.createElement(foundationModule.FoundationProvider, {
		colorMode = foundationModule.Enums.ColorMode.Dark,
		overlayGui = { DisplayOrder = 9 }
	}, {
		CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
		Sheet = reactModule.createElement(var17)
	})
	
	if fFlagBuildExperienceUserMessageHapticFeedbackModule then
		var24 = reactModule.createElement(var14, nil, { FoundationProvider = var24 })
	end
	var22:render(reactModule.createElement(localizationProvider, { localization = var23 }, { ChatSheet = var24 }))
	
	return var22
end