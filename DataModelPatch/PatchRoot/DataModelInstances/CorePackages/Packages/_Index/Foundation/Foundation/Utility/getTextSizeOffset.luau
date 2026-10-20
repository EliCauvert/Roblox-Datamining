local Foundation = script:FindFirstAncestor("Foundation")
local TextService = require(Foundation.Utility.Wrappers).Services.TextService
local NoYieldModule = require(Foundation.Utility.noYield)

return function()
	-- upvalues: NoYieldModule (copy), TextService (copy)
	return NoYieldModule(function(p1, p2)
		-- upvalues: TextService (upval)
		local P0 = p1 or 0
		local P1 = p2 or Font.fromEnum(Enum.Font.BuilderSans)
		local Success, Result = pcall(function()
			-- upvalues: TextService (upval), P0 (ref), P1 (ref)
			return TextService:GetTextSizeOffsetAsync(P0, P1)
		end)
		
		return if Success then Result else nil
	end)
end