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
local chatSheetModule = require(buildExperience.Components.ChatSheet.ChatSheet)
local getPlayButtonStoreModule = require(buildExperience.Stores.GetPlayButtonStore)
local clientLogsCollectorModule = require(buildExperience.Chat.clientLogsCollector)
local localizationProvider = localizationModule.LocalizationProvider
local localization = robloxAppLocalesModule.Localization
local fIntInGameBuildChatSheetSnapPoint = game:DefineFastInt("FIntInGameBuildChatSheetSnapPoint", 50)

local function ConnectedChatSheet() --[[ line: 23 ]]
	-- upvalues: getPlayButtonStoreModule (ref), reactModule (ref), chatSheetModule (ref), fIntInGameBuildChatSheetSnapPoint (ref)
	local var15 = getPlayButtonStoreModule()
	local var16 = var15.useResumeTarget()
	
	return reactModule.createElement(chatSheetModule, {
		defaultSnapPointIndex = 2,
		isOpen = var15.useIsActive(),
		onClose = reactModule.useCallback(function() --[[ line: 28 ]]
			-- upvalues: var15 (ref)
			var15.setIsActive(false)
		end, { var15 }),
		snapPoints = { fIntInGameBuildChatSheetSnapPoint / 100, 1 },
		universeId = if var16 then var16.universeId else nil,
		placeId = if var16 then var16.placeId else nil,
		sessionId = if var16 then var16.sessionId else nil
	})
end

local var14 = roactUtilsModule.Components.createLazyComponent(function() --[[ line: 43 ]]
	-- upvalues: ConnectedChatSheet (ref)
	return ConnectedChatSheet
end)

return function() --[[ line: 47 | named "mountChatSheet" ]]
	-- upvalues: clientLogsCollectorModule (ref), coreGuiService (ref), reactRobloxModule (ref), localization (ref), localizationService (ref), reactModule (ref), localizationProvider (ref), foundationModule (ref), var14 (ref)
	clientLogsCollectorModule.startServerLogCollection()
	local buildExperienceChatSheet = Instance.new("ScreenGui")
	buildExperienceChatSheet.Name = "BuildExperienceChatSheet"
	buildExperienceChatSheet.IgnoreGuiInset = true
	buildExperienceChatSheet.ResetOnSpawn = false
	buildExperienceChatSheet.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	buildExperienceChatSheet.Parent = coreGuiService
	local var18 = reactRobloxModule.createRoot(buildExperienceChatSheet)
	var18:render(reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, { theme = foundationModule.Enums.Theme.Dark }, { Sheet = reactModule.createElement(var14) })
	}))
	
	return var18
end