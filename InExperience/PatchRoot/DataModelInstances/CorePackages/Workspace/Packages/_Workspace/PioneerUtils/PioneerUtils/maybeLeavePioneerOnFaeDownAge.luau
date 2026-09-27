local pioneerUtils = script:FindFirstAncestor("PioneerUtils")
local parent = pioneerUtils.Parent
local fetchModule = require(parent.Fetch)
local fetch = fetchModule.fetch
local response = fetchModule.Response
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local pioneerJoinBlockedStorageModule = require(pioneerUtils.PioneerJoinBlockedStorage)
local isPioneerLaunchModule = require(pioneerUtils.isPioneerLaunch)
local leaveExperienceModule = require(pioneerUtils.leaveExperience)
local formattedText = string.format("%s/users/authenticated/app-launch-info", url.USERS_URL)

local function _()
	-- upvalues: promiseModule (ref), fetch (ref), formattedText (ref), response (ref)
	return promiseModule.new(function(p1)
		-- upvalues: fetch (copy), formattedText (copy), response (copy)
		local var1 = fetch(formattedText, { method = "GET" }):catch(function()
			-- upvalues: response (copy)
			return response.error()
		end):expect()
		
		if var1.ok then
			local var2 = var1:json():catch(function()
				return nil
			end):expect()
			p1(typeof(var2) == "table" and (typeof(var2.ageBracket) == "number" and var2.ageBracket ~= 1))
			
			return
		end
		p1(false)
	end)
end

return function(p1, p2)
	-- upvalues: isPioneerLaunchModule (ref), promiseModule (ref), fetch (ref), formattedText (ref), response (ref), pioneerJoinBlockedStorageModule (ref), leaveExperienceModule (ref)
	local function _()
		-- upvalues: p2 (ref)
		if p2 then
			p2()
		end
	end
	
	if isPioneerLaunchModule() then
		if p1 then
			return promiseModule.new(function(p3)
				-- upvalues: fetch (copy), formattedText (copy), response (copy)
				local var1 = fetch(formattedText, { method = "GET" }):catch(function()
					-- upvalues: response (copy)
					return response.error()
				end):expect()
				
				if var1.ok then
					local var2 = var1:json():catch(function()
						return nil
					end):expect()
					p3(typeof(var2) == "table" and (typeof(var2.ageBracket) == "number" and var2.ageBracket ~= 1))
					
					return
				end
				p3(false)
			end):andThen(function(p3)
				-- upvalues: p2 (ref), pioneerJoinBlockedStorageModule (copy), leaveExperienceModule (copy)
				if not p3 then
					pioneerJoinBlockedStorageModule.set(pioneerJoinBlockedStorageModule.Reason.AccountUnder13)
					leaveExperienceModule()
				elseif p2 then
					p2()
				end
				return not p3
			end)
		elseif p2 then
			p2()
		end
		return
	elseif p2 then
		p2()
	end
end