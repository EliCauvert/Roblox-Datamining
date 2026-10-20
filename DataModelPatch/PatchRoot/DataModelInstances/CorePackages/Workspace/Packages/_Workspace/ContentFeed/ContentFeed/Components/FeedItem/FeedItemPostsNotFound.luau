local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseStyleFunction = UIBloxModule.Core.Style.useStyle

return function(p1)
	-- upvalues: UseScreenSizeFunction (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), StyledTextLabel (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		LayoutOrder = p1.layoutOrder,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.new(1, 0, 0, UseScreenSizeResult.Y)
	}, {
		NotFoundMessage = ReactModule.createElement(StyledTextLabel, {
			fluidSizing = false,
			layoutOrder = 1,
			fontStyle = UseStyleResult.Font.Header1,
			colorStyle = UseStyleResult.Theme.TextEmphasis,
			size = UDim2.fromScale(1, 1),
			text = UseLocalizationFunction({ postsNotFound = "Feature.ContentFeed.Body.PostsNotFound" }).postsNotFound,
			textTruncate = Enum.TextTruncate.AtEnd,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center
		})
	})
end