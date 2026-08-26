local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local assetTraversalUtilsModule = require(parent.util.AssetTraversalUtils)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)

return function(p1, p2, p3, p4, p5)
	-- upvalues: assetTraversalUtilsModule (ref), constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
	local t = {}
	
	if Enum.AssetType.DynamicHead == p4 then
		assetTraversalUtilsModule.calculateBounds(p4, p3, CFrame.new(), t, p5)
		p1.CFrame = CFrame.new()
		p2.CFrame = CFrame.new()
		p1.Size = p2.Size
	else
		local var1 = assetTraversalUtilsModule.assetHierarchy[p4]
		assetTraversalUtilsModule.traverseHierarchy(nil, p3, p4, nil, CFrame.new(), var1.root, var1, t, p5)
		
		local function moveParts(p6, p7, p8, p9, p10)
			-- upvalues: constantsInterfaceModule (copy), p4 (ref), r15plusUtilsModule (copy), getAttachmentCFrameInPartSpaceModule (copy), moveParts (ref)
			local var2 = p6:FindFirstChild(p9)
			local var3 = p8
			
			if p7 then
				local rigAttachmentToParent = constantsInterfaceModule.getRigAttachmentToParent(p4, p9)
				var3 = var3 * getAttachmentCFrameInPartSpaceModule(p6:FindFirstChild(p7):FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())) * getAttachmentCFrameInPartSpaceModule(var2:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())):Inverse()
			end
			var2.CFrame = var3
			
			if p10.children then
				for i, v in p10.children do
					moveParts(p6, p9, var3, i, v)
				end
			end
		end
		
		local cFrame = CFrame.new()
		local root = var1.root
		p2:FindFirstChild(root).CFrame = cFrame
		
		if var1.children then
			for i, v in var1.children do
				moveParts(p2, root, cFrame, i, v)
			end
		end
		local _ = Vector3.new()
		local _ = Vector3.new()
		local var4 = if t.maxOverall then t.maxOverall else Vector3.new()
		local var5 = if t.minOverall then t.minOverall else Vector3.new()
		
		if t.minOverall == nil or t.maxOverall == nil then
			return false
		end
		p1.Size = Vector3.new(var4.X - var5.X, var4.Y - var5.Y, var4.Z - var5.Z)
		p1.Position = Vector3.new(var5.X + p1.Size.X / 2, var5.Y + p1.Size.Y / 2, var5.Z + p1.Size.Z / 2)
	end
	return true
end