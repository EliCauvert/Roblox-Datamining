local SocialProofVerticalUserListSheetModule = require(script.SocialProofVerticalUserListSheet)

return {
	FriendsOwnedUserList = require(script.FriendsOwnedUserList),
	SocialProofVerticalUserListSheet = if require(script:FindFirstAncestor("SocialProof").Parent.SharedFlags).FFlagEnableSocialProofVerticalUserListSheet then SocialProofVerticalUserListSheetModule else nil
}