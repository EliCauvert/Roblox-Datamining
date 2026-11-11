return require(script:FindFirstAncestor("PaymentsProtocol").Parent.enumerate)(script.Name, {
	BrowseProductStart = "BrowseProductStart",
	BrowseProductEnd = "BrowseProductEnd",
	ProductNotAvailable = "ProductNotAvailable"
})