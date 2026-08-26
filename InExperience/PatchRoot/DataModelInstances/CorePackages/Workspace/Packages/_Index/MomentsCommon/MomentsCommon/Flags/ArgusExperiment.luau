local IXPService = game:GetService("IXPService")
local useUserExperiment = require(script:FindFirstAncestor("MomentsCommon").Parent.RoactAppExperiment).useUserExperiment
game:DefineFastString("ArgusExperimentLayer", "Social.MomentsMigration")
local argusExperimentLayerFastString = game:GetFastString("ArgusExperimentLayer")
game:DefineFastString("ArgusEntryTypeKey", "entryType")
local argusEntryTypeKeyFastString = game:GetFastString("ArgusEntryTypeKey")
game:DefineFastString("ArgusPlatformIntegrationKey", "platformIntegration")
local argusPlatformIntegrationKeyFastString = game:GetFastString("ArgusPlatformIntegrationKey")
game:DefineFastString("ArgusInfluencerUploadsKey", "influencerUploads")
local argusInfluencerUploadsKeyFastString = game:GetFastString("ArgusInfluencerUploadsKey")
local t = { platformIntegration = false, influencerUploads = false }

local function getExperimentConfig(p1)
	-- upvalues: argusExperimentLayerFastString (ref), argusEntryTypeKeyFastString (ref), t (ref), argusPlatformIntegrationKeyFastString (ref), argusInfluencerUploadsKeyFastString (ref)
	local var1 = (p1 or {})[argusExperimentLayerFastString] or {}
	local var2 = var1[argusEntryTypeKeyFastString]
	
	return if var2 == "flyout" or var2 == "tab" then {
		entryType = var2,
		platformIntegration = var1[argusPlatformIntegrationKeyFastString] == true,
		influencerUploads = var1[argusInfluencerUploadsKeyFastString] == true
	} else t
end

return {
	ExperimentLayer = argusExperimentLayerFastString,
	getExperimentConfig = getExperimentConfig,
	getCurrentExperimentConfig = function()
		-- upvalues: IXPService (ref), argusExperimentLayerFastString (ref), t (ref), getExperimentConfig (ref)
		local ok, status = pcall(function()
			-- upvalues: IXPService (copy), argusExperimentLayerFastString (copy)
			return IXPService:GetUserLayerVariables(argusExperimentLayerFastString)
		end)
		
		return if ok then getExperimentConfig({ [argusExperimentLayerFastString] = status }) else t
	end,
	useExperimentConfig = function(p1)
		-- upvalues: useUserExperiment (ref), argusExperimentLayerFastString (ref), getExperimentConfig (ref)
		return useUserExperiment({ argusExperimentLayerFastString }, getExperimentConfig, if p1 then p1.isExposureEnabled else nil)
	end,
	logExposure = function()
		-- upvalues: IXPService (ref), argusExperimentLayerFastString (ref)
		IXPService:LogUserLayerExposure(argusExperimentLayerFastString)
	end
}