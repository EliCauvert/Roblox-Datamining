local Parent = script.Parent.Parent
local GetDeepValueFunction = require(Parent.dependencies).SocialLibraries.Dictionary.getDeepValue
local RODUXKEY = require(Parent.Common.Constants).RODUX_KEY

return function(p1) --[[ Line: 6 ]]
	-- upvalues: GetDeepValueFunction (copy), RODUXKEY (copy)
	return GetDeepValueFunction(p1, RODUXKEY .. "." .. "ShowContactImporterParams") or {}
end