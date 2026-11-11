local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local BuildExperienceCompositionStyleSheetModule = require(BuildExperience.Components.BuildExperienceCompositionStyleSheet)
local _ = require(BuildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local ChatSheetModule = require(BuildExperience.Components.ChatSheet.ChatSheet)
local GetPlayButtonStoreModule = require(BuildExperience.Stores.GetPlayButtonStore)
local ClientLogsCollectorModule = require(BuildExperience.Chat.clientLogsCollector)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.RobloxAppLocales).Localization
local FIntInGameBuildChatSheetSnapPoint = game:DefineFastInt("FIntInGameBuildChatSheetSnapPoint", 50)

local function ConnectedChatSheet()
	-- upvalues: GetPlayButtonStoreModule (copy), ReactModule (copy), ChatSheetModule (copy), FIntInGameBuildChatSheetSnapPoint (copy)
	local PlayButtonStoreModule = GetPlayButtonStoreModule()
	local UseIsActiveResult = PlayButtonStoreModule.useIsActive()
	local config = {
		isNewGameTarget = false,
		universeId = game.GameId,
		placeId = game.PlaceId
	}
	local UseResumeTargetResult = PlayButtonStoreModule.useResumeTarget()
	
	return ReactModule.createElement(ChatSheetModule, {
		defaultSnapPointIndex = 1,
		isOpen = UseIsActiveResult,
		onClose = ReactModule.useCallback(function()
			-- upvalues: PlayButtonStoreModule (copy)
			PlayButtonStoreModule.setIsActive(false)
		end, { PlayButtonStoreModule }),
		snapPoints = { FIntInGameBuildChatSheetSnapPoint / 100 },
		topBarPillMenuTarget = if UseIsActiveResult then config else nil,
		universeId = if UseResumeTargetResult then UseResumeTargetResult.universeId else nil,
		placeId = if UseResumeTargetResult then UseResumeTargetResult.placeId else nil,
		sessionId = if UseResumeTargetResult then UseResumeTargetResult.sessionId else nil
	})
end

local LazyComponent = require(Parent.RoactUtils).Components.createLazyComponent(function()
	-- upvalues: ConnectedChatSheet (copy)
	return ConnectedChatSheet
end)

return function()
	-- upvalues: ClientLogsCollectorModule (copy), CoreGui (copy), ReactRobloxModule (copy), Localization (copy), LocalizationService (copy), ReactModule (copy), LocalizationProvider (copy), FoundationModule (copy), BuildExperienceCompositionStyleSheetModule (copy), LazyComponent (copy)
	ClientLogsCollectorModule.startServerLogCollection()
	local BuildExperienceChatSheet = Instance.new("ScreenGui")
	BuildExperienceChatSheet.Name = "BuildExperienceChatSheet"
	BuildExperienceChatSheet.IgnoreGuiInset = true
	BuildExperienceChatSheet.ResetOnSpawn = false
	BuildExperienceChatSheet.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	BuildExperienceChatSheet.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(BuildExperienceChatSheet)
	Root:render(ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		FoundationProvider = ReactModule.createElement(FoundationModule.FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, {
			CompositionStyleSheet = ReactModule.createElement(BuildExperienceCompositionStyleSheetModule),
			Sheet = ReactModule.createElement(LazyComponent)
		})
	}))
	
	return Root
end