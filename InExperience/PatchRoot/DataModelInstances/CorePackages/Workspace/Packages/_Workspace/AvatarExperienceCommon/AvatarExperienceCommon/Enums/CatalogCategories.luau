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
	AllAnimations = "AllAnimations",
	Emotes = "Emotes",
	Makeup = if avatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport or avatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport then "Makeup" else nil,
	Backgrounds = if avatarExperienceFlagsModule.FFlagAXCatalogBackgroundsSupport then "Backgrounds" else nil,
	Props = if avatarExperienceFlagsModule.FFlagAXCatalogM41Props then "Props" else nil,
	HighDefinition = if avatarExperienceFlagsModule.FFlagAXAddHDCatalogTab then "HighDefinition" else nil
})