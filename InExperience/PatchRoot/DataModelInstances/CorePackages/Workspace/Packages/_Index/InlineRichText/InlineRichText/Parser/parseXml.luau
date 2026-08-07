local inlineRichText = script:FindFirstAncestor("InlineRichText")
local _ = require(inlineRichText.Types)
local cryoModule = require(inlineRichText.Parent.Cryo)
local tokenizeModule = require(script.Parent.tokenize)
local buildTreeModule = require(script.Parent.buildTree)
local defaultParserOptionsModule = require(script.Parent.DefaultParserOptions)

return function(p0, p1) --[[ line: 10 | named "parseXml" ]]
	-- upvalues: tokenizeModule (ref), buildTreeModule (ref), cryoModule (ref), defaultParserOptionsModule (ref)
	return pcall(function() --[[ line: 11 ]]
		-- upvalues: tokenizeModule (copy), p0 (ref), buildTreeModule (copy), cryoModule (copy), defaultParserOptionsModule (copy), p1 (ref)
		return buildTreeModule(tokenizeModule(p0), {
			TagConfigurations = cryoModule.Dictionary.join(defaultParserOptionsModule.TagConfigurations, if p1 then p1.TagConfigurations else {}),
			TagAliases = cryoModule.Dictionary.join(defaultParserOptionsModule.TagAliases, if p1 then p1.TagAliases else {})
		})
	end)
end