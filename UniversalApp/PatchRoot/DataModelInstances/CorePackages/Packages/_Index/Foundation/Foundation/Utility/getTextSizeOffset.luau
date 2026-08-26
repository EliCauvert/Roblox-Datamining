local foundation = script:FindFirstAncestor("Foundation")
local textService = require(foundation.Utility.Wrappers).Services.TextService
local noYieldModule = require(foundation.Utility.noYield)

return function()
	-- upvalues: noYieldModule (ref), textService (ref)
	return noYieldModule(function(p1, p2)
		-- upvalues: textService (copy)
		p1 = p1 or 0
		p2 = p2 or Font.fromEnum(Enum.Font.BuilderSans)
		local ok, status = pcall(function()
			-- upvalues: textService (copy), p1 (write), p2 (write)
			return textService:GetTextSizeOffsetAsync(p1, p2)
		end)
		
		return if ok then status else nil
	end)
end