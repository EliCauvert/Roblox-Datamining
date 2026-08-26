local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Parent.MomentsTypes)
local makeMomentMetadataModule = require(momentsCreation.Utils.makeMomentMetadata)
local makeRegistrationInfoModule = require(momentsCreation.Utils.makeRegistrationInfo)
local uploadMomentModule = require(momentsCreation.Upload.uploadMoment)

return function(p1, p2, p3, p4)
	-- upvalues: makeMomentMetadataModule (ref), makeRegistrationInfoModule (ref), uploadMomentModule (ref)
	local var1 = makeMomentMetadataModule(p1, p3, p2, p4.resolvedTimeLength)
	uploadMomentModule(p1, var1, makeRegistrationInfoModule(p1, var1), p4.localizations, p4.uploadStore, p4.toastStore, nil, nil, p4.creationSessionId)
end