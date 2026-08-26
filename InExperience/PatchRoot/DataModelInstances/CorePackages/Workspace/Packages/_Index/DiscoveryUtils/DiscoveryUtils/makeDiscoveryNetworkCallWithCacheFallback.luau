local discoveryUtils = script:FindFirstAncestor("DiscoveryUtils")
local parent = discoveryUtils.Parent
local _ = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local discoveryClientAppStorageModule = require(discoveryUtils.DiscoveryClientAppStorage)

return function(p1, p2, p3)
	-- upvalues: discoveryClientAppStorageModule (ref), promiseModule (ref)
	return p1:andThen(function(p4)
		return p4
	end):catch(function(p4)
		-- upvalues: discoveryClientAppStorageModule (copy), p2 (ref), p3 (ref), promiseModule (copy)
		local ok, status = pcall(function()
			-- upvalues: discoveryClientAppStorageModule (copy), p2 (copy), p3 (copy)
			return discoveryClientAppStorageModule.getJsonStorageData(p2, p3)
		end)
		
		return if ok then if status then promiseModule.resolve({ isFromCache = true, responseBody = status }) else promiseModule.reject(p4) else promiseModule.reject(status)
	end)
end