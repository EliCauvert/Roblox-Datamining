local parent = script:FindFirstAncestor("Localization").Parent
local reactModule = require(parent.React)
local argCheckModule = require(parent.ArgCheck)
local localizationConsumerModule = require(script.Parent.LocalizationConsumer)

return function(p0)
	-- upvalues: argCheckModule (ref), reactModule (ref), localizationConsumerModule (ref)
	argCheckModule.isType(p0, "table", "stringsToBeLocalized passed to withLocalization()")
	
	return function(p1)
		-- upvalues: argCheckModule (copy), reactModule (copy), localizationConsumerModule (copy), p0 (ref)
		argCheckModule.isType(p1, "function", "render passed to withLocalization()")
		
		return reactModule.createElement(localizationConsumerModule, { render = p1, stringsToBeLocalized = p0 })
	end
end