local inlineRichText = script:FindFirstAncestor("InlineRichText")
local _ = require(inlineRichText.Types)
local cryoModule = require(inlineRichText.Parent.Cryo)
local tokenizeModule = require(script.Parent.tokenize)
local buildTreeModule = require(script.Parent.buildTree)
local defaultParserOptionsModule = require(script.Parent.DefaultParserOptions)

return function(p1, p2)
	-- upvalues: tokenizeModule (ref), buildTreeModule (ref), cryoModule (ref), defaultParserOptionsModule (ref)
	return pcall(function()
		-- upvalues: tokenizeModule (copy), p1 (ref), buildTreeModule (copy), cryoModule (copy), defaultParserOptionsModule (copy), p2 (ref)
		return buildTreeModule(tokenizeModule(p1), {
			TagConfigurations = cryoModule.Dictionary.join(defaultParserOptionsModule.TagConfigurations, if p2 then p2.TagConfigurations else {}),
			TagAliases = cryoModule.Dictionary.join(defaultParserOptionsModule.TagAliases, if p2 then p2.TagAliases else {})
		})
	end)
end