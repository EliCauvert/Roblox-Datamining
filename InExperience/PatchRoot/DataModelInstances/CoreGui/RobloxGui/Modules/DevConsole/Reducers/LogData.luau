local RoduxModule = require(game:GetService("CorePackages").Packages.Rodux)
local ImmutableModule = require(script.Parent.Parent.Immutable)

return function(p1, p2) --[[ Line: 5 ]]
	-- upvalues: RoduxModule (copy), ImmutableModule (copy)
	return RoduxModule.createReducer({
		clientSearchTerm = "",
		serverSearchTerm = "",
		clientTypeFilters = {},
		serverTypeFilters = {}
	}, {
		ClientLogAppendMessage = function(p3, p4) --[[ Line: 13 ]]
			-- upvalues: ImmutableModule (upval)
			return ImmutableModule.JoinDictionaries(p3, {
				clientData = ImmutableModule.Append(p3.clientData, p4.newMessage)
			})
		end,
		ServerLogAppendMessage = function(p3, p4) --[[ Line: 19 ]]
			-- upvalues: ImmutableModule (upval)
			return ImmutableModule.JoinDictionaries(p3, {
				serverData = ImmutableModule.Append(p3.serverData, p4.newMessage)
			})
		end,
		ClientLogAppendFilteredMessage = function(p3, p4) --[[ Line: 25 ]]
			-- upvalues: ImmutableModule (upval)
			return ImmutableModule.JoinDictionaries(p3, {
				clientData = ImmutableModule.Append(p3.clientData, p4.newMessage),
				clientDataFiltered = ImmutableModule.Append(p3.clientDataFiltered, p4.newMessage)
			})
		end,
		ServerLogAppendFilteredMessage = function(p3, p4) --[[ Line: 32 ]]
			-- upvalues: ImmutableModule (upval)
			return ImmutableModule.JoinDictionaries(p3, {
				serverData = ImmutableModule.Append(p3.serverData, p4.newMessage),
				serverDataFiltered = ImmutableModule.Append(p3.serverDataFiltered, p4.newMessage)
			})
		end,
		ClientLogSetData = function(p3, p4) --[[ Line: 39 ]]
			-- upvalues: ImmutableModule (upval)
			return ImmutableModule.JoinDictionaries(p3, {
				clientData = p4.newData,
				clientDataFiltered = p4.newDataFiltered
			})
		end,
		ServerLogSetData = function(p3, p4) --[[ Line: 46 ]]
			-- upvalues: ImmutableModule (upval)
			return ImmutableModule.JoinDictionaries(p3, {
				serverData = p4.newData,
				serverDataFiltered = p4.newDataFiltered
			})
		end,
		ClientLogUpdateSearchFilter = function(p3, p4) --[[ Line: 53 ]]
			-- upvalues: ImmutableModule (upval)
			return ImmutableModule.JoinDictionaries(p3, {
				clientSearchTerm = p4.searchTerm,
				clientTypeFilters = ImmutableModule.JoinDictionaries(p3.clientTypeFilters, p4.filterTypes)
			})
		end,
		ServerLogUpdateSearchFilter = function(p3, p4) --[[ Line: 60 ]]
			-- upvalues: ImmutableModule (upval)
			return ImmutableModule.JoinDictionaries(p3, {
				serverSearchTerm = p4.searchTerm,
				serverTypeFilters = ImmutableModule.JoinDictionaries(p3.serverTypeFilters, p4.filterTypes)
			})
		end
	})(p1, p2)
end