local Parent = script:FindFirstAncestor("AvatarExperienceModel").Parent
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXCatalogM41Props = AvatarExperienceFlagsModule.FFlagAXCatalogM41Props
local FFlagAXAddHDCatalogTab = AvatarExperienceFlagsModule.FFlagAXAddHDCatalogTab

return require(Parent.enumerate)(script.Name, {
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
	Backgrounds = if AvatarExperienceFlagsModule.FFlagAXCatalogBackgroundsSupport then "Backgrounds" else nil,
	Props = if FFlagAXCatalogM41Props then "Props" else nil,
	HighDefinition = if FFlagAXAddHDCatalogTab then "HighDefinition" else nil
})