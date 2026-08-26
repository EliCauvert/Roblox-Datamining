local socialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local parent = socialLuaAnalytics.Parent
local promiseModule = require(parent.Promise)
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local eventTypes = require(socialLuaAnalytics.Analytics.Enums).EventTypes
local _ = require(parent.LuauPolyfill)
local timersModule = require(script.Parent.Timers)

return function(p1, p2, p3)
	-- upvalues: timersModule (ref), eventTypes (ref), retrievalStatus (ref), promiseModule (ref)
	return function(...)
		-- upvalues: timersModule (copy), p3 (ref), p2 (ref), eventTypes (copy), p1 (ref), retrievalStatus (copy), promiseModule (copy)
		local list = { ... }
		local var1 = timersModule()
		local var2 = var1.start()
		
		local var3 = function(p4, p5)
			-- upvalues: p3 (copy), var1 (ref), var2 (ref), p2 (copy), list (ref), eventTypes (copy)
			if p3 and p3.fireEvent then
				local var4 = p2(unpack(list)) or {}
				p3.fireEvent(eventTypes.LoadingTime, {
					fetch = var4.fetch,
					nextPage = var4.nextPage,
					status = p4,
					result = p5
				}, var1.stop(var2))
			end
		end
		
		return p1(...):andThen(function(p4)
			-- upvalues: var3 (ref), retrievalStatus (copy)
			pcall(function()
				-- upvalues: var3 (copy), retrievalStatus (copy), p4 (ref)
				var3(retrievalStatus.Done, p4)
			end)
			
			return p4
		end):catch(function(p4)
			-- upvalues: var3 (ref), retrievalStatus (copy), promiseModule (copy)
			pcall(function()
				-- upvalues: var3 (copy), retrievalStatus (copy)
				var3(retrievalStatus.Failed)
			end)
			
			return promiseModule.reject(p4)
		end)
	end
end