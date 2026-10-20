return {
	START_DISCOVERY = "{\"magicLoginActionKey\" : \"startDiscovery\"}",
	STOP_DISCOVERY = "{\"magicLoginActionKey\" : \"stopDiscovery\"}",
	START_ADVERTISEMENT = "{\"magicLoginActionKey\" : \"startAdvertisement\"}",
	STOP_ADVERTISEMENT = "{\"magicLoginActionKey\" : \"stopAdvertisement\"}",
	ENDPOINT_FOUND = "endpointFound",
	ENDPOINT_LOST = "endpointLost",
	REQUEST_CONNECTION = "requestConnection",
	CONNECTION_INIT = "connectionInit",
	CLEAR_DEVICE_LIST = "clearDeviceList",
	CONTENT_MAX_WIDTH = 480,
	getButtonTextOverrideConfig = function()
		return {
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.XY
		}
	end,
	getSmallIconButtonTextOverrideConfig = function(p1)
		return {
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(0.7, 0, 0, 0),
			TextSize = p1.FontSize.FontSize_350,
			TextXAlignment = Enum.TextXAlignment.Left
		}
	end,
	getSmallButtonSize = function(p1): UDim2
		return UDim2.new(0.5, 0, 0, p1.Size.Size_1000)
	end
}