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

function t.new() --[[ line: 72 ]]
	-- upvalues: localizationService (ref), localization (ref), t (ref)
	return setmetatable({
		_localization = localization.new(localizationService.RobloxLocaleId),
		_settings = {},
		_signals = {},
		_disposables = {}
	}, t)
end

function t:registerSetting(p0) --[[ line: 82 ]]
	-- upvalues: signalsModule (ref), settingEnumModule (ref)
	self._disposables[p0.id] = {}
	
	if p0.alreadyLocalized == nil then
		p0.alreadyLocalized = true
	end
	local var5, var6 = signalsModule.createSignal(true)
	
	if p0.onAvailabilityChanged then
		table.insert(self._disposables[p0.id], signalsModule.createEffect(function(p1) --[[ line: 93 ]]
			-- upvalues: var5 (ref), p0 (ref)
			p0.onAvailabilityChanged(var5(p1))
		end))
	end
	if p0.initialAvailability ~= nil then
		var6(p0.initialAvailability)
	end
	local var7, var8 = signalsModule.createSignal(true)
	
	if p0.onVisibilityChanged then
		table.insert(self._disposables[p0.id], signalsModule.createEffect(function(p2) --[[ line: 106 ]]
			-- upvalues: var7 (ref), p0 (ref)
			p0.onVisibilityChanged(var7(p2))
		end))
	end
	if p0.initialVisibility ~= nil then
		var8(p0.initialVisibility)
	end
	self._signals[p0.id] = {
		availability = var5,
		setAvailability = var6,
		visibility = var7,
		setVisibility = var8
	}
	p0.subscribeAvailable = var5
	p0.subscribeVisible = var7
	
	if not p0.alreadyLocalized then
		p0.label = self:_updateLocalization(p0.label)
		p0.description = self:_updateLocalization(p0.description)
	end
	local var9 = p0
	
	if var9.field_type == settingEnumModule.Selector then
		var9 = self:_registerSelector(var9)
	elseif var9.field_type == settingEnumModule.Slider then
		var9 = self:_registerSlider(var9)
	elseif var9.field_type == settingEnumModule.Dropdown then
		var9 = self:_registerDropdown(var9)
	elseif var9.field_type == settingEnumModule.TextButton then
		var9 = self:_registerTextButton(var9)
	elseif var9.field_type == settingEnumModule.Toggle then
		var9 = self:_registerToggle(var9)
	else
		error(tostring(var9.field_type) .. " is not a valid field_type")
	end
	self._settings[var9.id] = var9
	
	return var9
end

function t:setting(p3) --[[ line: 147 ]]
	if not self._settings[p3] then
		error("No setting registered with id: " .. p3)
	end
	return self._settings[p3]
end

function t:updateSetting(p4, p5) --[[ line: 154 ]]
	assert(typeof(self:setting(p4)) == "table", "No setting registered with id: " .. p4)
	
	if p5.available ~= nil then
		self._signals[p4].setAvailability(p5.available)
	end
	if p5.visible ~= nil then
		self._signals[p4].setVisibility(p5.visible)
	end
end

function t:disconnect() --[[ line: 164 ]]
	for i, v in self._disposables do
		for i_1, v_1 in v do
			v_1()
		end
	end
	self._disposables = {}
	self._signals = {}
	self._settings = {}
end

function t:_updateLocalization(p6) --[[ line: 176 ]]
	if p6 == nil then
		return nil
	end
	local localization = self._localization
	
	return if typeof(p6) == "string" then localization:Format(p6) else localization:Format(p6.key, p6.args)
end

function t._registerToggle(_, p7) --[[ line: 188 ]]
	return p7
end

function t:_registerOptions(p8, p9) --[[ line: 193 ]]
	for i, v in ipairs(p9) do
		if not p8 then
			v.text = self:_updateLocalization(v.text)
		end
		local var10 = v.initialAvailability ~= nil or v.initialAvailability
		
		if v.onAvailabilityChanged then
			v.onAvailabilityChanged(var10)
		end
	end
	return p9
end

function t:_registerSlider(p10) --[[ line: 212 ]]
	if not p10.alreadyLocalized then
		p10.sliderLeftLabel = self:_updateLocalization(p10.sliderLeftLabel)
		p10.sliderRightLabel = self:_updateLocalization(p10.sliderRightLabel)
	end
	return p10
end

function t:_registerTextButton(p11) --[[ line: 221 ]]
	if not p11.alreadyLocalized then
		p11.text = self:_updateLocalization(p11.text)
	end
	return p11
end

function t:_registerDropdown(p12) --[[ line: 233 ]]
	-- upvalues: valueChangedSignalModule (ref)
	if not p12.alreadyLocalized then
		p12.placeholder = self:_updateLocalization(p12.placeholder)
	end
	p12.onMenuOpenChange = p12.onMenuOpenChange or valueChangedSignalModule.new(nil)
	p12.options = self:_registerOptions(p12.alreadyLocalized, p12.options)
	
	return p12
end

function t:_registerSelector(p13) --[[ line: 243 ]]
	if not p13.alreadyLocalized then
		p13.placeholder = self:_updateLocalization(p13.placeholder)
	end
	p13.options = self:_registerOptions(p13.alreadyLocalized, p13.options)
	
	return p13
end

return t