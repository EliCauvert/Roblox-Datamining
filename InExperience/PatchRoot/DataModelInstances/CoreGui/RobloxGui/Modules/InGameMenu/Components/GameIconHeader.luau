local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local parent = script.Parent.Parent
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local gameIconModule = require(parent.Components.GameIcon)

return roactRodux.UNSTABLE_connect2(function(p1)
	return { gameName = p1.gameInfo.name }
end)(function(p0)
	-- upvalues: roact (ref), gameIconModule (ref), themedTextLabelModule (ref)
	return roact.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 148)
	}, {
		Padding = roact.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 24),
			PaddingLeft = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24),
			PaddingTop = UDim.new(0, 24)
		}),
		GameIcon = roact.createElement(gameIconModule, { iconSize = 100, gameId = game.GameId }),
		GameName = roact.createElement(themedTextLabelModule, {
			fontKey = "Title",
			themeKey = "TextEmphasis",
			TextWrapped = true,
			Position = UDim2.new(0, 112, 0, 0),
			Size = UDim2.new(1, -112, 1, 0),
			Text = p0.gameName,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		})
	})
end)