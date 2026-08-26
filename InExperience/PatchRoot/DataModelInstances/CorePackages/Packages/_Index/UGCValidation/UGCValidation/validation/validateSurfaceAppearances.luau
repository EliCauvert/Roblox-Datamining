local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)

return function(p1, p2)
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref)
	local allowEditableInstances = p2.allowEditableInstances
	local descendants = p1:GetDescendants()
	table.insert(descendants, p1)
	local var1 = failureReasonsAccumulatorModule.new()
	
	for i, v in pairs(descendants) do
		if v:IsA("MeshPart") then
			local var2 = v.TextureID ~= ""
			
			if allowEditableInstances and not var2 then
				local var3
				local textureContent = v.TextureContent
				
				if textureContent.Uri ~= nil then
					var3 = if textureContent.Uri == "" then textureContent.Object ~= nil else true
				end
				var2 = var3
			end
			local surfaceAppearance = v:FindFirstChildWhichIsA("SurfaceAppearance")
			
			if var2 then
				if surfaceAppearance then
					analyticsModule.reportFailure(analyticsModule.ErrorType.validateSurfaceAppearances_MeshPartHasTexture, nil, p2)
					var1:updateReasons(false, {
						`TextureID and SurfaceAppearance are both defined for MeshPart ({v:GetFullName()}). Publishing will only use SurfaceApperance.`
					})
				end
			elseif not surfaceAppearance then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateSurfaceAppearances_MissingSurfaceAppearance, nil, p2)
				var1:updateReasons(false, {
					`({v:GetFullName()}) has an empty TextureID and no child SurfaceAppearance instance. You need to define at least one of them.`
				})
			end
		end
	end
	return var1:getFinalResults()
end