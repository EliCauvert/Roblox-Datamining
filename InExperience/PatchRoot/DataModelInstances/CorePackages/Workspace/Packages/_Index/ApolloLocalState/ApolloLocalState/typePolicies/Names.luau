local makeDefaultReadPolicyModule = require(script.Parent.utils.makeDefaultReadPolicy)

return {
	fields = {
		alias = { read = makeDefaultReadPolicyModule("") },
		contactName = { read = makeDefaultReadPolicyModule("") },
		platformName = { read = makeDefaultReadPolicyModule("") }
	}
}