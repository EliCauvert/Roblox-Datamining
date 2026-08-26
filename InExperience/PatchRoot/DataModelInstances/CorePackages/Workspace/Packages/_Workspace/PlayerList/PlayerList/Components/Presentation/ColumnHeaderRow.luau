local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local leaderboardRowShellModule = require(parent.Components.Presentation.LeaderboardRowShell)
local peopleCellModule = require(parent.Components.Presentation.PeopleCell)
local leaderboardTextCellModule = require(parent.Components.Presentation.LeaderboardTextCell)
local _ = require(parent.Common.computeStatColumns)
local gameTextTranslatorContextModule = require(parent.Common.GameTextTranslatorContext)
local getPeopleHeaderLabelModule = require(parent.Common.getPeopleHeaderLabel)
local fFlagPlayerListLocalizeGameTextModule = require(parent.Flags.FFlagPlayerListLocalizeGameText)

return reactModule.memo(function(p1)
	-- upvalues: fFlagPlayerListLocalizeGameTextModule (ref), reactModule (ref), gameTextTranslatorContextModule (ref), getPeopleHeaderLabelModule (ref), peopleCellModule (ref), leaderboardTextCellModule (ref), leaderboardRowShellModule (ref)
	local var1 = if fFlagPlayerListLocalizeGameTextModule then reactModule.useContext(gameTextTranslatorContextModule) else nil
	local t = {
		PeopleHeader = reactModule.createElement(peopleCellModule, {
			layoutOrder = 1,
			textTag = "size-full text-caption-small text-align-x-left content-emphasis",
			displayName = if fFlagPlayerListLocalizeGameTextModule then getPeopleHeaderLabelModule() else "People"
		})
	}
	
	for i, v in ipairs(p1.statColumns or {}) do
		t[`StatHeader_{v.name}`] = reactModule.createElement(leaderboardTextCellModule, {
			textTag = "size-full text-caption-small text-align-x-left content-emphasis",
			text = if var1 then var1(v.name) else v.name,
			width = p1.statWidth,
			rowHeight = p1.headerHeight,
			layoutOrder = i + 1
		})
	end
	return reactModule.createElement(leaderboardRowShellModule, {
		rowHeight = p1.headerHeight,
		layoutOrder = p1.layoutOrder
	}, t)
end)