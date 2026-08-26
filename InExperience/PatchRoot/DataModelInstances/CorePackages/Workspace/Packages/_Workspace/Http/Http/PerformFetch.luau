local http = script:FindFirstAncestor("Http")
local parent = http.Parent
local resultModule = require(parent.Result)
local promiseModule = require(parent.Promise)
local promiseUtilities = require(parent.AppCommonLib).Utils.PromiseUtilities
local retrievalStatus = require(http.Enum).RetrievalStatus
local batchUpdateFetchingStatus = require(http.Actions).BatchUpdateFetchingStatus
local t = {}
local t_1 = {}

function t.ClearOutstandingPromiseStatus()
	-- upvalues: t_1 (write)
	t_1 = {}
end

local function singleFetchKeymapper(p1)
	return p1
end

function t.GetStatus(p1, p2)
	-- upvalues: retrievalStatus (ref)
	assert(typeof(p1) == "table")
	assert(typeof(p2) == "string")
	assert(#p2 > 0)
	
	return p1.FetchingStatus[p2] or retrievalStatus.NotStarted
end

function t.Single(p1, p2)
	-- upvalues: t (ref), singleFetchKeymapper (ref), promiseModule (ref), resultModule (ref)
	assert(typeof(p1) == "string")
	assert(typeof(p2) == "function")
	assert(#p1 > 0)
	
	return function(p3)
		-- upvalues: t (copy), p1 (ref), singleFetchKeymapper (copy), p2 (ref), promiseModule (copy), resultModule (copy)
		return t.Batch({ p1 }, singleFetchKeymapper, function(p4, p5)
			-- upvalues: p2 (copy), promiseModule (copy), p1 (copy), resultModule (copy)
			assert(#p5 == 1)
			local var1 = p2(p4)
			assert(promiseModule.is(var1))
			
			return var1:andThen(function(...)
				-- upvalues: promiseModule (copy), p1 (copy), resultModule (copy)
				assert(#{ ... } <= 1)
				
				return promiseModule.resolve({ [p1] = resultModule.new(true, ...) })
			end, function(...)
				-- upvalues: promiseModule (copy), p1 (copy), resultModule (copy)
				assert(#{ ... } <= 1)
				
				return promiseModule.resolve({ [p1] = resultModule.new(false, ...) })
			end)
		end)(p3):andThen(function(p4)
			-- upvalues: p1 (copy), promiseModule (copy)
			local var1, var2 = p4[p1]:unwrap()
			
			return if var1 then promiseModule.resolve(var2) else promiseModule.reject(var2)
		end)
	end
end

function t.Batch(p1, p2, p3)
	-- upvalues: t_1 (write), promiseModule (ref), retrievalStatus (ref), batchUpdateFetchingStatus (ref), promiseUtilities (ref), resultModule (ref)
	assert(typeof(p1) == "table")
	assert(typeof(p2) == "function")
	assert(typeof(p3) == "function")
	
	return function(p4)
		-- upvalues: p1 (ref), p2 (ref), t_1 (copy), promiseModule (copy), retrievalStatus (copy), batchUpdateFetchingStatus (copy), p3 (ref), promiseUtilities (copy), resultModule (copy)
		local t = {}
		local t_2 = {}
		local t_3 = {}
		
		for i, v in ipairs(p1) do
			local var1 = p2(v)
			local var2 = t_1[var1]
			
			if var2 then
				t_3[var1] = var2
			else
				table.insert(t, v)
				t_2[v] = var1
			end
		end
		local var3
		local var4 = nil
		local var5 = promiseModule.new(function(p5)
			-- upvalues: var4 (write)
			var4 = p5
		end)
		local _ = nil
		
		if #t > 0 then
			local t_4 = {}
			
			for i_1, v_1 in pairs(t_2) do
				table.insert(t_4, { key = v_1, status = retrievalStatus.Fetching })
				t_1[v_1] = var5
			end
			if #t_4 > 0 then
				p4:dispatch(batchUpdateFetchingStatus(t_4))
			end
			var3 = p3(p4, t)
			assert(promiseModule.is(var3))
		else
			var3 = promiseModule.resolve({})
		end
		var3:andThen(function(p5)
			-- upvalues: promiseUtilities (copy), t_3 (ref)
			p5 = p5 or {}
			
			return promiseUtilities.Batch(t_3):andThen(function(p6)
				-- upvalues: p5 (write)
				local t = {}
				
				for i, v in pairs(p6) do
					local _, var6 = v:unwrap()
					t[i] = var6[i]
				end
				return p5, t
			end)
		end, function()
			assert(false, "PerformFetch fetchFunctor should never reject")
		end):andThen(function(p6, p7)
			-- upvalues: t_2 (ref), resultModule (copy), retrievalStatus (copy), t_1 (copy), p4 (ref), batchUpdateFetchingStatus (copy)
			local t = {}
			
			for i, v in pairs(t_2) do
				local var6 = p6[v]
				
				if resultModule.is(var6) then
					p7[v] = var6
				else
					p7[v] = resultModule.error()
				end
				table.insert(t, {
					key = v,
					status = if p7[v]:unwrap() then retrievalStatus.Done else retrievalStatus.Failed
				})
				t_1[v] = nil
			end
			if #t > 0 then
				p4:dispatch(batchUpdateFetchingStatus(t))
			end
			return p7
		end):andThen(function(p8)
			-- upvalues: var4 (write)
			var4(p8)
		end)
		
		return var5
	end
end

return t