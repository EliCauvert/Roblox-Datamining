local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local NormalizeFontFaceModule = require(Foundation.Utility.normalizeFontFace)
local TextService = require(Foundation.Utility.Wrappers.Services).TextService

return function(Text, p1, Size, p2)
	-- upvalues: NormalizeFontFaceModule (copy), TextService (copy)
	local NormalizeFontFaceModuleResult = NormalizeFontFaceModule(p1)
	
	if typeof(NormalizeFontFaceModuleResult) == "Font" then
		local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
		GetTextBoundsParams.Text = Text
		GetTextBoundsParams.Font = NormalizeFontFaceModuleResult
		GetTextBoundsParams.Size = Size
		GetTextBoundsParams.Width = p2 or 1e999
		local Success, Result = pcall(function()
			-- upvalues: TextService (upval), GetTextBoundsParams (copy)
			return TextService:GetTextBoundsAsync(GetTextBoundsParams)
		end)
		GetTextBoundsParams:Destroy()
		
		return if Success then Result else nil
	else
		return nil
	end
end