local InlineRichText = script:FindFirstAncestor("InlineRichText")
local CryoModule = require(InlineRichText.Parent.Cryo)
local _ = require(InlineRichText.Types)

return function(p1, p2) --[[ Line: 7 ]]
	-- upvalues: CryoModule (copy)
	local config = { name = p1.name, attributes = p1.attributes }
	
	return CryoModule.List.map(p2.processChildren(p1, p2), function(p3) --[[ Line: 14 ]]
		-- upvalues: CryoModule (upval), config (copy)
		return {
			text = p3.text,
			engineTags = CryoModule.List.join(p3.engineTags, { config })
		}
	end)
end