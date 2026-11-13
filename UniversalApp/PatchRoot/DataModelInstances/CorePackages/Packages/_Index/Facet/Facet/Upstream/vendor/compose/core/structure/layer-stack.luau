local _ = require("../types")
local _ = require("../runtime/children")
local DiagnosticsModule = require("../diagnostics")
local SupportModule = require("./support")
local _ = require("../reactive/types")
local RetainModule = require("../collection/retain")
local config = { from = true, key = true, render = true, retention = true }
local IdentityKey = require("../reactive/graph").identityKey

local function sameState(p1, p2): boolean
	return p1.index == p2.index and (p1.depthFromTop == p2.depthFromTop and p1.top == p2.top) and p1.covered == p2.covered
end

return function(p1)
	-- upvalues: SupportModule (copy), config (copy), IdentityKey (copy), DiagnosticsModule (copy), RetainModule (copy), sameState (copy)
	local LayerStack = SupportModule.optionsOf(p1, "LayerStack", "from = ..., key = ..., render = ...")
	SupportModule.noUnknownFields(LayerStack, "LayerStack", config)
	local LayerStack1 = SupportModule.sourceOf(LayerStack.from, "LayerStack", "from")
	local LayerStack2 = SupportModule.builderOf(LayerStack.render, "LayerStack", "render")
	local IdentityKey1 = if LayerStack.key == nil then IdentityKey else SupportModule.builderOf(LayerStack.key, "LayerStack", "key")
	local Retention = LayerStack.retention or "all"
	
	return if Retention == "all" or Retention == "top" then RetainModule({
		primitive = "LayerStack",
		source = LayerStack1,
		key = IdentityKey1,
		select = function(_, p2)
			-- upvalues: Retention (copy), IdentityKey1 (copy)
			local CountP4 = #p2
			local Values = {}
			local Keys = {}
			local States = {}
			
			for i = if Retention == "top" then math.max(1, CountP4) else 1, CountP4 do
				local v1 = #Values + 1
				Values[v1] = p2[i]
				Keys[v1] = IdentityKey1(p2[i], i)
				States[v1] = {
					index = i,
					depthFromTop = CountP4 - i,
					top = i == CountP4,
					covered = i < CountP4
				}
			end
			return { values = Values, keys = Keys, states = States }
		end,
		render = LayerStack2,
		equals = sameState
	}) else DiagnosticsModule.raise("layer-stack/unknown-retention", "LayerStack was given a retention policy it does not have", {
		expected = "\"all\" or \"top\"",
		actual = DiagnosticsModule.describe(Retention)
	})
end