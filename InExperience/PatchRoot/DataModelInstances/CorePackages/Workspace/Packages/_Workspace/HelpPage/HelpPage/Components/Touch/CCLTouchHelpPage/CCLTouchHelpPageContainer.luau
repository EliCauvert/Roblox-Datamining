local ReactModule = require(script:FindFirstAncestor("HelpPage").Parent.React)
local CCLTouchHelpPageViewModule = require(script.Parent.CCLTouchHelpPageView)
local UseCCLTouchHelpPageViewModelModule = require(script.Parent.useCCLTouchHelpPageViewModel)

return function()
	-- upvalues: UseCCLTouchHelpPageViewModelModule (copy), ReactModule (copy), CCLTouchHelpPageViewModule (copy)
	return ReactModule.createElement(CCLTouchHelpPageViewModule, (UseCCLTouchHelpPageViewModelModule()))
end