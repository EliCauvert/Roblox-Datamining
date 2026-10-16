local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local _ = require(Parent.MomentsTypes)
local IsStudioModule = require(Parent.MomentsCommon.isStudio)
local CreateMomentModule = require(MomentsCreation.Upload.createMoment)
local GetTagsForMomentModule = require(MomentsCreation.Utils.getTagsForMoment)
local MakeMomentMetadataModule = require(MomentsCreation.Utils.makeMomentMetadata)
local MakeRegistrationInfoModule = require(MomentsCreation.Utils.makeRegistrationInfo)

return function(p1, p2, p3, p4, p5, p6): boolean --[[ Line: 16 | Named "publishMomentWithTags" ]]
	-- upvalues: IsStudioModule (copy), MakeMomentMetadataModule (copy), MakeRegistrationInfoModule (copy), GetTagsForMomentModule (copy), CreateMomentModule (copy)
	if IsStudioModule() then
		print(`[moments-creation] dev publish (not uploaded): "{p2}"`)
		
		return false
	else
		local MomentMetadataModule = MakeMomentMetadataModule(p1, p3, p2, p5, p6)
		local RegistrationInfoModule = MakeRegistrationInfoModule(p1, MomentMetadataModule, GetTagsForMomentModule(MomentMetadataModule))
		task.spawn(function() --[[ Line: 34 ]]
			-- upvalues: CreateMomentModule (upval), p1 (copy), MomentMetadataModule (copy), RegistrationInfoModule (copy), p4 (copy)
			CreateMomentModule(p1, MomentMetadataModule, RegistrationInfoModule, p4)
		end)
		
		return true
	end
end