local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local CurveAnimationHierarchyUtilsModule = require(Parent.util.CurveAnimationHierarchyUtils)
local CurveAnimBoneHierarchyUtilsModule = require(Parent.util.CurveAnimBoneHierarchyUtils)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		ValidationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations },
	conditionalData = { ValidationEnumsModule.SharedDataMember.curveAnimBoneData },
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p1, p2)
		-- upvalues: CurveAnimationHierarchyUtilsModule (copy), CurveAnimBoneHierarchyUtilsModule (copy), ErrorSourceStringsModule (copy)
		for _, curveAnimation in p2.curveAnimations do
			for _, Folder in curveAnimation:GetDescendants() do
				if Folder:IsA("Folder") then
					local IsBodyPartFolderNameValid = CurveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(Folder.Name)
					local IsBoneFolderName = CurveAnimBoneHierarchyUtilsModule.isBoneFolderName(Folder.Name)
					
					if CurveAnimationHierarchyUtilsModule.folderHasAnimationTracks(Folder) and not IsBodyPartFolderNameValid and not IsBoneFolderName then
						p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidBoneName, { boneName = Folder.Name })
					end
				end
			end
		end
	end
}