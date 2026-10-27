local CommonMarkModule = require(script:FindFirstAncestor("Markdown").Parent.CommonMark)
local UnderlineModule = require(script.Parent.Underline)

return {
	new = function()
		-- upvalues: CommonMarkModule (copy), UnderlineModule (copy)
		return CommonMarkModule.Parser.Delimiter.EmphasisLikeDelimiterProcessor.new(95, { minLength = 2, createStrongEmphasis = UnderlineModule })
	end
}