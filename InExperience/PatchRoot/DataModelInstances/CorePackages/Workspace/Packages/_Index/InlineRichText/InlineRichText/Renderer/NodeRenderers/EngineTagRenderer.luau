local inlineRichText = script:FindFirstAncestor("InlineRichText")
local cryoModule = require(inlineRichText.Parent.Cryo)
local _ = require(inlineRichText.Types)

return function(p1, p2)
	-- upvalues: cryoModule (ref)
	local t = { name = p1.name, attributes = p1.attributes }
	
	return cryoModule.List.map(p2.processChildren(p1, p2), function(p3)
		-- upvalues: cryoModule (copy), t (ref)
		return {
			text = p3.text,
			engineTags = cryoModule.List.join(p3.engineTags, { t })
		}
	end)
end