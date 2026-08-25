local roduxModule = require(game:GetService("CorePackages").Packages.Rodux)
local immutableModule = require(script.Parent.Parent.Immutable)

return function(p0, p1)
	-- upvalues: roduxModule (ref), immutableModule (ref)
	return roduxModule.createReducer({
		clientSearchTerm = "",
		serverSearchTerm = "",
		clientTypeFilters = {},
		serverTypeFilters = {}
	}, {
		ClientLogAppendMessage = function(p2, p3)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(p2, {
				clientData = immutableModule.Append(p2.clientData, p3.newMessage)
			})
		end,
		ServerLogAppendMessage = function(p4, p5)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(p4, {
				serverData = immutableModule.Append(p4.serverData, p5.newMessage)
			})
		end,
		ClientLogAppendFilteredMessage = function(p6, p7)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(p6, {
				clientData = immutableModule.Append(p6.clientData, p7.newMessage),
				clientDataFiltered = immutableModule.Append(p6.clientDataFiltered, p7.newMessage)
			})
		end,
		ServerLogAppendFilteredMessage = function(p8, p9)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(p8, {
				serverData = immutableModule.Append(p8.serverData, p9.newMessage),
				serverDataFiltered = immutableModule.Append(p8.serverDataFiltered, p9.newMessage)
			})
		end,
		ClientLogSetData = function(value, p10)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(value, {
				clientData = p10.newData,
				clientDataFiltered = p10.newDataFiltered
			})
		end,
		ServerLogSetData = function(value, p11)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(value, {
				serverData = p11.newData,
				serverDataFiltered = p11.newDataFiltered
			})
		end,
		ClientLogUpdateSearchFilter = function(p12, p13)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(p12, {
				clientSearchTerm = p13.searchTerm,
				clientTypeFilters = immutableModule.JoinDictionaries(p12.clientTypeFilters, p13.filterTypes)
			})
		end,
		ServerLogUpdateSearchFilter = function(p14, p15)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(p14, {
				serverSearchTerm = p15.searchTerm,
				serverTypeFilters = immutableModule.JoinDictionaries(p14.serverTypeFilters, p15.filterTypes)
			})
		end
	})(p0, p1)
end