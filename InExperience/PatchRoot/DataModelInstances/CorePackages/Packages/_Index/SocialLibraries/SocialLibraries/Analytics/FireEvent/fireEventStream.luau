local llama = require(script.Parent.Parent.Parent.dependencies).llama
local _ = require(script.Parent.Types)
local toStringAdditionalArgsModule = require(script.Parent.toStringAdditionalArgs)
local getEventInfoModule = require(script.Parent.getEventInfo)
local optionallyLogModule = require(script.Parent.optionallyLog)
local composeModule = require(script.Parent.Parent.Parent.RoduxTools.compose)
local isEnumModule = require(script.Parent.Parent.Parent.Utils.isEnum)

local _ = function(p0) --[[ line: 12 ]]
	-- upvalues: llama (ref), isEnumModule (ref)
	return llama.Dictionary.map(p0 or {}, function(p1) --[[ line: 13 ]]
		-- upvalues: isEnumModule (copy)
		return if isEnumModule(p1) then p1.rawValue() else p1
	end)
end

local var5 = function(p2, p3) --[[ line: 22 ]]
	-- upvalues: llama (ref)
	return if p2 and p3 then llama.Dictionary.map(p2, function(p4, p5) --[[ line: 27 ]]
		-- upvalues: p3 (ref), llama (copy)
		local var7 = p3[p5]
		
		return if var7 then if type(var7) == "function" then var7(p4) else p4 else llama.None
	end) else {}
end

local var6 = function(p6) --[[ line: 37 ]]
	-- upvalues: toStringAdditionalArgsModule (ref)
	return string.format("context: (%s), eventName: (%s), additionalInfo: (%s)", p6.context, p6.eventType, toStringAdditionalArgsModule(p6.additionalInfo))
end

local _ = function(p7) --[[ line: 46 ]]
	return function(p8) --[[ line: 47 ]]
		-- upvalues: p7 (ref)
		p7:setRBXEventStream(p8.context, p8.eventType, p8.additionalInfo)
		
		return p8
	end
end

return function(p9) --[[ line: 54 ]]
	-- upvalues: getEventInfoModule (ref), composeModule (ref), optionallyLogModule (ref), var6 (ref), llama (ref), isEnumModule (ref), var5 (ref)
	local var8 = getEventInfoModule(p9.eventList)
	
	return function(p10, p11) --[[ line: 64 ]]
		-- upvalues: var8 (ref), composeModule (copy), optionallyLogModule (copy), p9 (ref), var6 (copy), llama (copy), isEnumModule (copy), var5 (copy)
		local var9 = var8(p10)
		local eventStreamImpl = p9.eventStreamImpl
		composeModule(optionallyLogModule(p9.loggerImpl, var6), function(p13) --[[ line: 47 ]]
			-- upvalues: eventStreamImpl (ref)
			eventStreamImpl:setRBXEventStream(p13.context, p13.eventType, p13.additionalInfo)
			
			return p13
		end)({
			context = var9.context.rawValue(),
			eventType = var9.eventType.rawValue(),
			additionalInfo = llama.Dictionary.join(p9.infoForAllEvents or {}, llama.Dictionary.map(var9.additionalInfo or {}, function(p12) --[[ line: 13 ]]
				-- upvalues: isEnumModule (copy)
				return if isEnumModule(p12) then p12.rawValue() else p12
			end), var5(p11, var9.formatRulesForAdditionalInfo))
		})
		
		return p10, p11
	end
end