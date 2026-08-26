local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
local name = require(inlineRichText.Logger):new(script.Name)
local _ = require(inlineRichText.Types)
local cryoModule = require(parent.Cryo)

return function(p1, p2)
	-- upvalues: name (ref), cryoModule (ref)
	local name_1 = p2.inlineCustomRenderers[p1.name]
	
	if name_1 and typeof(name_1) == "function" then
		return name_1(p1, cryoModule.Dictionary.join(p2, { nodeProps = p2.nodeProps[p1.name] or {} }))
	end
	name:warning(`Node {p1.name}: No custom renderer found. For custom tags, you must provide a renderer function in the renderers prop`)
	
	return {}
end