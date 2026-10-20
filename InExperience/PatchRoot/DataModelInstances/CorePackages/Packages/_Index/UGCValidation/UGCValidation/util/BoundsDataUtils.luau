local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local CalculateMinMaxModule = require(Parent.util.calculateMinMax)
local BoundsDataUtils = {}

function BoundsDataUtils.combineBounds(p1, p2)
	-- upvalues: CalculateMinMaxModule (copy), BoundsDataUtils (copy)
	local MinMaxModule, MinMaxModule2 = CalculateMinMaxModule(p1.minMeshCorner, p1.maxMeshCorner, p2.minMeshCorner, p2.maxMeshCorner)
	local MinMaxModule1, MinMaxModule2_1 = CalculateMinMaxModule(p1.minRigAttachment, p1.maxRigAttachment, p2.minRigAttachment, p2.maxRigAttachment)
	local config = {
		minMeshCorner = MinMaxModule,
		maxMeshCorner = MinMaxModule2,
		minRigAttachment = MinMaxModule1,
		maxRigAttachment = MinMaxModule2_1
	}
	BoundsDataUtils.setOverallBounds(config)
	
	return config
end

function BoundsDataUtils.expandMeshBounds(p1, p2)
	-- upvalues: CalculateMinMaxModule (copy)
	p1.minMeshCorner, p1.maxMeshCorner = CalculateMinMaxModule(p1.minMeshCorner, p1.maxMeshCorner, p2, p2)
end

function BoundsDataUtils.expandRigAttachmentBounds(p1, p2)
	-- upvalues: CalculateMinMaxModule (copy)
	p1.minRigAttachment, p1.maxRigAttachment = CalculateMinMaxModule(p1.minRigAttachment, p1.maxRigAttachment, p2, p2)
end

function BoundsDataUtils.setOverallBounds(p1)
	-- upvalues: CalculateMinMaxModule (copy)
	p1.minOverall, p1.maxOverall = CalculateMinMaxModule(p1.minMeshCorner, p1.maxMeshCorner, p1.minRigAttachment, p1.maxRigAttachment)
end

function BoundsDataUtils.calculateBoundsCenters(p1)
	local MinMeshCornerRatio = if p1.minMeshCorner and p1.maxMeshCorner then (p1.minMeshCorner + p1.maxMeshCorner) / 2 else nil
	local MinRigAttachmentRatio = if p1.minRigAttachment and p1.maxRigAttachment then (p1.minRigAttachment + p1.maxRigAttachment) / 2 else nil
	
	if p1.minOverall and p1.maxOverall then
		return MinMeshCornerRatio, MinRigAttachmentRatio, (p1.minOverall + p1.maxOverall) / 2
	else
		return MinMeshCornerRatio, MinRigAttachmentRatio, nil
	end
end

function BoundsDataUtils.calculateBoundsDimensions(p1)
	local MaxMeshCornerDelta = if p1.minMeshCorner and p1.maxMeshCorner then p1.maxMeshCorner - p1.minMeshCorner else nil
	local MaxRigAttachmentDelta = if p1.minRigAttachment and p1.maxRigAttachment then p1.maxRigAttachment - p1.minRigAttachment else nil
	
	if p1.minOverall and p1.maxOverall then
		return MaxMeshCornerDelta, MaxRigAttachmentDelta, p1.maxOverall - p1.minOverall
	else
		return MaxMeshCornerDelta, MaxRigAttachmentDelta, nil
	end
end

return BoundsDataUtils