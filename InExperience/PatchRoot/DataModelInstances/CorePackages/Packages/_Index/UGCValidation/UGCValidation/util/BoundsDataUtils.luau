local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local calculateMinMaxModule = require(parent.util.calculateMinMax)
local t = {}

function t.combineBounds(p1, p2)
	-- upvalues: calculateMinMaxModule (ref), t (ref)
	local t_1 = {}
	local var1, var2 = calculateMinMaxModule(p1.minMeshCorner, p1.maxMeshCorner, p2.minMeshCorner, p2.maxMeshCorner)
	t_1.minMeshCorner = var1
	t_1.maxMeshCorner = var2
	local var3, var4 = calculateMinMaxModule(p1.minRigAttachment, p1.maxRigAttachment, p2.minRigAttachment, p2.maxRigAttachment)
	t_1.minRigAttachment = var3
	t_1.maxRigAttachment = var4
	t.setOverallBounds(t_1)
	
	return t_1
end

function t.expandMeshBounds(p1, p2)
	-- upvalues: calculateMinMaxModule (ref)
	local var1, var2 = calculateMinMaxModule(p1.minMeshCorner, p1.maxMeshCorner, p2, p2)
	p1.minMeshCorner = var1
	p1.maxMeshCorner = var2
end

function t.expandRigAttachmentBounds(p1, p2)
	-- upvalues: calculateMinMaxModule (ref)
	local var1, var2 = calculateMinMaxModule(p1.minRigAttachment, p1.maxRigAttachment, p2, p2)
	p1.minRigAttachment = var1
	p1.maxRigAttachment = var2
end

function t.setOverallBounds(value)
	-- upvalues: calculateMinMaxModule (ref)
	local var1, var2 = calculateMinMaxModule(value.minMeshCorner, value.maxMeshCorner, value.minRigAttachment, value.maxRigAttachment)
	value.minOverall = var1
	value.maxOverall = var2
end

function t.calculateBoundsCenters(p1)
	local var1 = if p1.minMeshCorner and p1.maxMeshCorner then (p1.minMeshCorner + p1.maxMeshCorner) / 2 else nil
	local var2 = if p1.minRigAttachment and p1.maxRigAttachment then (p1.minRigAttachment + p1.maxRigAttachment) / 2 else nil
	
	if p1.minOverall and p1.maxOverall then
		return var1, var2, (p1.minOverall + p1.maxOverall) / 2
	end
	return var1, var2, nil
end

function t.calculateBoundsDimensions(p1)
	local var1 = if p1.minMeshCorner and p1.maxMeshCorner then p1.maxMeshCorner - p1.minMeshCorner else nil
	local var2 = if p1.minRigAttachment and p1.maxRigAttachment then p1.maxRigAttachment - p1.minRigAttachment else nil
	
	if p1.minOverall and p1.maxOverall then
		return var1, var2, p1.maxOverall - p1.minOverall
	end
	return var1, var2, nil
end

return t