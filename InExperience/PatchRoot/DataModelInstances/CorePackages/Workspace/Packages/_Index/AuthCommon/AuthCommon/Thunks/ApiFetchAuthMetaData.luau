local authCommon = script:FindFirstAncestor("AuthCommon")
local promiseModule = require(authCommon.Parent.Promise)
local getAuthMetaDataModule = require(authCommon.Http.Requests.GetAuthMetaData)

return function(p1)
	-- upvalues: getAuthMetaDataModule (ref), promiseModule (ref)
	return getAuthMetaDataModule(p1):andThen(function(p2)
		-- upvalues: promiseModule (copy)
		return if p2 and p2.responseBody then promiseModule.resolve(p2.responseBody) else promiseModule.reject()
	end, function(p2)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject({ p2.StatusCode })
	end)
end