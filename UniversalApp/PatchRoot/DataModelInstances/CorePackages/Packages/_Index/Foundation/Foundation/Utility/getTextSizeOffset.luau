local foundation = script:FindFirstAncestor("Foundation")
local textService = require(foundation.Utility.Wrappers).Services.TextService
local noYieldModule = require(foundation.Utility.noYield)

return function()
	-- upvalues: noYieldModule (ref), textService (ref)
	return noYieldModule(function(p0, p1)
		-- upvalues: textService (copy)
		p0 = p0 or 0
		p1 = p1 or Font.fromEnum(Enum.Font.BuilderSans)
		local ok, status = pcall(function()
			-- upvalues: textService (copy), p0 (write), p1 (write)
			return textService:GetTextSizeOffsetAsync(p0, p1)
		end)
		
		return if ok then status else nil
	end)
end