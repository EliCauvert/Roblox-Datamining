local corePackagesService = game:GetService("CorePackages")
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local colorsModule = require(parent.Colors)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local noInventoryNotice = roactModule.PureComponent:extend("NoInventoryNotice")

function noInventoryNotice.render(p1)
	-- upvalues: roactModule (ref), colorsModule (ref), appFonts (ref), robloxTranslatorModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = next(p1.props.assets) == nil and p1.props.isLoaded
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 15),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		NotWearingImage = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = "rbxasset://textures/ui/InspectMenu/ico_isnt-wearing.png",
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(0.25, 0, 0.25, 0),
			ImageColor3 = colorsModule.White
		}, {
			UIAspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1 })
		}),
		NotWearingText = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextScaled = true,
			TextSize = 20,
			TextWrapped = true,
			Size = UDim2.new(0.8, 0, 0.3, 0),
			Font = appFonts.default:getDefault(),
			Text = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Description.NoInventoryNotice", p1.props.locale),
			TextColor3 = colorsModule.White,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Top
		}, {
			UITextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = 20 })
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		assets = p1.assets,
		locale = p1.locale,
		isLoaded = p1.isLoaded
	}
end)(noInventoryNotice)