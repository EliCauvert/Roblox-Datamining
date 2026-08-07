local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)

return require(parent.enumerate)(script.Name, {
	Featured = "Featured",
	Recommended = "Recommended",
	Characters = "Characters",
	Avatars = "Avatars",
	Clothing = "Clothing",
	Accessories = "Accessories",
	Head = "Head",
	Body = "Body",
	Makeup = "Makeup",
	AllAnimations = "AllAnimations",
	Emotes = "Emotes",
	Backgrounds = if avatarExperienceFlagsModule.FFlagAXCatalogBackgroundsSupport then "Backgrounds" else nil,
	Props = if avatarExperienceFlagsModule.FFlagAXCatalogM41Props then "Props" else nil,
	HighDefinition = if avatarExperienceFlagsModule.FFlagAXAddHDCatalogTab then "HighDefinition" else nil
})