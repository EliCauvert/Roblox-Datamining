local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getMeshSizeModule = require(parent.util.getMeshSize)
local pcallDeferredModule = require(parent.util.pcallDeferred)

return function(p0, p1, p2)
	-- upvalues: getEditableMeshFromContextModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref)
	if p1.bypassFlags and p1.bypassFlags.skipPhysicsDataReset then
		if not p1.partSizes then
			p1.partSizes = {}
		end
		if p1.partSizes[p0] then
			return p1.partSizes[p0]
		end
		local t = {
			fieldName = "MeshId",
			fullName = p0:GetFullName(),
			contentId = p0.MeshId,
			context = p0.Name
		}
		local var4, var5 = getEditableMeshFromContextModule(p0, "MeshId", p1)
		
		if var4 then
			t.editableMesh = var5
			
			if p1.editableMeshes[p0].MeshId.created then
				return if p2 then p0.MeshSize else p0.Size
			end
			local var6, var7 = pcallDeferredModule(function()
				-- upvalues: getMeshSizeModule (copy), t (ref)
				return getMeshSizeModule(t)
			end, p1)
			
			if var6 then
				p1.partSizes[p0] = var7
				
				return var7
			end
			return if p2 then p0.MeshSize else p0.Size
		else
			return if p2 then p0.MeshSize else p0.Size
		end
	else
		return if p2 then p0.MeshSize else p0.Size
	end
end