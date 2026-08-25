local squads = script:FindFirstAncestor("Squads")
local cryoModule = require(squads.Parent.Cryo)
local dependenciesModule = require(squads.dependencies)
local foundation = dependenciesModule.Foundation
local react = dependenciesModule.React
local useTokens = foundation.Hooks.useTokens
local image = foundation.Image
local view = foundation.View

function HorizontalFacepileGroup(p0)
	-- upvalues: useTokens (ref), cryoModule (ref), react (ref), image (ref), view (ref)
	local var3 = useTokens()
	local _ = p0
	local var4 = cryoModule.Dictionary.union({
		avatarSize = 0,
		layoutOrder = 1,
		imageBackgroundStyle = nil,
		images = {},
		imageBorderStyle = {
			Color = var3.Color.Extended.Green.Green_800.Color3,
			Transparency = var3.Color.Extended.Green.Green_800.Transparency
		}
	}, p0)
	
	return react.createElement(view, {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(react.useMemo(function()
			-- upvalues: var4 (write)
			local imagesCount = #var4.images
			
			if imagesCount <= 0 then
				return 0
			end
			local avatarSize = var4.avatarSize
			
			for _ = 2, imagesCount do
				avatarSize += var4.avatarSize - 4
			end
			return avatarSize
		end, { #var4.images, var4.avatarSize }), var4.avatarSize),
		LayoutOrder = if var4.layoutOrder then var4.layoutOrder else nil
	}, {
		react.useMemo(function()
			-- upvalues: var4 (write), react (copy), image (copy), var3 (ref)
			local imagesCount = #var4.images
			local t = {}
			
			for i, v in ipairs(var4.images) do
				table.insert(t, react.createElement(image, {
					tag = "anchor-center-left bg-surface-100 radius-circle",
					Image = v,
					backgroundStyle = if var4.imageBackgroundStyle then var4.imageBackgroundStyle else nil,
					Size = UDim2.fromOffset(var4.avatarSize, var4.avatarSize),
					Position = UDim2.new(0, var4.avatarSize * (i - 1) - (if i == 1 then 0 else 4) * (i - 1), 0.5, 0),
					ZIndex = imagesCount - i + 1
				}, {
					UIStroke = react.createElement("UIStroke", {
						Color = if var4.imageBorderStyle then var4.imageBorderStyle.Color else var3.Color.Extended.Green.Green_800.Color3,
						Transparency = if var4.imageBorderStyle then var4.imageBorderStyle.Transparency else var3.Color.Extended.Green.Green_800.Transparency,
						Thickness = var3.Stroke.Thick
					})
				}))
			end
			return t
		end, {
			var4.avatarSize,
			var4.images,
			var4.imageBackgroundStyle,
			var4.imageBorderStyle
		})
	})
end

return HorizontalFacepileGroup