local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local calculateMinMaxModule = require(parent.util.calculateMinMax)

local function getVerts(p1, p2, p3)
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref)
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), p1 (ref)
		return UGCValidationService:GetEditableMeshVerts(p1.editableMesh)
	end, p3)
	
	if var1 then
		return true, nil, var2
	end
	local text = "Failed to read mesh: " .. p0.fullName
	
	if p2 then
		error(text)
	end
	return false, { text }
end

local function getBoundsInfo(p1, p2)
	-- upvalues: calculateMinMaxModule (ref)
	local var1 = nil
	local var2 = nil
	
	for i, v in pairs(p1) do
		local var3 = if p2 then v * p2 else v
		local var4, var5 = calculateMinMaxModule(var1, var2, var3, var3)
		var1 = var4
		var2 = var5
	end
	return var1, var2
end

return function(a, b)
	-- upvalues: getVerts (ref), getBoundsInfo (ref)
	local var6, var7, var8 = getVerts(a, b.isServer, b)
	
	if not var6 then
		return var6, var7
	elseif var8 and #var8 ~= 0 then
		local var9, var10 = getBoundsInfo(var8, a.scale)
		
		return true, nil, var9, var10
	end
	return false, { "Mesh: " .. a.fullName .. " contains no verts" }
end