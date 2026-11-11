local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local FitTextLabel = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitTextLabel
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)
local ResultsHeader = RoactModule.PureComponent:extend("ResultsHeader")

function ResultsHeader.renderWithStyle(p1, p2)
	-- upvalues: RoactModule (copy), Skeleton (copy), WithLocalizationFunction (copy), FitTextLabel (copy)
	local _Font = p2.Font
	local BodyFont = _Font.Body.Font
	local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
	local HeaderFont = _Font.Header2.Font
	local ScaledBaseSize1 = _Font.BaseSize * _Font.Header2.RelativeSize
	local Theme = p2.Theme
	local Color = Theme.TextEmphasis.Color
	local Transparency = Theme.TextEmphasis.Transparency
	local SearchInCatalog = p1.props.searchInCatalog
	
	if SearchInCatalog then
		local Keyword = SearchInCatalog.keyword
		
		return WithLocalizationFunction({
			showingResultsFor = "Feature.GamePage.LabelShowingResultsFor"
		})(function(p3)
			-- upvalues: RoactModule (upval), ScaledBaseSize (copy), FitTextLabel (upval), Color (copy), Transparency (copy), BodyFont (copy), Keyword (copy), ScaledBaseSize1 (copy), HeaderFont (copy)
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, ScaledBaseSize)
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 2)
				}),
				ShowingResultsText = RoactModule.createElement(FitTextLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					TextWrapped = true,
					width = FitTextLabel.Width.FitToText,
					Text = p3.showingResultsFor,
					Size = UDim2.new(0, 0, 1, 0),
					TextSize = ScaledBaseSize,
					TextColor3 = Color,
					TextTransparency = Transparency,
					Font = BodyFont,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top
				}),
				Keyword = RoactModule.createElement(FitTextLabel, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					TextWrapped = true,
					width = FitTextLabel.Width.FitToText,
					Text = Keyword or "",
					Size = UDim2.new(0, 0, 1, 0),
					TextSize = ScaledBaseSize1,
					TextColor3 = Color,
					TextTransparency = Transparency,
					Font = HeaderFont,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top
				})
			})
		end)
	else
		return RoactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, ScaledBaseSize) })
	end
end

function ResultsHeader.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithStyle(p2)
	end)
end

return RoactRoduxModule.connect(function(p1, p2)
	return {
		searchInCatalog = p1.Search.SearchesInCatalog[p2.searchUuid]
	}
end, nil)(ResultsHeader)