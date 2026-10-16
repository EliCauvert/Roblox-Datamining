local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local AssetTraversalUtilsModule = require(Parent.util.AssetTraversalUtils)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetAttachmentCFrameInPartSpaceModule = require(Parent.util.getAttachmentCFrameInPartSpace)

return function(p1, Object, p2, AssetType, p3): boolean --[[ Line: 15 ]]
	-- upvalues: AssetTraversalUtilsModule (copy), ConstantsInterfaceModule (copy), R15plusUtilsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy)
	local t = {}
	
	if Enum.AssetType.DynamicHead == AssetType then
		AssetTraversalUtilsModule.calculateBounds(AssetType, p2, CFrame.new(), t, p3)
		p1.CFrame = CFrame.new()
		Object.CFrame = CFrame.new()
		p1.Size = Object.Size
	else
		local AssetHierarchyEntry = AssetTraversalUtilsModule.assetHierarchy[AssetType]
		AssetTraversalUtilsModule.traverseHierarchy(nil, p2, AssetType, nil, CFrame.new(), AssetHierarchyEntry.root, AssetHierarchyEntry, t, p3)
		
		local function moveParts(Object, ChildName, ScaledInverted, ChildName1, p4) --[[ Line: 48 ]]
			-- upvalues: ConstantsInterfaceModule (upval), AssetType (copy), R15plusUtilsModule (upval), GetAttachmentCFrameInPartSpaceModule (upval), moveParts (copy)
			local ChildName2 = Object:FindFirstChild(ChildName1)
			local ScaledInverted1 = ScaledInverted
			
			if ChildName then
				local RigAttachmentToParent = ConstantsInterfaceModule.getRigAttachmentToParent(AssetType, ChildName1)
				ScaledInverted1 = ScaledInverted1 * GetAttachmentCFrameInPartSpaceModule((Object:FindFirstChild(ChildName):FindFirstChild(RigAttachmentToParent, R15plusUtilsModule.checkFlagEnabledForAllowHrd()))) * GetAttachmentCFrameInPartSpaceModule((ChildName2:FindFirstChild(RigAttachmentToParent, R15plusUtilsModule.checkFlagEnabledForAllowHrd()))):Inverse()
			end
			ChildName2.CFrame = ScaledInverted1
			
			if p4.children then
				for i, child in p4.children do
					moveParts(Object, ChildName1, ScaledInverted1, i, child)
				end
			end
		end
		
		local Root = AssetHierarchyEntry.root
		local _CFrame = CFrame.new()
		Object:FindFirstChild(Root).CFrame = _CFrame
		
		if AssetHierarchyEntry.children then
			for i, child in AssetHierarchyEntry.children do
				moveParts(Object, Root, _CFrame, i, child)
			end
		end
		local _ = Vector3.new()
		local _ = Vector3.new()
		local MaxOverall = if t.maxOverall then t.maxOverall else Vector3.new()
		local MinOverall = if t.minOverall then t.minOverall else Vector3.new()
		
		if t.minOverall == nil or t.maxOverall == nil then
			return false
		end
		p1.Size = Vector3.new(MaxOverall.X - MinOverall.X, MaxOverall.Y - MinOverall.Y, MaxOverall.Z - MinOverall.Z)
		p1.Position = Vector3.new(MinOverall.X + p1.Size.X / 2, MinOverall.Y + p1.Size.Y / 2, MinOverall.Z + p1.Size.Z / 2)
	end
	return true
end