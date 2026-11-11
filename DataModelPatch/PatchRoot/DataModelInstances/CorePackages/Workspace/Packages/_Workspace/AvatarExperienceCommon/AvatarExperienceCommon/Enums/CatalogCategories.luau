local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local FFlagAXCatalogM41Props = AvatarExperienceFlagsModule.FFlagAXCatalogM41Props
local FFlagAXAddHDCatalogTab = AvatarExperienceFlagsModule.FFlagAXAddHDCatalogTab
local FFlagAXCatalogBackgroundsSupport = AvatarExperienceFlagsModule.FFlagAXCatalogBackgroundsSupport

return require(Parent.enumerate)(script.Name, {
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
	Makeup = if AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport or FFlagAXCatalogMakeupSupport then "Makeup" else nil,
	Backgrounds = if FFlagAXCatalogBackgroundsSupport then "Backgrounds" else nil,
	Props = if FFlagAXCatalogM41Props then "Props" else nil,
	HighDefinition = if FFlagAXAddHDCatalogTab then "HighDefinition" else nil
})