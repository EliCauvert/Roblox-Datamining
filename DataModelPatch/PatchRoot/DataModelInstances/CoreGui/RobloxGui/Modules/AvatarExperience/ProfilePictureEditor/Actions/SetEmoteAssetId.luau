local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return (require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(EmoteAssetId)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isTypeOrNil(EmoteAssetId, "string", "SetEmoteAssetId action expects emoteAssetId to be a string or nil")
	
	return { emoteAssetId = EmoteAssetId }
end))