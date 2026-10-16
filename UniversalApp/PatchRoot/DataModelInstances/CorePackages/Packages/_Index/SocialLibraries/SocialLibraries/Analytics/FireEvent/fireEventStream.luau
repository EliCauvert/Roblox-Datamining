local Llama = require(script.Parent.Parent.Parent.dependencies).llama
local _ = require(script.Parent.Types)
local ToStringAdditionalArgsModule = require(script.Parent.toStringAdditionalArgs)
local GetEventInfoModule = require(script.Parent.getEventInfo)
local OptionallyLogModule = require(script.Parent.optionallyLog)
local ComposeModule = require(script.Parent.Parent.Parent.RoduxTools.compose)
local IsEnumModule = require(script.Parent.Parent.Parent.Utils.isEnum)

local function _(p1) --[[ Line: 12 ]]
	-- upvalues: Llama (copy), IsEnumModule (copy)
	return Llama.Dictionary.map(p1 or {}, function(p2) --[[ Line: 13 ]]
		-- upvalues: IsEnumModule (upval)
		return if IsEnumModule(p2) then p2.rawValue() else p2
	end)
end

local function v8(p1, FormatRulesForAdditionalInfo) --[[ Line: 22 ]]
	-- upvalues: Llama (copy)
	return if p1 and FormatRulesForAdditionalInfo then Llama.Dictionary.map(p1, function(p2, p3) --[[ Line: 27 ]]
		-- upvalues: FormatRulesForAdditionalInfo (copy), Llama (upval)
		local FormatRulesForAdditional = FormatRulesForAdditionalInfo[p3]
		
		return if FormatRulesForAdditional then if type(FormatRulesForAdditional) == "function" then FormatRulesForAdditional(p2) else p2 else Llama.None
	end) else {}
end

local function v9(p1): string --[[ Line: 37 ]]
	-- upvalues: ToStringAdditionalArgsModule (copy)
	return string.format("context: (%s), eventName: (%s), additionalInfo: (%s)", p1.context, p1.eventType, ToStringAdditionalArgsModule(p1.additionalInfo))
end

local _ = function(p1) --[[ Line: 46 ]]
	return function(p2) --[[ Line: 47 ]]
		-- upvalues: p1 (copy)
		p1:setRBXEventStream(p2.context, p2.eventType, p2.additionalInfo)
		
		return p2
	end
end

return function(p1) --[[ Line: 54 ]]
	-- upvalues: GetEventInfoModule (copy), ComposeModule (copy), OptionallyLogModule (copy), v9 (copy), Llama (copy), IsEnumModule (copy), v8 (copy)
	local EventInfoModule = GetEventInfoModule(p1.eventList)
	
	return function(p2, p3) --[[ Line: 64 ]]
		-- upvalues: EventInfoModule (copy), ComposeModule (upval), OptionallyLogModule (upval), p1 (copy), v9 (upval), Llama (upval), IsEnumModule (upval), v8 (upval)
		local EventInfoModuleResult = EventInfoModule(p2)
		local EventStreamImpl = p1.eventStreamImpl
		ComposeModule(OptionallyLogModule(p1.loggerImpl, v9), function(p4) --[[ Line: 47 ]]
			-- upvalues: EventStreamImpl (copy)
			EventStreamImpl:setRBXEventStream(p4.context, p4.eventType, p4.additionalInfo)
			
			return p4
		end)({
			context = EventInfoModuleResult.context.rawValue(),
			eventType = EventInfoModuleResult.eventType.rawValue(),
			additionalInfo = Llama.Dictionary.join(p1.infoForAllEvents or {}, Llama.Dictionary.map(EventInfoModuleResult.additionalInfo or {}, function(p4) --[[ Line: 13 ]]
				-- upvalues: IsEnumModule (upval)
				return if IsEnumModule(p4) then p4.rawValue() else p4
			end), v8(p3, EventInfoModuleResult.formatRulesForAdditionalInfo))
		})
		
		return p2, p3
	end
end