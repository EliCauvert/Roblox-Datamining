local Parent = script:FindFirstAncestor("Localization").Parent
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)
local LocalizationConsumerModule = require(script.Parent.LocalizationConsumer)

return function(StringsToBeLocalized) --[[ Line: 7 | Named "withLocalization" ]]
	-- upvalues: ArgCheckModule (copy), ReactModule (copy), LocalizationConsumerModule (copy)
	ArgCheckModule.isType(StringsToBeLocalized, "table", "stringsToBeLocalized passed to withLocalization()")
	
	return function(Render) --[[ Line: 10 ]]
		-- upvalues: ArgCheckModule (upval), ReactModule (upval), LocalizationConsumerModule (upval), StringsToBeLocalized (copy)
		ArgCheckModule.isType(Render, "function", "render passed to withLocalization()")
		
		return ReactModule.createElement(LocalizationConsumerModule, {
			render = Render,
			stringsToBeLocalized = StringsToBeLocalized
		})
	end
end