local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local ReactModule = require(MomentsCreation.Parent.React)
local CreationControllerContextModule = require(MomentsCreation.CreationController.CreationControllerContext)
local _ = require(MomentsCreation.Types.CreationFlowTypes)

return function() --[[ Line: 14 | Named "useCreationController" ]]
	-- upvalues: ReactModule (copy), CreationControllerContextModule (copy)
	local UseContextResult = ReactModule.useContext(CreationControllerContextModule)
	assert(UseContextResult ~= nil, "useCreationController must be used within a CreationControllerProvider")
	
	return UseContextResult
end