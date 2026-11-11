local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Rendering = settings().Rendering
local SavedQualityLevelPropertyChangedSignal = UserGameSettings:GetPropertyChangedSignal("SavedQualityLevel")
local Parent = script.Parent.Parent.Parent
local ToggleEntryModule = require(script.Parent.ToggleEntry)
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local SliderEntryModule = require(script.Parent.SliderEntry)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local v1 = #Enum.SavedQualitySetting:GetEnumItems() - 1

local function _(p1, p2, p3, MinValue: number, MaxValue: number): number
	return (math.clamp(math.floor(MinValue + (p1 - p2) * (MaxValue - MinValue) / (p3 - p2)), MinValue, MaxValue))
end

local GraphicsQualityEntry = Roact.PureComponent:extend("GraphicsQualityEntry")
GraphicsQualityEntry.validateProps = T.strictInterface({
	LayoutOrder = T.integer,
	canCaptureFocus = T.optional(T.boolean),
	isMenuOpen = T.optional(T.boolean)
})

function GraphicsQualityEntry.init(p1)
	-- upvalues: UserGameSettings (copy)
	local IsSavedQualityLevelMatch = UserGameSettings.SavedQualityLevel == Enum.SavedQualitySetting.Automatic
	p1:setState({
		quality = if IsSavedQualityLevelMatch then 5 else UserGameSettings.SavedQualityLevel.Value,
		automatic = IsSavedQualityLevelMatch
	})
	
	function p1.onQualityChanged()
		-- upvalues: UserGameSettings (upval), p1 (copy)
		local SavedQualityLevel = UserGameSettings.SavedQualityLevel
		p1:setState({
			quality = if SavedQualityLevel == Enum.SavedQualitySetting.Automatic then nil else SavedQualityLevel.Value or nil,
			automatic = SavedQualityLevel == Enum.SavedQualitySetting.Automatic
		})
	end
	
	if IsSavedQualityLevelMatch then
		p1:setAutomaticQualityLevel()
		
		return
	else
		p1:setManualQualityLevel(p1.state.quality)
	end
end

function GraphicsQualityEntry:setAutomaticQualityLevel()
	-- upvalues: UserGameSettings (copy), Rendering (copy)
	UserGameSettings.SavedQualityLevel = Enum.SavedQualitySetting.Automatic
	Rendering.QualityLevel = 0
end

function GraphicsQualityEntry:setManualQualityLevel(SavedQualityLevel: number)
	-- upvalues: v1 (copy), Rendering (copy), UserGameSettings (copy)
	local MaxQualityLevelDelta = Rendering:GetMaxQualityLevel() - 1
	UserGameSettings.SavedQualityLevel = SavedQualityLevel
	Rendering.QualityLevel = math.clamp(math.floor(1 + (SavedQualityLevel - 1) * (MaxQualityLevelDelta - 1) / (v1 - 1)), 1, MaxQualityLevelDelta)
	
	return nil
end

function GraphicsQualityEntry.render(p1)
	-- upvalues: Roact (copy), ToggleEntryModule (copy), SendAnalyticsModule (copy), ConstantsModule (copy), SliderEntryModule (copy), ExternalEventConnectionModule (copy), SavedQualityLevelPropertyChangedSignal (copy)
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 156),
		LayoutOrder = p1.props.LayoutOrder
	}, {
		Layout = Roact.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		AutoToggle = Roact.createElement(ToggleEntryModule, {
			LayoutOrder = 1,
			labelKey = "CoreScripts.InGameMenu.GameSettings.AutoGraphicsQuality",
			checked = p1.state.automatic,
			onToggled = function()
				-- upvalues: p1 (copy), SendAnalyticsModule (upval), ConstantsModule (upval)
				if p1.state.automatic then
					p1:setManualQualityLevel(p1.state.quality)
				else
					p1:setAutomaticQualityLevel()
				end
				SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, nil, {}, true)
			end
		}),
		Slider = Roact.createElement(SliderEntryModule, {
			LayoutOrder = 2,
			labelKey = "CoreScripts.InGameMenu.GameSettings.ManualGraphicsQuality",
			min = 1,
			max = 10,
			stepInterval = 1,
			value = p1.state.quality,
			disabled = p1.state.automatic,
			valueChanged = function(SavedQualityLevel)
				-- upvalues: p1 (copy), SendAnalyticsModule (upval), ConstantsModule (upval)
				p1:setManualQualityLevel(SavedQualityLevel)
				SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, nil, {}, true)
			end,
			canCaptureFocus = p1.props.canCaptureFocus,
			isMenuOpen = p1.props.isMenuOpen
		}),
		QualityListener = Roact.createElement(ExternalEventConnectionModule, {
			event = SavedQualityLevelPropertyChangedSignal,
			callback = p1.onQualityChanged
		})
	})
end

return GraphicsQualityEntry