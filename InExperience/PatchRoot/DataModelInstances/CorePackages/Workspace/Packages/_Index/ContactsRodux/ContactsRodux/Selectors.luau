return function(p0)
	return {
		sortContacts = require(script.sortContacts)(p0),
		getPhoneNumber = require(script.getPhoneNumber)
	}
end