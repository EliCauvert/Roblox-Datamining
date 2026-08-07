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

function autoPropertyToggleEntry.init(p0, p1) --[[ line: 37 ]]
	-- upvalues: sendAnalyticsModule (ref), constantsModule (ref)
	local valueKey = p1.instance[p1.valueKey]
	p0.changeEvent = p1.instance:GetPropertyChangedSignal(p1.valueKey)
	p0:setState({ checked = not p1.lockedToOff and valueKey == p1.onValue })
	
	function p0.onExternalChange() --[[ line: 45 ]]
		-- upvalues: p1 (ref), p0 (ref)
		p0:setState({ checked = p1.instance[p1.valueKey] == p1.onValue })
	end
	
	function p0.onToggled() --[[ line: 52 ]]
		-- upvalues: p0 (ref), p1 (ref), sendAnalyticsModule (copy), constantsModule (copy)
		if p0.props.lockedToOff then return end
		if p1.instance[p1.valueKey] == p1.onValue then
			p1.instance[p1.valueKey] = p1.offValue
		else
			p1.instance[p1.valueKey] = p1.onValue
		end
		sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
	end
end

function autoPropertyToggleEntry.render(p2) --[[ line: 69 ]]
	-- upvalues: roact (ref), toggleEntryModule (ref), externalEventConnectionModule (ref)
	local props = p2.props
	
	return roact.createFragment({
		Toggle = roact.createElement(toggleEntryModule, {
			checked = p2.state.checked,
			lockedToOff = props.lockedToOff,
			labelKey = props.labelKey,
			LayoutOrder = props.LayoutOrder,
			onToggled = p2.onToggled,
			subtextEnabled = props.subtextEnabled,
			subtextKey = props.subtextKey
		}),
		Listener = roact.createElement(externalEventConnectionModule, { event = p2.changeEvent, callback = p2.onExternalChange })
	})
end

return autoPropertyToggleEntry