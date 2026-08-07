local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)
local calculateMinMaxModule = require(parent.util.calculateMinMax)

local function getVerts(p0, p1, p2) --[[ line: 14 ]]
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref)
	local var5, var6 = pcallDeferredModule(function() --[[ line: 19 ]]
		-- upvalues: UGCValidationService (copy), p0 (ref)
		return UGCValidationService:GetEditableMeshVerts(p0.editableMesh)
	end, p2)
	
	if var5 then
		return true, nil, var6
	end
	local text = "Failed to read mesh: " .. p0.fullName
	
	if p1 then
		error(text)
	end
	return false, { text }
end

local function getBoundsInfo(p3, p4) --[[ line: 36 ]]
	-- upvalues: calculateMinMaxModule (ref)
	local var8 = nil
	local var9 = nil
	
	for i, v in pairs(p3) do
		local var10 = if p4 then v * p4 else v
		local var11, var12 = calculateMinMaxModule(var8, var9, var10, var10)
		var8 = var11
		var9 = var12
	end
	return var8, var9
end

return function(a, b) --[[ line: 47 | named "getMeshMinMax" ]]
	-- upvalues: getVerts (ref), getBoundsInfo (ref)
	local var13, var14, var15 = getVerts(a, b.isServer, b)
	
	if not var13 then
		return var13, var14
	elseif var15 and #var15 ~= 0 then
		local var16, var17 = getBoundsInfo(var15, a.scale)
		
		return true, nil, var16, var17
	end
	return false, { "Mesh: " .. a.fullName .. " contains no verts" }
end