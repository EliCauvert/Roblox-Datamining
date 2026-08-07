return function(p0) --[[ line: 1 ]]
	return {
		getStatus = require(script.getStatus)(p0),
		setStatus = require(script.setStatus)(p0),
		installReducer = require(script.installReducer)(p0),
		Enum = { Status = require(script.EnumNetworkStatus) }
	}
end