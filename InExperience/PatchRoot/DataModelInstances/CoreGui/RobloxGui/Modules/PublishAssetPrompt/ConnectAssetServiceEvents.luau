local assetService = game:GetService("AssetService")
local avatarCreationService = game:GetService("AvatarCreationService")
local experienceAuthService = game:GetService("ExperienceAuthService")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent
local openPublishAssetPromptModule = require(parent.Thunks.OpenPublishAssetPrompt)
local openPublishAvatarPromptModule = require(parent.Thunks.OpenPublishAvatarPrompt)
local openPublishAvatarAssetPromptModule = require(parent.Thunks.OpenPublishAvatarAssetPrompt)
local openPublishMakeupLookPromptModule = require(parent.Thunks.OpenPublishMakeupLookPrompt)
local openResultModalModule = require(parent.Thunks.OpenResultModal)
local setHumanoidModelModule = require(parent.Actions.SetHumanoidModel)
local setAccessoryInstanceModule = require(parent.Actions.SetAccessoryInstance)
local setPriceInRobuxModule = require(parent.Actions.SetPriceInRobux)
local openValidationErrorModalModule = require(parent.Actions.OpenValidationErrorModal)
local publishAssetAnalytics = require(corePackagesService.Workspace.Packages.PurchasePrompt).PublishAssetAnalytics
local getFFlagUploadMakeupSupportModule = require(parent.Flags.GetFFlagUploadMakeupSupport)
local fFlagPublishAssetPromptItemDetailsTelemetryModule = require(parent.Flags.FFlagPublishAssetPromptItemDetailsTelemetry)
local promptImportAnimationClipFromVideoAsyncEnabledEngineFeature = game:GetEngineFeature("PromptImportAnimationClipFromVideoAsyncEnabled")

local function updateModelAttachmentsWithWrapDeformers(p1)
	-- upvalues: robloxReplicatedStorageService (ref)
	p1.Parent = robloxReplicatedStorageService
	
	for i, v in p1:GetChildren() do
		if v:IsA("MeshPart") then
			local wrapDeformer = v:FindFirstChildWhichIsA("WrapDeformer")
			
			if wrapDeformer then
				for i_1, v_1 in v:GetChildren() do
					if v_1:IsA("Attachment") then
						v_1.CFrame = wrapDeformer:GetDeformedCFrameAsync(v_1.CFrame)
					end
				end
			end
		end
	end
end

local function setAnalyticsItemDetails(value)
	-- upvalues: publishAssetAnalytics (ref)
	if value.instanceToPublish or value.serializedInstance then
		publishAssetAnalytics.setItemDetails(publishAssetAnalytics.ItemType.Asset, value.assetType.Name)
		
		return
	elseif value.outfitToPublish then
		publishAssetAnalytics.setItemDetails(publishAssetAnalytics.ItemType.Outfit, Enum.OutfitType.Avatar.Name)
		
		return
	elseif value.makeupLookToPublish then
		publishAssetAnalytics.setItemDetails(publishAssetAnalytics.ItemType.Outfit, Enum.OutfitType.Makeup.Name)
		
		return
	elseif value.accessoryToPublish then
		publishAssetAnalytics.setItemDetails(publishAssetAnalytics.ItemType.Asset, value.accessoryType.Name)
	end
end

