local markdown = script:FindFirstAncestor("Markdown")
local dashModule = require(markdown.Parent.Dash)
local buildTreeModule = require(script.BuildTree)
local postProcessTreeModule = require(script.PostProcessTree)
local tokenizeModule = require(script.Tokenize)
local _ = require(markdown.Types)
local unindentTagsModule = require(script.Parent.UnindentTags)
local indexTreeModule = require(script.Parent.IndexTree)
local defaultParserOptionsModule = require(script.Parent.DefaultParserOptions)
local t = {}

function t.safeParse(p1, p2)
	-- upvalues: t (ref)
	local ok, status = xpcall(function()
		-- upvalues: t (copy), p1 (ref), p2 (ref)
		return t.parse(p1, p2)
	end, function(p1)
		return `{p1}\n{debug.traceback()}`
	end)
	
	return ok, status
end

function t.parse(p1, p2)
	-- upvalues: dashModule (ref), defaultParserOptionsModule (ref), unindentTagsModule (ref), tokenizeModule (ref), buildTreeModule (ref), postProcessTreeModule (ref), indexTreeModule (ref)
	local var1 = dashModule.joinDeep(defaultParserOptionsModule, p2 or {})
	local var2 = buildTreeModule(tokenizeModule(unindentTagsModule(p1)), var1)
	var2.children = postProcessTreeModule(var2, var1)
	
	return indexTreeModule(var2)
end

return t