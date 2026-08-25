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

function t.safeParse(p0, p1)
	-- upvalues: t (ref)
	local ok, status = xpcall(function()
		-- upvalues: t (copy), p0 (ref), p1 (ref)
		return t.parse(p0, p1)
	end, function(p2)
		return `{p2}\n{debug.traceback()}`
	end)
	
	return ok, status
end

function t.parse(p3, p4)
	-- upvalues: dashModule (ref), defaultParserOptionsModule (ref), unindentTagsModule (ref), tokenizeModule (ref), buildTreeModule (ref), postProcessTreeModule (ref), indexTreeModule (ref)
	local var9 = dashModule.joinDeep(defaultParserOptionsModule, p4 or {})
	local var10 = buildTreeModule(tokenizeModule(unindentTagsModule(p3), var9), var9)
	var10.children = postProcessTreeModule(var10, var9)
	
	return indexTreeModule(var10)
end

return t