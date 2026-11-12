local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local LeaderboardRowShellModule = require(Parent.Components.Presentation.LeaderboardRowShell)
local PeopleCellModule = require(Parent.Components.Presentation.PeopleCell)
local LeaderboardTextCellModule = require(Parent.Components.Presentation.LeaderboardTextCell)
local _ = require(Parent.Common.computeStatColumns)
local GameTextTranslatorContextModule = require(Parent.Common.GameTextTranslatorContext)
local GetPeopleHeaderLabelModule = require(Parent.Common.getPeopleHeaderLabel)
local FFlagPlayerListLocalizeGameTextModule = require(Parent.Flags.FFlagPlayerListLocalizeGameText)

return ReactModule.memo(function(p1)
	-- upvalues: FFlagPlayerListLocalizeGameTextModule (copy), ReactModule (copy), GameTextTranslatorContextModule (copy), GetPeopleHeaderLabelModule (copy), PeopleCellModule (copy), LeaderboardTextCellModule (copy), LeaderboardRowShellModule (copy)
	local UseContextResult = if FFlagPlayerListLocalizeGameTextModule then ReactModule.useContext(GameTextTranslatorContextModule) else nil
	local config = {
		PeopleHeader = ReactModule.createElement(PeopleCellModule, {
			layoutOrder = 1,
			textTag = "size-full text-caption-small text-align-x-left content-emphasis",
			displayName = if FFlagPlayerListLocalizeGameTextModule then GetPeopleHeaderLabelModule() else "People"
		})
	}
	
	for i, value in ipairs(p1.statColumns or {}) do
		config[`StatHeader_{value.name}`] = ReactModule.createElement(LeaderboardTextCellModule, {
			textTag = "size-full text-caption-small text-align-x-left content-emphasis",
			text = if UseContextResult then UseContextResult(value.name) else value.name,
			width = p1.statWidth,
			rowHeight = p1.headerHeight,
			layoutOrder = i + 1
		})
	end
	return ReactModule.createElement(LeaderboardRowShellModule, {
		rowHeight = p1.headerHeight,
		layoutOrder = p1.layoutOrder
	}, config)
end)