local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local rendering = settings().Rendering
local savedQualityLevelPropertyChangedSignal = userGameSettingsService:GetPropertyChangedSignal("SavedQualityLevel")
local parent = script.Parent.Parent.Parent
local toggleEntryModule = require(script.Parent.ToggleEntry)
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local sliderEntryModule = require(script.Parent.SliderEntry)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local var1 = #Enum.SavedQualitySetting:GetEnumItems() - 1

local function _(p1, p2, p3, p4, p5)
	return math.clamp(math.floor(p4 + (p1 - p2) * (p5 - p4) / (p3 - p2)), p4, p5)
end

local graphicsQualityEntry = roact.PureComponent:extend("GraphicsQualityEntry")
graphicsQualityEntry.validateProps = t.strictInterface({
	LayoutOrder = t.integer,
	canCaptureFocus = t.optional(t.boolean),
	isMenuOpen = t.optional(t.boolean)
})

function graphicsQualityEntry.init(p1)
	-- upvalues: userGameSettingsService (ref)
	local var2 = userGameSettingsService.SavedQualityLevel == Enum.SavedQualitySetting.Automatic
	p1:setState({
		quality = if var2 then 5 else userGameSettingsService.SavedQualityLevel.Value,
		automatic = var2
	})
	
	function p5.onQualityChanged()
		-- upvalues: userGameSettingsService (copy), p1 (ref)
		local savedQualityLevel = userGameSettingsService.SavedQualityLevel
		p1:setState({
			quality = if not (savedQualityLevel == Enum.SavedQualitySetting.Automatic) then savedQualityLevel.Value else nil,
			automatic = savedQualityLevel == Enum.SavedQualitySetting.Automatic
		})
	end
	
	if var2 then
		p1:setAutomaticQualityLevel()
		
		return
	end
	p1:setManualQualityLevel(p1.state.quality)
end

function graphicsQualityEntry.setAutomaticQualityLevel(_)
	-- upvalues: userGameSettingsService (ref), rendering (ref)
	userGameSettingsService.SavedQualityLevel = Enum.SavedQualitySetting.Automatic
	rendering.QualityLevel = 0
end

function graphicsQualityEntry.setManualQualityLevel(_, p1)
	-- upvalues: var1 (ref), rendering (ref), userGameSettingsService (ref)
	local var2 = rendering:GetMaxQualityLevel() - 1
	local clampedValue = math.clamp(math.floor(1 + (p1 - 1) * (var2 - 1) / (var1 - 1)), 1, var2)
	userGameSettingsService.SavedQualityLevel = p1
	rendering.QualityLevel = clampedValue
	
	return nil
end

function graphicsQualityEntry.render(p1)
	-- upvalues: roact (ref), toggleEntryModule (ref), sendAnalyticsModule (ref), constantsModule (ref), sliderEntryModule (ref), externalEventConnectionModule (ref), savedQualityLevelPropertyChangedSignal (ref)
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 156),
		LayoutOrder = p1.props.LayoutOrder
	}, {
		Layout = roact.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		AutoToggle = roact.createElement(toggleEntryModule, {
			LayoutOrder = 1,
			labelKey = "CoreScripts.InGameMenu.GameSettings.AutoGraphicsQuality",
			checked = p1.state.automatic,
			onToggled = function()
				-- upvalues: p1 (ref), sendAnalyticsModule (copy), constantsModule (copy)
				if p1.state.automatic then
					p1:setManualQualityLevel(p1.state.quality)
				else
					p1:setAutomaticQualityLevel()
				end
				sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
			end
		}),
		Slider = roact.createElement(sliderEntryModule, {
			LayoutOrder = 2,
			labelKey = "CoreScripts.InGameMenu.GameSettings.ManualGraphicsQuality",
			min = 1,
			max = 10,
			stepInterval = 1,
			value = p1.state.quality,
			disabled = p1.state.automatic,
			valueChanged = function(p2)
				-- upvalues: p1 (ref), sendAnalyticsModule (copy), constantsModule (copy)
				p1:setManualQualityLevel(p2)
				sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
			end,
			canCaptureFocus = p1.props.canCaptureFocus,
			isMenuOpen = p1.props.isMenuOpen
		}),
		QualityListener = roact.createElement(externalEventConnectionModule, {
			event = savedQualityLevelPropertyChangedSignal,
			callback = p1.onQualityChanged
		})
	})
end

return graphicsQualityEntry