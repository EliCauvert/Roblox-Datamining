local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local ToggleEntryModule = require(script.Parent.ToggleEntry)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local AutoPropertyToggleEntry = Roact.PureComponent:extend("AutoPropertyToggleEntry")
AutoPropertyToggleEntry.validateProps = T.strictInterface({
	instance = T.Instance,
	valueKey = T.string,
	lockedToOff = T.optional(T.boolean),
	onValue = T.optional(T.any),
	offValue = T.optional(T.any),
	labelKey = T.string,
	LayoutOrder = T.integer,
	subtextEnabled = T.optional(T.boolean),
	subtextKey = T.optional(T.string)
})
AutoPropertyToggleEntry.defaultProps = {
	onValue = true,
	offValue = false,
	lockedToOff = false,
	subtextEnabled = false,
	subtextKey = ""
}

function AutoPropertyToggleEntry.init(p1, DefaultProps) --[[ Line: 37 ]]
	-- upvalues: SendAnalyticsModule (copy), ConstantsModule (copy)
	local DefaultPropsInstanceEntry = DefaultProps.instance[DefaultProps.valueKey]
	p1.changeEvent = DefaultProps.instance:GetPropertyChangedSignal(DefaultProps.valueKey)
	p1:setState({
		checked = not DefaultProps.lockedToOff and DefaultPropsInstanceEntry == DefaultProps.onValue
	})
	
	function p1.onExternalChange() --[[ Line: 45 ]]
		-- upvalues: DefaultProps (copy), p1 (copy)
		p1:setState({
			checked = DefaultProps.instance[DefaultProps.valueKey] == DefaultProps.onValue
		})
	end
	
	function p1.onToggled() --[[ Line: 52 ]]
		-- upvalues: p1 (copy), DefaultProps (copy), SendAnalyticsModule (upval), ConstantsModule (upval)
		if p1.props.lockedToOff then return end
		if DefaultProps.instance[DefaultProps.valueKey] == DefaultProps.onValue then
			DefaultProps.instance[DefaultProps.valueKey] = DefaultProps.offValue
		else
			DefaultProps.instance[DefaultProps.valueKey] = DefaultProps.onValue
		end
		SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, nil, {}, true)
	end
end

function AutoPropertyToggleEntry.render(p1) --[[ Line: 69 ]]
	-- upvalues: Roact (copy), ToggleEntryModule (copy), ExternalEventConnectionModule (copy)
	local Props = p1.props
	
	return Roact.createFragment({
		Toggle = Roact.createElement(ToggleEntryModule, {
			checked = p1.state.checked,
			lockedToOff = Props.lockedToOff,
			labelKey = Props.labelKey,
			LayoutOrder = Props.LayoutOrder,
			onToggled = p1.onToggled,
			subtextEnabled = Props.subtextEnabled,
			subtextKey = Props.subtextKey
		}),
		Listener = Roact.createElement(ExternalEventConnectionModule, { event = p1.changeEvent, callback = p1.onExternalChange })
	})
end

return AutoPropertyToggleEntry