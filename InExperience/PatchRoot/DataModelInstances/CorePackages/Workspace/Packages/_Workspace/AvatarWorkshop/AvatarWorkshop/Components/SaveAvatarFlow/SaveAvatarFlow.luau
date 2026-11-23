local ReactModule = require(script:FindFirstAncestor("AvatarWorkshop").Parent.React)
local SaveAvatarFlowViewModule = require(script.Parent.SaveAvatarFlowView)
local UseSaveAvatarFlowViewModelModule = require(script.Parent.useSaveAvatarFlowViewModel)

return function(_)
	-- upvalues: UseSaveAvatarFlowViewModelModule (copy), ReactModule (copy), SaveAvatarFlowViewModule (copy)
	return ReactModule.createElement(SaveAvatarFlowViewModule, (UseSaveAvatarFlowViewModelModule()))
end