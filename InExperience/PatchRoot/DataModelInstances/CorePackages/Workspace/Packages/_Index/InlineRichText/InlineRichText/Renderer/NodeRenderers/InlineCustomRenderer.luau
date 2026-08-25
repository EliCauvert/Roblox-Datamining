local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
local name = require(inlineRichText.Logger):new(script.Name)
local _ = require(inlineRichText.Types)
local cryoModule = require(parent.Cryo)

return function(p0, p1)
	-- upvalues: name (ref), cryoModule (ref)
	local name_1 = p1.inlineCustomRenderers[p0.name]
	
	if name_1 and typeof(name_1) == "function" then
		return name_1(p0, cryoModule.Dictionary.join(p1, { nodeProps = p1.nodeProps[p0.name] or {} }))
	end
	name:warning(`Node {p0.name}: No custom renderer found. For custom tags, you must provide a renderer function in the renderers prop`)
	
	return {}
end