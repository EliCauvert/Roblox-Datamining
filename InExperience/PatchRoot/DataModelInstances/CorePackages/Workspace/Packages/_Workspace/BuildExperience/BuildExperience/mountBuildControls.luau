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
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local localizationProvider = localizationModule.LocalizationProvider
local localization = robloxAppLocalesModule.Localization
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local buildControlsModule = require(buildExperience.Components.BuildControls.BuildControls)

local function ConnectedBuildControls() --[[ line: 22 ]]
	-- upvalues: reactModule (ref), localization (ref), localizationService (ref), localizationProvider (ref), foundationModule (ref), buildExperienceCompositionStyleSheetModule (ref), view (ref), buildControlsModule (ref), iconName (ref)
	return reactModule.createElement(localizationProvider, {
		localization = reactModule.useMemo(function() --[[ line: 23 ]]
			-- upvalues: localization (copy), localizationService (copy)
			return localization.new(localizationService.RobloxLocaleId)
		end, {})
	}, {
		FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Light }, {
			CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
			Anchor = reactModule.createElement(view, {
				tag = "auto-xy",
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0)
			}, {
				BuildControls = reactModule.createElement(buildControlsModule, { overflowIcon = iconName.ThreeDotsHorizontal })
			})
		})
	})
end

local var12 = roactUtilsModule.Components.createLazyComponent(function() --[[ line: 47 ]]
	-- upvalues: ConnectedBuildControls (ref)
	return ConnectedBuildControls
end)

return function() --[[ line: 51 | named "mountBuildControls" ]]
	-- upvalues: coreGuiService (ref), reactRobloxModule (ref), reactModule (ref), var12 (ref)
	local buildExperienceBuildControls = Instance.new("ScreenGui")
	buildExperienceBuildControls.Name = "BuildExperienceBuildControls"
	buildExperienceBuildControls.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets
	buildExperienceBuildControls.ResetOnSpawn = false
	buildExperienceBuildControls.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	buildExperienceBuildControls.Parent = coreGuiService
	local var14 = reactRobloxModule.createRoot(buildExperienceBuildControls)
	var14:render(reactModule.createElement(var12))
	
	return var14
end