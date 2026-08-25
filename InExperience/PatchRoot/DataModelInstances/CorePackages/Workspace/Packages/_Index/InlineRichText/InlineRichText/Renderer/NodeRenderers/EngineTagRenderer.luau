local inlineRichText = script:FindFirstAncestor("InlineRichText")
local cryoModule = require(inlineRichText.Parent.Cryo)
local _ = require(inlineRichText.Types)

return function(p0, p1)
	-- upvalues: cryoModule (ref)
	local t = { name = p0.name, attributes = p0.attributes }
	
	return cryoModule.List.map(p1.processChildren(p0, p1), function(p2)
		-- upvalues: cryoModule (copy), t (ref)
		return {
			text = p2.text,
			engineTags = cryoModule.List.join(p2.engineTags, { t })
		}
	end)
end