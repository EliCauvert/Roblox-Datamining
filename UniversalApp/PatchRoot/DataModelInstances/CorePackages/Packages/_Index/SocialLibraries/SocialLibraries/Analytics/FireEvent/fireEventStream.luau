local llama = require(script.Parent.Parent.Parent.dependencies).llama
local _ = require(script.Parent.Types)
local toStringAdditionalArgsModule = require(script.Parent.toStringAdditionalArgs)
local getEventInfoModule = require(script.Parent.getEventInfo)
local optionallyLogModule = require(script.Parent.optionallyLog)
local composeModule = require(script.Parent.Parent.Parent.RoduxTools.compose)
local isEnumModule = require(script.Parent.Parent.Parent.Utils.isEnum)

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

local _ = function(p1)
	return function(p2)
		-- upvalues: p1 (ref)
		p1:setRBXEventStream(p2.context, p2.eventType, p2.additionalInfo)
		
		return p2
	end
end

return function(p1)
	-- upvalues: getEventInfoModule (ref), composeModule (ref), optionallyLogModule (ref), var2 (ref), llama (ref), isEnumModule (ref), var1 (ref)
	local var3 = getEventInfoModule(p1.eventList)
	
	return function(p2, p3)
		-- upvalues: var3 (ref), composeModule (copy), optionallyLogModule (copy), p1 (ref), var2 (copy), llama (copy), isEnumModule (copy), var1 (copy)
		local var4 = var3(p2)
		local eventStreamImpl = p1.eventStreamImpl
		composeModule(optionallyLogModule(p1.loggerImpl, var2), function(p4)
			-- upvalues: eventStreamImpl (ref)
			eventStreamImpl:setRBXEventStream(p4.context, p4.eventType, p4.additionalInfo)
			
			return p4
		end)({
			context = var4.context.rawValue(),
			eventType = var4.eventType.rawValue(),
			additionalInfo = llama.Dictionary.join(p1.infoForAllEvents or {}, llama.Dictionary.map(var4.additionalInfo or {}, function(p4)
				-- upvalues: isEnumModule (copy)
				return if isEnumModule(p4) then p4.rawValue() else p4
			end), var1(p3, var4.formatRulesForAdditionalInfo))
		})
		
		return p2, p3
	end
end