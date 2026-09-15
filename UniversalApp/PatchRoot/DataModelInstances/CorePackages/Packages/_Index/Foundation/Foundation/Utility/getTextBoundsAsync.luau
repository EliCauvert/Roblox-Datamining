local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local normalizeFontFaceModule = require(foundation.Utility.normalizeFontFace)
local textService = require(foundation.Utility.Wrappers.Services).TextService

return function(p1, p2, p3, p4)
	-- upvalues: normalizeFontFaceModule (ref), textService (ref)
	local var1 = normalizeFontFaceModule(p2)
	
	if typeof(var1) ~= "Font" then
		return nil
	end
	local getTextBoundsParams = Instance.new("GetTextBoundsParams")
	getTextBoundsParams.Text = p1
	getTextBoundsParams.Font = var1
	getTextBoundsParams.Size = p3
	getTextBoundsParams.Width = p4 or 1e999
	local ok, status = pcall(function()
		-- upvalues: textService (copy), getTextBoundsParams (ref)
		return textService:GetTextBoundsAsync(getTextBoundsParams)
	end)
	getTextBoundsParams:Destroy()
	
	return if ok then status else nil
end