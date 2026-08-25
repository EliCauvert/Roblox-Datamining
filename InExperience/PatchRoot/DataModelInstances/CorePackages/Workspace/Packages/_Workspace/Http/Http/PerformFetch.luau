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

local function singleFetchKeymapper(p0)
	return p0
end

function t.GetStatus(p1, p2)
	-- upvalues: retrievalStatus (ref)
	assert(typeof(p1) == "table")
	assert(typeof(p2) == "string")
	assert(#p2 > 0)
	
	return p1.FetchingStatus[p2] or retrievalStatus.NotStarted
end

function t.Single(p3, p4)
	-- upvalues: t (ref), singleFetchKeymapper (ref), promiseModule (ref), resultModule (ref)
	assert(typeof(p3) == "string")
	assert(typeof(p4) == "function")
	assert(#p3 > 0)
	
	return function(p5)
		-- upvalues: t (copy), p3 (ref), singleFetchKeymapper (copy), p4 (ref), promiseModule (copy), resultModule (copy)
		return t.Batch({ p3 }, singleFetchKeymapper, function(p7, p8)
			-- upvalues: p4 (copy), promiseModule (copy), p3 (copy), resultModule (copy)
			assert(#p8 == 1)
			local var8 = p4(p7)
			assert(promiseModule.is(var8))
			
			return var8:andThen(function(...)
				-- upvalues: promiseModule (copy), p3 (copy), resultModule (copy)
				assert(#{ ... } <= 1)
				
				return promiseModule.resolve({ [p3] = resultModule.new(true, ...) })
			end, function(...)
				-- upvalues: promiseModule (copy), p3 (copy), resultModule (copy)
				assert(#{ ... } <= 1)
				
				return promiseModule.resolve({ [p3] = resultModule.new(false, ...) })
			end)
		end)(p5):andThen(function(p6)
			-- upvalues: p3 (copy), promiseModule (copy)
			local var6, var7 = p6[p3]:unwrap()
			
			return if var6 then promiseModule.resolve(var7) else promiseModule.reject(var7)
		end)
	end
end

function t.Batch(p9, p10, p11)
	-- upvalues: t_1 (write), promiseModule (ref), retrievalStatus (ref), batchUpdateFetchingStatus (ref), promiseUtilities (ref), resultModule (ref)
	assert(typeof(p9) == "table")
	assert(typeof(p10) == "function")
	assert(typeof(p11) == "function")
	
	return function(p12)
		-- upvalues: p9 (ref), p10 (ref), t_1 (copy), promiseModule (copy), retrievalStatus (copy), batchUpdateFetchingStatus (copy), p11 (ref), promiseUtilities (copy), resultModule (copy)
		local t = {}
		local t_2 = {}
		local t_3 = {}
		
		for i, v in ipairs(p9) do
			local var16 = p10(v)
			local var17 = t_1[var16]
			
			if var17 then
				t_3[var16] = var17
			else
				table.insert(t, v)
				t_2[v] = var16
			end
		end
		local var15
		local var12 = nil
		local var13 = promiseModule.new(function(p13)
			-- upvalues: var12 (write)
			var12 = p13
		end)
		local _ = nil
		
		if #t > 0 then
			local t_4 = {}
			
			for i_1, v_1 in pairs(t_2) do
				table.insert(t_4, { key = v_1, status = retrievalStatus.Fetching })
				t_1[v_1] = var13
			end
			if #t_4 > 0 then
				p12:dispatch(batchUpdateFetchingStatus(t_4))
			end
			var15 = p11(p12, t)
			assert(promiseModule.is(var15))
		else
			var15 = promiseModule.resolve({})
		end
		var15:andThen(function(p17)
			-- upvalues: promiseUtilities (copy), t_3 (ref)
			p17 = p17 or {}
			
			return promiseUtilities.Batch(t_3):andThen(function(p18)
				-- upvalues: p17 (write)
				local t = {}
				
				for i, v in pairs(p18) do
					local _, var21 = v:unwrap()
					t[i] = var21[i]
				end
				return p17, t
			end)
		end, function()
			assert(false, "PerformFetch fetchFunctor should never reject")
		end):andThen(function(p15, p16)
			-- upvalues: t_2 (ref), resultModule (copy), retrievalStatus (copy), t_1 (copy), p12 (ref), batchUpdateFetchingStatus (copy)
			local t = {}
			
			for i, v in pairs(t_2) do
				local var19 = p15[v]
				
				if resultModule.is(var19) then
					p16[v] = var19
				else
					p16[v] = resultModule.error()
				end
				table.insert(t, {
					key = v,
					status = if p16[v]:unwrap() then retrievalStatus.Done else retrievalStatus.Failed
				})
				t_1[v] = nil
			end
			if #t > 0 then
				p12:dispatch(batchUpdateFetchingStatus(t))
			end
			return p16
		end):andThen(function(p14)
			-- upvalues: var12 (write)
			var12(p14)
		end)
		
		return var13
	end
end

return t