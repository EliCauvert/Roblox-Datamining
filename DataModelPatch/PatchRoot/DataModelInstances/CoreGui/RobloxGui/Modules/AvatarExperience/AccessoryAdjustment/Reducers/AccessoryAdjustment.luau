local Parent = script.Parent

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	AdjustmentTypeSelected = require(Parent.AdjustmentTypeSelected),
	SelectedAccessory = require(Parent.SelectedAccessory)
})