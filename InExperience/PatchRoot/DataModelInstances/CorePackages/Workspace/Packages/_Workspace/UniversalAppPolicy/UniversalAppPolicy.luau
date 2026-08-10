local _ = require(script.PolicyTypes)

return {
	getAppFeaturePolicies = require(script.getAppFeaturePolicies),
	AppFeaturePolicies = require(script.AppFeaturePolicies),
	RoactAppPolicy = require(script.RoactAppPolicy),
	UniversalAppPolicy = require(script.UniversalAppPolicy),
	useAppPolicy = require(script.useAppPolicy),
	Enum = {
		CrossPlayCapabilities = require(script.Enum.CrossPlayCapabilities)
	}
}