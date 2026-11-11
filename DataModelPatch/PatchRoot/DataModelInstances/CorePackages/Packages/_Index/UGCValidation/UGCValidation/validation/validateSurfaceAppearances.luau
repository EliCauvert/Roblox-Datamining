local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)

return function(Object, p1)
	-- upvalues: FailureReasonsAccumulatorModule (copy), AnalyticsModule (copy)
	local AllowEditableInstances = p1.allowEditableInstances
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	for _, Part in pairs(Descendants) do
		if Part:IsA("MeshPart") then
			local IsNotTextureIDMatch = Part.TextureID ~= ""
			
			if AllowEditableInstances and not IsNotTextureIDMatch then
				local TextureContent = Part.TextureContent
				IsNotTextureIDMatch = if TextureContent.Uri == nil then TextureContent.Object ~= nil else TextureContent.Uri ~= "" or TextureContent.Object ~= nil
			end
			local SurfaceAppearance = Part:FindFirstChildWhichIsA("SurfaceAppearance")
			
			if IsNotTextureIDMatch then
				if SurfaceAppearance then
					AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateSurfaceAppearances_MeshPartHasTexture, nil, p1)
					NewFailureReasonsAccumulator:updateReasons(false, {
						`TextureID and SurfaceAppearance are both defined for MeshPart ({Part:GetFullName()}). Publishing will only use SurfaceApperance.`
					})
				end
			elseif not SurfaceAppearance then
				AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateSurfaceAppearances_MissingSurfaceAppearance, nil, p1)
				NewFailureReasonsAccumulator:updateReasons(false, {
					`({Part:GetFullName()}) has an empty TextureID and no child SurfaceAppearance instance. You need to define at least one of them.`
				})
			end
		end
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end