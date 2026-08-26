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

function GetPaymentMethod(p1)
	-- upvalues: paymentPlatformModule (ref), enableVRPreparePaymentCheck (ref), getIsQuestPlatformModule (ref)
	return if p1 == Enum.Platform.PS4 then "PlaystationStore" elseif p1 == paymentPlatformModule.Maquettes or enableVRPreparePaymentCheck and getIsQuestPlatformModule() then "QuestStore" elseif p1 == Enum.Platform.XBoxOne then "XboxStore" else ""
end

function IsPreparePaymentSuccessful(p1, p2)
	-- upvalues: httpService (ref), httpRbxApiService (ref), url (ref), default (ref), preparePaymentCheckCounterModule (ref)
	local var1 = httpService:JSONEncode({ paymentMethod = p1, providerProductId = p2 })
	local ok, status = pcall(function()
		-- upvalues: httpRbxApiService (copy), url (copy), var1 (ref)
		return httpRbxApiService:PostAsyncFullUrl(url.APIS_URL .. "payments-gateway/v1/prepare-payment", var1)
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

function ConsolePreparePaymentCheck(p1)
	-- upvalues: userInputService (ref), usePlaystationPaymentsProtocolCommonFunctions (ref)
	local platform = userInputService:GetPlatform()
	local var1 = GetPaymentMethod(platform)
	
	return if usePlaystationPaymentsProtocolCommonFunctions and (platform == Enum.Platform.PS4 or platform == Enum.Platform.PS5) then true else var1 == "" or platform == Enum.Platform.XBoxOne or IsPreparePaymentSuccessful(var1, p1)
end

return function(p1)
	-- upvalues: isVRAppBuild (ref), guiService (ref), getBlockingConsolePreparePaymentCheckModule (ref)
	return if not (not isVRAppBuild() and not guiService:IsTenFootInterface()) then not getBlockingConsolePreparePaymentCheckModule() or ConsolePreparePaymentCheck(p1) else true
end