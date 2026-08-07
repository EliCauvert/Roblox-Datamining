local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local toggleEntryModule = require(script.Parent.ToggleEntry)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local VRComfortSettingPropertyChangedSignal = userGameSettingsService:GetPropertyChangedSignal("VRComfortSetting")
local VRComfortAutoToggleEntry = roact.PureComponent:extend("VRComfortAutoToggleEntry")
VRComfortAutoToggleEntry.validateProps = t.strictInterface({
	customValueKey = t.string,
	derivedValueKey = t.string,
	labelKey = t.string,
	LayoutOrder = t.integer,
	checkedValue = t.optional(t.any)
})
VRComfortAutoToggleEntry.defaultProps = { checkedValue = true }

function VRComfortAutoToggleEntry.init(p0, p1) --[[ line: 45 ]]
	-- upvalues: userGameSettingsService (ref), sendAnalyticsModule (ref), constantsModule (ref)
	p0.derivedValueChangeEvent = userGameSettingsService:GetPropertyChangedSignal(p1.derivedValueKey)
	p0:setState({
		checked = userGameSettingsService[p1.derivedValueKey] == p1.checkedValue,
		vrComfortSetting = userGameSettingsService.VRComfortSetting
	})
	
	function p0.onExternalChange() --[[ line: 53 ]]
		-- upvalues: userGameSettingsService (copy), p1 (ref), p0 (ref)
		p0:setState({
			checked = userGameSettingsService[p1.derivedValueKey] == p1.checkedValue
		})
	end
	
	function p0.onToggled() --[[ line: 60 ]]
		-- upvalues: p0 (ref), userGameSettingsService (copy), p1 (ref), sendAnalyticsModule (copy), constantsModule (copy)
		if p0.state.vrComfortSetting == Enum.VRComfortSetting.Custom then
			if userGameSettingsService[p1.customValueKey] == p1.checkedValue then
				userGameSettingsService[p1.customValueKey] = not p1.checkedValue
			else
				userGameSettingsService[p1.customValueKey] = p1.checkedValue
			end
			sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
		end
	end
end

function VRComfortAutoToggleEntry.render(p2) --[[ line: 73 ]]
	-- upvalues: roact (ref), toggleEntryModule (ref), externalEventConnectionModule (ref), VRComfortSettingPropertyChangedSignal (ref), userGameSettingsService (ref)
	local props = p2.props
	
	return roact.createFragment({
		Toggle = roact.createElement(toggleEntryModule, {
			checked = p2.state.checked,
			labelKey = props.labelKey,
			LayoutOrder = props.LayoutOrder,
			onToggled = p2.onToggled,
			isDisabled = p2.state.vrComfortSetting ~= Enum.VRComfortSetting.Custom
		}),
		DerivedValueListener = roact.createElement(externalEventConnectionModule, {
			event = p2.derivedValueChangeEvent,
			callback = p2.onExternalChange
		}),
		VRComfortSettingListener = roact.createElement(externalEventConnectionModule, {
			event = VRComfortSettingPropertyChangedSignal,
			callback = function() --[[ line: 91 ]]
				-- upvalues: p2 (ref), userGameSettingsService (copy)
				p2:setState({
					vrComfortSetting = userGameSettingsService.VRComfortSetting
				})
			end
		})
	})
end

return VRComfortAutoToggleEntry