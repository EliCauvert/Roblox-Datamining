local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local playersService = game:GetService("Players")
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local default = require(parent.LoggingProtocol).default
local keystrokeEventModule = require(appChat.Analytics.KeystrokeEvent)
local getFIntAppChatBehaviorCollectionEnabledPercentageModule = require(appChat.Flags.getFIntAppChatBehaviorCollectionEnabledPercentage)
local list = { Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter }

return function(p0)
	-- upvalues: reactModule (ref), getAppFeaturePolicies (ref), getFIntAppChatBehaviorCollectionEnabledPercentageModule (ref), playersService (ref), default (ref), keystrokeEventModule (ref), cryoModule (ref), list (ref)
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useRef({})
	local var9 = reactModule.useRef({})
	local var10 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: getAppFeaturePolicies (copy), getFIntAppChatBehaviorCollectionEnabledPercentageModule (copy), playersService (copy), var7 (ref)
		local var12 = getFIntAppChatBehaviorCollectionEnabledPercentageModule()
		
		if var12 > 0 and playersService.LocalPlayer and getAppFeaturePolicies().getKeystrokeCollectionEnabled() then
			var7.current = playersService.LocalPlayer.UserId % 100 < var12
		end
	end, {})
	local var11 = reactModule.useCallback(function(p1)
		-- upvalues: var8 (ref), p0 (ref), default (copy), keystrokeEventModule (copy), var9 (ref), var10 (ref)
		if #var8.current >= 0 then
			p0.eventLoggingFunc(default, keystrokeEventModule, {}, {
				chatContext = p1,
				keyPressedData = table.concat(var8.current, ","),
				eventTypeData = table.concat(var9.current, ","),
				timestampData = table.concat(var10.current, ",")
			})
			var8.current = {}
			var9.current = {}
			var10.current = {}
		end
	end, { p0.eventLoggingFunc })
	
	return {
		recordKeystroke = reactModule.useCallback(function(p2, p3)
			-- upvalues: var7 (ref), var8 (ref), var9 (ref), var10 (ref), cryoModule (copy), list (copy), p0 (ref), var11 (ref)
			if not var7.current then return end
			if p2 then
				table.insert(var8.current, p3.Name)
				table.insert(var9.current, 0)
				table.insert(var10.current, DateTime.now().UnixTimestampMillis)
			elseif cryoModule.List.find(list, p3) == nil or #var8.current ~= 0 then
				table.insert(var8.current, p3.Name)
				table.insert(var9.current, 1)
				table.insert(var10.current, DateTime.now().UnixTimestampMillis)
			end
			if (p0.maxKeystrokeDataLength or 200) <= #var8.current then
				var11("UAMaxLengthReached")
			end
		end, { var11, p0.maxKeystrokeDataLength }),
		recordTextChange = reactModule.useCallback(function(p4)
			-- upvalues: var7 (ref), var8 (ref), var10 (ref), p0 (ref), var11 (ref)
			if not var7.current then return end
			table.insert(var8.current, string.sub(p4, -1))
			table.insert(var10.current, DateTime.now().UnixTimestampMillis)
			
			if (p0.maxKeystrokeDataLength or 200) <= #var8.current then
				var11("UAMaxLengthReached")
			end
		end, { var11, p0.maxKeystrokeDataLength }),
		sendKeystrokeEventOnSend = reactModule.useCallback(function()
			-- upvalues: var7 (ref), var11 (ref)
			if var7.current then
				var11("UASendPressed")
			end
		end, { var11 })
	}
end