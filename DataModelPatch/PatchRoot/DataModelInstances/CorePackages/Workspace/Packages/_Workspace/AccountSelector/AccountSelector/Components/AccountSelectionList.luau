local DependenciesModule = require(script.Parent.Parent.dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local Dash = DependenciesModule.Dash
local ScrollingListTable = UIBlox.App.Table.ScrollingListTable
local ListTable = UIBlox.App.Table.ListTable
local AccountSelectionModule = require(script.Parent.AccountSelection)
local DisableAccountSelectionListScrollingRelease2 = game:DefineFastFlag("DisableAccountSelectionListScrollingRelease2", false)

return function(p1)
	-- upvalues: React (copy), AccountSelectionModule (copy), DisableAccountSelectionListScrollingRelease2 (copy), ScrollingListTable (copy), Dash (copy), ListTable (copy)
	local function createAccountSelectionCell(User)
		-- upvalues: React (upval), AccountSelectionModule (upval), p1 (copy)
		return React.createElement(AccountSelectionModule, {
			user = User,
			onAccountSelection = p1.onAccountSelection,
			isDisabled = p1.isDisabled
		})
	end
	
	return if DisableAccountSelectionListScrollingRelease2 and not p1.isScrollable then React.createElement(ListTable, {
		showDividers = false,
		size = UDim2.new(1, 0, 0, p1.height),
		cells = Dash.map(p1.users, createAccountSelectionCell)
	}) else React.createElement(ScrollingListTable, {
		size = UDim2.new(1, 0, 0, p1.height),
		cells = Dash.map(p1.users, createAccountSelectionCell)
	})
end