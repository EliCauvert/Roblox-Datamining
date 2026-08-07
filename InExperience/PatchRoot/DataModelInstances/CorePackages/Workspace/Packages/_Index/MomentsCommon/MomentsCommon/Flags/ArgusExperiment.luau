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

local function getExperimentConfig(p0) --[[ line: 39 ]]
	-- upvalues: argusExperimentLayerFastString (ref), argusEntryTypeKeyFastString (ref), t (ref), argusPlatformIntegrationKeyFastString (ref), argusInfluencerUploadsKeyFastString (ref)
	local var7 = (p0 or {})[argusExperimentLayerFastString] or {}
	local var8 = var7[argusEntryTypeKeyFastString]
	
	return if var8 == "flyout" or var8 == "tab" then {
		entryType = var8,
		platformIntegration = var7[argusPlatformIntegrationKeyFastString] == true,
		influencerUploads = var7[argusInfluencerUploadsKeyFastString] == true
	} else t
end

return {
	ExperimentLayer = argusExperimentLayerFastString,
	getExperimentConfig = getExperimentConfig,
	getCurrentExperimentConfig = function() --[[ line: 53 ]]
		-- upvalues: IXPService (ref), argusExperimentLayerFastString (ref), t (ref), getExperimentConfig (ref)
		local ok, status = pcall(function() --[[ line: 54 ]]
			-- upvalues: IXPService (copy), argusExperimentLayerFastString (copy)
			return IXPService:GetUserLayerVariables(argusExperimentLayerFastString)
		end)
		
		return if ok then getExperimentConfig({ [argusExperimentLayerFastString] = status }) else t
	end,
	useExperimentConfig = function(p1) --[[ line: 72 ]]
		-- upvalues: useUserExperiment (ref), argusExperimentLayerFastString (ref), getExperimentConfig (ref)
		return useUserExperiment({ argusExperimentLayerFastString }, getExperimentConfig, if p1 then p1.isExposureEnabled else nil)
	end,
	logExposure = function() --[[ line: 80 ]]
		-- upvalues: IXPService (ref), argusExperimentLayerFastString (ref)
		IXPService:LogUserLayerExposure(argusExperimentLayerFastString)
	end
}