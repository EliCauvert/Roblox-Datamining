local ReactModule = require(script:FindFirstAncestor("VirtualEvents").Parent.React)
local PushUpsellPromptViewModule = require(script.Parent.PushUpsellPromptView)
local UsePushUpsellPromptViewModelModule = require(script.Parent.usePushUpsellPromptViewModel)

return function(p1)
	-- upvalues: UsePushUpsellPromptViewModelModule (copy), ReactModule (copy), PushUpsellPromptViewModule (copy)
	return ReactModule.createElement(PushUpsellPromptViewModule, (UsePushUpsellPromptViewModelModule(p1)))
end