local parent = script.Parent.Parent
local getDeepValue = require(parent.dependencies).SocialLibraries.Dictionary.getDeepValue
local RODUX_KEY = require(parent.Common.Constants).RODUX_KEY

return function(p0) --[[ line: 6 ]]
	-- upvalues: getDeepValue (ref), RODUX_KEY (ref)
	return getDeepValue(p0, RODUX_KEY .. "." .. "ShowContactImporterParams") or {}
end