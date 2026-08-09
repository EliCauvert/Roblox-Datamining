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
local buildControlsModule = require(buildExperience.Components.BuildControls.BuildControls)

local function ConnectedBuildControls() --[[ line: 21 ]]
	-- upvalues: reactModule (ref), localization (ref), localizationService (ref), localizationProvider (ref), foundationModule (ref), view (ref), buildControlsModule (ref), iconName (ref)
	return reactModule.createElement(localizationProvider, {
		localization = reactModule.useMemo(function() --[[ line: 22 ]]
			-- upvalues: localization (copy), localizationService (copy)
			return localization.new(localizationService.RobloxLocaleId)
		end, {})
	}, {
		FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, { theme = foundationModule.Enums.Theme.Light }, {
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

local var11 = roactUtilsModule.Components.createLazyComponent(function() --[[ line: 45 ]]
	-- upvalues: ConnectedBuildControls (ref)
	return ConnectedBuildControls
end)

return function() --[[ line: 49 | named "mountBuildControls" ]]
	-- upvalues: coreGuiService (ref), reactRobloxModule (ref), reactModule (ref), var11 (ref)
	local buildExperienceBuildControls = Instance.new("ScreenGui")
	buildExperienceBuildControls.Name = "BuildExperienceBuildControls"
	buildExperienceBuildControls.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets
	buildExperienceBuildControls.ResetOnSpawn = false
	buildExperienceBuildControls.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	buildExperienceBuildControls.Parent = coreGuiService
	local var13 = reactRobloxModule.createRoot(buildExperienceBuildControls)
	var13:render(reactModule.createElement(var11))
	
	return var13
end