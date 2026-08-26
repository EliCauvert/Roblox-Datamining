local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)

local function getIsOpaque(p1)
	local var1 = p1:ReadPixelsBuffer(Vector2.new(0, 0), p1.Size)
	
	for i = 0, buffer.len(var1) - 1, 4 do
		if buffer.readu8(var1, i + 3) >= 255 then
			continue
		end
		return false
	end
	return true
end

return function(p2, p3)
	-- upvalues: analyticsModule (ref), getIsOpaque (ref)
	local currentTime = tick()
	
	if not p2.editableImage then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTextureTransparency_InvalidTextureId, nil, p3)
		
		return false, {
			string.format("Invalid textureID used in mesh '%s'. Make sure the texture exists and try again.", p2.fullName)
		}
	elseif getIsOpaque(p2.editableImage) then
		analyticsModule.recordScriptTime(script.Name, currentTime, p3)
		
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateTextureTransparency_TransparentTexture, nil, p3)
	
	return false, {
		string.format("Texture %s is not fully opaque. Please use an opaque texture.", p2.fullName)
	}
end