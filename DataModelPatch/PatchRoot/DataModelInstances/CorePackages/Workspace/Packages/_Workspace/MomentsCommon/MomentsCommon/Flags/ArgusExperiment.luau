local IXPService = game:GetService("IXPService")
local UseUserExperimentFunction = require(script:FindFirstAncestor("MomentsCommon").Parent.RoactAppExperiment).useUserExperiment
game:DefineFastString("ArgusExperimentLayer", "Social.MomentsMigration")
local ArgusExperimentLayerFastString = game:GetFastString("ArgusExperimentLayer")
game:DefineFastString("ArgusEntryTypeKey", "entryType")
local ArgusEntryTypeKeyFastString = game:GetFastString("ArgusEntryTypeKey")
game:DefineFastString("ArgusPlatformIntegrationKey", "platformIntegration")
local ArgusPlatformIntegrationKeyFastString = game:GetFastString("ArgusPlatformIntegrationKey")
game:DefineFastString("ArgusInfluencerUploadsKey", "influencerUploads")
local ArgusInfluencerUploadsKeyFastString = game:GetFastString("ArgusInfluencerUploadsKey")
local config = { platformIntegration = false, influencerUploads = false }

local function getExperimentConfig(p1)
	-- upvalues: ArgusExperimentLayerFastString (copy), ArgusEntryTypeKeyFastString (copy), config (copy), ArgusPlatformIntegrationKeyFastString (copy), ArgusInfluencerUploadsKeyFastString (copy)
	local Entry = (p1 or {})[ArgusExperimentLayerFastString] or {}
	local Entry1 = Entry[ArgusEntryTypeKeyFastString]
	
	return if Entry1 == "flyout" or Entry1 == "tab" then {
		entryType = Entry1,
		platformIntegration = Entry[ArgusPlatformIntegrationKeyFastString] == true,
		influencerUploads = Entry[ArgusInfluencerUploadsKeyFastString] == true
	} else config
end

return {
	ExperimentLayer = ArgusExperimentLayerFastString,
	getExperimentConfig = getExperimentConfig,
	getCurrentExperimentConfig = function()
		-- upvalues: IXPService (copy), ArgusExperimentLayerFastString (copy), config (copy), getExperimentConfig (copy)
		local Success, Result = pcall(function()
			-- upvalues: IXPService (upval), ArgusExperimentLayerFastString (upval)
			return IXPService:GetUserLayerVariables(ArgusExperimentLayerFastString)
		end)
		
		return if Success then getExperimentConfig({ [ArgusExperimentLayerFastString] = Result }) else config
	end,
	useExperimentConfig = function(p1)
		-- upvalues: UseUserExperimentFunction (copy), ArgusExperimentLayerFastString (copy), getExperimentConfig (copy)
		return UseUserExperimentFunction({ ArgusExperimentLayerFastString }, getExperimentConfig, if p1 then p1.isExposureEnabled else nil)
	end,
	logExposure = function()
		-- upvalues: IXPService (copy), ArgusExperimentLayerFastString (copy)
		IXPService:LogUserLayerExposure(ArgusExperimentLayerFastString)
	end
}