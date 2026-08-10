local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local leaderboardRowShellModule = require(parent.Components.Presentation.LeaderboardRowShell)
local peopleCellModule = require(parent.Components.Presentation.PeopleCell)
local leaderboardTextCellModule = require(parent.Components.Presentation.LeaderboardTextCell)
local _ = require(parent.Common.computeStatColumns)
local gameTextTranslatorContextModule = require(parent.Common.GameTextTranslatorContext)
local getPeopleHeaderLabelModule = require(parent.Common.getPeopleHeaderLabel)
local fFlagPlayerListLocalizeGameTextModule = require(parent.Flags.FFlagPlayerListLocalizeGameText)

return reactModule.memo(function(p0) --[[ line: 18 | named "ColumnHeaderRow" ]]
	-- upvalues: fFlagPlayerListLocalizeGameTextModule (ref), reactModule (ref), gameTextTranslatorContextModule (ref), getPeopleHeaderLabelModule (ref), peopleCellModule (ref), leaderboardTextCellModule (ref), leaderboardRowShellModule (ref)
	local var7 = if fFlagPlayerListLocalizeGameTextModule then reactModule.useContext(gameTextTranslatorContextModule) else nil
	local t = {
		PeopleHeader = reactModule.createElement(peopleCellModule, {
			layoutOrder = 1,
			textTag = "size-full text-caption-small text-align-x-left content-emphasis",
			displayName = if fFlagPlayerListLocalizeGameTextModule then getPeopleHeaderLabelModule() else "People"
		})
	}
	
	for i, v in ipairs(p0.statColumns or {}) do
		t[`StatHeader_{v.name}`] = reactModule.createElement(leaderboardTextCellModule, {
			textTag = "size-full text-caption-small text-align-x-left content-emphasis",
			text = if var7 then var7(v.name) else v.name,
			width = p0.statWidth,
			rowHeight = p0.headerHeight,
			layoutOrder = i + 1
		})
	end
	return reactModule.createElement(leaderboardRowShellModule, {
		rowHeight = p0.headerHeight,
		layoutOrder = p0.layoutOrder
	}, t)
end)