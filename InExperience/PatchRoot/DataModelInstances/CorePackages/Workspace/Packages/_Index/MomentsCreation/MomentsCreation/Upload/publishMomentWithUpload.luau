local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Parent.MomentsTypes)
local makeMomentMetadataModule = require(momentsCreation.Utils.makeMomentMetadata)
local makeRegistrationInfoModule = require(momentsCreation.Utils.makeRegistrationInfo)
local uploadMomentModule = require(momentsCreation.Upload.uploadMoment)

return function(p0, p1, p2, p3)
	-- upvalues: makeMomentMetadataModule (ref), makeRegistrationInfoModule (ref), uploadMomentModule (ref)
	local var4 = makeMomentMetadataModule(p0, p2, p1, p3.resolvedTimeLength)
	uploadMomentModule(p0, var4, makeRegistrationInfoModule(p0, var4), p3.localizations, p3.uploadStore, p3.toastStore, nil, nil, p3.creationSessionId)
end