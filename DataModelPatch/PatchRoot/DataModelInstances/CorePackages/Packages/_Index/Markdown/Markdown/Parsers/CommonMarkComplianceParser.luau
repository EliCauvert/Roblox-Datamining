local Markdown = script:FindFirstAncestor("Markdown")
local DashModule = require(Markdown.Parent.Dash)
local BuildTreeModule = require(script.BuildTree)
local PostProcessTreeModule = require(script.PostProcessTree)
local TokenizeModule = require(script.Tokenize)
local _ = require(Markdown.Types)
local UnindentTagsModule = require(script.Parent.UnindentTags)
local IndexTreeModule = require(script.Parent.IndexTree)
local DefaultParserOptionsModule = require(script.Parent.DefaultParserOptions)
local CommonMarkComplianceParserModule = {}

function CommonMarkComplianceParserModule.safeParse(p1, p2)
	-- upvalues: CommonMarkComplianceParserModule (copy)
	local Success, Result = xpcall(function()
		-- upvalues: CommonMarkComplianceParserModule (upval), p1 (copy), p2 (copy)
		return CommonMarkComplianceParserModule.parse(p1, p2)
	end, function(Err): string
		return `{Err}\n{debug.traceback()}`
	end)
	
	return Success, Result
end

function CommonMarkComplianceParserModule.parse(p1, p2)
	-- upvalues: DashModule (copy), DefaultParserOptionsModule (copy), UnindentTagsModule (copy), TokenizeModule (copy), BuildTreeModule (copy), PostProcessTreeModule (copy), IndexTreeModule (copy)
	local JoinDeepResult = DashModule.joinDeep(DefaultParserOptionsModule, p2 or {})
	local TreeModule = BuildTreeModule(TokenizeModule(UnindentTagsModule(p1), JoinDeepResult), JoinDeepResult)
	TreeModule.children = PostProcessTreeModule(TreeModule, JoinDeepResult)
	
	return IndexTreeModule(TreeModule)
end

return CommonMarkComplianceParserModule