local parent = script:FindFirstAncestor("PeopleReactView").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local signalsModule = require(parent.Signals)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = signalsReactModule.useSignalState

return function(p0)
	-- upvalues: useTokens (ref), useSignalState (ref), signalsModule (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref), text (ref)
	local var4 = useTokens()
	local var5 = useSignalState(p0.animatedIcon or signalsModule.createSignal(""))
	local var6 = useSignalState(p0.buttonState or signalsModule.createSignal(false))
	local var7 = reactModule.useMemo(function()
		-- upvalues: p0 (ref), var6 (ref)
		return if p0.icon.off and p0.buttonState then if var6 then p0.icon.off else p0.icon.on else p0.icon.on
	end, { var6, p0.icon })
	
	return reactModule.createElement(view, {
		tag = "size-0-1200 flex-x-fill grow radius-medium padding-x-small align-y-center row gap-xsmall bg-surface-200",
		onActivated = p0.onActivated,
		LayoutOrder = p0.LayoutOrder,
		ref = p0.onMount
	}, {
		IconContainer = reactModule.createElement(view, {
			tag = "size-1100 align-y-center align-x-center row",
			LayoutOrder = 1
		}, {
			Icon = reactModule.createElement(icon, {
				name = reactModule.useMemo(function()
					-- upvalues: p0 (ref), var5 (ref), var7 (ref)
					return if p0.animatedIcon then var5 else var7
				end, { var5, var7 }),
				size = if p0.isNewIcon then iconSize.Large else iconSize.Medium
			})
		}),
		Text = reactModule.createElement(text, {
			tag = "text-label-medium size-full text-align-x-left",
			LayoutOrder = 2,
			Text = p0.text,
			textStyle = { Color3 = var4.Color.Content.Default.Color3 },
			TextTruncate = Enum.TextTruncate.SplitWord
		})
	})
end