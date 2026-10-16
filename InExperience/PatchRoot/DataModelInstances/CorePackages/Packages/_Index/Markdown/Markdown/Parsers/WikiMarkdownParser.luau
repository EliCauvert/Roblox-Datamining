local Markdown = script:FindFirstAncestor("Markdown")
local DashModule = require(Markdown.Parent.Dash)
local BuildTreeModule = require(script.BuildTree)
local PostProcessTreeModule = require(script.PostProcessTree)
local TokenizeModule = require(script.Tokenize)
local _ = require(Markdown.Types)
local UnindentTagsModule = require(script.Parent.UnindentTags)
local IndexTreeModule = require(script.Parent.IndexTree)
local DefaultParserOptionsModule = require(script.Parent.DefaultParserOptions)
local WikiMarkdownParserModule = {}

function WikiMarkdownParserModule.safeParse(p1, p2) --[[ Line: 18 ]]
	-- upvalues: WikiMarkdownParserModule (copy)
	local Success, Result = xpcall(function() --[[ Line: 19 ]]
		-- upvalues: WikiMarkdownParserModule (upval), p1 (copy), p2 (copy)
		return WikiMarkdownParserModule.parse(p1, p2)
	end, function(Err): string --[[ Line: 21 ]]
		return `{Err}\n{debug.traceback()}`
	end)
	
	return Success, Result
end

function WikiMarkdownParserModule.parse(p1, p2) --[[ Line: 27 ]]
	-- upvalues: DashModule (copy), DefaultParserOptionsModule (copy), UnindentTagsModule (copy), TokenizeModule (copy), BuildTreeModule (copy), PostProcessTreeModule (copy), IndexTreeModule (copy)
	local JoinDeepResult = DashModule.joinDeep(DefaultParserOptionsModule, p2 or {})
	local TreeModule = BuildTreeModule(TokenizeModule((UnindentTagsModule(p1))), JoinDeepResult)
	TreeModule.children = PostProcessTreeModule(TreeModule, JoinDeepResult)
	
	return IndexTreeModule(TreeModule)
end

return WikiMarkdownParserModule