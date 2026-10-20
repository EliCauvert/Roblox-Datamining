local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ActionBarWithContextualTextViewModule = require(script.Parent.ActionBarWithContextualTextView)
local UseActionBarWithContextualTextViewModelModule = require(script.Parent.useActionBarWithContextualTextViewModel)

return function(p1)
	-- upvalues: UseActionBarWithContextualTextViewModelModule (copy), ReactModule (copy), ActionBarWithContextualTextViewModule (copy)
	return ReactModule.createElement(ActionBarWithContextualTextViewModule, (UseActionBarWithContextualTextViewModelModule(p1)))
end