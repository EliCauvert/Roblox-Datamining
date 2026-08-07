local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local calculateMinMaxModule = require(parent.util.calculateMinMax)
local t = {}

function t.combineBounds(p0, p1) --[[ line: 23 ]]
	-- upvalues: calculateMinMaxModule (ref), t (ref)
	local t_1 = {}
	local var3, var4 = calculateMinMaxModule(p0.minMeshCorner, p0.maxMeshCorner, p1.minMeshCorner, p1.maxMeshCorner)
	t_1.minMeshCorner = var3
	t_1.maxMeshCorner = var4
	local var5, var6 = calculateMinMaxModule(p0.minRigAttachment, p0.maxRigAttachment, p1.minRigAttachment, p1.maxRigAttachment)
	t_1.minRigAttachment = var5
	t_1.maxRigAttachment = var6
	t.setOverallBounds(t_1)
	
	return t_1
end

function t.expandMeshBounds(p2, p3) --[[ line: 36 ]]
	-- upvalues: calculateMinMaxModule (ref)
	local var7, var8 = calculateMinMaxModule(p2.minMeshCorner, p2.maxMeshCorner, p3, p3)
	p2.minMeshCorner = var7
	p2.maxMeshCorner = var8
end

function t.expandRigAttachmentBounds(p4, p5) --[[ line: 41 ]]
	-- upvalues: calculateMinMaxModule (ref)
	local var9, var10 = calculateMinMaxModule(p4.minRigAttachment, p4.maxRigAttachment, p5, p5)
	p4.minRigAttachment = var9
	p4.maxRigAttachment = var10
end

function t.setOverallBounds(value) --[[ line: 46 ]]
	-- upvalues: calculateMinMaxModule (ref)
	local var11, var12 = calculateMinMaxModule(value.minMeshCorner, value.maxMeshCorner, value.minRigAttachment, value.maxRigAttachment)
	value.minOverall = var11
	value.maxOverall = var12
end

function t.calculateBoundsCenters(p6) --[[ line: 52 ]]
	local var13 = if p6.minMeshCorner and p6.maxMeshCorner then (p6.minMeshCorner + p6.maxMeshCorner) / 2 else nil
	local var14 = if p6.minRigAttachment and p6.maxRigAttachment then (p6.minRigAttachment + p6.maxRigAttachment) / 2 else nil
	
	if p6.minOverall and p6.maxOverall then
		return var13, var14, (p6.minOverall + p6.maxOverall) / 2
	end
	return var13, var14, nil
end

function t.calculateBoundsDimensions(p7) --[[ line: 66 ]]
	local var15 = if p7.minMeshCorner and p7.maxMeshCorner then p7.maxMeshCorner - p7.minMeshCorner else nil
	local var16 = if p7.minRigAttachment and p7.maxRigAttachment then p7.maxRigAttachment - p7.minRigAttachment else nil
	
	if p7.minOverall and p7.maxOverall then
		return var15, var16, p7.maxOverall - p7.minOverall
	end
	return var15, var16, nil
end

return t