local Parent = script.Parent
local Parent1 = Parent.Parent
local LocalizationService = game:GetService("LocalizationService")
local SignalsModule = require(Parent1.Signals)
local _ = require(Parent.Types)
local SettingEnumModule = require(Parent.SettingEnum)
local ValueChangedSignalModule = require(Parent.ValueChangedSignal)
local Localization = require(Parent1.InExperienceLocales).Localization
local SettingsService = {}
SettingsService.__index = SettingsService

function SettingsService.new() --[[ Line: 72 ]]
	-- upvalues: LocalizationService (copy), Localization (copy), SettingsService (copy)
	return (setmetatable({
		_localization = Localization.new(LocalizationService.RobloxLocaleId),
		_settings = {},
		_signals = {},
		_disposables = {}
	}, SettingsService))
end

function SettingsService:registerSetting(RegisterDropdownResult) --[[ Line: 82 ]]
	-- upvalues: SignalsModule (copy), SettingEnumModule (copy)
	self._disposables[RegisterDropdownResult.id] = {}
	
	if RegisterDropdownResult.alreadyLocalized == nil then
		RegisterDropdownResult.alreadyLocalized = true
	end
	local Signal, Signal2 = SignalsModule.createSignal(true)
	
	if RegisterDropdownResult.onAvailabilityChanged then
		table.insert(self._disposables[RegisterDropdownResult.id], SignalsModule.createEffect(function(p1) --[[ Line: 93 ]]
			-- upvalues: Signal (copy), RegisterDropdownResult (copy)
			RegisterDropdownResult.onAvailabilityChanged((Signal(p1)))
		end))
	end
	if RegisterDropdownResult.initialAvailability ~= nil then
		Signal2(RegisterDropdownResult.initialAvailability)
	end
	local Signal1, Signal2_1 = SignalsModule.createSignal(true)
	
	if RegisterDropdownResult.onVisibilityChanged then
		table.insert(self._disposables[RegisterDropdownResult.id], SignalsModule.createEffect(function(p1) --[[ Line: 106 ]]
			-- upvalues: Signal1 (copy), RegisterDropdownResult (copy)
			RegisterDropdownResult.onVisibilityChanged((Signal1(p1)))
		end))
	end
	if RegisterDropdownResult.initialVisibility ~= nil then
		Signal2_1(RegisterDropdownResult.initialVisibility)
	end
	self._signals[RegisterDropdownResult.id] = {
		availability = Signal,
		setAvailability = Signal2,
		visibility = Signal1,
		setVisibility = Signal2_1
	}
	RegisterDropdownResult.subscribeAvailable = Signal
	RegisterDropdownResult.subscribeVisible = Signal1
	
	if not RegisterDropdownResult.alreadyLocalized then
		RegisterDropdownResult.label = self:_updateLocalization(RegisterDropdownResult.label)
		RegisterDropdownResult.description = self:_updateLocalization(RegisterDropdownResult.description)
	end
	local RegisterDropdownResult1 = RegisterDropdownResult
	
	if RegisterDropdownResult1.field_type == SettingEnumModule.Selector then
		RegisterDropdownResult1 = self:_registerSelector(RegisterDropdownResult1)
	elseif RegisterDropdownResult1.field_type == SettingEnumModule.Slider then
		RegisterDropdownResult1 = self:_registerSlider(RegisterDropdownResult1)
	elseif RegisterDropdownResult1.field_type == SettingEnumModule.Dropdown then
		RegisterDropdownResult1 = self:_registerDropdown(RegisterDropdownResult1)
	elseif RegisterDropdownResult1.field_type == SettingEnumModule.TextButton then
		RegisterDropdownResult1 = self:_registerTextButton(RegisterDropdownResult1)
	elseif RegisterDropdownResult1.field_type == SettingEnumModule.Toggle then
		RegisterDropdownResult1 = self:_registerToggle(RegisterDropdownResult1)
	else
		error(tostring(RegisterDropdownResult1.field_type) .. " is not a valid field_type")
	end
	self._settings[RegisterDropdownResult1.id] = RegisterDropdownResult1
	
	return RegisterDropdownResult1
