local authCommon = script:FindFirstAncestor("AuthCommon")
local promiseModule = require(authCommon.Parent.Promise)
local getAuthMetaDataModule = require(authCommon.Http.Requests.GetAuthMetaData)

return function(p0)
	-- upvalues: getAuthMetaDataModule (ref), promiseModule (ref)
	return getAuthMetaDataModule(p0):andThen(function(p1)
		-- upvalues: promiseModule (copy)
		return if p1 and p1.responseBody then promiseModule.resolve(p1.responseBody) else promiseModule.reject()
	end, function(p2)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject({ p2.StatusCode })
	end)
end