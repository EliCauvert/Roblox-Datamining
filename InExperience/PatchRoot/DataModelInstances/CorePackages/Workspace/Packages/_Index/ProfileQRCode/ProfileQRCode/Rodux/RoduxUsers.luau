local profileQRCode = script:FindFirstAncestor("ProfileQRCode")

return require(profileQRCode.Parent.LuaSocialLibrariesDeps).RoduxUsers.config({
	keyPath = require(profileQRCode.Common.Constants).RODUX_KEY .. ".Users"
})