local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local UserInputService = game:GetService("UserInputService")
local PaymentPlatformModule = require(Parent1.Enums.PaymentPlatform)
local Url = require(Parent2.Http).Url
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local IsVRAppBuildFunction = require(Parent2.AppCommonLib).IsVRAppBuild
local IsTenFootInterfaceFunction = require(Parent2.AppCommonLib).isTenFootInterface
local GetBlockingConsolePreparePaymentCheckModule = require(Parent1.Flags.getBlockingConsolePreparePaymentCheck)
local GetIsQuestPlatformModule = require(Parent1.Utility.getIsQuestPlatform)
local Default = require(Parent2.LoggingProtocol).default
local PreparePaymentCheckCounterModule = require(Parent.Events.PreparePaymentCheckCounter)
local UsePlaystationPaymentsProtocolCommonFunctions = game:DefineFastFlag("UsePlaystationPaymentsProtocolCommonFunctions", false)

function GetPaymentMethod(Platform): string --[[ Line: 19 ]]
	-- upvalues: PaymentPlatformModule (copy), GetIsQuestPlatformModule (copy)
	return if Platform == Enum.Platform.PS4 then "PlaystationStore" elseif Platform == PaymentPlatformModule.Maquettes or GetIsQuestPlatformModule() then "QuestStore" elseif Platform == Enum.Platform.XBoxOne then "XboxStore" else ""
end

function IsPreparePaymentSuccessful(PaymentMethod, ProviderProductId): boolean --[[ Line: 30 ]]
	-- upvalues: HttpService (copy), HttpRbxApiService (copy), Url (copy), Default (copy), PreparePaymentCheckCounterModule (copy)
	local Json = HttpService:JSONEncode({
		paymentMethod = PaymentMethod,
		providerProductId = ProviderProductId
	})
	local Success, Result = pcall(function() --[[ Line: 37 ]]
		-- upvalues: HttpRbxApiService (upval), Url (upval), Json (copy)
		return HttpRbxApiService:PostAsyncFullUrl(Url.APIS_URL .. "payments-gateway/v1/prepare-payment", Json)
	end)
	
	if not Success then
		Default:logRobloxTelemetryCounter(PreparePaymentCheckCounterModule, 1, { result = "Error", paymentMethod = PaymentMethod })
		
		return true
	elseif HttpService:JSONDecode(Result).isSuccess then
		Default:logRobloxTelemetryCounter(PreparePaymentCheckCounterModule, 1, { result = "Success", paymentMethod = PaymentMethod })
		
		return true
	else
		Default:logRobloxTelemetryCounter(PreparePaymentCheckCounterModule, 1, { result = "Failed", paymentMethod = PaymentMethod })
		
		return false
	end
end

function ConsolePreparePaymentCheck(p1) --[[ Line: 65 ]]
	-- upvalues: UserInputService (copy), UsePlaystationPaymentsProtocolCommonFunctions (copy)
	local Platform = UserInputService:GetPlatform()
	local Payment = GetPaymentMethod(Platform)
	
	return UsePlaystationPaymentsProtocolCommonFunctions and (Platform == Enum.Platform.PS4 or Platform == Enum.Platform.PS5) or (Payment == "" or Platform == Enum.Platform.XBoxOne or IsPreparePaymentSuccessful(Payment, p1))
end

return function(p1) --[[ Line: 84 ]]
	-- upvalues: IsVRAppBuildFunction (copy), IsTenFootInterfaceFunction (copy), GetBlockingConsolePreparePaymentCheckModule (copy)
	return not IsVRAppBuildFunction() and not IsTenFootInterfaceFunction() or (not GetBlockingConsolePreparePaymentCheckModule() or ConsolePreparePaymentCheck(p1))
end