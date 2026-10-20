local SocialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local Parent = SocialLuaAnalytics.Parent
local PromiseModule = require(Parent.Promise)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local EventTypes = require(SocialLuaAnalytics.Analytics.Enums).EventTypes
local _ = require(Parent.LuauPolyfill)
local TimersModule = require(script.Parent.Timers)

return function(Callback, Callback1, p1)
	-- upvalues: TimersModule (copy), EventTypes (copy), RetrievalStatus (copy), PromiseModule (copy)
	return function(...)
		-- upvalues: TimersModule (upval), p1 (copy), Callback1 (copy), EventTypes (upval), Callback (copy), RetrievalStatus (upval), PromiseModule (upval)
		local list = { ... }
		local TimersModuleResult = TimersModule()
		local StartResult = TimersModuleResult.start()
		
		local function v10(Status, Result)
			-- upvalues: p1 (upval), TimersModuleResult (copy), StartResult (copy), Callback1 (upval), list (copy), EventTypes (upval)
			if p1 and p1.fireEvent then
				local StopResult = TimersModuleResult.stop(StartResult)
				local CallbackResult = Callback1(unpack(list)) or {}
				p1.fireEvent(EventTypes.LoadingTime, {
					fetch = CallbackResult.fetch,
					nextPage = CallbackResult.nextPage,
					status = Status,
					result = Result
				}, StopResult)
			end
		end
		
		return Callback(...):andThen(function(Result)
			-- upvalues: v10 (copy), RetrievalStatus (upval)
			pcall(function()
				-- upvalues: v10 (upval), RetrievalStatus (upval), Result (copy)
				v10(RetrievalStatus.Done, Result)
			end)
			
			return Result
		end):catch(function(Err)
			-- upvalues: v10 (copy), RetrievalStatus (upval), PromiseModule (upval)
			pcall(function()
				-- upvalues: v10 (upval), RetrievalStatus (upval)
				v10(RetrievalStatus.Failed)
			end)
			
			return PromiseModule.reject(Err)
		end)
	end
end