local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local robloxAppLocalesModule = require(parent.RobloxAppLocales)
local roactUtilsModule = require(parent.RoactUtils)
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local _ = require(buildExperience.Components.BuildPillMenu.BuildPillMenuPortal)
local chatSheetModule = require(buildExperience.Components.ChatSheet.ChatSheet)
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)
local clientLogsCollectorModule = require(buildExperience.Chat.clientLogsCollector)
local localizationProvider = localizationModule.LocalizationProvider
local localization = robloxAppLocalesModule.Localization
local fIntInGameBuildChatSheetSnapPoint = game:DefineFastInt("FIntInGameBuildChatSheetSnapPoint", 50)

local function ConnectedChatSheet() --[[ line: 31 ]]
	-- upvalues: getPlayButtonStoreModule (ref), reactModule (ref), chatSheetModule (ref), fIntInGameBuildChatSheetSnapPoint (ref)
	local var16 = getPlayButtonStoreModule()
	local var17 = var16.useIsActive()
	local var18 = var16.useResumeTarget()
	
	return reactModule.createElement(chatSheetModule, {
		defaultSnapPointIndex = 1,
		isOpen = var17,
		onClose = reactModule.useCallback(function() --[[ line: 41 ]]
			-- upvalues: var16 (ref)
			var16.setIsActive(false)
		end, { var16 }),
		snapPoints = { fIntInGameBuildChatSheetSnapPoint / 100 },
		topBarPillMenuTarget = if var17 then {
			isNewGameTarget = false,
			universeId = game.GameId,
			placeId = game.PlaceId
		} else nil,
		universeId = if var18 then var18.universeId else nil,
		placeId = if var18 then var18.placeId else nil,
		sessionId = if var18 then var18.sessionId else nil
	})
end

local var15 = roactUtilsModule.Components.createLazyComponent(function() --[[ line: 57 ]]
	-- upvalues: ConnectedChatSheet (ref)
	return ConnectedChatSheet
end)

return function() --[[ line: 61 | named "mountChatSheet" ]]
	-- upvalues: clientLogsCollectorModule (ref), coreGuiService (ref), reactRobloxModule (ref), localization (ref), localizationService (ref), reactModule (ref), localizationProvider (ref), foundationModule (ref), buildExperienceCompositionStyleSheetModule (ref), var15 (ref)
	clientLogsCollectorModule.startServerLogCollection()
	local buildExperienceChatSheet = Instance.new("ScreenGui")
	buildExperienceChatSheet.Name = "BuildExperienceChatSheet"
	buildExperienceChatSheet.IgnoreGuiInset = true
	buildExperienceChatSheet.ResetOnSpawn = false
	buildExperienceChatSheet.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	buildExperienceChatSheet.Parent = coreGuiService
	buildExperienceChatSheet.DisplayOrder = 9
	local var20 = reactRobloxModule.createRoot(buildExperienceChatSheet)
	var20:render(reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, {
			theme = foundationModule.Enums.Theme.Dark,
			overlayGui = { DisplayOrder = 9 }
		}, {
			CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
			Sheet = reactModule.createElement(var15)
		})
	}))
	
	return var20
end