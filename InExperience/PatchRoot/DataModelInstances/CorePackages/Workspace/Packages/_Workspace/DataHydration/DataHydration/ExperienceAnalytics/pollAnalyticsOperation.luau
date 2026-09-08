local parent = script:FindFirstAncestor("DataHydration").Parent
local promiseModule = require(parent.Promise)
local httpClientModule = require(parent.HttpClient)

local function _(p1)
	return if typeof(p1) == "table" and typeof(p1.errorMessage) == "string" then p1 else { errorMessage = tostring(p1) }
end

local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p1)
	-- upvalues: promiseModule (ref), asPromise (ref), fetch (ref)
	local delay = p1.delay or promiseModule.delay
	
	return promiseModule.new(function(p2, p3, p4)
		-- upvalues: asPromise (copy), fetch (copy), p1 (ref), delay (ref)
		local var1 = false
		local var2 = nil
		local var3 = nil
		p4(function()
			-- upvalues: var1 (write), var2 (write), var3 (write)
			var1 = true
			
			if var2 ~= nil then
				var2:cancel()
			end
			if var3 ~= nil then
				var3:cancel()
			end
		end)
		
		local function postQuery(p5)
			-- upvalues: var1 (write), asPromise (copy), fetch (copy), p1 (copy), var2 (write), p3 (ref), delay (copy), var3 (write), postQuery (ref), p2 (ref)
			if var1 then
				return
			end
			local var4 = asPromise(fetch({
				method = "POST",
				network = p1.network,
				url = p1.url,
				body = p1.body,
				analyticsKey = p1.analyticsKey,
				decode = function(p6)
					return if p6 then p6.operation else {}
				end
			}))
			var2 = var4
			var4:andThen(function(p6)
				-- upvalues: var1 (copy), p5 (ref), p3 (copy), p1 (copy), delay (copy), var3 (copy), postQuery (copy), p2 (copy)
				if var1 then return end
				if p6.done == true then
					if p6.error ~= nil then
						p3({
							responseCode = p6.error.code,
							errorMessage = p6.error.message or "analytics operation returned an error"
						})
						
						return
					end
					local ok, status = pcall(p1.mapResult, p6)
					
					if ok then
						p2(status)
						
						return
					end
					p3(if typeof(status) == "table" and typeof(status.errorMessage) == "string" then status else { errorMessage = tostring(status) })
					
					return
				elseif p5 >= 6 then
					p3({ errorMessage = p1.timeoutMessage })
					
					return
				end
				local var5 = delay(2)
				var3 = var5
				var5:andThen(function()
					-- upvalues: postQuery (copy), p5 (copy)
					postQuery(p5 + 1)
				end)
			end, function(p6)
				-- upvalues: p3 (copy)
				p3(if typeof(p6) == "table" and typeof(p6.errorMessage) == "string" then p6 else { errorMessage = tostring(p6) })
			end)
		end
		
		postQuery(1)
	end)
end