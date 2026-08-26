local parent = script.Parent
local parent_1 = parent.Parent
local localizationService = game:GetService("LocalizationService")
local signalsModule = require(parent_1.Signals)
local _ = require(parent.Types)
local settingEnumModule = require(parent.SettingEnum)
local valueChangedSignalModule = require(parent.ValueChangedSignal)
local localization = require(parent_1.InExperienceLocales).Localization
local t = {}
t.__index = t

function t.new()
	-- upvalues: localizationService (ref), localization (ref), t (ref)
	return setmetatable({
		_localization = localization.new(localizationService.RobloxLocaleId),
		_settings = {},
		_signals = {},
		_disposables = {}
	}, t)
end

function t:registerSetting(p1)
	-- upvalues: signalsModule (ref), settingEnumModule (ref)
	self._disposables[p1.id] = {}
	
	if p1.alreadyLocalized == nil then
		p1.alreadyLocalized = true
	end
	local var1, var2 = signalsModule.createSignal(true)
	
	if p1.onAvailabilityChanged then
		table.insert(self._disposables[p1.id], signalsModule.createEffect(function(p2)
			-- upvalues: var1 (ref), p1 (ref)
			p1.onAvailabilityChanged(var1(p2))
		end))
	end
	if p1.initialAvailability ~= nil then
		var2(p1.initialAvailability)
	end
	local var3, var4 = signalsModule.createSignal(true)
	
	if p1.onVisibilityChanged then
		table.insert(self._disposables[p1.id], signalsModule.createEffect(function(p2)
			-- upvalues: var3 (ref), p1 (ref)
			p1.onVisibilityChanged(var3(p2))
		end))
	end
	if p1.initialVisibility ~= nil then
		var4(p1.initialVisibility)
	end
	self._signals[p1.id] = {
		availability = var1,
		setAvailability = var2,
		visibility = var3,
		setVisibility = var4
	}
	p1.subscribeAvailable = var1
	p1.subscribeVisible = var3
	
	if not p1.alreadyLocalized then
		p1.label = self:_updateLocalization(p1.label)
		p1.description = self:_updateLocalization(p1.description)
	end
	local var5 = p1
	
	if var5.field_type == settingEnumModule.Selector then
		var5 = self:_registerSelector(var5)
	elseif var5.field_type == settingEnumModule.Slider then
		var5 = self:_registerSlider(var5)
	elseif var5.field_type == settingEnumModule.Dropdown then
		var5 = self:_registerDropdown(var5)
	elseif var5.field_type == settingEnumModule.TextButton then
		var5 = self:_registerTextButton(var5)
	elseif var5.field_type == settingEnumModule.Toggle then
		var5 = self:_registerToggle(var5)
	else
		error(tostring(var5.field_type) .. " is not a valid field_type")
	end
	self._settings[var5.id] = var5
	
	return var5
end

function t:setting(p1)
	if not self._settings[p1] then
		error("No setting registered with id: " .. p3)
	end
	return self._settings[p1]
end

function t:updateSetting(p1, p2)
	assert(typeof(self:setting(p1)) == "table", "No setting registered with id: " .. p4)
	
	if p2.available ~= nil then
		self._signals[p1].setAvailability(p2.available)
	end
	if p2.visible ~= nil then
		self._signals[p1].setVisibility(p2.visible)
	end
end

function t:disconnect()
	for i, v in self._disposables do
		for i_1, v_1 in v do
			v_1()
		end
	end
	self._disposables = {}
	self._signals = {}
	self._settings = {}
end

function t:_updateLocalization(p1)
	if p1 == nil then
		return nil
	end
	local localization = self._localization
	
	return if typeof(p1) == "string" then localization:Format(p1) else localization:Format(p1.key, p1.args)
end

function t._registerToggle(_, p1)
	return p1
end

function t:_registerOptions(p1, p2)
	for i, v in ipairs(p2) do
		if not p1 then
			v.text = self:_updateLocalization(v.text)
		end
		local var1 = v.initialAvailability ~= nil or v.initialAvailability
		
		if v.onAvailabilityChanged then
			v.onAvailabilityChanged(var1)
		end
	end
	return p2
end

function t:_registerSlider(p3)
	if not p3.alreadyLocalized then
		p3.sliderLeftLabel = self:_updateLocalization(p3.sliderLeftLabel)
		p3.sliderRightLabel = self:_updateLocalization(p3.sliderRightLabel)
	end
	return p3
end

function t:_registerTextButton(p3)
	if not p3.alreadyLocalized then
		p3.text = self:_updateLocalization(p3.text)
	end
	return p3
end

function t:_registerDropdown(p3)
	-- upvalues: valueChangedSignalModule (ref)
	if not p3.alreadyLocalized then
		p3.placeholder = self:_updateLocalization(p3.placeholder)
	end
	p3.onMenuOpenChange = p3.onMenuOpenChange or valueChangedSignalModule.new(nil)
	p3.options = self:_registerOptions(p3.alreadyLocalized, p3.options)
	
	return p3
end

function t:_registerSelector(p3)
	if not p3.alreadyLocalized then
		p3.placeholder = self:_updateLocalization(p3.placeholder)
	end
	p3.options = self:_registerOptions(p3.alreadyLocalized, p3.options)
	
	return p3
end

return t