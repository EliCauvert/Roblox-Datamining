return function(p1)
	return {
		getStatus = require(script.getStatus)(p1),
		setStatus = require(script.setStatus)(p1),
		installReducer = require(script.installReducer)(p1),
		Enum = { Status = require(script.EnumNetworkStatus) }
	}
end