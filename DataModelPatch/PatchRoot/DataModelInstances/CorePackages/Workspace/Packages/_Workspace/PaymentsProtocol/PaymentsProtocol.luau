local _ = require(script.PaymentsProtocolTypes)

return {
	Enum = { ProductType = require(script.Enums.ProductType) },
	PaymentsProtocol = require(script.PaymentsProtocol),
	PaymentsProtocolConstants = require(script.PaymentsProtocolConstants),
	Flags = {}
}