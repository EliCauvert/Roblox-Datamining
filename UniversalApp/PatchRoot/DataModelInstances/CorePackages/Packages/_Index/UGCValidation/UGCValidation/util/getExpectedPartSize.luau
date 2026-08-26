local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local getEditableMeshFromContextModule = require(parent.util.getEditableMeshFromContext)
local getMeshSizeModule = require(parent.util.getMeshSize)
local pcallDeferredModule = require(parent.util.pcallDeferred)

return function(p1, p2, p3)
	-- upvalues: getEditableMeshFromContextModule (ref), pcallDeferredModule (ref), getMeshSizeModule (ref)
	if p2.bypassFlags and p2.bypassFlags.skipPhysicsDataReset then
		if not p2.partSizes then
			p2.partSizes = {}
		end
		if p2.partSizes[p1] then
			return p2.partSizes[p1]
		end
		local t = {
			fieldName = "MeshId",
			fullName = p1:GetFullName(),
			contentId = p1.MeshId,
			context = p1.Name
		}
		local var1, var2 = getEditableMeshFromContextModule(p1, "MeshId", p2)
		
		if var1 then
			t.editableMesh = var2
			
			if p2.editableMeshes[p1].MeshId.created then
				return if p3 then p1.MeshSize else p1.Size
			end
			local var3, var4 = pcallDeferredModule(function()
				-- upvalues: getMeshSizeModule (copy), t (ref)
				return getMeshSizeModule(t)
			end, p2)
			
			if var3 then
				p2.partSizes[p1] = var4
				
				return var4
			end
			return if p3 then p1.MeshSize else p1.Size
		else
			return if p3 then p1.MeshSize else p1.Size
		end
	else
		return if p3 then p1.MeshSize else p1.Size
	end
end