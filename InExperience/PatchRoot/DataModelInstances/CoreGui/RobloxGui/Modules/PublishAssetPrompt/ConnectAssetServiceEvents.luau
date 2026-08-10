local assetService = game:GetService("AssetService")
local avatarCreationService = game:GetService("AvatarCreationService")
local experienceAuthService = game:GetService("ExperienceAuthService")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
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
local getFFlagUploadMakeupSupportModule = require(parent.Flags.GetFFlagUploadMakeupSupport)
local promptImportAnimationClipFromVideoAsyncEnabledEngineFeature = game:GetEngineFeature("PromptImportAnimationClipFromVideoAsyncEnabled")

local function updateModelAttachmentsWithWrapDeformers(p0) --[[ line: 28 ]]
	-- upvalues: robloxReplicatedStorageService (ref)
	p0.Parent = robloxReplicatedStorageService
	
	for i, v in p0:GetChildren() do
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

return function(value) --[[ line: 52 | named "ConnectAssetServiceEvents" ]]
	-- upvalues: experienceAuthService (ref), promptImportAnimationClipFromVideoAsyncEnabledEngineFeature (ref), openPublishAssetPromptModule (ref), assetService (ref), openPublishAvatarPromptModule (ref), getFFlagUploadMakeupSupportModule (ref), openPublishMakeupLookPromptModule (ref), openPublishAvatarAssetPromptModule (ref), openResultModalModule (ref), avatarCreationService (ref), setAccessoryInstanceModule (ref), setPriceInRobuxModule (ref), updateModelAttachmentsWithWrapDeformers (ref), setHumanoidModelModule (ref), openValidationErrorModalModule (ref)
	local t = {}
	table.insert(t, experienceAuthService.OpenAuthPrompt:Connect(function(p1, p2, p3) --[[ line: 58 ]]
		-- upvalues: promptImportAnimationClipFromVideoAsyncEnabledEngineFeature (copy), value (ref), openPublishAssetPromptModule (copy), assetService (copy), openPublishAvatarPromptModule (copy), getFFlagUploadMakeupSupportModule (copy), openPublishMakeupLookPromptModule (copy), openPublishAvatarAssetPromptModule (copy)
		if #p2 == 1 and p2[1] == Enum.ExperienceAuthScope.CreatorAssetsCreate and not (promptImportAnimationClipFromVideoAsyncEnabledEngineFeature and p3.isVideoToAnimationFlow) then
			if p3.instanceToPublish then
				value:dispatch(openPublishAssetPromptModule(p3.instanceToPublish, p3.assetType, p1, p2))
				
				return
			elseif p3.serializedInstance then
				value:dispatch(openPublishAssetPromptModule(assetService:DeserializeInstance(p3.serializedInstance), p3.assetType, p1, p2))
				
				return
			elseif p3.outfitToPublish then
				value:dispatch(openPublishAvatarPromptModule(p1, p2))
				
				return
			elseif getFFlagUploadMakeupSupportModule() and p3.makeupLookToPublish then
				value:dispatch(openPublishMakeupLookPromptModule(p1, p2, p3.makeupEntries))
				
				return
			elseif p3.accessoryToPublish then
				value:dispatch(openPublishAvatarAssetPromptModule(p3.accessoryType, p1, p2))
			end
		end
	end))
	table.insert(t, assetService.OpenPublishResultModal:Connect(function(p4) --[[ line: 91 ]]
		-- upvalues: value (ref), openResultModalModule (copy)
		value:dispatch(openResultModalModule(p4))
	end))
	
	local function checkNewEventsExist() --[[ line: 95 ]]
		-- upvalues: avatarCreationService (copy)
		return avatarCreationService.UgcValidationSuccess and avatarCreationService.UgcValidationFailure
	end
	
	if pcall(checkNewEventsExist) then
		table.insert(t, avatarCreationService.UgcValidationSuccess:Connect(function(p5, p6, p7) --[[ line: 103 ]]
			-- upvalues: value (ref), getFFlagUploadMakeupSupportModule (copy), avatarCreationService (copy), setAccessoryInstanceModule (copy), setPriceInRobuxModule (copy), updateModelAttachmentsWithWrapDeformers (copy), setHumanoidModelModule (copy)
			local state = value:getState()
			
			if state and (state.promptRequest.promptInfo.promptType == "PublishAvatarAsset" or getFFlagUploadMakeupSupportModule() and state.promptRequest.promptInfo.promptType == "PublishMakeupLook") then
				value:dispatch(setAccessoryInstanceModule(avatarCreationService:DeserializeAvatarModel(p6)))
				
				if p7 then
					value:dispatch(setPriceInRobuxModule(p7))
				end
				return
			elseif state and state.promptRequest.promptInfo.guid == p5 then
				local var20 = avatarCreationService:DeserializeAvatarModel(p6)
				updateModelAttachmentsWithWrapDeformers(var20)
				value:dispatch(setHumanoidModelModule(var20))
				value:dispatch(setPriceInRobuxModule(p7))
			end
		end))
	end
	if pcall(checkNewEventsExist) then
		table.insert(t, avatarCreationService.UgcValidationFailure:Connect(function(p8, p9) --[[ line: 142 ]]
			-- upvalues: value (ref), openValidationErrorModalModule (copy)
			local state = value:getState()
			
			if state and state.promptRequest.promptInfo.guid == p8 then
				value:dispatch(openValidationErrorModalModule(p9))
			end
		end))
	end
	return t
end