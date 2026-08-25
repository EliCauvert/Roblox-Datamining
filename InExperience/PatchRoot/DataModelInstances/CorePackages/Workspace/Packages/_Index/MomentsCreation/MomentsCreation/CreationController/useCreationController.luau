local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local reactModule = require(momentsCreation.Parent.React)
local creationControllerContextModule = require(momentsCreation.CreationController.CreationControllerContext)
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function()
	-- upvalues: reactModule (ref), creationControllerContextModule (ref)
	local var3 = reactModule.useContext(creationControllerContextModule)
	assert(var3 ~= nil, "useCreationController must be used within a CreationControllerProvider")
	
	return var3
end