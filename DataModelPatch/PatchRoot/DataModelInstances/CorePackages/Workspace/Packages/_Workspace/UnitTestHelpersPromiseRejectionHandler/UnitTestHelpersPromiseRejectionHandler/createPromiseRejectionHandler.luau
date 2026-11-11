local RunService = game:GetService("RunService")
local PromiseModule = require(script.Parent.Parent.Dev.Promise)
local DummyFFlagPromiseRejectionFlagState = game:DefineFastFlag("DummyFFlagPromiseRejectionFlagState", false)

local function _(p1): boolean
	return p1:match("^[%w%._%-]+:[%d]+.+") ~= nil
end

local function isRedactedPath(p1: string): boolean
	return (p1:find("CorePackages.Packages.+%.TestEZ%.") or (p1:find("CorePackages.Packages.+%.Promise%.") or (p1:find("CorePackages.Packages.+%.roblox_rodux%.") or (p1:find("CorePackages.Packages.+%.React%.") or (p1:find("CorePackages.Packages.+%.ReactReconciler%.") or (p1:find("CorePackages.Packages.+%.Scheduler%.") or p1:find("CorePackages.Packages.+%.Shared%."))))))) ~= nil
end

local function reduceStacks(Text: string): string
	-- upvalues: isRedactedPath (copy)
	local List = {}
	local Flag = false
	
	for _, value in ipairs(Text:split("\n")) do
		if value:match("^[%w%._%-]+:[%d]+.+") == nil then
			Flag = false
		elseif not Flag then
			Flag = true
			table.insert(List, value)
			continue
		end
		if not isRedactedPath(value) then
			table.insert(List, value)
		elseif List[#List] ~= "..." then
			table.insert(List, "...")
		end
	end
	return table.concat(List, "\n")
end

return function(p1)
	-- upvalues: reduceStacks (copy), RunService (copy), DummyFFlagPromiseRejectionFlagState (copy), PromiseModule (copy)
	local List = {}
	
	local function onUnhandledRejection(p2, ...)
		-- upvalues: p1 (copy), reduceStacks (upval), List (copy)
		local v1 = p2._source:split("\n")
		local v2 = nil
		
		for i = #v1, 1, -1 do
			if not v1[i]:find("%.([%a%d]+%.spec):(%d+)") then
				continue
			end
			v2 = v1[i]
			break
		end
		local v3: string? = nil
		local v4 = nil
		
		if select("#", ...) >= 1 then
			v3 = tostring(select(1, ...))
			v4 = if p1 then v3 else reduceStacks(v3)
		end
		local Source = if v3 == nil or v3:find("Promise created at:") == nil then if p1 then p2._source else reduceStacks(p2._source) else nil
		local Message: string = if v2 then `\n~~~ UNHANDLED PROMISE REJECTION ~~~\nPromise was created in test at:\n{v2}\n\n` else "\n~~~ UNHANDLED PROMISE REJECTION ~~~\nNo test file was found in promise creation stack. "
		
		if v4 ~= nil then
			Message ..= `Error output:\n{v4}`
		end
		if Source ~= nil then
			Message ..= `\n\nPromise created at:\n{Source}`
		end
		table.insert(List, Message)
	end
	
	return {
		reportRejections = function(p3, p4, p5)
			-- upvalues: RunService (upval), DummyFFlagPromiseRejectionFlagState (upval), List (copy)
			RunService.Heartbeat:Wait()
			RunService.Heartbeat:Wait()
			local P7 = p5 or 1
			local v5 = if DummyFFlagPromiseRejectionFlagState then p4 else p3
			local Floored = nil
			local v6 = nil
			
			if v5 == nil then
				Floored = 0
				v6 = "0 (default)"
			else
				Floored = math.floor(v5 * P7)
				v6 = tostring(Floored)
			end
			if #List > 0 then
				local List1 = {}
				local IsFlooredBelow = Floored < #List
				table.insert(List1, "Caught unhandled promise rejections caught during test run. These may indicate\nerrors in tested code, or tests that were not cleaned up properly.\n\nIf you would like to see full stack traces without library internals redacted,\npass `true` as the first argument to `createPromiseRejectionHandler`.\n\nMore information about unhandled promise rejections in tests (and how to clean\nthem up) can be found at https://roblox.atlassian.net/wiki/spaces/HOW/pages/1556186613/Handling+Lua+Promises+in+Tests.\n")
				
				for _, value in ipairs(List) do
					table.insert(List1, value)
				end
				table.insert(List1, string.format("\nPromise rejection report:\n    unhandled rejections: %d", #List))
				
				if IsFlooredBelow then
					table.insert(List1, string.format("    allowed rejections threshold: %s\n\nThis test suite run has FAILED due to exceeding the threshold of unhandled\npromise rejections. For any functionality changed, try running the suite with\nrelevant tests focused (new or existing) to find which tests are producing\nunhandled promise rejections", v6))
				end
				if Floored < #List then
					error(table.concat(List1, "\n"), 0)
					
					return
				end
				warn(table.concat(List1, "\n"))
			end
		end,
		inject = function()
			-- upvalues: PromiseModule (upval), onUnhandledRejection (copy)
			PromiseModule.TEST = true
			
			return PromiseModule.onUnhandledRejection(onUnhandledRejection)
		end
	}
end