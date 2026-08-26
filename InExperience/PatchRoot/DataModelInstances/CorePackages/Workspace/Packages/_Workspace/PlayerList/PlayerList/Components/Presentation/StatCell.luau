local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsModule = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local _ = require(parent_1.LeaderboardStore)
local leaderboardTextCellModule = require(script.Parent.LeaderboardTextCell)
local formatStatStringModule = require(parent.Common.FormatStatString)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), formatStatStringModule (ref), signalsReactModule (ref), leaderboardTextCellModule (ref)
	return reactModule.createElement(leaderboardTextCellModule, {
		text = signalsReactModule.useSignalBinding(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), p1 (ref), formatStatStringModule (copy)
			return signalsModule.createComputed(function(p2)
				-- upvalues: p1 (copy), formatStatStringModule (copy)
				return if p1.playerStat then formatStatStringModule(p1.playerStat(p2)) else "-"
			end)
		end, { p1.playerStat })),
		width = p1.statWidth,
		rowHeight = p1.rowHeight,
		layoutOrder = p1.layoutOrder,
		textTag = `size-full text-align-x-left text-truncate-end {p0.textTag or "text-body-small content-default"}`
	})
end)