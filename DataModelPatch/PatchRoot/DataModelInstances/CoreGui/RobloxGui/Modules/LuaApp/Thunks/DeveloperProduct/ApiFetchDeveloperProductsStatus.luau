local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local DeveloperProductGetStatusesModule = require(Modules.LuaApp.Http.Requests.DeveloperProductApi.DeveloperProductGetStatuses)
local SetDeveloperProductStatusesModule = require(Modules.LuaApp.Actions.DeveloperProduct.SetDeveloperProductStatuses)

return function(p1, Text, p2, Text1)
	-- upvalues: PerformFetch (copy), DeveloperProductGetStatusesModule (copy), SetDeveloperProductStatusesModule (copy), PromiseModule (copy)
	return PerformFetch.Single("ApiFetchDeveloperProductsStatus" .. Text .. Text1, function(p3)
		-- upvalues: DeveloperProductGetStatusesModule (upval), p1 (copy), Text (copy), Text1 (copy), SetDeveloperProductStatusesModule (upval), p2 (copy), PromiseModule (upval)
		return DeveloperProductGetStatusesModule(p1, Text, Text1):andThen(function(Result)
			-- upvalues: p3 (copy), SetDeveloperProductStatusesModule (upval), p2 (upval)
			local t = {}
			
			if Result and Result.responseBody then
				for _, value in ipairs(Result.responseBody) do
					if value.actionArgs and value.receipt then
						for _, actionArg in ipairs(value.actionArgs) do
							if actionArg.Key == "productId" and actionArg.Value then
								if t[actionArg.Value] == nil then
									t[actionArg.Value] = {}
								end
								table.insert(t[actionArg.Value], value.receipt)
							end
						end
					end
				end
			end
			return p3:dispatch(SetDeveloperProductStatusesModule(p2, t))
		end, function(_)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end)
	end)
end