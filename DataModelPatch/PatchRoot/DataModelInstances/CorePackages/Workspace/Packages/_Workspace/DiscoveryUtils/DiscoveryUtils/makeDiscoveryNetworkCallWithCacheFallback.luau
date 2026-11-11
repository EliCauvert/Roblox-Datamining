local DiscoveryUtils = script:FindFirstAncestor("DiscoveryUtils")
local Parent = DiscoveryUtils.Parent
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local DiscoveryClientAppStorageModule = require(DiscoveryUtils.DiscoveryClientAppStorage)

return function(Promise, p1, p2)
	-- upvalues: DiscoveryClientAppStorageModule (copy), PromiseModule (copy)
	return Promise:andThen(function(Result)
		return Result
	end):catch(function(Err)
		-- upvalues: DiscoveryClientAppStorageModule (upval), p1 (copy), p2 (copy), PromiseModule (upval)
		local Success, Result = pcall(function()
			-- upvalues: DiscoveryClientAppStorageModule (upval), p1 (upval), p2 (upval)
			return DiscoveryClientAppStorageModule.getJsonStorageData(p1, p2)
		end)
		
		return if Success then if Result then PromiseModule.resolve({ isFromCache = true, responseBody = Result }) else PromiseModule.reject(Err) else PromiseModule.reject(Result)
	end)
end