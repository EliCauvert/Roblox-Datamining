local InsertService = game:GetService("InsertService")
local UGCValidationService = game:GetService("UGCValidationService")
local Players = game:GetService("Players")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local GetFFlagAXSupportShoesInItemViewportModule = require(Modules.AvatarExperience.Flags.GetFFlagAXSupportShoesInItemViewport)
local AXSupportPBRInItemViewport = game:DefineFastFlag("AXSupportPBRInItemViewport", false)
local ItemViewportFallbackCameraMaxDistanceRatio = game:DefineFastInt("ItemViewportFallbackCameraMaxDistance", 10000) / 1000
local ItemViewportFallbackCameraZoomOutFactorRatio = game:DefineFastInt("ItemViewportFallbackCameraZoomOutFactor", 1100) / 1000

local function waitForChildOfClass(Object, ClassName)
	local ClassName1 = Object:FindFirstChildOfClass(ClassName)
	while not ClassName1 do
		Object.ChildAdded:Wait()
		ClassName1 = Object:FindFirstChildOfClass(ClassName)
	end
	return ClassName1
end

return {
	getAssetModel = function(p1)
		-- upvalues: AXSupportPBRInItemViewport (copy), UGCValidationService (copy), InsertService (copy), GetFFlagAXSupportShoesInItemViewportModule (copy), waitForChildOfClass (copy)
		local Model = nil
		if AXSupportPBRInItemViewport then
			Model = Instance.new("Model")
			UGCValidationService:FetchAssetWithFormat(`https://assetgame.roblox.com/asset/?id={p1}`, "rbx-format/avatar_meshpart_accessory")[1].Parent = Model
		else
			Model = InsertService:LoadAsset((tonumber(p1)))
		end
		local Accessory = nil
		if GetFFlagAXSupportShoesInItemViewportModule() then
			Accessory = waitForChildOfClass(Model, "Accessory")
		else
			Accessory = Model:FindFirstChildOfClass("Accessory")
			while not Accessory do
				Model.ChildAdded:Wait()
				Accessory = Model:FindFirstChildOfClass("Accessory")
			end
		end
		local Inverted = Accessory.AttachmentPoint:Inverse()
		Model:PivotTo(Inverted - Inverted.Position)
		
		return Model
	end,
	getShoesModel = function(List)
		-- upvalues: ConstantsModule (copy), InsertService (copy), waitForChildOfClass (copy)
		local Model = Instance.new("Model")
		
		for _, value in List do
			if value.type == ConstantsModule.ItemType.Asset then
				local Asset = InsertService:LoadAsset((tonumber(value.id)))
				local MeshPart = waitForChildOfClass(waitForChildOfClass(Asset, "Accessory"), "MeshPart")
				MeshPart.Parent = Model
				local HasLeftFootAttachment = MeshPart:FindFirstChild("LeftFootAttachment") ~= nil
				local HasRightFootAttachment = MeshPart:FindFirstChild("RightFootAttachment") ~= nil
				assert(HasLeftFootAttachment or HasRightFootAttachment, "Couldn't distinguish between left and right shoe because no foot attachment was found")
				local NewX = 0.05 + MeshPart.Size.X / 2
				MeshPart.CFrame = CFrame.new(if HasLeftFootAttachment then -NewX else NewX, 0, 0)
				Asset:Destroy()
			end
		end
		return Model
	end,
	getAvatarModel = function(List, p2)
		-- upvalues: ConstantsModule (copy), Players (copy)
		local Number: number? = nil
		
		for _, value in List do
			if value.type == ConstantsModule.ItemType.Outfit then
				Number = tonumber(value.id)
				break
			end
		end
		assert(Number, "No outfit ID found in bundle items")
		local HumanoidModelFromDescriptionAsync = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:CreateHumanoidModelFromDescriptionAsync(Players:GetHumanoidDescriptionFromOutfitIdAsync(Number), Enum.HumanoidRigType.R15) else Players:CreateHumanoidModelFromDescription(Players:GetHumanoidDescriptionFromOutfitId(Number), Enum.HumanoidRigType.R15)
		
		if p2 then
			local Humanoid = HumanoidModelFromDescriptionAsync:FindFirstChildOfClass("Humanoid")
			
			for _, child in HumanoidModelFromDescriptionAsync:GetChildren() do
				if child ~= Humanoid and Humanoid and Humanoid:GetLimb(child) ~= Enum.Limb.Head then
					child:Destroy()
				end
			end
		end
		HumanoidModelFromDescriptionAsync.Parent = workspace
		HumanoidModelFromDescriptionAsync.Parent = nil
		HumanoidModelFromDescriptionAsync:PivotTo(CFrame.new(-(HumanoidModelFromDescriptionAsync:GetBoundingBox().Position - HumanoidModelFromDescriptionAsync:GetPivot().Position)))
		
		return HumanoidModelFromDescriptionAsync
	end,
	getBundleModel = function(DynamicHead, OutfitId)
		-- upvalues: Players (copy), ConstantsModule (copy)
		local HumanoidModelFromDescriptionAsync = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:CreateHumanoidModelFromDescriptionAsync(Players:GetHumanoidDescriptionFromOutfitIdAsync(OutfitId), Enum.HumanoidRigType.R15) else Players:CreateHumanoidModelFromDescription(Players:GetHumanoidDescriptionFromOutfitId(OutfitId), Enum.HumanoidRigType.R15)
		
		if DynamicHead == ConstantsModule.BundleTypeIdStrings.DynamicHead then
			local Humanoid = HumanoidModelFromDescriptionAsync:FindFirstChildOfClass("Humanoid")
			
			for _, child in HumanoidModelFromDescriptionAsync:GetChildren() do
				if child ~= Humanoid and Humanoid and Humanoid:GetLimb(child) ~= Enum.Limb.Head then
					child:Destroy()
				end
			end
		end
		HumanoidModelFromDescriptionAsync.Parent = workspace
		HumanoidModelFromDescriptionAsync.Parent = nil
		HumanoidModelFromDescriptionAsync:PivotTo(CFrame.new(-(HumanoidModelFromDescriptionAsync:GetBoundingBox().Position - HumanoidModelFromDescriptionAsync:GetPivot().Position)))
		
		return HumanoidModelFromDescriptionAsync
	end,
	getCameraDistance = function(Object, p3: number)
		-- upvalues: GetFFlagAXSupportShoesInItemViewportModule (copy), ItemViewportFallbackCameraZoomOutFactorRatio (copy), ItemViewportFallbackCameraMaxDistanceRatio (copy)
		local Accessory = Object:FindFirstChildOfClass("Accessory")
		local HasMeshPart: boolean = Accessory and Accessory:FindFirstChildOfClass("MeshPart") ~= nil
		local Humanoid = Object:FindFirstChildOfClass("Humanoid")
		local HasRightFootAttachment: boolean = GetFFlagAXSupportShoesInItemViewportModule() and (Object:FindFirstChild("LeftFootAttachment", true) ~= nil and Object:FindFirstChild("RightFootAttachment", true) ~= nil)
		local ThumbnailConfiguration = Accessory and Accessory:FindFirstChild("ThumbnailConfiguration")
		local ScaledSine = 1 / math.sin((math.rad(p3 / 2))) * ItemViewportFallbackCameraZoomOutFactorRatio
		
		if HasMeshPart or Humanoid or GetFFlagAXSupportShoesInItemViewportModule() and HasRightFootAttachment then
			if Humanoid then
				Object.Parent = workspace
			end
			local _, BoundingSize = Object:GetBoundingBox()
			
			if Humanoid then
				Object.Parent = nil
			end
			return (BoundingSize / 2).Magnitude / math.sin((math.rad(p3 / 2)))
		elseif ThumbnailConfiguration then
			local ThumbnailCameraValue = ThumbnailConfiguration:FindFirstChild("ThumbnailCameraValue")
			local Value = ThumbnailCameraValue and ThumbnailCameraValue.Value
			local Magnitude = Value and Value.Position.Magnitude
			
			return if Magnitude and Magnitude < ItemViewportFallbackCameraMaxDistanceRatio then Magnitude * ItemViewportFallbackCameraZoomOutFactorRatio else ScaledSine
		else
			return ScaledSine
		end
	end
}