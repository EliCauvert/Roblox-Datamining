local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local paymentPlatformModule = require(parent_1.Enums.PaymentPlatform)
local url = require(parent_2.Http).Url
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local isVRAppBuild = require(parent_2.AppCommonLib).IsVRAppBuild
local getBlockingConsolePreparePaymentCheckModule = require(parent_1.Flags.getBlockingConsolePreparePaymentCheck)
local getIsQuestPlatformModule = require(parent_1.Utility.getIsQuestPlatform)
local default = require(parent_2.LoggingProtocol).default
local preparePaymentCheckCounterModule = require(parent.Events.PreparePaymentCheckCounter)
local usePlaystationPaymentsProtocolCommonFunctions = game:DefineFastFlag("UsePlaystationPaymentsProtocolCommonFunctions", false)
local enableVRPreparePaymentCheck = game:DefineFastFlag("EnableVRPreparePaymentCheck", false)

function GetPaymentMethod(p0) --[[ line: 20 ]]
	-- upvalues: paymentPlatformModule (ref), enableVRPreparePaymentCheck (ref), getIsQuestPlatformModule (ref)
	return if p0 == Enum.Platform.PS4 then "PlaystationStore" elseif p0 == paymentPlatformModule.Maquettes or enableVRPreparePaymentCheck and getIsQuestPlatformModule() then "QuestStore" elseif p0 == Enum.Platform.XBoxOne then "XboxStore" else ""
end

function IsPreparePaymentSuccessful(p1, p2) --[[ line: 31 ]]
	-- upvalues: httpService (ref), httpRbxApiService (ref), url (ref), default (ref), preparePaymentCheckCounterModule (ref)
	local var10 = httpService:JSONEncode({ paymentMethod = p1, providerProductId = p2 })
	local ok, status = pcall(function() --[[ line: 38 ]]
		-- upvalues: httpRbxApiService (copy), url (copy), var10 (ref)
		return httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "payments-gateway/v1/prepare-payment", var10)
	end)
	
	if not ok then
		default:logRobloxTelemetryCounter(preparePaymentCheckCounterModule, 1, { result = "Error", paymentMethod = p1 })
		
		return true
	elseif httpService:JSONDecode(status).isSuccess then
		default:logRobloxTelemetryCounter(preparePaymentCheckCounterModule, 1, { result = "Success", paymentMethod = p1 })
		
		return true
	end
	default:logRobloxTelemetryCounter(preparePaymentCheckCounterModule, 1, { result = "Failed", paymentMethod = p1 })
	
	return false
end

function ConsolePreparePaymentCheck(p3) --[[ line: 66 ]]
	-- upvalues: userInputService (ref), usePlaystationPaymentsProtocolCommonFunctions (ref)
	local platform = userInputService:GetPlatform()
	local var12 = GetPaymentMethod(platform)
	
	return if usePlaystationPaymentsProtocolCommonFunctions and (platform == Enum.Platform.PS4 or platform == Enum.Platform.PS5) then true else var12 == "" or platform == Enum.Platform.XBoxOne or IsPreparePaymentSuccessful(var12, p3)
end

return function(p4) --[[ line: 85 ]]
	-- upvalues: isVRAppBuild (ref), guiService (ref), getBlockingConsolePreparePaymentCheckModule (ref)
	return if not (not isVRAppBuild() and not guiService:IsTenFootInterface()) then not getBlockingConsolePreparePaymentCheckModule() or ConsolePreparePaymentCheck(p4) else true
end