local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(script.AdapterTypes)
local _ = require(Markdown.Parent.CommonMark)
local DefaultRulesModule = require(script.DefaultRules)
local EngineModule = require(script.Engine)
local RegistryModule = require(script.Registry)
local _ = require(Markdown.Types)

return {
	Rules = require(script.Rules),
	build = function(Register)
		-- upvalues: RegistryModule (copy), DefaultRulesModule (copy), EngineModule (copy)
		local BuildResult = RegistryModule.build(DefaultRulesModule.register, Register or {})
		
		return table.freeze({
			toRendererAst = function(p1, p2)
				-- upvalues: EngineModule (upval), BuildResult (copy)
				return EngineModule.adapt(BuildResult, p1, p2)
			end
		})
	end
}