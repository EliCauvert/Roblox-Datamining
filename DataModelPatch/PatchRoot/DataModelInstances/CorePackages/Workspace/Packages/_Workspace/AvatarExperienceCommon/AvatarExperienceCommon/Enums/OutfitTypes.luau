local _ = require(script.Parent.Parent.Types.CategoryTypes.CategoryTypes)

return {
	Avatar = "Avatar",
	EditableAvatar = "EditableAvatar",
	DynamicHead = "DynamicHead",
	Shoes = "Shoes",
	Animations = "Animations",
	Makeup = if require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport then "Makeup" else nil
}