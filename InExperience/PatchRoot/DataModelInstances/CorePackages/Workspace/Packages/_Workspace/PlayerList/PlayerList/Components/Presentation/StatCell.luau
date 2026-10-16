local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsModule = require(Parent1.Signals)
local SignalsReactModule = require(Parent1.SignalsReact)
local _ = require(Parent1.LeaderboardStore)
local LeaderboardTextCellModule = require(script.Parent.LeaderboardTextCell)
local FormatStatStringModule = require(Parent.Common.FormatStatString)

return ReactModule.memo(function(p1) --[[ Line: 14 | Named "StatCell" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy), FormatStatStringModule (copy), SignalsReactModule (copy), LeaderboardTextCellModule (copy)
	return ReactModule.createElement(LeaderboardTextCellModule, {
		text = SignalsReactModule.useSignalBinding((ReactModule.useMemo(function() --[[ Line: 22 ]]
			-- upvalues: SignalsModule (upval), p1 (copy), FormatStatStringModule (upval)
			return SignalsModule.createComputed(function(p2) --[[ Line: 23 ]]
				-- upvalues: p1 (upval), FormatStatStringModule (upval)
				return if p1.playerStat then FormatStatStringModule((p1.playerStat(p2))) else "-"
			end)
		end, { p1.playerStat }))),
		width = p1.statWidth,
		rowHeight = p1.rowHeight,
		layoutOrder = p1.layoutOrder,
		textTag = `size-full text-align-x-left text-truncate-end {p0.textTag or "text-body-small content-default"}`
	})
end)