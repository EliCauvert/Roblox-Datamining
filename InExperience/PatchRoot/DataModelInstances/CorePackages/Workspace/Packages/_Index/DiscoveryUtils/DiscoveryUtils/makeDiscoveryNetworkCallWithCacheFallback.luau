local discoveryUtils = script:FindFirstAncestor("DiscoveryUtils")
local parent = discoveryUtils.Parent
local _ = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local discoveryClientAppStorageModule = require(discoveryUtils.DiscoveryClientAppStorage)

return function(p0, p1, p2)
	-- upvalues: discoveryClientAppStorageModule (ref), promiseModule (ref)
	return p0:andThen(function(p4)
		return p4
	end):catch(function(p3)
		-- upvalues: discoveryClientAppStorageModule (copy), p1 (ref), p2 (ref), promiseModule (copy)
		local ok, status = pcall(function()
			-- upvalues: discoveryClientAppStorageModule (copy), p1 (copy), p2 (copy)
			return discoveryClientAppStorageModule.getJsonStorageData(p1, p2)
		end)
		
		return if ok then if status then promiseModule.resolve({ isFromCache = true, responseBody = status }) else promiseModule.reject(p3) else promiseModule.reject(status)
	end)
end