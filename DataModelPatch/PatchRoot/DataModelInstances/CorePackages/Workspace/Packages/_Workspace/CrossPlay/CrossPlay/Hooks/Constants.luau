local CrossPlayCapabilities = require(script:FindFirstAncestor("CrossPlay").Parent.UniversalAppPolicy).Enum.CrossPlayCapabilities

return {
	PrivilegeCodes = {
		[CrossPlayCapabilities.CrossPlatform] = 185,
		[CrossPlayCapabilities.Multiplayer] = 254,
		[CrossPlayCapabilities.SharedContent] = 247
	},
	PrivilegeCheckResults = {
		NO_ISSUE = "NoIssue",
		BANNED = "Banned",
		PURCHASE_REQUIRED = "PurchaseRequired",
		ERROR = "Error"
	}
}