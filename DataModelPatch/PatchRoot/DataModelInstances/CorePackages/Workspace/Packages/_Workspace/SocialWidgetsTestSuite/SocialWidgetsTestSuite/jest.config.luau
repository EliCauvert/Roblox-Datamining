local Parent = script.Parent.Parent

return {
	projects = {
		require(Parent.FriendsCarousel)["jest.config"],
		require(Parent.FriendsMenu)["jest.config"],
		require(Parent.PYMKCarousel)["jest.config"],
		require(Parent.SocialCarousel)["jest.config"]
	}
}