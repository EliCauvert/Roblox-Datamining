local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local toggleEntryModule = require(script.Parent.ToggleEntry)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local autoPropertyToggleEntry = roact.PureComponent:extend("AutoPropertyToggleEntry")
autoPropertyToggleEntry.validateProps = t.strictInterface({
	instance = t.Instance,
	valueKey = t.string,
	lockedToOff = t.optional(t.boolean),
	onValue = t.optional(t.any),
	offValue = t.optional(t.any),
	labelKey = t.string,
	LayoutOrder = t.integer,
	subtextEnabled = t.optional(t.boolean),
	subtextKey = t.optional(t.string)
})
autoPropertyToggleEntry.defaultProps = {
	onValue = true,
	offValue = false,
	lockedToOff = false,
	subtextEnabled = false,
	subtextKey = ""
}

function autoPropertyToggleEntry.init(p1, p2)
	-- upvalues: sendAnalyticsModule (ref), constantsModule (ref)
	local valueKey = p2.instance[p2.valueKey]
	p1.changeEvent = p2.instance:GetPropertyChangedSignal(p2.valueKey)
	p1:setState({ checked = not p2.lockedToOff and valueKey == p2.onValue })
	
	function p0.onExternalChange()
		-- upvalues: p2 (ref), p1 (ref)
		p1:setState({ checked = p2.instance[p2.valueKey] == p2.onValue })
	end
	
	function p0.onToggled()
		-- upvalues: p1 (ref), p2 (ref), sendAnalyticsModule (copy), constantsModule (copy)
		if p1.props.lockedToOff then return end
		if p2.instance[p2.valueKey] == p2.onValue then
			p2.instance[p2.valueKey] = p2.offValue
		else
			p2.instance[p2.valueKey] = p2.onValue
		end
		sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
	end
end

function autoPropertyToggleEntry.render(p1)
	-- upvalues: roact (ref), toggleEntryModule (ref), externalEventConnectionModule (ref)
	local props = p1.props
	
	return roact.createFragment({
		Toggle = roact.createElement(toggleEntryModule, {
			checked = p1.state.checked,
			lockedToOff = props.lockedToOff,
			labelKey = props.labelKey,
			LayoutOrder = props.LayoutOrder,
			onToggled = p1.onToggled,
			subtextEnabled = props.subtextEnabled,
			subtextKey = props.subtextKey
		}),
		Listener = roact.createElement(externalEventConnectionModule, { event = p1.changeEvent, callback = p1.onExternalChange })
	})
end

return autoPropertyToggleEntry