local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local libraryDataStoreModule = require(script.Parent.LibraryDataStore)

return function(p1)
	-- upvalues: reactModule (ref), libraryDataStoreModule (ref), signalsReactModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: libraryDataStoreModule (copy), p1 (ref)
		return libraryDataStoreModule.getSource({ kind = p1.source.kind, placeId = p1.source.placeId })
	end, { p1.source.kind, p1.source.placeId })
	reactModule.useEffect(function()
		-- upvalues: libraryDataStoreModule (copy), var1 (ref)
		return libraryDataStoreModule.retain(var1)
	end, { var1 })
	
	return {
		source = var1.config,
		status = signalsReactModule.useSignalState(var1.getStatus),
		retrySource = reactModule.useCallback(function()
			-- upvalues: libraryDataStoreModule (copy), var1 (ref)
			libraryDataStoreModule.retrySource(var1)
		end, { var1 }),
		getList = libraryDataStoreModule.getList,
		fetchList = libraryDataStoreModule.fetchList,
		getAndFetchList = libraryDataStoreModule.getAndFetchList,
		getItem = libraryDataStoreModule.getItem
	}
end