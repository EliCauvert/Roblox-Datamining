local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)

return function(p0, p1) --[[ line: 13 | named "validateSurfaceAppearances" ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref)
	local allowEditableInstances = p1.allowEditableInstances
	local descendants = p0:GetDescendants()
	table.insert(descendants, p0)
	local var3 = failureReasonsAccumulatorModule.new()
	
	for i, v in pairs(descendants) do
		if v:IsA("MeshPart") then
			local var4 = v.TextureID ~= ""
			
			if allowEditableInstances and not var4 then
				local var5
				local textureContent = v.TextureContent
				
				if textureContent.Uri ~= nil then
					var5 = if textureContent.Uri == "" then textureContent.Object ~= nil else true
				end
				var4 = var5
			end
			local surfaceAppearance = v:FindFirstChildWhichIsA("SurfaceAppearance")
			
			if var4 then
				if surfaceAppearance then
					analyticsModule.reportFailure(analyticsModule.ErrorType.validateSurfaceAppearances_MeshPartHasTexture, nil, p1)
					var3:updateReasons(false, {
						`TextureID and SurfaceAppearance are both defined for MeshPart ({v:GetFullName()}). Publishing will only use SurfaceApperance.`
					})
				end
			elseif not surfaceAppearance then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateSurfaceAppearances_MissingSurfaceAppearance, nil, p1)
				var3:updateReasons(false, {
					`({v:GetFullName()}) has an empty TextureID and no child SurfaceAppearance instance. You need to define at least one of them.`
				})
			end
		end
	end
	return var3:getFinalResults()
end