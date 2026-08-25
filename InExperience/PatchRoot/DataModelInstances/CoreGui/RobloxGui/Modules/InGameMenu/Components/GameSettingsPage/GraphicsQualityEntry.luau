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
local var8 = #Enum.SavedQualitySetting:GetEnumItems() - 1

local function _(p0, p1, p2, p3, p4)
	return math.clamp(math.floor(p3 + (p0 - p1) * (p4 - p3) / (p2 - p1)), p3, p4)
end

local graphicsQualityEntry = roact.PureComponent:extend("GraphicsQualityEntry")
graphicsQualityEntry.validateProps = t.strictInterface({
	LayoutOrder = t.integer,
	canCaptureFocus = t.optional(t.boolean),
	isMenuOpen = t.optional(t.boolean)
})

function graphicsQualityEntry.init(p5)
	-- upvalues: userGameSettingsService (ref)
	local var10 = userGameSettingsService.SavedQualityLevel == Enum.SavedQualitySetting.Automatic
	p5:setState({
		quality = if var10 then 5 else userGameSettingsService.SavedQualityLevel.Value,
		automatic = var10
	})
	
	function p5.onQualityChanged()
		-- upvalues: userGameSettingsService (copy), p5 (ref)
		local savedQualityLevel = userGameSettingsService.SavedQualityLevel
		p5:setState({
			quality = if not (savedQualityLevel == Enum.SavedQualitySetting.Automatic) then savedQualityLevel.Value else nil,
			automatic = savedQualityLevel == Enum.SavedQualitySetting.Automatic
		})
	end
	
	if var10 then
		p5:setAutomaticQualityLevel()
		
		return
	end
	p5:setManualQualityLevel(p5.state.quality)
end

function graphicsQualityEntry.setAutomaticQualityLevel(_)
	-- upvalues: userGameSettingsService (ref), rendering (ref)
	userGameSettingsService.SavedQualityLevel = Enum.SavedQualitySetting.Automatic
	rendering.QualityLevel = 0
end

function graphicsQualityEntry.setManualQualityLevel(_, p6)
	-- upvalues: var8 (ref), rendering (ref), userGameSettingsService (ref)
	local var11 = rendering:GetMaxQualityLevel() - 1
	local clampedValue = math.clamp(math.floor(1 + (p6 - 1) * (var11 - 1) / (var8 - 1)), 1, var11)
	userGameSettingsService.SavedQualityLevel = p6
	rendering.QualityLevel = clampedValue
	
	return nil
end

function graphicsQualityEntry.render(p7)
	-- upvalues: roact (ref), toggleEntryModule (ref), sendAnalyticsModule (ref), constantsModule (ref), sliderEntryModule (ref), externalEventConnectionModule (ref), savedQualityLevelPropertyChangedSignal (ref)
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 156),
		LayoutOrder = p7.props.LayoutOrder
	}, {
		Layout = roact.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		AutoToggle = roact.createElement(toggleEntryModule, {
			LayoutOrder = 1,
			labelKey = "CoreScripts.InGameMenu.GameSettings.AutoGraphicsQuality",
			checked = p7.state.automatic,
			onToggled = function()
				-- upvalues: p7 (ref), sendAnalyticsModule (copy), constantsModule (copy)
				if p7.state.automatic then
					p7:setManualQualityLevel(p7.state.quality)
				else
					p7:setAutomaticQualityLevel()
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
			value = p7.state.quality,
			disabled = p7.state.automatic,
			valueChanged = function(p8)
				-- upvalues: p7 (ref), sendAnalyticsModule (copy), constantsModule (copy)
				p7:setManualQualityLevel(p8)
				sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
			end,
			canCaptureFocus = p7.props.canCaptureFocus,
			isMenuOpen = p7.props.isMenuOpen
		}),
		QualityListener = roact.createElement(externalEventConnectionModule, {
			event = savedQualityLevelPropertyChangedSignal,
			callback = p7.onQualityChanged
		})
	})
end

return graphicsQualityEntry