local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local llama = require(parent.dependencies).llama
local _ = require(script.Parent.Parent.Types)
local toStringAdditionalArgsModule = require(script.Parent.toStringAdditionalArgs)
local getEventInfoModule = require(script.Parent.getEventInfo)
local optionallyLogModule = require(script.Parent.optionallyLog)
local isEnumModule = require(script.Parent.Parent.Parent.Utils.isEnum)
local dashModule = require(parent_1.Dash)

local _ = function(p0) --[[ line: 15 ]]
	-- upvalues: llama (ref), isEnumModule (ref)
	return llama.Dictionary.map(p0 or {}, function(p1) --[[ line: 16 ]]
		-- upvalues: isEnumModule (copy)
		return if isEnumModule(p1) then p1.rawValue() else p1
	end)
end

local var5 = function(p2, p3) --[[ line: 27 ]]
	-- upvalues: llama (ref)
	return if p2 and p3 then llama.Dictionary.map(p2, function(p4, p5) --[[ line: 32 ]]
		-- upvalues: p3 (ref), llama (copy)
		local var8 = p3[p5]
		
		return if var8 then if type(var8) == "function" then var8(p4) else p4 else llama.None
	end) else {}
end

local var6 = function(p6) --[[ line: 42 ]]
	-- upvalues: toStringAdditionalArgsModule (ref)
	return string.format("context: (%s), eventName: (%s), additionalInfo: (%s)", p6.context, p6.eventType, toStringAdditionalArgsModule(p6.additionalInfo))
end

local var7 = function(p7, p8) --[[ line: 51 ]]
	return function(p9) --[[ line: 52 ]]
		-- upvalues: p8 (ref), p7 (ref)
		if p8 then
			p7:sendEventDeferred(p9.context, p9.eventType, p9.additionalInfo)
			
			return p9
		end
		p7:setRBXEventStream(p9.context, p9.eventType, p9.additionalInfo)
		
		return p9
	end
end

return function(p10) --[[ line: 63 ]]
	-- upvalues: getEventInfoModule (ref), var7 (ref), dashModule (ref), optionallyLogModule (ref), var6 (ref), llama (ref), isEnumModule (ref), var5 (ref)
	local var9 = getEventInfoModule(p10.eventList)
	
	return function(p11, p12) --[[ line: 73 ]]
		-- upvalues: var9 (ref), var7 (copy), p10 (ref), dashModule (copy), optionallyLogModule (copy), var6 (copy), llama (copy), isEnumModule (copy), var5 (copy)
		local var10 = var9(p11)
		local var11 = if p10.getInfoForAllEvents then p10.getInfoForAllEvents() else p10.infoForAllEvents
		local pipe = dashModule.pipe
		local eventStreamImpl = p10.eventStreamImpl
		local shouldUseSendEventDeferred = p10.shouldUseSendEventDeferred
		pipe(function(p14) --[[ line: 52 ]]
			-- upvalues: shouldUseSendEventDeferred (ref), eventStreamImpl (ref)
			if shouldUseSendEventDeferred then
				eventStreamImpl:sendEventDeferred(p14.context, p14.eventType, p14.additionalInfo)
				
				return p14
			end
			eventStreamImpl:setRBXEventStream(p14.context, p14.eventType, p14.additionalInfo)
			
			return p14
		end, optionallyLogModule(p10.loggerImpl, var6))({
			context = var10.context,
			eventType = var10.eventType,
			additionalInfo = llama.Dictionary.join(var11 or {}, llama.Dictionary.map(var10.additionalInfo or {}, function(p13) --[[ line: 16 ]]
				-- upvalues: isEnumModule (copy)
				return if isEnumModule(p13) then p13.rawValue() else p13
			end), var5(p12, var10.formatRulesForAdditionalInfo))
		})
		
		return p11, p12
	end
end