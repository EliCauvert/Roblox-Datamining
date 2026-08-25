local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local signalsModule = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local _ = require(parent_1.LeaderboardStore)
local leaderboardTextCellModule = require(script.Parent.LeaderboardTextCell)
local formatStatStringModule = require(parent.Common.FormatStatString)

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), signalsModule (ref), formatStatStringModule (ref), signalsReactModule (ref), leaderboardTextCellModule (ref)
	return reactModule.createElement(leaderboardTextCellModule, {
		text = signalsReactModule.useSignalBinding(reactModule.useMemo(function()
			-- upvalues: signalsModule (copy), p0 (ref), formatStatStringModule (copy)
			return signalsModule.createComputed(function(p1)
				-- upvalues: p0 (copy), formatStatStringModule (copy)
				return if p0.playerStat then formatStatStringModule(p0.playerStat(p1)) else "-"
			end)
		end, { p0.playerStat })),
		width = p0.statWidth,
		rowHeight = p0.rowHeight,
		layoutOrder = p0.layoutOrder,
		textTag = `size-full text-align-x-left text-truncate-end {p0.textTag or "text-body-small content-default"}`
	})
end)