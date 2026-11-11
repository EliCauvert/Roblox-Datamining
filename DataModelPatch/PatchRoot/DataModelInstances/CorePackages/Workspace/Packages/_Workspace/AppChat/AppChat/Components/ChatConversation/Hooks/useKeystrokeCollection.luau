local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local Players = game:GetService("Players")
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local Default = require(Parent.LoggingProtocol).default
local KeystrokeEventModule = require(AppChat.Analytics.KeystrokeEvent)
local GetFIntAppChatBehaviorCollectionEnabledPercentageModule = require(AppChat.Flags.getFIntAppChatBehaviorCollectionEnabledPercentage)
local list = { Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter }

return function(p1)
	-- upvalues: ReactModule (copy), GetAppFeaturePoliciesFunction (copy), GetFIntAppChatBehaviorCollectionEnabledPercentageModule (copy), Players (copy), Default (copy), KeystrokeEventModule (copy), CryoModule (copy), list (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef({})
	local UseRefResult3 = ReactModule.useRef({})
	ReactModule.useEffect(function()
		-- upvalues: GetAppFeaturePoliciesFunction (upval), GetFIntAppChatBehaviorCollectionEnabledPercentageModule (upval), Players (upval), UseRefResult (copy)
		local KeystrokeCollectionEnabled = GetAppFeaturePoliciesFunction().getKeystrokeCollectionEnabled()
		local FIntAppChatBehaviorCollectionEnabledPercentageModule: number = GetFIntAppChatBehaviorCollectionEnabledPercentageModule()
		
		if FIntAppChatBehaviorCollectionEnabledPercentageModule > 0 and Players.LocalPlayer and KeystrokeCollectionEnabled then
			UseRefResult.current = Players.LocalPlayer.UserId % 100 < FIntAppChatBehaviorCollectionEnabledPercentageModule
		end
	end, {})
	local UseResult = ReactModule.useCallback(function(ChatContext)
		-- upvalues: UseRefResult1 (copy), p1 (copy), Default (upval), KeystrokeEventModule (upval), UseRefResult2 (copy), UseRefResult3 (copy)
		if #UseRefResult1.current >= 0 then
			p1.eventLoggingFunc(Default, KeystrokeEventModule, {}, {
				chatContext = ChatContext,
				keyPressedData = table.concat(UseRefResult1.current, ","),
				eventTypeData = table.concat(UseRefResult2.current, ","),
				timestampData = table.concat(UseRefResult3.current, ",")
			})
			UseRefResult1.current = {}
			UseRefResult2.current = {}
			UseRefResult3.current = {}
		end
	end, { p1.eventLoggingFunc })
	
	return {
		recordKeystroke = ReactModule.useCallback(function(p2, p3)
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), CryoModule (upval), list (upval), p1 (copy), UseResult (copy)
			if not UseRefResult.current then return end
			if p2 then
				table.insert(UseRefResult1.current, p3.Name)
				table.insert(UseRefResult2.current, 0)
				table.insert(UseRefResult3.current, DateTime.now().UnixTimestampMillis)
			elseif CryoModule.List.find(list, p3) == nil or #UseRefResult1.current ~= 0 then
				table.insert(UseRefResult1.current, p3.Name)
				table.insert(UseRefResult2.current, 1)
				table.insert(UseRefResult3.current, DateTime.now().UnixTimestampMillis)
			end
			if (p1.maxKeystrokeDataLength or 200) <= #UseRefResult1.current then
				UseResult("UAMaxLengthReached")
			end
		end, { UseResult, p1.maxKeystrokeDataLength }),
		recordTextChange = ReactModule.useCallback(function(Text: string)
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult3 (copy), p1 (copy), UseResult (copy)
			if not UseRefResult.current then return end
			table.insert(UseRefResult1.current, (string.sub(Text, -1)))
			table.insert(UseRefResult3.current, DateTime.now().UnixTimestampMillis)
			
			if (p1.maxKeystrokeDataLength or 200) <= #UseRefResult1.current then
				UseResult("UAMaxLengthReached")
			end
		end, { UseResult, p1.maxKeystrokeDataLength }),
		sendKeystrokeEventOnSend = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), UseResult (copy)
			if UseRefResult.current then
				UseResult("UASendPressed")
			end
		end, { UseResult })
	}
end