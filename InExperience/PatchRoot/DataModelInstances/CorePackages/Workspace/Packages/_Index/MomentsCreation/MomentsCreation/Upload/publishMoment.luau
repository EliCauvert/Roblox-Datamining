local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Parent.MomentsTypes)
local makeMomentMetadataModule = require(momentsCreation.Utils.makeMomentMetadata)
local makeRegistrationInfoModule = require(momentsCreation.Utils.makeRegistrationInfo)
local createMomentModule = require(momentsCreation.Upload.createMoment)

return function(p0, p1, p2, p3, p4) --[[ line: 31 | named "publishMoment" ]]
	-- upvalues: makeMomentMetadataModule (ref), makeRegistrationInfoModule (ref), createMomentModule (ref)
	local var4 = makeMomentMetadataModule(p0, p2, p1, p4)
	createMomentModule(p0, var4, makeRegistrationInfoModule(p0, var4), p3)
end