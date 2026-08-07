local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")

return require(socialExperienceJoin.Parent.LuaSocialLibrariesDeps).NetworkingGames.config({
	roduxNetworking = require(socialExperienceJoin.Networking.myRoduxNetworking)
})