local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidateTextureTransparencyModule = require(Parent.validation.validateTextureTransparency)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local GetEditableImageFromContextModule = require(Parent.util.getEditableImageFromContext)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local config = { ColorMap = true, NormalMap = true }

return function(Object, p1)
	-- upvalues: FailureReasonsAccumulatorModule (copy), AnalyticsModule (copy), ParseContentIdsModule (copy), ConstantsModule (copy), config (copy), GetEditableImageFromContextModule (copy), ValidateTextureTransparencyModule (copy)
	local CurrentTime = tick()
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, Object)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	for _, Part in Descendants do
		if Part:IsA("MeshPart") then
			local SurfaceAppearance = Part:FindFirstChildWhichIsA("SurfaceAppearance")
			
			if SurfaceAppearance then
				if SurfaceAppearance.AlphaMode ~= Enum.AlphaMode.Overlay then
					AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateSurfaceAppearances_InvalidAlphaMode, nil, p1)
					NewFailureReasonsAccumulator:updateReasons(false, {
						`SurfaceAppearance ({Part:GetFullName()}) has an invalid AlphaMode. Expected Enum.AlphaMode.Overlay`
					})
				end
				for _, value in ParseContentIdsModule.parse(SurfaceAppearance, ConstantsModule.TEXTURE_CONTENT_ID_FIELDS, p1) do
					if config[value.fieldName] then
						local config1 = {
							fullName = value.instance:GetFullName(),
							fieldName = value.fieldName,
							contentId = value.instance[value.fieldName]
						}
						local EditableImageFromContextModule, EditableImageFromContextModule2 = GetEditableImageFromContextModule(value.instance, value.fieldName, p1)
						
						if not EditableImageFromContextModule then
							return false, { "Failed to load texture data" }
						end
						config1.editableImage = EditableImageFromContextModule2
						NewFailureReasonsAccumulator:updateReasons(ValidateTextureTransparencyModule(config1, p1))
					end
				end
			end
		end
	end
	AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p1)
	
	return NewFailureReasonsAccumulator:getFinalResults()
end