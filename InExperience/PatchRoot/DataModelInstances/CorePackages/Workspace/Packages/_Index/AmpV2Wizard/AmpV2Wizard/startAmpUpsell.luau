local Parent = script.Parent
local PromiseModule = require(Parent.Parent.Promise)
local _ = require(Parent.Parent.LuauPolyfill)
local _ = require(Parent.Types)
local FFlagAmpV2WizardRateLimitedOutcomeModule = require(Parent.FFlagAmpV2WizardRateLimitedOutcome)
local FFlagAmpV2WizardTerminalOutcomeModule = require(Parent.FFlagAmpV2WizardTerminalOutcome)

local function errorResult()
	return { reason = "Error", flowId = "" }
end

return function(p1, p2, Callback, p3)
	-- upvalues: PromiseModule (copy), Parent (copy), FFlagAmpV2WizardRateLimitedOutcomeModule (copy), FFlagAmpV2WizardTerminalOutcomeModule (copy), errorResult (copy)
	return PromiseModule.new(function(Callback1: (any) -> ())
		-- upvalues: p1 (copy), p2 (copy), p3 (copy), Callback (copy), Parent (upval), FFlagAmpV2WizardRateLimitedOutcomeModule (upval), FFlagAmpV2WizardTerminalOutcomeModule (upval)
		local Flag = false
		
		local function _(p4, p5)
			-- upvalues: Flag (ref), Callback1 (copy), p1 (upval)
			if Flag then return end
			Flag = true
			Callback1(p4)
			
			if p5 and p1.onComplete then
				p1.onComplete(p4)
			end
		end
		
		local config = {
			target = p2.target,
			flow = p2.flow,
			surface = p1.surface,
			odpEventContext = p1.odpEventContext,
			odpEventUniverseId = p1.odpEventUniverseId,
			api = p1.api,
			registry = p1.registry,
			extraProps = if p3 then nil else p2.extraProps,
			onEvent = p1.onEvent,
			onExit = function(p4)
				-- upvalues: Flag (ref), Callback1 (copy), p1 (upval)
				if Flag then return end
				Flag = true
				Callback1(p4)
				
				if p1.onComplete then
					p1.onComplete(p4)
				end
			end
		}
		
		local _ = function(InitialFragment)
			-- upvalues: config (copy), Callback (upval), Flag (ref), Callback1 (copy)
			config.initialFragment = InitialFragment
			
			if Callback(config) == false then
				local config1 = { reason = "Error", flowId = "" }
				
				if Flag then return end
				Flag = true
				Callback1(config1)
			end
		end
		
		if p3 then
			local Api = p1.api or require(Parent.FlowApiProvider)
			local Registry = p1.registry or require(Parent.ComponentRegistry).default
			config.api = Api
			config.registry = Registry
			Api.entrypoint(require(Parent.buildEntrypointRequest)(p2.target, p2.flow, p1.surface, Registry, p2.extraProps)):andThen(function(Result)
				-- upvalues: FFlagAmpV2WizardRateLimitedOutcomeModule (upval), FFlagAmpV2WizardTerminalOutcomeModule (upval), Flag (ref), Callback1 (copy), config (copy), Callback (upval)
				local IsRateLimited: boolean = FFlagAmpV2WizardRateLimitedOutcomeModule and Result.outcome == "RateLimited" or Result.outcome == "Error"
				
				if (Result.entry == nil or Result.entry == "") and not IsRateLimited then
					local config1 = {
						reason = "Completed",
						flowId = Result.flowId,
						outcome = if FFlagAmpV2WizardTerminalOutcomeModule then Result.outcome else nil
					}
					
					if not Flag then
						Flag = true
						Callback1(config1)
						
						return
					end
					return
				else
					config.initialFragment = Result
					
					if Callback(config) == false then
						local config2 = { reason = "Error", flowId = "" }
						
						if Flag then return end
						Flag = true
						Callback1(config2)
					end
				end
			end):catch(function()
				-- upvalues: Flag (ref), Callback1 (copy)
				local config = { reason = "Error", flowId = "" }
				
				if not Flag then
					Flag = true
					Callback1(config)
					
					return
				end
			end)
			
			return
		end
		config.initialFragment = nil
		
		if Callback(config) == false then
			local config1 = { reason = "Error", flowId = "" }
			
			if not Flag then
				Flag = true
				Callback1(config1)
			end
		end
	end):catch(errorResult)
end