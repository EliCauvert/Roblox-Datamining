local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local PPEThumbnailTypeModule = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)
local MutedErrorModule = require(Modules.LuaApp.mutedError)

return require(CorePackages.Packages.Rodux).createReducer({
	lastSuccessfulPoseEmoteAssetId = nil,
	emoteAssetId = nil,
	fieldOfViewDeg = nil,
	ppeEmoteLoadingCount = 0,
	ppeVersion = {
		[PPEThumbnailTypeModule.Closeup] = 0,
		[PPEThumbnailTypeModule.FullBody] = 0
	}
}, {
	[require(Modules.AvatarExperience.ProfilePictureEditor.Actions.StartPPEEmoteLoading).name] = function(p1, _)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { ppeEmoteLoadingCount = p1.ppeEmoteLoadingCount + 1 })
	end,
	[require(Modules.AvatarExperience.ProfilePictureEditor.Actions.CompletePPEEmoteLoading).name] = function(p1, _)
		-- upvalues: MutedErrorModule (copy), CryoModule (copy)
		local PpeEmoteLoadingCountDelta = p1.ppeEmoteLoadingCount - 1
		
		if PpeEmoteLoadingCountDelta < 0 then
			MutedErrorModule("newPPEEmoteLoadingCount is less than 0")
		end
		return CryoModule.Dictionary.join(p1, { ppeEmoteLoadingCount = PpeEmoteLoadingCountDelta })
	end,
	[require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetLastSuccessfulPoseEmoteAssetId).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			lastSuccessfulPoseEmoteAssetId = p2.lastSuccessfulPoseEmoteAssetId or CryoModule.None
		})
	end,
	[require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetEmoteAssetId).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { emoteAssetId = p2.emoteAssetId or CryoModule.None })
	end,
	[require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetFieldOfViewDeg).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { fieldOfViewDeg = p2.fieldOfViewDeg or CryoModule.None })
	end,
	[require(Modules.AvatarExperience.ProfilePictureEditor.Actions.IncrementPPEVersion).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			ppeVersion = CryoModule.Dictionary.join(p1.ppeVersion, {
				[p2.thumbnailType] = p1.ppeVersion[p2.thumbnailType] + 1
			})
		})
	end
})