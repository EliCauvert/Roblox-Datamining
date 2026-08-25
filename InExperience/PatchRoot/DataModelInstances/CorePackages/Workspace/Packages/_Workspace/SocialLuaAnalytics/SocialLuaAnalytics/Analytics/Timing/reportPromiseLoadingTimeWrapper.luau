local socialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local parent = socialLuaAnalytics.Parent
local promiseModule = require(parent.Promise)
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local eventTypes = require(socialLuaAnalytics.Analytics.Enums).EventTypes
local _ = require(parent.LuauPolyfill)
local timersModule = require(script.Parent.Timers)

return function(p0, p1, p2)
	-- upvalues: timersModule (ref), eventTypes (ref), retrievalStatus (ref), promiseModule (ref)
	return function(...)
		-- upvalues: timersModule (copy), p2 (ref), p1 (ref), eventTypes (copy), p0 (ref), retrievalStatus (copy), promiseModule (copy)
		local list = { ... }
		local var4 = timersModule()
		local var5 = var4.start()
		
		local var6 = function(p3, p4)
			-- upvalues: p2 (copy), var4 (ref), var5 (ref), p1 (copy), list (ref), eventTypes (copy)
			if p2 and p2.fireEvent then
				local var7 = p1(unpack(list)) or {}
				p2.fireEvent(eventTypes.LoadingTime, {
					fetch = var7.fetch,
					nextPage = var7.nextPage,
					status = p3,
					result = p4
				}, var4.stop(var5))
			end
		end
		
		return p0(...):andThen(function(p6)
			-- upvalues: var6 (ref), retrievalStatus (copy)
			pcall(function()
				-- upvalues: var6 (copy), retrievalStatus (copy), p6 (ref)
				var6(retrievalStatus.Done, p6)
			end)
			
			return p6
		end):catch(function(p5)
			-- upvalues: var6 (ref), retrievalStatus (copy), promiseModule (copy)
			pcall(function()
				-- upvalues: var6 (copy), retrievalStatus (copy)
				var6(retrievalStatus.Failed)
			end)
			
			return promiseModule.reject(p5)
		end)
	end
end