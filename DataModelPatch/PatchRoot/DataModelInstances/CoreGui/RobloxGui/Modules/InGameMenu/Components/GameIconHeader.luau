local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local Parent = script.Parent.Parent
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local GameIconModule = require(Parent.Components.GameIcon)

return InGameMenuDependenciesModule.RoactRodux.UNSTABLE_connect2(function(p1)
	return { gameName = p1.gameInfo.name }
end)(function(p1)
	-- upvalues: Roact (copy), GameIconModule (copy), ThemedTextLabelModule (copy)
	return Roact.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 148)
	}, {
		Padding = Roact.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 24),
			PaddingLeft = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24),
			PaddingTop = UDim.new(0, 24)
		}),
		GameIcon = Roact.createElement(GameIconModule, { iconSize = 100, gameId = game.GameId }),
		GameName = Roact.createElement(ThemedTextLabelModule, {
			fontKey = "Title",
			themeKey = "TextEmphasis",
			TextWrapped = true,
			Position = UDim2.new(0, 112, 0, 0),
			Size = UDim2.new(1, -112, 1, 0),
			Text = p1.gameName,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		})
	})
end)