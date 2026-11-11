local CaptureService = game:GetService("CaptureService")
local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local _ = require(Parent.MomentsTypes)
local EventNames = require(Parent.MomentsCommon).Analytics.EventNames
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local v1 = game
local CaptureServiceUploadUniverseIdOverrideEngineFeature = game:GetEngineFeature("CaptureServiceUploadUniverseIdOverride")
game:DefineFastString("MomentsUploadUniverseId", "8357232245")

local function _(Tbl)
	-- upvalues: v1 (copy)
	local GameId: number = v1.GameId
	
	if GameId == nil or GameId <= 0 then
		local Copy = table.clone(Tbl)
		Copy.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
		
		return Copy
	else
		return Tbl
	end
end

return function(Capture, Tbl, FeedRegistrationInfo)
	-- upvalues: CaptureServiceUploadUniverseIdOverrideEngineFeature (copy), v1 (copy), CaptureService (copy), FireAnalyticsEventModule (copy), EventNames (copy), MakeCreationEventFieldsModule (copy)
	local MomentMetadata = nil
	if CaptureServiceUploadUniverseIdOverrideEngineFeature then
		local GameId: number = v1.GameId
		
		if GameId == nil or GameId <= 0 then
			local Copy = table.clone(Tbl)
			Copy.universeIdOverride = tonumber(game:GetFastString("MomentsUploadUniverseId"))
			MomentMetadata = Copy
		else
			MomentMetadata = Tbl
		end
	else
		MomentMetadata = Tbl
	end
	pcall(function()
		-- upvalues: CaptureService (upval), Capture (copy), MomentMetadata (copy), FeedRegistrationInfo (copy)
		CaptureService:UploadCaptureAndPostMoment(Capture, MomentMetadata, FeedRegistrationInfo)
	end)
	FireAnalyticsEventModule(EventNames.EditingFlowMomentPublished, MakeCreationEventFieldsModule.makeCaptureDescriptorFields(Capture))
end