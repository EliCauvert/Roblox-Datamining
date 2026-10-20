local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local HttpErrorModule = require(Modules.LuaApp.Http.HttpError)

local function _(p1)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback)
		-- upvalues: p1 (copy)
		delay(p1, function()
			-- upvalues: Callback (copy)
			Callback()
		end)
	end)
end

local function retryRequest(Callback, p1)
	-- upvalues: HttpErrorModule (copy), PromiseModule (copy), retryRequest (copy)
	return Callback():catch(function(Err)
		-- upvalues: p1 (copy), HttpErrorModule (upval), PromiseModule (upval), retryRequest (upval), Callback (copy)
		p1.remainingAttempts -= 1
		
		if p1.remainingAttempts <= 0 or Err.kind ~= HttpErrorModule.Kind.RequireExternalRetry and Err.kind ~= HttpErrorModule.Kind.LuaTimeout then
			return PromiseModule.reject(Err)
		elseif p1.shouldImmediateRetry then
			return retryRequest(Callback, p1)
		else
			local BackoffRatePower = p1.backoffRate ^ (p1.maxAttempts - p1.remainingAttempts)
			
			return PromiseModule.new(function(Callback)
				-- upvalues: BackoffRatePower (copy)
				delay(BackoffRatePower, function()
					-- upvalues: Callback (copy)
					Callback()
				end)
			end):andThen(function()
				-- upvalues: retryRequest (upval), Callback (upval), p1 (upval)
				return retryRequest(Callback, p1)
			end)
		end
	end)
end

return function(Callback, p1)
	-- upvalues: HttpErrorModule (copy), PromiseModule (copy), retryRequest (copy)
	return function(p2, p3, p4)
		-- upvalues: p1 (copy), Callback (copy), HttpErrorModule (upval), PromiseModule (upval), retryRequest (upval)
		local config = {
			maxAttempts = 3,
			backoffRate = 2,
			shouldImmediateRetry = false
		}
		
		if p1 and p1.shouldImmediateRetry then
			assert(type(p1.shouldImmediateRetry) == "boolean", "shouldImmediateRetry must be a bool")
			config.shouldImmediateRetry = p1.shouldImmediateRetry
		end
		config.remainingAttempts = config.maxAttempts
		
		local function makeRequest()
			-- upvalues: Callback (upval), p2 (copy), p3 (copy), p4 (copy)
			return Callback(p2, p3, p4)
		end
		
		return (Callback(p2, p3, p4):catch(function(Err)
			-- upvalues: config (copy), HttpErrorModule (upval), PromiseModule (upval), retryRequest (upval), makeRequest (copy)
			config.remainingAttempts -= 1
			
			if config.remainingAttempts <= 0 or Err.kind ~= HttpErrorModule.Kind.RequireExternalRetry and Err.kind ~= HttpErrorModule.Kind.LuaTimeout then
				return PromiseModule.reject(Err)
			elseif config.shouldImmediateRetry then
				return retryRequest(makeRequest, config)
			else
				local BackoffRatePower = config.backoffRate ^ (config.maxAttempts - config.remainingAttempts)
				
				return PromiseModule.new(function(Callback)
					-- upvalues: BackoffRatePower (copy)
					delay(BackoffRatePower, function()
						-- upvalues: Callback (copy)
						Callback()
					end)
				end):andThen(function()
					-- upvalues: retryRequest (upval), makeRequest (upval), config (upval)
					return retryRequest(makeRequest, config)
				end)
			end
		end))
	end
end