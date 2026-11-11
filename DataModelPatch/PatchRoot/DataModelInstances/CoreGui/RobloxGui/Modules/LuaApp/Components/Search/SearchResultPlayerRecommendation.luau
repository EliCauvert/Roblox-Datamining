local Modules = game:GetService("CoreGui").RobloxGui.Modules
local WithStyleFunction = require(game:GetService("CorePackages").Packages.UIBlox).Style.withStyle
local RoactModule = require(Modules.Common.Roact)
local FitTextButtonModule = require(Modules.LuaApp.Components.FitTextButton)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local LocalizedFitTextLabelModule = require(Modules.LuaApp.Components.LocalizedFitTextLabel)
local DoPlayerSearchModule = require(Modules.LuaApp.Components.Search.DoPlayerSearch)
local GamesSearchForPlayers = RoactModule.PureComponent:extend("GamesSearchForPlayers")

function GamesSearchForPlayers.init(p1)
	-- upvalues: DoPlayerSearchModule (copy)
	function p1.onPlayerSearchButtonActivated()
		-- upvalues: DoPlayerSearchModule (upval), p1 (copy)
		DoPlayerSearchModule(p1.props.analytics, p1.props.guiService, p1.props.keyword, p1.props.openWebview, p1.props.localization, "CommonUI.Features.Label.Players")
	end
end

function GamesSearchForPlayers.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), LocalizedFitTextLabelModule (copy), FitChildrenModule (copy), FitTextButtonModule (copy)
	local Keyword = p1.props.keyword
	local LayoutOrder = p1.props.layoutOrder
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), LayoutOrder (copy), LocalizedFitTextLabelModule (upval), FitChildrenModule (upval), FitTextButtonModule (upval), Keyword (copy), p1 (copy)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 18),
			LayoutOrder = LayoutOrder
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 2)
			}),
			PlayerSearchTitleText = RoactModule.createElement(LocalizedFitTextLabelModule, {
				Text = "Feature.GamePage.LabelSearchInsteadForPlayersNamed",
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Size = UDim2.new(0, 0, 1, 0),
				TextSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize,
				Font = p2.Font.Body.Font,
				TextColor3 = p2.Theme.TextDefault.Color,
				TextTransparency = p2.Theme.TextDefault.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				fitAxis = FitChildrenModule.FitAxis.Width
			}),
			PlayerSearchKeyword = RoactModule.createElement(FitTextButtonModule, {
				Text = Keyword,
				LayoutOrder = 2,
				Size = UDim2.new(0, 0, 1, 0),
				BackgroundTransparency = 1,
				TextSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize,
				Font = p2.Font.Body.Font,
				TextColor3 = p2.Theme.TextEmphasis.Color,
				TextTransparency = p2.Theme.TextEmphasis.Transparency,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				fitAxis = FitChildrenModule.FitAxis.Width,
				[RoactModule.Event.Activated] = p1.onPlayerSearchButtonActivated
			}, {
				Underline = RoactModule.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0, 0, 1, -1),
					BackgroundColor3 = p2.Theme.TextEmphasis.Color,
					BackgroundTransparency = p2.Theme.TextEmphasis.Transparency
				})
			})
		})
	end)
end

return GamesSearchForPlayers