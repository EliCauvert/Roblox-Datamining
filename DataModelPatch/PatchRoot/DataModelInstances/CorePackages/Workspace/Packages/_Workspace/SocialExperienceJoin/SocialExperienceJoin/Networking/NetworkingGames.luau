local SocialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")

return (require(SocialExperienceJoin.Parent.LuaSocialLibrariesDeps).NetworkingGames.config({
	roduxNetworking = require(SocialExperienceJoin.Networking.myRoduxNetworking)
}))