local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.SystemTypes)
local UnpackContentModule = require(script.Parent.Parent.unpackContent)

return {
	fromSystem = function(Text, IconName)
		return { system = { text = Text, iconName = IconName } }
	end,
	getDetail = function(p1)
		return p1.system
	end,
	isSystemMessage = function(p1): boolean
		-- upvalues: UnpackContentModule (copy)
		local Content = p1.contents[1]
		
		return Content ~= nil and UnpackContentModule(Content) == "system"
	end
}