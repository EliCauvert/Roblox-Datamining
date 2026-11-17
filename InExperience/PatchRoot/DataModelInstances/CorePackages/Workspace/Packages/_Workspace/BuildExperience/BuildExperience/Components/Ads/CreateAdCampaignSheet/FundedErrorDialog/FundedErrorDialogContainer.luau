local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local FundedErrorDialogViewModule = require(script.Parent.FundedErrorDialogView)
local UseFundedErrorDialogViewModelModule = require(script.Parent.useFundedErrorDialogViewModel)

return function(p1)
	-- upvalues: UseFundedErrorDialogViewModelModule (copy), ReactModule (copy), FundedErrorDialogViewModule (copy)
	return ReactModule.createElement(FundedErrorDialogViewModule, (UseFundedErrorDialogViewModelModule(p1)))
end