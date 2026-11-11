local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(LastSuccessfulPoseEmoteAssetId)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isTypeOrNil(LastSuccessfulPoseEmoteAssetId, "string", "SetLastSuccessfulPoseEmoteAssetId action expects lastSuccessfulPoseEmoteAssetId to be a string or nil")
	
	return {
		lastSuccessfulPoseEmoteAssetId = LastSuccessfulPoseEmoteAssetId
	}
end)