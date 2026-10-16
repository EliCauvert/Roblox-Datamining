local AssetService = game:GetService("AssetService")
local AvatarCreationService = game:GetService("AvatarCreationService")
local ExperienceAuthService = game:GetService("ExperienceAuthService")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local Parent = script.Parent
local OpenPublishAssetPromptModule = require(Parent.Thunks.OpenPublishAssetPrompt)
local OpenPublishAvatarPromptModule = require(Parent.Thunks.OpenPublishAvatarPrompt)
local OpenPublishAvatarAssetPromptModule = require(Parent.Thunks.OpenPublishAvatarAssetPrompt)
local OpenPublishMakeupLookPromptModule = require(Parent.Thunks.OpenPublishMakeupLookPrompt)
local OpenResultModalModule = require(Parent.Thunks.OpenResultModal)
local SetHumanoidModelModule = require(Parent.Actions.SetHumanoidModel)
local SetAccessoryInstanceModule = require(Parent.Actions.SetAccessoryInstance)
local SetPriceInRobuxModule = require(Parent.Actions.SetPriceInRobux)
local OpenValidationErrorModalModule = require(Parent.Actions.OpenValidationErrorModal)
local PublishAssetAnalytics = require(game:GetService("CorePackages").Workspace.Packages.PurchasePrompt).PublishAssetAnalytics
local GetFFlagUploadMakeupSupportModule = require(Parent.Flags.GetFFlagUploadMakeupSupport)
local FFlagPublishAssetPromptItemDetailsTelemetryModule = require(Parent.Flags.FFlagPublishAssetPromptItemDetailsTelemetry)
local PromptImportAnimationClipFromVideoAsyncEnabledEngineFeature = game:GetEngineFeature("PromptImportAnimationClipFromVideoAsyncEnabled")

local function updateModelAttachmentsWithWrapDeformers(DeserializeAvatarModelResult) --[[ Line: 32 ]]
	-- upvalues: RobloxReplicatedStorage (copy)
	DeserializeAvatarModelResult.Parent = RobloxReplicatedStorage
	
	for _, Part in DeserializeAvatarModelResult:GetChildren() do
		if Part:IsA("MeshPart") then
			local WrapDeformer = Part:FindFirstChildWhichIsA("WrapDeformer")
			
			if WrapDeformer then
				for _, Attachment in Part:GetChildren() do
					if Attachment:IsA("Attachment") then
						Attachment.CFrame = WrapDeformer:GetDeformedCFrameAsync(Attachment.CFrame)
					end
				end
			end
		end
	end
end

local function setAnalyticsItemDetails(p1) --[[ Line: 56 ]]
	-- upvalues: PublishAssetAnalytics (copy)
	if p1.instanceToPublish or p1.serializedInstance then
		PublishAssetAnalytics.setItemDetails(PublishAssetAnalytics.ItemType.Asset, p1.assetType.Name)
		
		return
	end
	if p1.outfitToPublish then
		PublishAssetAnalytics.setItemDetails(PublishAssetAnalytics.ItemType.Outfit, Enum.OutfitType.Avatar.Name)
		
		return
	end
	if p1.makeupLookToPublish then
		PublishAssetAnalytics.setItemDetails(PublishAssetAnalytics.ItemType.Outfit, Enum.OutfitType.Makeup.Name)
		
		return
	end
	if p1.accessoryToPublish then
		PublishAssetAnalytics.setItemDetails(PublishAssetAnalytics.ItemType.Asset, p1.accessoryType.Name)
	end
end

