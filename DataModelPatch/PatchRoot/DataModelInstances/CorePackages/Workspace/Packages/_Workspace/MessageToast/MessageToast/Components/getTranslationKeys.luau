local Parent = script.Parent.Parent
local TextKeysModule = require(Parent.Common.TextKeys)
local TypesModule = require(Parent.Common.Types)
local config = {
	[TypesModule.DefaultError] = {
		toastTitle = TextKeysModule.DefaultErrorTitle,
		toastSubtitle = TextKeysModule.DefaultErrorSubtitle
	}
}

return function(Custom, p1)
	-- upvalues: TypesModule (copy), config (copy)
	return if Custom == TypesModule.Custom and p1 then p1 else config[Custom]
end