end

function SettingsService:setting(Text) --[[ Line: 147 ]]
	if not self._settings[Text] then
		error("No setting registered with id: " .. Text)
	end
	return self._settings[Text]
end

function SettingsService:updateSetting(Text, p1) --[[ Line: 154 ]]
	assert(typeof(self:setting(Text)) == "table", "No setting registered with id: " .. Text)
	
	if p1.available ~= nil then
		self._signals[Text].setAvailability(p1.available)
	end
	if p1.visible ~= nil then
		self._signals[Text].setVisibility(p1.visible)
	end
end

function SettingsService:disconnect() --[[ Line: 164 ]]
	for _, disposable in self._disposables do
		for _, value in disposable do
			value()
		end
	end
	self._disposables = {}
	self._signals = {}
	self._settings = {}
end

function SettingsService:_updateLocalization(Placeholder) --[[ Line: 176 ]]
	if Placeholder == nil then
		return nil
	else
		local Localization = self._localization
		
		return if typeof(Placeholder) == "string" then Localization:Format(Placeholder) else Localization:Format(Placeholder.key, Placeholder.args)
	end
end

function SettingsService:_registerToggle(RegisterDropdownResult) --[[ Line: 188 ]]
	return RegisterDropdownResult
end

function SettingsService:_registerOptions(AlreadyLocalized, Options) --[[ Line: 193 ]]
	for _, option in ipairs(Options) do
		if not AlreadyLocalized then
			option.text = self:_updateLocalization(option.text)
		end
		local NoInitialAvailability = option.initialAvailability == nil or option.initialAvailability
		
		if option.onAvailabilityChanged then
			option.onAvailabilityChanged(NoInitialAvailability)
		end
	end
	return Options
end

function SettingsService:_registerSlider(RegisterDropdownResult) --[[ Line: 212 ]]
	if not RegisterDropdownResult.alreadyLocalized then
		RegisterDropdownResult.sliderLeftLabel = self:_updateLocalization(RegisterDropdownResult.sliderLeftLabel)
		RegisterDropdownResult.sliderRightLabel = self:_updateLocalization(RegisterDropdownResult.sliderRightLabel)
	end
	return RegisterDropdownResult
end

function SettingsService:_registerTextButton(RegisterDropdownResult) --[[ Line: 221 ]]
	if not RegisterDropdownResult.alreadyLocalized then
		RegisterDropdownResult.text = self:_updateLocalization(RegisterDropdownResult.text)
	end
	return RegisterDropdownResult
end

function SettingsService:_registerDropdown(RegisterDropdownResult) --[[ Line: 233 ]]
	-- upvalues: ValueChangedSignalModule (copy)
	if not RegisterDropdownResult.alreadyLocalized then
		RegisterDropdownResult.placeholder = self:_updateLocalization(RegisterDropdownResult.placeholder)
	end
	RegisterDropdownResult.onMenuOpenChange = RegisterDropdownResult.onMenuOpenChange or ValueChangedSignalModule.new(nil)
	RegisterDropdownResult.options = self:_registerOptions(RegisterDropdownResult.alreadyLocalized, RegisterDropdownResult.options)
	
	return RegisterDropdownResult
end

function SettingsService:_registerSelector(RegisterDropdownResult) --[[ Line: 243 ]]
	if not RegisterDropdownResult.alreadyLocalized then
		RegisterDropdownResult.placeholder = self:_updateLocalization(RegisterDropdownResult.placeholder)
	end
	RegisterDropdownResult.options = self:_registerOptions(RegisterDropdownResult.alreadyLocalized, RegisterDropdownResult.options)
	
	return RegisterDropdownResult
end

return SettingsService