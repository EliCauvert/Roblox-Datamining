local parent = script.Parent.Parent
local getCageMeshInfosModule = require(parent.validation.getCageMeshInfos)
local getFStringLCCageQualityDocumentationLinkModule = require(parent.flags.getFStringLCCageQualityDocumentationLink)
local validateLCCagingRelevancyModule = require(parent.validation.validateLCCagingRelevancy)
local validateRenderMeshInsideOuterCageMeshModule = require(parent.validation.validateRenderMeshInsideOuterCageMesh)
local _ = require(parent.util.Types)

return function(p1, p2, p3)
	-- upvalues: getCageMeshInfosModule (ref), validateLCCagingRelevancyModule (ref), validateRenderMeshInsideOuterCageMeshModule (ref), getFStringLCCageQualityDocumentationLinkModule (ref)
	local var1 = true
	local t = {}
	local wrapLayer = p1:FindFirstChild("Handle"):FindFirstChildOfClass("WrapLayer")
	assert(wrapLayer, "calling validateInstanceTree() means we would not get this far if there was no WrapLayer")
	local var2, var3, var4 = getCageMeshInfosModule(p1, p3)
	
	if not var2 or var4 == nil then
		return false, var3
	end
	local var5, var6 = unpack({ var4[1], var4[2] })
	local _ = false
	local _ = {}
	local var7, var8 = validateLCCagingRelevancyModule(var5, var6, p2, wrapLayer.ReferenceOrigin.Position, wrapLayer.CageOrigin.Position, p3)
	
	if not var7 and var8 ~= nil then
		var1 = false
		
		for i, v in var8 do
			table.insert(t, v)
		end
	end
	local var9, var10 = validateRenderMeshInsideOuterCageMeshModule(wrapLayer, var6, p2, p3)
	
	if not var9 then
		table.insert(t, table.concat(var10, "\n"))
		var1 = false
	end
	if var1 then
		return true
	elseif getFStringLCCageQualityDocumentationLinkModule() ~= "" then
		table.insert(t, string.format("[Caging best practices](%s)", getFStringLCCageQualityDocumentationLinkModule()))
	end
	return false, t
end