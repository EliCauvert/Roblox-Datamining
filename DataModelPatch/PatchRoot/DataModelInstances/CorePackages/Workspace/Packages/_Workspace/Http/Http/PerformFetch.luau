local Http = script:FindFirstAncestor("Http")
local Parent = Http.Parent
local ResultModule = require(Parent.Result)
local PromiseModule = require(Parent.Promise)
local PromiseUtilities = require(Parent.AppCommonLib).Utils.PromiseUtilities
local RetrievalStatus = require(Http.Enum).RetrievalStatus
local BatchUpdateFetchingStatusFunction = require(Http.Actions).BatchUpdateFetchingStatus
local NewResults = {}

local function singleFetchKeymapper(p1)
	return p1
end

local PerformFetchModule = {
	ClearOutstandingPromiseStatus = function()
		-- upvalues: NewResults (ref)
		NewResults = {}
	end,
	GetStatus = function(p1, p2)
		-- upvalues: RetrievalStatus (copy)
		assert(typeof(p1) == "table")
		assert(typeof(p2) == "string")
		assert(#p2 > 0)
		
		return p1.FetchingStatus[p2] or RetrievalStatus.NotStarted
	end
}

function PerformFetchModule.Single(p1, Callback)
	-- upvalues: PerformFetchModule (copy), singleFetchKeymapper (copy), PromiseModule (copy), ResultModule (copy)
	assert(typeof(p1) == "string")
	assert(typeof(Callback) == "function")
	assert(#p1 > 0)
	
	return function(p2)
		-- upvalues: PerformFetchModule (upval), p1 (copy), singleFetchKeymapper (upval), Callback (copy), PromiseModule (upval), ResultModule (upval)
		return PerformFetchModule.Batch({ p1 }, singleFetchKeymapper, function(p3, p4)
			-- upvalues: Callback (upval), PromiseModule (upval), p1 (upval), ResultModule (upval)
			assert(#p4 == 1)
			local CallbackResult = Callback(p3)
			assert(PromiseModule.is(CallbackResult))
			
			return CallbackResult:andThen(function(...)
				-- upvalues: PromiseModule (upval), p1 (upval), ResultModule (upval)
				assert(#{ ... } <= 1)
				
				return PromiseModule.resolve({ [p1] = ResultModule.new(true, (...)) })
			end, function(...)
				-- upvalues: PromiseModule (upval), p1 (upval), ResultModule (upval)
				assert(#{ ... } <= 1)
				
				return PromiseModule.resolve({ [p1] = ResultModule.new(false, (...)) })
			end)
		end)(p2):andThen(function(Result)
			-- upvalues: p1 (upval), PromiseModule (upval)
			local UnwrapResult, UnwrapResult2 = Result[p1]:unwrap()
			
			return if UnwrapResult then PromiseModule.resolve(UnwrapResult2) else PromiseModule.reject(UnwrapResult2)
		end)
	end
end

function PerformFetchModule.Batch(p1, Callback, Callback1)
	-- upvalues: NewResults (ref), PromiseModule (copy), RetrievalStatus (copy), BatchUpdateFetchingStatusFunction (copy), PromiseUtilities (copy), ResultModule (copy)
	assert(typeof(p1) == "table")
	assert(typeof(Callback) == "function")
	assert(typeof(Callback1) == "function")
	
	return function(p2)
		-- upvalues: p1 (copy), Callback (copy), NewResults (upval), PromiseModule (upval), RetrievalStatus (upval), BatchUpdateFetchingStatusFunction (upval), Callback1 (copy), PromiseUtilities (upval), ResultModule (upval)
		local List = {}
		local Keys = {}
		local t = {}
		
		for _, value in ipairs(p1) do
			local CallbackResult = Callback(value)
			local NewResult = NewResults[CallbackResult]
			
			if NewResult then
				t[CallbackResult] = NewResult
			else
				table.insert(List, value)
				Keys[value] = CallbackResult
			end
		end
		local Callback2 = nil
		local NewPromise = PromiseModule.new(function(p3)
			-- upvalues: Callback2 (ref)
			Callback2 = p3
		end)
		local ResolveResult = nil
		
		if #List > 0 then
			local List1 = {}
			
			for _, key in pairs(Keys) do
				table.insert(List1, { key = key, status = RetrievalStatus.Fetching })
				NewResults[key] = NewPromise
			end
			if #List1 > 0 then
				p2:dispatch(BatchUpdateFetchingStatusFunction(List1))
			end
			ResolveResult = Callback1(p2, List)
			assert(PromiseModule.is(ResolveResult))
		else
			ResolveResult = PromiseModule.resolve({})
		end
		ResolveResult:andThen(function(Result)
			-- upvalues: PromiseUtilities (upval), t (copy)
			local Result1 = Result or {}
			
			return PromiseUtilities.Batch(t):andThen(function(Result)
				-- upvalues: Result1 (ref)
				local t = {}
				
				for i, value in pairs(Result) do
					local _, UnwrapResult2 = value:unwrap()
					t[i] = UnwrapResult2[i]
				end
				return Result1, t
			end)
		end, function()
			assert(false, "PerformFetch fetchFunctor should never reject")
		end):andThen(function(Result, p3)
			-- upvalues: Keys (copy), ResultModule (upval), RetrievalStatus (upval), NewResults (upval), p2 (copy), BatchUpdateFetchingStatusFunction (upval)
			local List = {}
			
			for _, key in pairs(Keys) do
				local Entry = Result[key]
				
				if ResultModule.is(Entry) then
					p3[key] = Entry
				else
					p3[key] = ResultModule.error()
				end
				table.insert(List, {
					key = key,
					status = p3[key]:unwrap() and RetrievalStatus.Done or RetrievalStatus.Failed
				})
				NewResults[key] = nil
			end
			if #List > 0 then
				p2:dispatch(BatchUpdateFetchingStatusFunction(List))
			end
			return p3
		end):andThen(function(Result)
			-- upvalues: Callback2 (ref)
			Callback2(Result)
		end)
		
		return NewPromise
	end
end

return PerformFetchModule