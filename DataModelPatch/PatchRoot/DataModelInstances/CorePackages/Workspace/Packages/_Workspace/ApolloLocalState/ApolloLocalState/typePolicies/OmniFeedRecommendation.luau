return {
	fields = {
		contentMetadata = {
			read = require(script.Parent.utils.makeDefaultReadPolicy)({})
		}
	}
}