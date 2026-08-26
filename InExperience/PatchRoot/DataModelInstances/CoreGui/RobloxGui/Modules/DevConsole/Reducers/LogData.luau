local roduxModule = require(game:GetService("CorePackages").Packages.Rodux)
local immutableModule = require(script.Parent.Parent.Immutable)

return function(p1, p2)
	-- upvalues: roduxModule (ref), immutableModule (ref)
	return roduxModule.createReducer({
		clientSearchTerm = "",
		serverSearchTerm = "",
		clientTypeFilters = {},
		serverTypeFilters = {}
	}, {
		ClientLogAppendMessage = function(p3, p4)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(p3, {
				clientData = immutableModule.Append(p3.clientData, p4.newMessage)
			})
		end,
		ServerLogAppendMessage = function(p3, p4)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(p3, {
				serverData = immutableModule.Append(p3.serverData, p4.newMessage)
			})
		end,
		ClientLogAppendFilteredMessage = function(p3, p4)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(p3, {
				clientData = immutableModule.Append(p3.clientData, p4.newMessage),
				clientDataFiltered = immutableModule.Append(p3.clientDataFiltered, p4.newMessage)
			})
		end,
		ServerLogAppendFilteredMessage = function(p3, p4)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(p3, {
				serverData = immutableModule.Append(p3.serverData, p4.newMessage),
				serverDataFiltered = immutableModule.Append(p3.serverDataFiltered, p4.newMessage)
			})
		end,
		ClientLogSetData = function(value, p3)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(value, {
				clientData = p3.newData,
				clientDataFiltered = p3.newDataFiltered
			})
		end,
		ServerLogSetData = function(value, p3)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(value, {
				serverData = p3.newData,
				serverDataFiltered = p3.newDataFiltered
			})
		end,
		ClientLogUpdateSearchFilter = function(p3, p4)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(p3, {
				clientSearchTerm = p4.searchTerm,
				clientTypeFilters = immutableModule.JoinDictionaries(p3.clientTypeFilters, p4.filterTypes)
			})
		end,
		ServerLogUpdateSearchFilter = function(p3, p4)
			-- upvalues: immutableModule (copy)
			return immutableModule.JoinDictionaries(p3, {
				serverSearchTerm = p4.searchTerm,
				serverTypeFilters = immutableModule.JoinDictionaries(p3.serverTypeFilters, p4.filterTypes)
			})
		end
	})(p1, p2)
end