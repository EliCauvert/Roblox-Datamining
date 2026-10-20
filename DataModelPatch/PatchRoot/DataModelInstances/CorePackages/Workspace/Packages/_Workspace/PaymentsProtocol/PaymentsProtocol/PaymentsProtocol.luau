local Parent = script.Parent
local PromiseModule = require(Parent.Parent.Promise)
local PaymentsProtocolConstantsModule = require(Parent.PaymentsProtocolConstants)
local _ = require(Parent.PaymentsProtocolTypes)
local _ = require(Parent.Enums.IAPEventType)
local MessageBusService = game:GetService("MessageBusService")
local PaymentsProtocolModule = {}
PaymentsProtocolModule.__index = PaymentsProtocolModule

function PaymentsProtocolModule.new()
	-- upvalues: PaymentsProtocolModule (copy)
	return (setmetatable({}, PaymentsProtocolModule))
end

function PaymentsProtocolModule:isAvailable()
	-- upvalues: PromiseModule (copy), MessageBusService (copy), PaymentsProtocolConstantsModule (copy)
	return (PromiseModule.new(function(Callback, _)
		-- upvalues: MessageBusService (upval), PaymentsProtocolConstantsModule (upval)
		MessageBusService:MakeRequest(PaymentsProtocolConstantsModule.NAME, PaymentsProtocolConstantsModule.METHOD_IS_AVAILABLE, {}, function(p1)
			-- upvalues: Callback (copy)
			Callback(p1.available)
		end, {})
	end))
end

function PaymentsProtocolModule:listNativeProducts()
	-- upvalues: PromiseModule (copy), MessageBusService (copy), PaymentsProtocolConstantsModule (copy)
	return (PromiseModule.new(function(Callback, _)
		-- upvalues: MessageBusService (upval), PaymentsProtocolConstantsModule (upval)
		MessageBusService:MakeRequest(PaymentsProtocolConstantsModule.NAME, PaymentsProtocolConstantsModule.METHOD_LIST_NATIVE_PRODUCTS, {}, function(p1)
			-- upvalues: Callback (copy)
			Callback(p1)
		end, {})
	end))
end

function PaymentsProtocolModule:processPendingPurchase()
	-- upvalues: MessageBusService (copy), PaymentsProtocolConstantsModule (copy)
	MessageBusService:Publish(PaymentsProtocolConstantsModule.MESSAGE_PROCESS_PENDING_PURCHASE, {})
end

function PaymentsProtocolModule:sendIAPEvent(EventType)
	-- upvalues: MessageBusService (copy), PaymentsProtocolConstantsModule (copy)
	MessageBusService:Publish(PaymentsProtocolConstantsModule.MESSAGE_SEND_IAP_EVENT, { eventType = EventType })
end

PaymentsProtocolModule.default = PaymentsProtocolModule.new()

return PaymentsProtocolModule