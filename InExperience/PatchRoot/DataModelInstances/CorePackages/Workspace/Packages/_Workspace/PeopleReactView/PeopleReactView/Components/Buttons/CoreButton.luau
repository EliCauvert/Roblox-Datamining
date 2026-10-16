local Parent = script:FindFirstAncestor("PeopleReactView").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

return function(Frame) --[[ Line: 30 | Named "CoreButton" ]]
	-- upvalues: UseTokensFunction (copy), UseSignalStateFunction (copy), SignalsModule (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = UseSignalStateFunction(Frame.animatedIcon or SignalsModule.createSignal(""))
	local UseSignalStateResult1 = UseSignalStateFunction(Frame.buttonState or SignalsModule.createSignal(false))
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 36 ]]
		-- upvalues: Frame (copy), UseSignalStateResult1 (copy)
		return Frame.icon.off and Frame.buttonState and (UseSignalStateResult1 and Frame.icon.off) or Frame.icon.on
	end, { UseSignalStateResult1, Frame.icon })
	
	return ReactModule.createElement(View, {
		tag = "size-0-1200 flex-x-fill grow radius-medium padding-x-small align-y-center row gap-xsmall bg-surface-200",
		onActivated = Frame.onActivated,
		LayoutOrder = Frame.LayoutOrder,
		ref = Frame.onMount
	}, {
		IconContainer = ReactModule.createElement(View, {
			tag = "size-1100 align-y-center align-x-center row",
			LayoutOrder = 1
		}, {
			Icon = ReactModule.createElement(Icon, {
				name = ReactModule.useMemo(function() --[[ Line: 46 ]]
					-- upvalues: Frame (copy), UseSignalStateResult (copy), UseMemoResult (copy)
					return if Frame.animatedIcon then UseSignalStateResult else UseMemoResult
				end, { UseSignalStateResult, UseMemoResult }),
				size = if Frame.isNewIcon then IconSize.Large else IconSize.Medium
			})
		}),
		Text = ReactModule.createElement(Text, {
			tag = "text-label-medium size-full text-align-x-left",
			LayoutOrder = 2,
			Text = Frame.text,
			textStyle = { Color3 = UseTokensResult.Color.Content.Default.Color3 },
			TextTruncate = Enum.TextTruncate.SplitWord
		})
	})
end