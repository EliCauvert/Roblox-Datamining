return function(p1)
	return {
		sortContacts = require(script.sortContacts)(p1),
		getPhoneNumber = require(script.getPhoneNumber)
	}
end