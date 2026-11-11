local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(MomentsCreation.Parent.MomentsTypes)
local MakeMomentMetadataModule = require(MomentsCreation.Utils.makeMomentMetadata)
local MakeRegistrationInfoModule = require(MomentsCreation.Utils.makeRegistrationInfo)
local CreateMomentModule = require(MomentsCreation.Upload.createMoment)

return function(p1, p2, p3)
	-- upvalues: MakeMomentMetadataModule (copy), MakeRegistrationInfoModule (copy), CreateMomentModule (copy)
	local MomentMetadataModule = MakeMomentMetadataModule(p1, p3, p2)
	CreateMomentModule(p1, MomentMetadataModule, (MakeRegistrationInfoModule(p1, MomentMetadataModule)))
end