local Squads = script:FindFirstAncestor("Squads")
local CryoModule = require(Squads.Parent.Cryo)
local DependenciesModule = require(Squads.dependencies)
local Foundation = DependenciesModule.Foundation
local React = DependenciesModule.React
local UseTokensFunction = Foundation.Hooks.useTokens
local Image = Foundation.Image
local View = Foundation.View

function HorizontalFacepileGroup(UnionResult) --[[ Line: 26 ]]
	-- upvalues: UseTokensFunction (copy), CryoModule (copy), React (copy), Image (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local UnionResult1 = UnionResult
	UnionResult1 = CryoModule.Dictionary.union({
		avatarSize = 0,
		layoutOrder = 1,
		imageBackgroundStyle = nil,
		images = {},
		imageBorderStyle = {
			Color = UseTokensResult.Color.Extended.Green.Green_800.Color3,
			Transparency = UseTokensResult.Color.Extended.Green.Green_800.Transparency
		}
	}, UnionResult)
	
	return React.createElement(View, {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(React.useMemo(function() --[[ Line: 44 ]]
			-- upvalues: UnionResult1 (ref)
			local CountImages = #UnionResult1.images
			
			if CountImages <= 0 then
				return 0
			end
			local AvatarSize = UnionResult1.avatarSize
			
			for _ = 2, CountImages do
				AvatarSize += UnionResult1.avatarSize - 4
			end
			return AvatarSize
		end, { #UnionResult1.images, UnionResult1.avatarSize }), UnionResult1.avatarSize),
		LayoutOrder = if UnionResult1.layoutOrder then UnionResult1.layoutOrder else nil,
		testId = UnionResult1.testId
	}, {
		(React.useMemo(function() --[[ Line: 59 ]]
			-- upvalues: UnionResult1 (ref), React (upval), Image (upval), UseTokensResult (copy)
			local CountImages = #UnionResult1.images
			local Elements = {}
			
			for i, image in ipairs(UnionResult1.images) do
				table.insert(Elements, React.createElement(Image, {
					tag = "anchor-center-left bg-surface-100 radius-circle",
					Image = image,
					backgroundStyle = if UnionResult1.imageBackgroundStyle then UnionResult1.imageBackgroundStyle else nil,
					Size = UDim2.fromOffset(UnionResult1.avatarSize, UnionResult1.avatarSize),
					Position = UDim2.new(0, UnionResult1.avatarSize * (i - 1) - (if i == 1 then 0 else 4) * (i - 1), 0.5, 0),
					ZIndex = CountImages - i + 1,
					testId = if UnionResult1.testId then `{UnionResult1.testId}--image-{i}` else nil
				}, {
					UIStroke = React.createElement("UIStroke", {
						Color = if UnionResult1.imageBorderStyle then UnionResult1.imageBorderStyle.Color else UseTokensResult.Color.Extended.Green.Green_800.Color3,
						Transparency = if UnionResult1.imageBorderStyle then UnionResult1.imageBorderStyle.Transparency else UseTokensResult.Color.Extended.Green.Green_800.Transparency,
						Thickness = UseTokensResult.Stroke.Thick
					})
				}))
			end
			return Elements
		end, {
			UnionResult1.avatarSize,
			UnionResult1.images,
			UnionResult1.imageBackgroundStyle,
			UnionResult1.imageBorderStyle,
			UnionResult1.testId
		}))
	})
end

return HorizontalFacepileGroup