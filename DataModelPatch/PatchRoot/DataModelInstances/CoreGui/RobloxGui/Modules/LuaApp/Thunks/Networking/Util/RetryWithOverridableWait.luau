local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local PromiseModule = require(CorePackages.Packages.Promise)
local InterfaceResult = TModule.interface({
	previousResult = TModule.optional(TModule.any),
	isResolveConditionMet = TModule.callback,
	retryCallback = TModule.callback,
	retryCount = TModule.number,
	retryTimeMultiplier = TModule.number,
	waitImpl = TModule.callback
})

local function retry(JoinResult)
	-- upvalues: PromiseModule (copy), retry (copy), CryoModule (copy)
	local RetryCount = JoinResult.retryCount
	local PreviousResult = JoinResult.previousResult
	local RetryCallbackFunction = JoinResult.retryCallback
	local RetryTimeMultiplier = JoinResult.retryTimeMultiplier
	local WaitImplFunction = JoinResult.waitImpl
	
	return if JoinResult.isResolveConditionMet(PreviousResult) then PromiseModule.resolve(PreviousResult) else PromiseModule.new(function(Callback, _)
		-- upvalues: WaitImplFunction (copy), RetryTimeMultiplier (copy), RetryCount (copy)
		coroutine.wrap(function()
			-- upvalues: WaitImplFunction (upval), RetryTimeMultiplier (upval), RetryCount (upval), Callback (copy)
			WaitImplFunction(RetryTimeMultiplier * math.pow(2, RetryCount - 1))
			Callback()
		end)()
	end):andThen(function()
		-- upvalues: RetryCallbackFunction (copy)
		return RetryCallbackFunction()
	end):andThen(function(Result)
		-- upvalues: RetryCount (copy), retry (upval), CryoModule (upval), JoinResult (copy), PromiseModule (upval)
		return if RetryCount > 1 then retry(CryoModule.Dictionary.join(JoinResult, { retryCount = RetryCount - 1, previousResult = Result })) else PromiseModule.reject()
	end)
end

return function(p1)
	-- upvalues: ArgCheckModule (copy), InterfaceResult (copy), retry (copy)
	ArgCheckModule.assert(InterfaceResult(p1))
	
	return retry(p1)
end