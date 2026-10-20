local UserGameSettings = UserSettings():GetService("UserGameSettings")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local ToggleEntryModule = require(script.Parent.ToggleEntry)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local VRComfortSettingPropertyChangedSignal = UserGameSettings:GetPropertyChangedSignal("VRComfortSetting")
local VRComfortAutoToggleEntry = Roact.PureComponent:extend("VRComfortAutoToggleEntry")
VRComfortAutoToggleEntry.validateProps = T.strictInterface({
	customValueKey = T.string,
	derivedValueKey = T.string,
	labelKey = T.string,
	LayoutOrder = T.integer,
	checkedValue = T.optional(T.any)
})
VRComfortAutoToggleEntry.defaultProps = { checkedValue = true }

function VRComfortAutoToggleEntry.init(p1, p2)
	-- upvalues: UserGameSettings (copy), SendAnalyticsModule (copy), ConstantsModule (copy)
	p1.derivedValueChangeEvent = UserGameSettings:GetPropertyChangedSignal(p2.derivedValueKey)
	p1:setState({
		checked = UserGameSettings[p2.derivedValueKey] == p2.checkedValue,
		vrComfortSetting = UserGameSettings.VRComfortSetting
	})
	
	function p1.onExternalChange()
		-- upvalues: UserGameSettings (upval), p2 (copy), p1 (copy)
		p1:setState({
			checked = UserGameSettings[p2.derivedValueKey] == p2.checkedValue
		})
	end
	
	function p1.onToggled()
		-- upvalues: p1 (copy), UserGameSettings (upval), p2 (copy), SendAnalyticsModule (upval), ConstantsModule (upval)
		if p1.state.vrComfortSetting == Enum.VRComfortSetting.Custom then
			if UserGameSettings[p2.customValueKey] == p2.checkedValue then
				UserGameSettings[p2.customValueKey] = not p2.checkedValue
			else
				UserGameSettings[p2.customValueKey] = p2.checkedValue
			end
			SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, nil, {}, true)
		end
	end
end

function VRComfortAutoToggleEntry.render(p1)
	-- upvalues: Roact (copy), ToggleEntryModule (copy), ExternalEventConnectionModule (copy), VRComfortSettingPropertyChangedSignal (copy), UserGameSettings (copy)
	local Props = p1.props
	
	return Roact.createFragment({
		Toggle = Roact.createElement(ToggleEntryModule, {
			checked = p1.state.checked,
			labelKey = Props.labelKey,
			LayoutOrder = Props.LayoutOrder,
			onToggled = p1.onToggled,
			isDisabled = p1.state.vrComfortSetting ~= Enum.VRComfortSetting.Custom
		}),
		DerivedValueListener = Roact.createElement(ExternalEventConnectionModule, {
			event = p1.derivedValueChangeEvent,
			callback = p1.onExternalChange
		}),
		VRComfortSettingListener = Roact.createElement(ExternalEventConnectionModule, {
			event = VRComfortSettingPropertyChangedSignal,
			callback = function()
				-- upvalues: p1 (copy), UserGameSettings (upval)
				p1:setState({ vrComfortSetting = UserGameSettings.VRComfortSetting })
			end
		})
	})
end

return VRComfortAutoToggleEntry