local squads = script:FindFirstAncestor("Squads")
local cryoModule = require(squads.Parent.Cryo)
local dependenciesModule = require(squads.dependencies)
local foundation = dependenciesModule.Foundation
local react = dependenciesModule.React
local useTokens = foundation.Hooks.useTokens
local image = foundation.Image
local view = foundation.View

function HorizontalFacepileGroup(p1)
	-- upvalues: useTokens (ref), cryoModule (ref), react (ref), image (ref), view (ref)
	local var1 = useTokens()
	local _ = p1
	local var2 = cryoModule.Dictionary.union({
		avatarSize = 0,
		layoutOrder = 1,
		imageBackgroundStyle = nil,
		images = {},
		imageBorderStyle = {
			Color = var1.Color.Extended.Green.Green_800.Color3,
			Transparency = var1.Color.Extended.Green.Green_800.Transparency
		}
	}, p1)
	
	return react.createElement(view, {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(react.useMemo(function()
			-- upvalues: var2 (write)
			local imagesCount = #var2.images
			
			if imagesCount <= 0 then
				return 0
			end
			local avatarSize = var2.avatarSize
			
			for _ = 2, imagesCount do
				avatarSize += var2.avatarSize - 4
			end
			return avatarSize
		end, { #var2.images, var2.avatarSize }), var2.avatarSize),
		LayoutOrder = if var2.layoutOrder then var2.layoutOrder else nil
	}, {
		react.useMemo(function()
			-- upvalues: var2 (write), react (copy), image (copy), var1 (ref)
			local imagesCount = #var2.images
			local t = {}
			
			for i, v in ipairs(var2.images) do
				table.insert(t, react.createElement(image, {
					tag = "anchor-center-left bg-surface-100 radius-circle",
					Image = v,
					backgroundStyle = if var2.imageBackgroundStyle then var2.imageBackgroundStyle else nil,
					Size = UDim2.fromOffset(var2.avatarSize, var2.avatarSize),
					Position = UDim2.new(0, var2.avatarSize * (i - 1) - (if i == 1 then 0 else 4) * (i - 1), 0.5, 0),
					ZIndex = imagesCount - i + 1
				}, {
					UIStroke = react.createElement("UIStroke", {
						Color = if var2.imageBorderStyle then var2.imageBorderStyle.Color else var1.Color.Extended.Green.Green_800.Color3,
						Transparency = if var2.imageBorderStyle then var2.imageBorderStyle.Transparency else var1.Color.Extended.Green.Green_800.Transparency,
						Thickness = var1.Stroke.Thick
					})
				}))
			end
			return t
		end, {
			var2.avatarSize,
			var2.images,
			var2.imageBackgroundStyle,
			var2.imageBorderStyle
		})
	})
end

return HorizontalFacepileGroup