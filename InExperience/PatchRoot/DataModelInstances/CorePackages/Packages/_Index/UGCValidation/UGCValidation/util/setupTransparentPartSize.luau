local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local assetTraversalUtilsModule = require(parent.util.AssetTraversalUtils)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)

return function(p0, p1, p2, p3, p4)
	-- upvalues: assetTraversalUtilsModule (ref), constantsInterfaceModule (ref), r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref)
	local t = {}
	
	if Enum.AssetType.DynamicHead == p3 then
		assetTraversalUtilsModule.calculateBounds(p3, p2, CFrame.new(), t, p4)
		p0.CFrame = CFrame.new()
		p1.CFrame = CFrame.new()
		p0.Size = p1.Size
	else
		local var5 = assetTraversalUtilsModule.assetHierarchy[p3]
		assetTraversalUtilsModule.traverseHierarchy(nil, p2, p3, nil, CFrame.new(), var5.root, var5, t, p4)
		
		local function moveParts(p5, p6, p7, p8, p9)
			-- upvalues: constantsInterfaceModule (copy), p3 (ref), r15plusUtilsModule (copy), getAttachmentCFrameInPartSpaceModule (copy), moveParts (ref)
			local var10 = p5:FindFirstChild(p8)
			local var11 = p7
			
			if p6 then
				local rigAttachmentToParent = constantsInterfaceModule.getRigAttachmentToParent(p3, p8)
				var11 = var11 * getAttachmentCFrameInPartSpaceModule(p5:FindFirstChild(p6):FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())) * getAttachmentCFrameInPartSpaceModule(var10:FindFirstChild(rigAttachmentToParent, r15plusUtilsModule.checkFlagEnabledForAllowHrd())):Inverse()
			end
			var10.CFrame = var11
			
			if p9.children then
				for i, v in p9.children do
					moveParts(p5, p8, var11, i, v)
				end
			end
		end
		
		local cFrame = CFrame.new()
		local root = var5.root
		p1:FindFirstChild(root).CFrame = cFrame
		
		if var5.children then
			for i, v in var5.children do
				moveParts(p1, root, cFrame, i, v)
			end
		end
		local _ = Vector3.new()
		local _ = Vector3.new()
		local var8 = if t.maxOverall then t.maxOverall else Vector3.new()
		local var9 = if t.minOverall then t.minOverall else Vector3.new()
		
		if t.minOverall == nil or t.maxOverall == nil then
			return false
		end
		p0.Size = Vector3.new(var8.X - var9.X, var8.Y - var9.Y, var8.Z - var9.Z)
		p0.Position = Vector3.new(var9.X + p0.Size.X / 2, var9.Y + p0.Size.Y / 2, var9.Z + p0.Size.Z / 2)
	end
	return true
end