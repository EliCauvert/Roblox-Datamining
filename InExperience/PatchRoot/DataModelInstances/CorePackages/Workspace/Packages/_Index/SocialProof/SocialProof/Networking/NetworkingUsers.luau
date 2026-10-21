local SocialProof = script:FindFirstAncestor("SocialProof")

return require(SocialProof.Parent.LuaSocialLibrariesDeps).NetworkingUsers.config({
	roduxNetworking = require(SocialProof.Networking.myRoduxNetworking)
})