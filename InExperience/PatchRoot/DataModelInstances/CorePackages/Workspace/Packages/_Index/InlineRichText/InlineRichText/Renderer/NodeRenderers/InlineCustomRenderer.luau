local InlineRichText = script:FindFirstAncestor("InlineRichText")
local NewResult = require(InlineRichText.Logger):new(script.Name)
local _ = require(InlineRichText.Types)
local CryoModule = require(InlineRichText.Parent.Cryo)

return function(p1, p2) --[[ Line: 9 ]]
	-- upvalues: NewResult (copy), CryoModule (copy)
	local InlineCustomRenderer = p2.inlineCustomRenderers[p1.name]
	
	if InlineCustomRenderer and typeof(InlineCustomRenderer) == "function" then
		return InlineCustomRenderer(p1, CryoModule.Dictionary.join(p2, { nodeProps = p2.nodeProps[p1.name] or {} }))
	else
		NewResult:warning(`Node {p1.name}: No custom renderer found. For custom tags, you must provide a renderer function in the renderers prop`)
		
		return {}
	end
end