return function(value)
	-- upvalues: experienceAuthService (ref), promptImportAnimationClipFromVideoAsyncEnabledEngineFeature (ref), fFlagPublishAssetPromptItemDetailsTelemetryModule (ref), setAnalyticsItemDetails (ref), openPublishAssetPromptModule (ref), assetService (ref), openPublishAvatarPromptModule (ref), getFFlagUploadMakeupSupportModule (ref), openPublishMakeupLookPromptModule (ref), openPublishAvatarAssetPromptModule (ref), openResultModalModule (ref), avatarCreationService (ref), setAccessoryInstanceModule (ref), setPriceInRobuxModule (ref), updateModelAttachmentsWithWrapDeformers (ref), setHumanoidModelModule (ref), openValidationErrorModalModule (ref)
	local t = {}
	table.insert(t, experienceAuthService.OpenAuthPrompt:Connect(function(p2, p3, p4)
		-- upvalues: promptImportAnimationClipFromVideoAsyncEnabledEngineFeature (copy), fFlagPublishAssetPromptItemDetailsTelemetryModule (copy), setAnalyticsItemDetails (copy), value (ref), openPublishAssetPromptModule (copy), assetService (copy), openPublishAvatarPromptModule (copy), getFFlagUploadMakeupSupportModule (copy), openPublishMakeupLookPromptModule (copy), openPublishAvatarAssetPromptModule (copy)
		if #p3 == 1 and p3[1] == Enum.ExperienceAuthScope.CreatorAssetsCreate and not (promptImportAnimationClipFromVideoAsyncEnabledEngineFeature and p4.isVideoToAnimationFlow) then
			if fFlagPublishAssetPromptItemDetailsTelemetryModule then
				setAnalyticsItemDetails(p4)
			end
			if p4.instanceToPublish then
				value:dispatch(openPublishAssetPromptModule(p4.instanceToPublish, p4.assetType, p2, p3))
				
				return
			elseif p4.serializedInstance then
				value:dispatch(openPublishAssetPromptModule(assetService:DeserializeInstance(p4.serializedInstance), p4.assetType, p2, p3))
				
				return
			elseif p4.outfitToPublish then
				value:dispatch(openPublishAvatarPromptModule(p2, p3))
				
				return
			elseif getFFlagUploadMakeupSupportModule() and p4.makeupLookToPublish then
				value:dispatch(openPublishMakeupLookPromptModule(p2, p3, p4.makeupEntries))
				
				return
			elseif p4.accessoryToPublish then
				value:dispatch(openPublishAvatarAssetPromptModule(p4.accessoryType, p2, p3))
			end
		end
	end))
	table.insert(t, assetService.OpenPublishResultModal:Connect(function(p2)
		-- upvalues: value (ref), openResultModalModule (copy)
		value:dispatch(openResultModalModule(p2))
	end))
	
	local function checkNewEventsExist()
		-- upvalues: avatarCreationService (copy)
		return avatarCreationService.UgcValidationSuccess and avatarCreationService.UgcValidationFailure
	end
	
	if pcall(checkNewEventsExist) then
		table.insert(t, avatarCreationService.UgcValidationSuccess:Connect(function(p2, p3, p4)
			-- upvalues: value (ref), getFFlagUploadMakeupSupportModule (copy), avatarCreationService (copy), setAccessoryInstanceModule (copy), setPriceInRobuxModule (copy), updateModelAttachmentsWithWrapDeformers (copy), setHumanoidModelModule (copy)
			local state = value:getState()
			
			if state and (state.promptRequest.promptInfo.promptType == "PublishAvatarAsset" or getFFlagUploadMakeupSupportModule() and state.promptRequest.promptInfo.promptType == "PublishMakeupLook") then
				value:dispatch(setAccessoryInstanceModule(avatarCreationService:DeserializeAvatarModel(p3)))
				
				if p4 then
					value:dispatch(setPriceInRobuxModule(p4))
				end
				return
			elseif state and state.promptRequest.promptInfo.guid == p2 then
				local var1 = avatarCreationService:DeserializeAvatarModel(p3)
				updateModelAttachmentsWithWrapDeformers(var1)
				value:dispatch(setHumanoidModelModule(var1))
				value:dispatch(setPriceInRobuxModule(p4))
			end
		end))
	end
	if pcall(checkNewEventsExist) then
		table.insert(t, avatarCreationService.UgcValidationFailure:Connect(function(p2, p3)
			-- upvalues: value (ref), openValidationErrorModalModule (copy)
			local state = value:getState()
			
			if state and state.promptRequest.promptInfo.guid == p2 then
				value:dispatch(openValidationErrorModalModule(p3))
			end
		end))
	end
	return t
end