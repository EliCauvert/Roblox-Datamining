local MakeDefaultReadPolicyModule = require(script.Parent.utils.makeDefaultReadPolicy)

return {
	fields = {
		alias = { read = MakeDefaultReadPolicyModule("") },
		contactName = { read = MakeDefaultReadPolicyModule("") },
		platformName = { read = MakeDefaultReadPolicyModule("") }
	}
}