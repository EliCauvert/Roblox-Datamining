local parent = script:FindFirstAncestor("Localization").Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local localizationConsumerModule = require(script.Parent.LocalizationConsumer)

return function(p1)
	-- upvalues: argCheckModule (ref), reactModule (ref), localizationConsumerModule (ref)
	argCheckModule.isType(p1, "table", "stringsToBeLocalized passed to withLocalization()")
	
	return function(p2)
		-- upvalues: argCheckModule (copy), reactModule (copy), localizationConsumerModule (copy), p1 (ref)
		argCheckModule.isType(p2, "function", "render passed to withLocalization()")
		
		return reactModule.createElement(localizationConsumerModule, { render = p2, stringsToBeLocalized = p1 })
	end
end