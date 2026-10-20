local CorePackages = game:GetService("CorePackages")
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ColorsModule = require(script.Parent.Parent.Colors)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local NoInventoryNotice = RoactModule.PureComponent:extend("NoInventoryNotice")

function NoInventoryNotice.render(p1)
	-- upvalues: RoactModule (copy), ColorsModule (copy), AppFonts (copy), RobloxTranslatorModule (copy)
	local IsLoaded = p1.props.isLoaded
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = next(p1.props.assets) == nil and IsLoaded
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 15),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		NotWearingImage = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = "rbxasset://textures/ui/InspectMenu/ico_isnt-wearing.png",
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(0.25, 0, 0.25, 0),
			ImageColor3 = ColorsModule.White
		}, {
			UIAspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1 })
		}),
		NotWearingText = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextScaled = true,
			TextSize = 20,
			TextWrapped = true,
			Size = UDim2.new(0.8, 0, 0.3, 0),
			Font = AppFonts.default:getDefault(),
			Text = RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Description.NoInventoryNotice", p1.props.locale),
			TextColor3 = ColorsModule.White,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Top
		}, {
			UITextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = 20 })
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		assets = p1.assets,
		locale = p1.locale,
		isLoaded = p1.isLoaded
	}
end)(NoInventoryNotice)