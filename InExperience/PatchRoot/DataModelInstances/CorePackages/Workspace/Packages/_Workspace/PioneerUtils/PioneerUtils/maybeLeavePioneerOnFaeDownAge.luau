local PioneerUtils = script:FindFirstAncestor("PioneerUtils")
local Parent = PioneerUtils.Parent
local FetchModule = require(Parent.Fetch)
local FetchFunction = FetchModule.fetch
local Response = FetchModule.Response
local PromiseModule = require(Parent.Promise)
local PioneerLeaveReasonModule = require(PioneerUtils.PioneerLeaveReason)
local IsPioneerLaunchModule = require(PioneerUtils.isPioneerLaunch)
local LeaveExperienceModule = require(PioneerUtils.leaveExperience)
local Formatted = string.format("%s/users/authenticated/app-launch-info", require(Parent.Http).Url.USERS_URL)

local function _()
	-- upvalues: PromiseModule (copy), FetchFunction (copy), Formatted (copy), Response (copy)
	return PromiseModule.new(function(Callback: (any) -> ())
		-- upvalues: FetchFunction (upval), Formatted (upval), Response (upval)
		local v1 = FetchFunction(Formatted, { method = "GET" }):catch(function()
			-- upvalues: Response (upval)
			return Response.error()
		end):expect()
		
		if v1.ok then
			local v2 = v1:json():catch(function()
				return nil
			end):expect()
			Callback(typeof(v2) == "table" and typeof(v2.ageBracket) == "number" and v2.ageBracket ~= 1)
			
			return
		else
			Callback(false)
		end
	end)
end

return function(p1, Callback: () -> ())
	-- upvalues: IsPioneerLaunchModule (copy), PromiseModule (copy), FetchFunction (copy), Formatted (copy), Response (copy), LeaveExperienceModule (copy), PioneerLeaveReasonModule (copy)
	local function _()
		-- upvalues: Callback (copy)
		if Callback then
			Callback()
		end
	end
	
	if IsPioneerLaunchModule() then
		if p1 then
			return PromiseModule.new(function(Callback: (any) -> ())
				-- upvalues: FetchFunction (upval), Formatted (upval), Response (upval)
				local v1 = FetchFunction(Formatted, { method = "GET" }):catch(function()
					-- upvalues: Response (upval)
					return Response.error()
				end):expect()
				
				if v1.ok then
					local v2 = v1:json():catch(function()
						return nil
					end):expect()
					Callback(typeof(v2) == "table" and typeof(v2.ageBracket) == "number" and v2.ageBracket ~= 1)
					
					return
				else
					Callback(false)
				end
			end):andThen(function(Result): boolean
				-- upvalues: Callback (copy), LeaveExperienceModule (upval), PioneerLeaveReasonModule (upval)
				if Result then
					if Callback then
						Callback()
					end
				else
					LeaveExperienceModule(PioneerLeaveReasonModule.AccountUnder13)
				end
				return not Result
			end)
		elseif Callback then
			Callback()
		end
		return
	elseif Callback then
		Callback()
	end
end