local InlineRichText = script:FindFirstAncestor("InlineRichText")
local _ = require(InlineRichText.Types)
local CryoModule = require(InlineRichText.Parent.Cryo)
local TokenizeModule = require(script.Parent.tokenize)
local BuildTreeModule = require(script.Parent.buildTree)
local DefaultParserOptionsModule = require(script.Parent.DefaultParserOptions)

return function(p1, p2) --[[ Line: 10 | Named "parseXml" ]]
	-- upvalues: TokenizeModule (copy), BuildTreeModule (copy), CryoModule (copy), DefaultParserOptionsModule (copy)
	return pcall(function() --[[ Line: 11 ]]
		-- upvalues: TokenizeModule (upval), p1 (copy), BuildTreeModule (upval), CryoModule (upval), DefaultParserOptionsModule (upval), p2 (copy)
		return BuildTreeModule(TokenizeModule(p1), {
			TagConfigurations = CryoModule.Dictionary.join(DefaultParserOptionsModule.TagConfigurations, p2 and p2.TagConfigurations or {}),
			TagAliases = CryoModule.Dictionary.join(DefaultParserOptionsModule.TagAliases, p2 and p2.TagAliases or {})
		})
	end)
end