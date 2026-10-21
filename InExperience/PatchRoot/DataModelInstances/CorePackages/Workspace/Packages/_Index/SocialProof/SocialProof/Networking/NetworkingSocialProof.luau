local SocialProof = script:FindFirstAncestor("SocialProof")

return (require(SocialProof.Parent.SocialProofNetworking).config({
	roduxNetworking = require(SocialProof.Networking.myRoduxNetworking)
}))