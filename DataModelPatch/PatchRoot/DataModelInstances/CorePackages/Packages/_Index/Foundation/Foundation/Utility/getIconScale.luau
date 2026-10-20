local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local FoundationImagesModule = require(Parent.FoundationImages)
local Images = FoundationImagesModule.Images
local IsBuilderIconModule = require(Foundation.Utility.isBuilderIcon)
local IconSizeModule = require(Foundation.Enums.IconSize)
local config = {
	[IconSizeModule.Small] = { Vector2.new(16, 16), Vector2.new(18, 18) },
	[IconSizeModule.Medium] = { Vector2.new(28, 28), Vector2.new(36, 36) },
	[IconSizeModule.Large] = { Vector2.new(48, 48) }
}
local ResolutionScale = FoundationImagesModule.getResolutionScale()
local config1 = {
	Small = {
		[IconSizeModule.XSmall] = 0.66667,
		[IconSizeModule.Small] = 0.88889,
		[IconSizeModule.Medium] = 1.11111,
		[IconSizeModule.Large] = 1.33333
	},
	Medium = {
		[IconSizeModule.XSmall] = 0.45,
		[IconSizeModule.Small] = 0.600003,
		[IconSizeModule.Medium] = 0.749997,
		[IconSizeModule.Large] = 0.9
	},
	Large = {
		[IconSizeModule.XSmall] = 0.24545699999999998,
		[IconSizeModule.Small] = 0.327276,
		[IconSizeModule.Medium] = 0.40909500000000004,
		[IconSizeModule.Large] = 0.490905
	}
}

return function(p1, p2)
	-- upvalues: IsBuilderIconModule (copy), Images (copy), ResolutionScale (copy), IconSizeModule (copy), DashModule (copy), config (copy), config1 (copy)
	if not p1 or IsBuilderIconModule(p1) then
		return nil, 1
	end
	local Image = Images[p1]
	
	if Image then
		local _Vector2 = Vector2.new(Image.ImageRectSize.X / ResolutionScale, Image.ImageRectSize.Y / ResolutionScale)
		
		return _Vector2, config1[if DashModule.includes(config[IconSizeModule.Small], _Vector2) then IconSizeModule.Small elseif DashModule.includes(config[IconSizeModule.Medium], _Vector2) then IconSizeModule.Medium elseif DashModule.includes(config[IconSizeModule.Large], _Vector2) then IconSizeModule.Large else IconSizeModule.Medium][p2]
	else
		return nil, 1
	end
end