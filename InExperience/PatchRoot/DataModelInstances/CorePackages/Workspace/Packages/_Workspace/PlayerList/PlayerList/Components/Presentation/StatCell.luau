local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsModule = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local _ = require(parent_1.LeaderboardStore)
local formatStatStringModule = require(parent.Common.FormatStatString)

return reactModule.memo(function(p0) --[[ line: 16 | named "StatCell" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), formatStatStringModule (ref), signalsReactModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "clip",
		Size = UDim2.fromOffset(p0.statWidth, p0.rowHeight),
		LayoutOrder = p0.layoutOrder
	}, {
		StatText = reactModule.createElement(text, {
			Text = signalsReactModule.useSignalBinding(reactModule.useMemo(function() --[[ line: 24 ]]
				-- upvalues: signalsModule (copy), p0 (ref), formatStatStringModule (copy)
				return signalsModule.createComputed(function(p1) --[[ line: 25 ]]
					-- upvalues: p0 (copy), formatStatStringModule (copy)
					return if p0.playerStat then formatStatStringModule(p0.playerStat(p1)) else "-"
				end)
			end, { p0.playerStat })),
			tag = `size-full text-align-x-left text-truncate-end {p0.textTag or "text-body-small content-default"}`
		})
	})
end)