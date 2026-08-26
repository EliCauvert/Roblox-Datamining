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

function VRComfortAutoToggleEntry.init(p1, p2)
	-- upvalues: userGameSettingsService (ref), sendAnalyticsModule (ref), constantsModule (ref)
	p1.derivedValueChangeEvent = userGameSettingsService:GetPropertyChangedSignal(p2.derivedValueKey)
	p1:setState({
		checked = userGameSettingsService[p2.derivedValueKey] == p2.checkedValue,
		vrComfortSetting = userGameSettingsService.VRComfortSetting
	})
	
	function p0.onExternalChange()
		-- upvalues: userGameSettingsService (copy), p2 (ref), p1 (ref)
		p1:setState({
			checked = userGameSettingsService[p2.derivedValueKey] == p2.checkedValue
		})
	end
	
	function p0.onToggled()
		-- upvalues: p1 (ref), userGameSettingsService (copy), p2 (ref), sendAnalyticsModule (copy), constantsModule (copy)
		if p1.state.vrComfortSetting == Enum.VRComfortSetting.Custom then
			if userGameSettingsService[p2.customValueKey] == p2.checkedValue then
				userGameSettingsService[p2.customValueKey] = not p2.checkedValue
			else
				userGameSettingsService[p2.customValueKey] = p2.checkedValue
			end
			sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
		end
	end
end

function VRComfortAutoToggleEntry.render(p1)
	-- upvalues: roact (ref), toggleEntryModule (ref), externalEventConnectionModule (ref), VRComfortSettingPropertyChangedSignal (ref), userGameSettingsService (ref)
	local props = p1.props
	
	return roact.createFragment({
		Toggle = roact.createElement(toggleEntryModule, {
			checked = p1.state.checked,
			labelKey = props.labelKey,
			LayoutOrder = props.LayoutOrder,
			onToggled = p1.onToggled,
			isDisabled = p1.state.vrComfortSetting ~= Enum.VRComfortSetting.Custom
		}),
		DerivedValueListener = roact.createElement(externalEventConnectionModule, {
			event = p1.derivedValueChangeEvent,
			callback = p1.onExternalChange
		}),
		VRComfortSettingListener = roact.createElement(externalEventConnectionModule, {
			event = VRComfortSettingPropertyChangedSignal,
			callback = function()
				-- upvalues: p1 (ref), userGameSettingsService (copy)
				p1:setState({
					vrComfortSetting = userGameSettingsService.VRComfortSetting
				})
			end
		})
	})
end

return VRComfortAutoToggleEntry