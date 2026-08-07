-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:45 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)

local function getIsOpaque(p0) --[[ line: 10 ]]
	local var2 = p0:ReadPixelsBuffer(Vector2.new(0, 0), p0.Size)
	
	for i = 0, buffer.len(var2) - 1, 4 do
		if buffer.readu8(var2, i + 3) >= 255 then
			continue
		end
		return false
	end
	return true
end

return function(p1, p2) --[[ line: 22 | named "validateTextureTransparency" ]]
	-- upvalues: analyticsModule (ref), getIsOpaque (ref)
	local currentTime = tick()
	
	if not p1.editableImage then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateTextureTransparency_InvalidTextureId, nil, p2)
		
		return false, {
			string.format("Invalid textureID used in mesh '%s'. Make sure the texture exists and try again.", p1.fullName)
		}
	elseif getIsOpaque(p1.editableImage) then
		analyticsModule.recordScriptTime(script.Name, currentTime, p2)
		
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateTextureTransparency_TransparentTexture, nil, p2)
	
	return false, {
		string.format("Texture %s is not fully opaque. Please use an opaque texture.", p1.fullName)
	}
end