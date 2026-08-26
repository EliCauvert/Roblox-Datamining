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

return function(p1)
	-- upvalues: reactModule (ref), getAppFeaturePolicies (ref), getFIntAppChatBehaviorCollectionEnabledPercentageModule (ref), playersService (ref), default (ref), keystrokeEventModule (ref), cryoModule (ref), list (ref)
	local var1 = reactModule.useRef(false)
	local var2 = reactModule.useRef({})
	local var3 = reactModule.useRef({})
	local var4 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: getAppFeaturePolicies (copy), getFIntAppChatBehaviorCollectionEnabledPercentageModule (copy), playersService (copy), var1 (ref)
		local var5 = getFIntAppChatBehaviorCollectionEnabledPercentageModule()
		
		if var5 > 0 and playersService.LocalPlayer and getAppFeaturePolicies().getKeystrokeCollectionEnabled() then
			var1.current = playersService.LocalPlayer.UserId % 100 < var5
		end
	end, {})
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), p1 (ref), default (copy), keystrokeEventModule (copy), var3 (ref), var4 (ref)
		if #var2.current >= 0 then
			p1.eventLoggingFunc(default, keystrokeEventModule, {}, {
				chatContext = p2,
				keyPressedData = table.concat(var2.current, ","),
				eventTypeData = table.concat(var3.current, ","),
				timestampData = table.concat(var4.current, ",")
			})
			var2.current = {}
			var3.current = {}
			var4.current = {}
		end
	end, { p1.eventLoggingFunc })
	
	return {
		recordKeystroke = reactModule.useCallback(function(p2, p3)
			-- upvalues: var1 (ref), var2 (ref), var3 (ref), var4 (ref), cryoModule (copy), list (copy), p1 (ref), var5 (ref)
			if not var1.current then return end
			if p2 then
				table.insert(var2.current, p3.Name)
				table.insert(var3.current, 0)
				table.insert(var4.current, DateTime.now().UnixTimestampMillis)
			elseif cryoModule.List.find(list, p3) == nil or #var2.current ~= 0 then
				table.insert(var2.current, p3.Name)
				table.insert(var3.current, 1)
				table.insert(var4.current, DateTime.now().UnixTimestampMillis)
			end
			if (p1.maxKeystrokeDataLength or 200) <= #var2.current then
				var5("UAMaxLengthReached")
			end
		end, { var5, p1.maxKeystrokeDataLength }),
		recordTextChange = reactModule.useCallback(function(p2)
			-- upvalues: var1 (ref), var2 (ref), var4 (ref), p1 (ref), var5 (ref)
			if not var1.current then return end
			table.insert(var2.current, string.sub(p2, -1))
			table.insert(var4.current, DateTime.now().UnixTimestampMillis)
			
			if (p1.maxKeystrokeDataLength or 200) <= #var2.current then
				var5("UAMaxLengthReached")
			end
		end, { var5, p1.maxKeystrokeDataLength }),
		sendKeystrokeEventOnSend = reactModule.useCallback(function()
			-- upvalues: var1 (ref), var5 (ref)
			if var1.current then
				var5("UASendPressed")
			end
		end, { var5 })
	}
end