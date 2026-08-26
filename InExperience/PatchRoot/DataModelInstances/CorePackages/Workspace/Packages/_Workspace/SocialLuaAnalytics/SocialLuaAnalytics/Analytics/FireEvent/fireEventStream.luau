local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local llama = require(parent.dependencies).llama
local _ = require(script.Parent.Parent.Types)
local toStringAdditionalArgsModule = require(script.Parent.toStringAdditionalArgs)
local getEventInfoModule = require(script.Parent.getEventInfo)
local optionallyLogModule = require(script.Parent.optionallyLog)
local isEnumModule = require(script.Parent.Parent.Parent.Utils.isEnum)
local dashModule = require(parent_1.Dash)

local _ = function(p1)
	-- upvalues: llama (ref), isEnumModule (ref)
	return llama.Dictionary.map(p1 or {}, function(p2)
		-- upvalues: isEnumModule (copy)
		return if isEnumModule(p2) then p2.rawValue() else p2
	end)
end

local var1 = function(p1, p2)
	-- upvalues: llama (ref)
	return if p1 and p2 then llama.Dictionary.map(p1, function(p3, p4)
		-- upvalues: p2 (ref), llama (copy)
		local var2 = p2[p4]
		
		return if var2 then if type(var2) == "function" then var2(p3) else p3 else llama.None
	end) else {}
end

local var2 = function(p1)
	-- upvalues: toStringAdditionalArgsModule (ref)
	return string.format("context: (%s), eventName: (%s), additionalInfo: (%s)", p1.context, p1.eventType, toStringAdditionalArgsModule(p1.additionalInfo))
end

local var3 = function(p1, p2)
	return function(p3)
		-- upvalues: p2 (ref), p1 (ref)
		if p2 then
			p1:sendEventDeferred(p3.context, p3.eventType, p3.additionalInfo)
			
			return p3
		end
		p1:setRBXEventStream(p3.context, p3.eventType, p3.additionalInfo)
		
		return p3
	end
end

return function(p1)
	-- upvalues: getEventInfoModule (ref), var3 (ref), dashModule (ref), optionallyLogModule (ref), var2 (ref), llama (ref), isEnumModule (ref), var1 (ref)
	local var4 = getEventInfoModule(p1.eventList)
	
	return function(p2, p3)
		-- upvalues: var4 (ref), var3 (copy), p1 (ref), dashModule (copy), optionallyLogModule (copy), var2 (copy), llama (copy), isEnumModule (copy), var1 (copy)
		local var5 = var4(p2)
		local var6 = if p1.getInfoForAllEvents then p1.getInfoForAllEvents() else p1.infoForAllEvents
		local pipe = dashModule.pipe
		local eventStreamImpl = p1.eventStreamImpl
		local shouldUseSendEventDeferred = p1.shouldUseSendEventDeferred
		pipe(function(p4)
			-- upvalues: shouldUseSendEventDeferred (ref), eventStreamImpl (ref)
			if shouldUseSendEventDeferred then
				eventStreamImpl:sendEventDeferred(p4.context, p4.eventType, p4.additionalInfo)
				
				return p4
			end
			eventStreamImpl:setRBXEventStream(p4.context, p4.eventType, p4.additionalInfo)
			
			return p4
		end, optionallyLogModule(p1.loggerImpl, var2))({
			context = var5.context,
			eventType = var5.eventType,
			additionalInfo = llama.Dictionary.join(var6 or {}, llama.Dictionary.map(var5.additionalInfo or {}, function(p4)
				-- upvalues: isEnumModule (copy)
				return if isEnumModule(p4) then p4.rawValue() else p4
			end), var1(p3, var5.formatRulesForAdditionalInfo))
		})
		
		return p2, p3
	end
end