local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local foundationImagesModule = require(parent.FoundationImages)
local images = foundationImagesModule.Images
local isBuilderIconModule = require(foundation.Utility.isBuilderIcon)
local iconSizeModule = require(foundation.Enums.IconSize)
local t = {
	[iconSizeModule.Small] = { Vector2.new(16, 16), Vector2.new(18, 18) },
	[iconSizeModule.Medium] = { Vector2.new(28, 28), Vector2.new(36, 36) },
	[iconSizeModule.Large] = { Vector2.new(48, 48) }
}
local resolutionScale = foundationImagesModule.getResolutionScale()
local t_1 = {
	Small = {
		[iconSizeModule.XSmall] = 0.66667,
		[iconSizeModule.Small] = 0.88889,
		[iconSizeModule.Medium] = 1.11111,
		[iconSizeModule.Large] = 1.33333
	},
	Medium = {
		[iconSizeModule.XSmall] = 0.45,
		[iconSizeModule.Small] = 0.600003,
		[iconSizeModule.Medium] = 0.749997,
		[iconSizeModule.Large] = 0.9
	},
	Large = {
		[iconSizeModule.XSmall] = 0.245457,
		[iconSizeModule.Small] = 0.327276,
		[iconSizeModule.Medium] = 0.409095,
		[iconSizeModule.Large] = 0.490905
	}
}

return function(p1, p2)
	-- upvalues: isBuilderIconModule (ref), images (ref), resolutionScale (ref), iconSizeModule (ref), dashModule (ref), t (ref), t_1 (ref)
	if not p1 or isBuilderIconModule(p1) then
		return nil, 1
	end
	local var1 = images[p1]
	
	if not var1 then
		return nil, 1
	end
	local vector2 = Vector2.new(var1.ImageRectSize.X / resolutionScale, var1.ImageRectSize.Y / resolutionScale)
	local medium = iconSizeModule.Medium
	
	if dashModule.includes(t[iconSizeModule.Small], vector2) then
		medium = iconSizeModule.Small
	elseif dashModule.includes(t[iconSizeModule.Medium], vector2) then
		medium = iconSizeModule.Medium
	elseif dashModule.includes(t[iconSizeModule.Large], vector2) then
		medium = iconSizeModule.Large
	end
	return vector2, t_1[medium][p2]
end