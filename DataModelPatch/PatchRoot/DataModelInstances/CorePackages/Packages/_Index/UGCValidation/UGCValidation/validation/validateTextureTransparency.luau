local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)

local function getIsOpaque(EditableImage): boolean
	local PixelsBuffer = EditableImage:ReadPixelsBuffer(Vector2.new(0, 0), EditableImage.Size)
	
	for i = 0, buffer.len(PixelsBuffer) - 1, 4 do
		if buffer.readu8(PixelsBuffer, i + 3) < 255 then
			return false
		end
	end
	return true
end

return function(p1, p2)
	-- upvalues: AnalyticsModule (copy), getIsOpaque (copy)
	local CurrentTime = tick()
	
	if not p1.editableImage then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateTextureTransparency_InvalidTextureId, nil, p2)
		
		return false, {
			string.format("Invalid textureID used in mesh '%s'. Make sure the texture exists and try again.", p1.fullName)
		}
	elseif getIsOpaque(p1.editableImage) then
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p2)
		
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateTextureTransparency_TransparentTexture, nil, p2)
		
		return false, {
			string.format("Texture %s is not fully opaque. Please use an opaque texture.", p1.fullName)
		}
	end
end