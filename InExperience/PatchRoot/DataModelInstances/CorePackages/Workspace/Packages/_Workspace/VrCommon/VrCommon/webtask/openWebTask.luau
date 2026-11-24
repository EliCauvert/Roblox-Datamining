local RunService = game:GetService("RunService")
local Parent = script:FindFirstAncestor("VrCommon").Parent
local Parent1 = script.Parent
local LinkingProtocol = require(Parent.LinkingProtocol).LinkingProtocol
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local WebTaskCountersModule = require(Parent1.WebTaskCounters)
local WebTaskPageModule = require(Parent1.WebTaskPage)
local BuildLoginRedirectUrlModule = require(Parent1.buildLoginRedirectUrl)
local BuildWebTaskUriModule = require(Parent1.buildWebTaskUri)
local FetchAuthTicketModule = require(Parent1.fetchAuthTicket)
local GetLocalUserIdModule = require(Parent1.getLocalUserId)
local IsAvailableModule = require(Parent1.isAvailable)
local config = { VRSettings = true }
local v1 = nil

local function isStudio()
	-- upvalues: RunService (copy)
	return RunService:IsStudio()
end

local t = {}

local function _(p1): boolean
	-- upvalues: t (copy)
	return p1 == t
end

local function withTimeout(TryResult, p1, Callback)
	-- upvalues: PromiseModule (copy), t (copy)
	return PromiseModule.race({
		TryResult,
		Callback(p1):andThen(function()
			-- upvalues: PromiseModule (upval), t (upval)
			return PromiseModule.reject(t)
		end)
	})
end

return function(p1, p2, p3)
	-- upvalues: v1 (ref), PromiseModule (copy), WebTaskCountersModule (copy), GetLocalUserIdModule (copy), config (copy), WebTaskPageModule (copy), IsAvailableModule (copy), isStudio (copy), LinkingProtocol (copy), FetchAuthTicketModule (copy), withTimeout (copy), BuildWebTaskUriModule (copy), BuildLoginRedirectUrlModule (copy), t (copy)
	if v1 ~= nil then
		return PromiseModule.resolve("Ignored")
	end
	local Counters = p3 and p3.counters or WebTaskCountersModule.default
	local GetUserId = p3 and p3.getUserId or GetLocalUserIdModule
	local Source = if p2 and config[p2.source] then p2.source else "Unknown"
	local ReturnPath = WebTaskPageModule.getReturnPath(p1)
	local Unknown = if ReturnPath then p1 else "Unknown"
	Counters.track("Requested", Source, Unknown)
	
	local function _(p4): string
		-- upvalues: Counters (copy), Source (copy), Unknown (copy)
		Counters.track("Failed", Source, Unknown, p4)
		
		return "Failed"
	end
	
	if ReturnPath == nil then
		local ResolveFunction = PromiseModule.resolve
		Counters.track("Failed", Source, Unknown, "UnknownPage")
		
		return ResolveFunction("Failed")
	elseif not (p3 and p3.isAvailable or IsAvailableModule)() then
		local ResolveFunction2 = PromiseModule.resolve
		Counters.track("Failed", Source, Unknown, "Unavailable")
		
		return ResolveFunction2("Failed")
	elseif (p3 and p3.isStudio or isStudio)() then
		local ResolveFunction1 = PromiseModule.resolve
		Counters.track("Failed", Source, Unknown, "Studio")
		
		return ResolveFunction1("Failed")
	else
		local UserId = GetUserId()
		
		if UserId == nil then
			local ResolveFunction3 = PromiseModule.resolve
			Counters.track("Failed", Source, Unknown, "NoUser")
			
			return ResolveFunction3("Failed")
		else
			local Linking = p3 and p3.linking or LinkingProtocol.default
			local t1 = {}
			v1 = t1
			local Flag = false
			
			local function release()
				-- upvalues: Flag (ref), v1 (upval), t1 (copy)
				if not Flag and v1 == t1 then
					v1 = nil
				end
			end
			
			local function releaseAfterNativeOpen()
				-- upvalues: Flag (ref), v1 (upval), t1 (copy)
				Flag = false
				
				if not Flag and v1 == t1 then
					v1 = nil
				end
			end
			
			local Delay = p3 and p3.delay or PromiseModule.delay
			local Promise = withTimeout(PromiseModule.try(p3 and p3.fetchAuthTicket or FetchAuthTicketModule), 10, Delay):andThen(function(Result)
				-- upvalues: GetUserId (copy), UserId (copy), Counters (copy), Source (copy), Unknown (copy), BuildWebTaskUriModule (upval), BuildLoginRedirectUrlModule (upval), ReturnPath (copy), Flag (ref), PromiseModule (upval), Linking (copy), releaseAfterNativeOpen (copy), Delay (copy), withTimeout (upval), p1 (copy), t (upval)
				if GetUserId() == UserId then
					local WebTaskUriModule = BuildWebTaskUriModule(BuildLoginRedirectUrlModule(ReturnPath, Result, UserId))
					Flag = true
					local TryResult = PromiseModule.try(function()
						-- upvalues: Linking (upval), WebTaskUriModule (copy)
						return Linking:openURL(WebTaskUriModule)
					end)
					TryResult:finally(releaseAfterNativeOpen)
					Delay(60):andThen(releaseAfterNativeOpen)
					
					return withTimeout(TryResult, 10, Delay):andThen(function(Enabled): string
						-- upvalues: Flag (upval), Counters (upval), Source (upval), Unknown (upval), p1 (upval)
						Flag = false
						
						if Enabled == true then
							Counters.track("Opened", Source, p1)
							
							return "Opened"
						else
							Counters.track("Failed", Source, Unknown, "OpenFailed")
							
							return "Failed"
						end
					end, function(p4): string
						-- upvalues: t (upval), Counters (upval), Source (upval), p1 (upval), Flag (upval), Unknown (upval)
						if p4 == t then
							Counters.track("OpenUnconfirmed", Source, p1)
							
							return "Ignored"
						else
							Flag = false
							Counters.track("Failed", Source, Unknown, "OpenFailed")
							
							return "Failed"
						end
					end)
				else
					Counters.track("Failed", Source, Unknown, "UserChanged")
					
					return "Failed"
				end
			end, function(p4): string
				-- upvalues: t (upval), Counters (copy), Source (copy), Unknown (copy)
				local IsTMatch = p4 == t
				Counters.track("Failed", Source, Unknown, if IsTMatch then "Timeout" else "TicketFailed")
				
				return "Failed"
			end):catch(function(): string
				-- upvalues: Counters (copy), Source (copy), Unknown (copy)
				Counters.track("Failed", Source, Unknown, "OpenFailed")
				
				return "Failed"
			end):andThen(function(Result)
				-- upvalues: Flag (ref), v1 (upval), t1 (copy)
				if not Flag and v1 == t1 then
					v1 = nil
				end
				return Result
			end)
			Promise:finally(release)
			
			return Promise
		end
	end
end