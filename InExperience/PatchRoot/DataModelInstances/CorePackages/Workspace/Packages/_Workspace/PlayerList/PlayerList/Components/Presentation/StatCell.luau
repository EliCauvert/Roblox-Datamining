local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local Text = require(Parent1.Foundation).Text
local LeaderboardTextCellModule = require(script.Parent.LeaderboardTextCell)
local SignalsModule = require(Parent1.Signals)
local SignalsReactModule = require(Parent1.SignalsReact)
local _ = require(Parent1.LeaderboardStore)
local FormatStatStringModule = require(Parent.Common.FormatStatString)
local FFlagPlayerListContrastingTeamTextModule = require(Parent.Flags.FFlagPlayerListContrastingTeamText)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), FormatStatStringModule (copy), SignalsReactModule (copy), FFlagPlayerListContrastingTeamTextModule (copy), Text (copy), LeaderboardTextCellModule (copy)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), p1 (copy), FormatStatStringModule (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: p1 (upval), FormatStatStringModule (upval)
			return if p1.playerStat then FormatStatStringModule((p1.playerStat(p2))) else "-"
		end)
	end, { p1.playerStat })))
	
	return if FFlagPlayerListContrastingTeamTextModule then ReactModule.createElement(Text, {
		tag = "text-align-x-left text-truncate-end clip",
		Text = UseSignalBindingResult,
		Size = UDim2.fromOffset(p1.statWidth, p1.rowHeight),
		LayoutOrder = p1.layoutOrder,
		fontStyle = p1.fontStyle,
		textStyle = p1.textStyle
	}) else ReactModule.createElement(LeaderboardTextCellModule, {
		text = UseSignalBindingResult,
		width = p1.statWidth,
		rowHeight = p1.rowHeight,
		layoutOrder = p1.layoutOrder,
		textTag = `size-full text-align-x-left text-truncate-end {p0.textTag or "text-body-small content-default"}`
	})
end)