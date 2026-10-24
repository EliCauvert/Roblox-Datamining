local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local _ = require(Parent.MomentsTypes)
local PromiseModule = require(Parent.Promise)
local EventNames = require(Parent.MomentsCommon).Analytics.EventNames
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local CreateAvatarMomentLookModule = require(MomentsCreation.Requests.createAvatarMomentLook)
local MakePostMetadataModule = require(MomentsCreation.Utils.makePostMetadata)
local _ = require(MomentsCreation.Types.CreationFlowTypes)

local function fireAvatarMomentFailure(p1, Url, p2)
	-- upvalues: MakeCreationEventFieldsModule (copy), FireAnalyticsEventModule (copy), EventNames (copy)
	local config = { status = "GenericFailure", error = `{p1}: {Url}` }
	
	for i, value in MakeCreationEventFieldsModule.makeCreationBaseFields(p2) do
		config[i] = value
	end
	FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
end

local function postAvatarMoment(p3, OutfitId, Edits, Description, p4, CommentsEnabled, p5): boolean
	-- upvalues: MakePostMetadataModule (copy), fireAvatarMomentFailure (copy), MakeCreationEventFieldsModule (copy), FireAnalyticsEventModule (copy), EventNames (copy)
	local PostMetadataModule = MakePostMetadataModule({
		description = Description,
		edits = Edits,
		commentsEnabled = CommentsEnabled
	})
	PostMetadataModule.media = {
		{
			avatar = {
				outfitId = OutfitId,
				cameraData = p3.AvatarPost.cameraData
			}
		}
	}
	local Success, Result = pcall(function()
		-- upvalues: p5 (copy), PostMetadataModule (copy)
		(p5 or game:GetService("MomentsService")):CreatePostAsync(PostMetadataModule)
	end)
	
	if Success then
		local CreationBaseFields = MakeCreationEventFieldsModule.makeCreationBaseFields(p4)
		CreationBaseFields.captureType = "avatar"
		FireAnalyticsEventModule(EventNames.EditingFlowMomentPublished, CreationBaseFields)
		
		return true
	else
		warn(`[MomentsCreation] Avatar Moment post failed: {tostring(Result)}`)
		fireAvatarMomentFailure("AvatarPostFailed", tostring(Result), p4)
		
		return false
	end
end

return function(p3, Edits, Description, p4, CommentsEnabled, p5)
	-- upvalues: MakeCreationEventFieldsModule (copy), FireAnalyticsEventModule (copy), EventNames (copy), PromiseModule (copy), CreateAvatarMomentLookModule (copy), fireAvatarMomentFailure (copy), postAvatarMoment (copy)
	local Success, Result = pcall(p3.AvatarPost.getLookRequest)
	
	if Success then
		return CreateAvatarMomentLookModule(Result):andThen(function(Result)
			-- upvalues: fireAvatarMomentFailure (upval), p4 (copy), MakeCreationEventFieldsModule (upval), FireAnalyticsEventModule (upval), EventNames (upval), postAvatarMoment (upval), p3 (copy), Edits (copy), Description (copy), CommentsEnabled (copy), p5 (copy)
			if Result.statusCode < 200 or Result.statusCode >= 300 then
				warn(`[MomentsCreation] Avatar Look creation failed with HTTP {Result.statusCode}`)
				fireAvatarMomentFailure("AvatarPostLookCreationFailed", `HTTP {Result.statusCode}`, p4)
				
				return false
			end
			if Result.outfitId ~= nil and Result.outfitId > 0 then
				return (postAvatarMoment(p3, Result.outfitId, Edits, Description, p4, CommentsEnabled, p5))
			end
			warn("[MomentsCreation] Avatar Look response is missing a positive outfitId")
			local config = {
				status = "GenericFailure",
				error = "AvatarPostLookCreationFailed: MissingPositiveOutfitId"
			}
			
			for i, value in MakeCreationEventFieldsModule.makeCreationBaseFields(p4) do
				config[i] = value
			end
			FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
			
			return false
		end):catch(function(Err): boolean
			-- upvalues: p4 (copy), MakeCreationEventFieldsModule (upval), FireAnalyticsEventModule (upval), EventNames (upval)
			warn(`[MomentsCreation] Avatar Look request failed: {tostring(Err)}`)
			local config = {
				status = "GenericFailure",
				error = `AvatarPostLookCreationFailed: {tostring(Err)}`
			}
			
			for i, value in MakeCreationEventFieldsModule.makeCreationBaseFields(p4) do
				config[i] = value
			end
			FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
			
			return false
		end)
	end
	warn(`[MomentsCreation] Failed to build Avatar Look request: {tostring(Result)}`)
	local config = {
		status = "GenericFailure",
		error = `AvatarPostLookCreationFailed: {tostring(Result)}`
	}
	
	for i, value in MakeCreationEventFieldsModule.makeCreationBaseFields(p4) do
		config[i] = value
	end
	FireAnalyticsEventModule(EventNames.UploadCaptureFailed, config)
	
	return PromiseModule.resolve(false)
end