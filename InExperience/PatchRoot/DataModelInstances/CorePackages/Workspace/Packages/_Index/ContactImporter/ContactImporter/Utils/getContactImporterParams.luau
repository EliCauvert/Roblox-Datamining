local parent = script.Parent.Parent
local getDeepValue = require(parent.dependencies).SocialLibraries.Dictionary.getDeepValue
local RODUX_KEY = require(parent.Common.Constants).RODUX_KEY

return function(p1)
	-- upvalues: getDeepValue (ref), RODUX_KEY (ref)
	return getDeepValue(p1, RODUX_KEY .. "." .. "ShowContactImporterParams") or {}
end