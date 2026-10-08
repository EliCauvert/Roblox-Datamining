local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local _ = require(parent.MomentsTypes)
local isStudioModule = require(parent.MomentsCommon.isStudio)
local createMomentModule = require(momentsCreation.Upload.createMoment)
local getTagsForMomentModule = require(momentsCreation.Utils.getTagsForMoment)
local makeMomentMetadataModule = require(momentsCreation.Utils.makeMomentMetadata)
local makeRegistrationInfoModule = require(momentsCreation.Utils.makeRegistrationInfo)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: isStudioModule (ref), makeMomentMetadataModule (ref), makeRegistrationInfoModule (ref), getTagsForMomentModule (ref), createMomentModule (ref)
	if isStudioModule() then
		print(`[moments-creation] dev publish (not uploaded): "{p2}"`)
		
		return false
	end
	local var1 = makeMomentMetadataModule(p1, p3, p2, p5, p6)
	local var2 = makeRegistrationInfoModule(p1, var1, getTagsForMomentModule(var1))
	task.spawn(function()
		-- upvalues: createMomentModule (copy), p1 (ref), var1 (ref), var2 (ref), p4 (ref)
		createMomentModule(p1, var1, var2, p4)
	end)
	
	return true
end