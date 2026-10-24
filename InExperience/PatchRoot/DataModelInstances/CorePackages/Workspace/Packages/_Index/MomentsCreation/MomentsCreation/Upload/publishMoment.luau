local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local _ = require(Parent.MomentsTypes)
local IsAvatarMomentModule = require(MomentsCreation.Utils.isAvatarMoment)
local MakeMomentMetadataModule = require(MomentsCreation.Utils.makeMomentMetadata)
local MakeRegistrationInfoModule = require(MomentsCreation.Utils.makeRegistrationInfo)
local CreateMomentModule = require(MomentsCreation.Upload.createMoment)
local FFlagMomentsCreateAvatarPosts = require(Parent.SharedFlags).FFlagMomentsCreateAvatarPosts

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: FFlagMomentsCreateAvatarPosts (copy), IsAvatarMomentModule (copy), MomentsCreation (copy), MakeMomentMetadataModule (copy), MakeRegistrationInfoModule (copy), CreateMomentModule (copy)
	if FFlagMomentsCreateAvatarPosts and IsAvatarMomentModule(p1) then
		return require(MomentsCreation.Upload.createAvatarMoment)(p1, p2, p3, p4, p6)
	else
		local MomentMetadataModule = MakeMomentMetadataModule(p1, p3, p2, p5, p6)
		CreateMomentModule(p1, MomentMetadataModule, MakeRegistrationInfoModule(p1, MomentMetadataModule), p4)
		
		return nil
	end
end