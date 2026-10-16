local AuthCommon = script:FindFirstAncestor("AuthCommon")
local PromiseModule = require(AuthCommon.Parent.Promise)
local GetAuthMetaDataModule = require(AuthCommon.Http.Requests.GetAuthMetaData)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: GetAuthMetaDataModule (copy), PromiseModule (copy)
	return GetAuthMetaDataModule(p1):andThen(function(Result) --[[ Line: 7 ]]
		-- upvalues: PromiseModule (upval)
		return if Result and Result.responseBody then PromiseModule.resolve(Result.responseBody) else PromiseModule.reject()
	end, function(p2) --[[ Line: 13 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject({ p2.StatusCode })
	end)
end