local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(MomentsCreation.Parent.MomentsTypes)
local MakeMomentMetadataModule = require(MomentsCreation.Utils.makeMomentMetadata)
local MakeRegistrationInfoModule = require(MomentsCreation.Utils.makeRegistrationInfo)
local UploadMomentModule = require(MomentsCreation.Upload.uploadMoment)

return function(p1, p2, p3, p4)
	-- upvalues: MakeMomentMetadataModule (copy), MakeRegistrationInfoModule (copy), UploadMomentModule (copy)
	local MomentMetadataModule = MakeMomentMetadataModule(p1, p3, p2)
	UploadMomentModule(p1, MomentMetadataModule, MakeRegistrationInfoModule(p1, MomentMetadataModule), p4.localizations, p4.uploadStore, p4.toastStore, nil, nil, p4.creationSessionId)
end