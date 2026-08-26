local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Parent.MomentsTypes)
local makeMomentMetadataModule = require(momentsCreation.Utils.makeMomentMetadata)
local makeRegistrationInfoModule = require(momentsCreation.Utils.makeRegistrationInfo)
local createMomentModule = require(momentsCreation.Upload.createMoment)

return function(p1, p2, p3, p4, p5)
	-- upvalues: makeMomentMetadataModule (ref), makeRegistrationInfoModule (ref), createMomentModule (ref)
	local var1 = makeMomentMetadataModule(p1, p3, p2, p5)
	createMomentModule(p1, var1, makeRegistrationInfoModule(p1, var1), p4)
end