local Parent = script.Parent.Parent.Parent
local Llama = require(Parent.dependencies).llama
local _ = require(script.Parent.Parent.Types)
local ToStringAdditionalArgsModule = require(script.Parent.toStringAdditionalArgs)
local GetEventInfoModule = require(script.Parent.getEventInfo)
local OptionallyLogModule = require(script.Parent.optionallyLog)
local IsEnumModule = require(script.Parent.Parent.Parent.Utils.isEnum)
local DashModule = require(Parent.Parent.Dash)

local function _(p1) --[[ Line: 15 ]]
	-- upvalues: Llama (copy), IsEnumModule (copy)
	return Llama.Dictionary.map(p1 or {}, function(p2) --[[ Line: 16 ]]
		-- upvalues: IsEnumModule (upval)
		return if IsEnumModule(p2) then p2.rawValue() else p2
	end)
end

local function v9(p1, FormatRulesForAdditionalInfo) --[[ Line: 27 ]]
	-- upvalues: Llama (copy)
	return if p1 and FormatRulesForAdditionalInfo then Llama.Dictionary.map(p1, function(p2, p3) --[[ Line: 32 ]]
		-- upvalues: FormatRulesForAdditionalInfo (copy), Llama (upval)
		local FormatRulesForAdditional = FormatRulesForAdditionalInfo[p3]
		
		return if FormatRulesForAdditional then if type(FormatRulesForAdditional) == "function" then FormatRulesForAdditional(p2) else p2 else Llama.None
	end) else {}
end

local function v10(p1): string --[[ Line: 42 ]]
	-- upvalues: ToStringAdditionalArgsModule (copy)
	return string.format("context: (%s), eventName: (%s), additionalInfo: (%s)", p1.context, p1.eventType, ToStringAdditionalArgsModule(p1.additionalInfo))
end

local function v11(p1, p2) --[[ Line: 51 ]]
	return function(p3) --[[ Line: 52 ]]
		-- upvalues: p2 (copy), p1 (copy)
		if p2 then
			p1:sendEventDeferred(p3.context, p3.eventType, p3.additionalInfo)
			
			return p3
		else
			p1:setRBXEventStream(p3.context, p3.eventType, p3.additionalInfo)
			
			return p3
		end
	end
end

return function(p1) --[[ Line: 63 ]]
	-- upvalues: GetEventInfoModule (copy), v11 (copy), DashModule (copy), OptionallyLogModule (copy), v10 (copy), Llama (copy), IsEnumModule (copy), v9 (copy)
	local EventInfoModule = GetEventInfoModule(p1.eventList)
	
	return function(p2, p3) --[[ Line: 73 ]]
		-- upvalues: EventInfoModule (copy), v11 (upval), p1 (copy), DashModule (upval), OptionallyLogModule (upval), v10 (upval), Llama (upval), IsEnumModule (upval), v9 (upval)
		local EventInfoModuleResult = EventInfoModule(p2)
		local EventStreamImpl = p1.eventStreamImpl
		local ShouldUseSendEventDeferred = p1.shouldUseSendEventDeferred
		DashModule.pipe(function(p4) --[[ Line: 52 ]]
			-- upvalues: ShouldUseSendEventDeferred (copy), EventStreamImpl (copy)
			if ShouldUseSendEventDeferred then
				EventStreamImpl:sendEventDeferred(p4.context, p4.eventType, p4.additionalInfo)
				
				return p4
			else
				EventStreamImpl:setRBXEventStream(p4.context, p4.eventType, p4.additionalInfo)
				
				return p4
			end
		end, OptionallyLogModule(p1.loggerImpl, v10))({
			context = EventInfoModuleResult.context,
			eventType = EventInfoModuleResult.eventType,
			additionalInfo = Llama.Dictionary.join((if p1.getInfoForAllEvents then p1.getInfoForAllEvents() else p1.infoForAllEvents) or {}, Llama.Dictionary.map(EventInfoModuleResult.additionalInfo or {}, function(p4) --[[ Line: 16 ]]
				-- upvalues: IsEnumModule (upval)
				return if IsEnumModule(p4) then p4.rawValue() else p4
			end), v9(p3, EventInfoModuleResult.formatRulesForAdditionalInfo))
		})
		
		return p2, p3
	end
end