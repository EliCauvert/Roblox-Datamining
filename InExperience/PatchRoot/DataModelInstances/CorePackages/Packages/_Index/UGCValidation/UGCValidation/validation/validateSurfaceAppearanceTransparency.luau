local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validateTextureTransparencyModule = require(parent.validation.validateTextureTransparency)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local getEditableImageFromContextModule = require(parent.util.getEditableImageFromContext)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local t = { ColorMap = true, NormalMap = true }

return function(p0, p1) --[[ line: 22 | named "validateSurfaceAppearanceTransparency" ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), analyticsModule (ref), parseContentIdsModule (ref), constantsModule (ref), t (ref), getEditableImageFromContextModule (ref), validateTextureTransparencyModule (ref)
	local currentTime = tick()
	local descendants = p0:GetDescendants()
	table.insert(descendants, p0)
	local var9 = failureReasonsAccumulatorModule.new()
	
	for i, v in descendants do
		if v:IsA("MeshPart") then
			local surfaceAppearance = v:FindFirstChildWhichIsA("SurfaceAppearance")
			
			if surfaceAppearance then
				if surfaceAppearance.AlphaMode ~= Enum.AlphaMode.Overlay then
					analyticsModule.reportFailure(analyticsModule.ErrorType.validateSurfaceAppearances_InvalidAlphaMode, nil, p1)
					var9:updateReasons(false, {
						`SurfaceAppearance ({v:GetFullName()}) has an invalid AlphaMode. Expected Enum.AlphaMode.Overlay`
					})
				end
				for i_1, v_1 in parseContentIdsModule.parse(surfaceAppearance, constantsModule.TEXTURE_CONTENT_ID_FIELDS, p1) do
					if t[v_1.fieldName] then
						local t_1 = {
							fullName = v_1.instance:GetFullName(),
							fieldName = v_1.fieldName,
							contentId = v_1.instance[v_1.fieldName]
						}
						local var12, var13 = getEditableImageFromContextModule(v_1.instance, v_1.fieldName, p1)
						
						if var12 then
							t_1.editableImage = var13
							var9:updateReasons(validateTextureTransparencyModule(t_1, p1))
							continue
						end
						return false, { "Failed to load texture data" }
					end
				end
			end
		end
	end
	analyticsModule.recordScriptTime(script.Name, currentTime, p1)
	
	return var9:getFinalResults()
end