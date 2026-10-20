local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local HttpService = game:GetService("HttpService")
local AccountService = game:GetService("AccountService")
local MagicLoginEngineFeature = game:GetEngineFeature("MagicLogin")
local UseEffectFunction = require(Parent.React).useEffect
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local Logger = require(Parent.Loggers).Logger
local ConstantsModule = require(LoginV2.Components.Constants)
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local MessageBus = require(Parent.MessageBus).MessageBus
local TModule = require(Parent.t)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), AccountService (ref), MagicLoginEngineFeature (ref), UseEffectFunction (copy), HttpService (copy), ConstantsModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), Logger (copy), MessageBus (copy), TModule (copy)
	local UseDispatch = p1.useDispatch or UseDispatchFunction()
	AccountService = p1.AccountService or AccountService
	MagicLoginEngineFeature = p1.MagicLoginEngineFeature or MagicLoginEngineFeature
	UseEffectFunction(function()
		-- upvalues: AccountService (upval), MagicLoginEngineFeature (upval), HttpService (upval), ConstantsModule (upval), UseDispatch (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), Logger (upval), MessageBus (upval), TModule (upval)
		local Connection = nil
		local NewResult = nil
		
		if AccountService and MagicLoginEngineFeature then
			Connection = AccountService.MagicLoginEvent:Connect(function(Text)
				-- upvalues: HttpService (upval), ConstantsModule (upval), UseDispatch (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), Logger (upval)
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, Text)
				
				if not Success then
					Logger:warning("Magic login Failed to parse JSON data from string: " .. Text)
				elseif Result.magicLoginActionKey == ConstantsModule.CONNECTION_INIT then
					UseDispatch(SetCentralOverlayFunction(CentralOverlayType.MagicLoginApprovePopup, {
						endpointName = Result.endpointName,
						endpointType = Result.endpointType,
						authenticationDigits = Result.authenticationDigits,
						authCode = Result.code
					}))
					
					return
				end
			end)
			NewResult = MessageBus.Subscriber.new()
			NewResult:subscribe({
				mid = MessageBus.getMessageId("Game", "onGameLeave"),
				validateParams = TModule.table
			}, function(_)
				-- upvalues: AccountService (upval), ConstantsModule (upval)
				AccountService:MagicLogin(ConstantsModule.START_ADVERTISEMENT)
			end)
			NewResult:subscribe({
				mid = MessageBus.getMessageId("Game", "launchSuccess"),
				validateParams = TModule.table
			}, function(_)
				-- upvalues: AccountService (upval), ConstantsModule (upval)
				AccountService:MagicLogin(ConstantsModule.STOP_ADVERTISEMENT)
			end)
		end
		return function()
			-- upvalues: Connection (ref), NewResult (ref)
			if Connection then
				Connection:Disconnect()
			end
			if NewResult then
				NewResult:unsubscribeFromAllMessages()
			end
		end
	end, {})
	
	return nil
end