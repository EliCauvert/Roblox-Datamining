local parent = script.Parent.Parent

return {
	Analytics = require(parent.Analytics),
	Logging = require(parent.AppCommonLib).Logging
}