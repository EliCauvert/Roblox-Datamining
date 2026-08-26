local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local reactModule = require(momentsCreation.Parent.React)
local creationControllerContextModule = require(momentsCreation.CreationController.CreationControllerContext)
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function()
	-- upvalues: reactModule (ref), creationControllerContextModule (ref)
	local var1 = reactModule.useContext(creationControllerContextModule)
	assert(var1 ~= nil, "useCreationController must be used within a CreationControllerProvider")
	
	return var1
end