return function(p1) --[[ Line: 68 | Named "ConnectAssetServiceEvents" ]]
	-- upvalues: ExperienceAuthService (copy), PromptImportAnimationClipFromVideoAsyncEnabledEngineFeature (copy), FFlagPublishAssetPromptItemDetailsTelemetryModule (copy), setAnalyticsItemDetails (copy), OpenPublishAssetPromptModule (copy), AssetService (copy), OpenPublishAvatarPromptModule (copy), GetFFlagUploadMakeupSupportModule (copy), OpenPublishMakeupLookPromptModule (copy), OpenPublishAvatarAssetPromptModule (copy), OpenResultModalModule (copy), AvatarCreationService (copy), SetAccessoryInstanceModule (copy), SetPriceInRobuxModule (copy), updateModelAttachmentsWithWrapDeformers (copy), SetHumanoidModelModule (copy), OpenValidationErrorModalModule (copy)
	local List = {}
	table.insert(List, ExperienceAuthService.OpenAuthPrompt:Connect(function(Guid, Entry, Metadata) --[[ Line: 74 ]]
		-- upvalues: PromptImportAnimationClipFromVideoAsyncEnabledEngineFeature (upval), FFlagPublishAssetPromptItemDetailsTelemetryModule (upval), setAnalyticsItemDetails (upval), p1 (copy), OpenPublishAssetPromptModule (upval), AssetService (upval), OpenPublishAvatarPromptModule (upval), GetFFlagUploadMakeupSupportModule (upval), OpenPublishMakeupLookPromptModule (upval), OpenPublishAvatarAssetPromptModule (upval)
		local IsVideoToAnimationFlow = PromptImportAnimationClipFromVideoAsyncEnabledEngineFeature and Metadata.isVideoToAnimationFlow
		
		if #Entry == 1 and Entry[1] == Enum.ExperienceAuthScope.CreatorAssetsCreate and not IsVideoToAnimationFlow then
			if FFlagPublishAssetPromptItemDetailsTelemetryModule then
				setAnalyticsItemDetails(Metadata)
			end
			if Metadata.instanceToPublish then
				p1:dispatch(OpenPublishAssetPromptModule(Metadata.instanceToPublish, Metadata.assetType, Guid, Entry))
				
				return
			end
			if Metadata.serializedInstance then
				p1:dispatch(OpenPublishAssetPromptModule(AssetService:DeserializeInstance(Metadata.serializedInstance), Metadata.assetType, Guid, Entry))
				
				return
			end
			if Metadata.outfitToPublish then
				p1:dispatch(OpenPublishAvatarPromptModule(Guid, Entry))
				
				return
			end
			if GetFFlagUploadMakeupSupportModule() and Metadata.makeupLookToPublish then
				p1:dispatch(OpenPublishMakeupLookPromptModule(Guid, Entry, Metadata.makeupEntries))
				
				return
			end
			if Metadata.accessoryToPublish then
				p1:dispatch(OpenPublishAvatarAssetPromptModule(Metadata.accessoryType, Guid, Entry))
			end
		end
	end))
	table.insert(List, AssetService.OpenPublishResultModal:Connect(function(ResultType) --[[ Line: 111 ]]
		-- upvalues: p1 (copy), OpenResultModalModule (upval)
		p1:dispatch(OpenResultModalModule(ResultType))
	end))
	
	local function checkNewEventsExist() --[[ Line: 115 ]]
		-- upvalues: AvatarCreationService (upval)
		return AvatarCreationService.UgcValidationSuccess and AvatarCreationService.UgcValidationFailure
	end
	
	if pcall(checkNewEventsExist) then
		table.insert(List, AvatarCreationService.UgcValidationSuccess:Connect(function(Guid, SerializedModel, Price) --[[ Line: 123 ]]
			-- upvalues: p1 (copy), GetFFlagUploadMakeupSupportModule (upval), AvatarCreationService (upval), SetAccessoryInstanceModule (upval), SetPriceInRobuxModule (upval), updateModelAttachmentsWithWrapDeformers (upval), SetHumanoidModelModule (upval)
			local State = p1:getState()
			
			if State and (State.promptRequest.promptInfo.promptType == "PublishAvatarAsset" or GetFFlagUploadMakeupSupportModule() and State.promptRequest.promptInfo.promptType == "PublishMakeupLook") then
				p1:dispatch(SetAccessoryInstanceModule((AvatarCreationService:DeserializeAvatarModel(SerializedModel))))
				
				if Price then
					p1:dispatch(SetPriceInRobuxModule(Price))
				end
				return
			elseif State and State.promptRequest.promptInfo.guid == Guid then
				local DeserializeAvatarModelResult = AvatarCreationService:DeserializeAvatarModel(SerializedModel)
				updateModelAttachmentsWithWrapDeformers(DeserializeAvatarModelResult)
				p1:dispatch(SetHumanoidModelModule(DeserializeAvatarModelResult))
				p1:dispatch(SetPriceInRobuxModule(Price))
			end
		end))
	end
	if pcall(checkNewEventsExist) then
		table.insert(List, AvatarCreationService.UgcValidationFailure:Connect(function(Guid, ErrorMessage) --[[ Line: 162 ]]
			-- upvalues: p1 (copy), OpenValidationErrorModalModule (upval)
			local State = p1:getState()
			
			if State and State.promptRequest.promptInfo.guid == Guid then
				p1:dispatch(OpenValidationErrorModalModule(ErrorMessage))
			end
		end))
	end
	return List
end