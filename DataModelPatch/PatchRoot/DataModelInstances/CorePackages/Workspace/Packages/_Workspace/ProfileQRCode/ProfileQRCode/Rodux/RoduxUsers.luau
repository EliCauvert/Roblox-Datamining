local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")

return require(ProfileQRCode.Parent.LuaSocialLibrariesDeps).RoduxUsers.config({
	keyPath = require(ProfileQRCode.Common.Constants).RODUX_KEY .. ".Users"
})