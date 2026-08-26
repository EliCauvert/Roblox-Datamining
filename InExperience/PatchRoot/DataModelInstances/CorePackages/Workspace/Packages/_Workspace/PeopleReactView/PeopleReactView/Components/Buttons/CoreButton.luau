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

return function(p1)
	-- upvalues: useTokens (ref), useSignalState (ref), signalsModule (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref), text (ref)
	local var1 = useTokens()
	local var2 = useSignalState(p1.animatedIcon or signalsModule.createSignal(""))
	local var3 = useSignalState(p1.buttonState or signalsModule.createSignal(false))
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var3 (ref)
		return if p1.icon.off and p1.buttonState then if var3 then p1.icon.off else p1.icon.on else p1.icon.on
	end, { var3, p1.icon })
	
	return reactModule.createElement(view, {
		tag = "size-0-1200 flex-x-fill grow radius-medium padding-x-small align-y-center row gap-xsmall bg-surface-200",
		onActivated = p1.onActivated,
		LayoutOrder = p1.LayoutOrder,
		ref = p1.onMount
	}, {
		IconContainer = reactModule.createElement(view, {
			tag = "size-1100 align-y-center align-x-center row",
			LayoutOrder = 1
		}, {
			Icon = reactModule.createElement(icon, {
				name = reactModule.useMemo(function()
					-- upvalues: p1 (ref), var2 (ref), var4 (ref)
					return if p1.animatedIcon then var2 else var4
				end, { var2, var4 }),
				size = if p1.isNewIcon then iconSize.Large else iconSize.Medium
			})
		}),
		Text = reactModule.createElement(text, {
			tag = "text-label-medium size-full text-align-x-left",
			LayoutOrder = 2,
			Text = p1.text,
			textStyle = { Color3 = var1.Color.Content.Default.Color3 },
			TextTruncate = Enum.TextTruncate.SplitWord
		})
	})
end