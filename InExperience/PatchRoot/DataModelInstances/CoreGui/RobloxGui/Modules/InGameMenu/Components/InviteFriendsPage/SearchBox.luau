local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local withStyle = UIBlox.Core.Style.withStyle
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local withLocalizationModule = require(parent.Localization.withLocalization)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local searchBox = roact.PureComponent:extend("SearchBox")
searchBox.validateProps = t.strictInterface({
	Size = t.UDim2,
	Position = t.UDim2,
	AnchorPoint = t.Vector2,
	searchUpdated = t.callback,
	searchCleared = t.callback,
	itemRef = t.optional(t.table)
})

function searchBox.init(p0) --[[ line: 41 ]]
	p0.state = { searchText = "" }
end

function searchBox.renderWithSelectionCursor(p1, p2) --[[ line: 47 ]]
	-- upvalues: withLocalizationModule (ref), withStyle (ref), roact (ref), cursorKind (ref), imageSetLabel (ref), assetsModule (ref), themedTextLabelModule (ref)
	return withLocalizationModule({
		searchPlaceholder = "CoreScripts.InGameMenu.InviteFriends.Search"
	})(function(p3) --[[ line: 50 ]]
		-- upvalues: withStyle (copy), p1 (ref), roact (copy), p2 (ref), cursorKind (copy), imageSetLabel (copy), assetsModule (copy), themedTextLabelModule (copy)
		return withStyle(function(p4) --[[ line: 51 ]]
			-- upvalues: p1 (copy), roact (copy), p2 (copy), cursorKind (copy), imageSetLabel (copy), assetsModule (copy), themedTextLabelModule (copy), p3 (ref)
			local textEmphasis = p4.Theme.TextEmphasis
			local body = p4.Font.Body
			local _ = nil
			local _ = nil
			local var5 = p1.state.searchText ~= ""
			local var6 = 49
			
			if var5 then
				var6 += 46
			end
			return roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Size = p1.props.Size,
				Position = p1.props.Position,
				AnchorPoint = p1.props.AnchorPoint,
				Image = assetsModule.Images.RoundedRect.Image,
				ImageColor3 = p4.Theme.BackgroundUIContrast.Color,
				ImageTransparency = p4.Theme.BackgroundUIContrast.Transparency,
				ScaleType = assetsModule.Images.RoundedRect.ScaleType,
				SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
			}, {
				Border = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Image = assetsModule.Images.RoundedRectBorder.Image,
					SliceCenter = assetsModule.Images.RoundedRectBorder.SliceCenter,
					ScaleType = assetsModule.Images.RoundedRectBorder.ScaleType,
					ImageColor3 = p4.Theme.Divider.Color,
					ImageTransparency = p4.Theme.Divider.Transparency
				}),
				SearchIcon = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 16, 0, 16),
					Position = UDim2.new(0, 22, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = assetsModule.Images.SearchIcon,
					ImageColor3 = p4.Theme.IconEmphasis.Color
				}),
				TextBox = roact.createElement("TextBox", {
					Size = UDim2.new(1, -var6, 1, 0),
					Position = UDim2.new(0, 44, 0, 0),
					PlaceholderText = "",
					Text = p1.state.searchText,
					ClearTextOnFocus = false,
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextColor3 = textEmphasis.Color,
					TextTransparency = textEmphasis.Transparency,
					Font = body.Font,
					TextSize = body.RelativeSize * p4.Font.BaseSize,
					TextWrapped = false,
					SelectionImageObject = p2(cursorKind.InputFields),
					[roact.Change.Text] = function(p5) --[[ line: 143 ]]
						-- upvalues: p1 (copy)
						if p1.state.searchText ~= p5.Text then
							p1:setState({ searchText = p5.Text })
							p1.props.searchUpdated(p5.Text)
						end
					end,
					[roact.Ref] = p1.props.itemRef
				}),
				PlaceholderText = roact.createElement(themedTextLabelModule, {
					themeKey = "TextEmphasis",
					fontKey = "Body",
					TextTransparency = 0.5,
					ZIndex = 2,
					Text = p3.searchPlaceholder,
					Size = UDim2.new(1, -44, 1, 0),
					Position = UDim2.new(0, 44, 0, 0),
					TextXAlignment = Enum.TextXAlignment.Left,
					Visible = p1.state.searchText == ""
				}),
				ClearButton = roact.createElement("TextButton", {
					Size = UDim2.fromOffset(32, 32),
					Position = UDim2.new(1, -7, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundTransparency = 1,
					Visible = var5,
					SelectionImageObject = p2(cursorKind.SmallPill),
					Selectable = true,
					[roact.Event.Activated] = function() --[[ line: 72 ]]
						-- upvalues: p1 (copy)
						p1:setState({ searchText = "" })
						p1.props.searchCleared()
					end
				}, {
					UIPadding = roact.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, 7),
						PaddingRight = UDim.new(0, 7),
						PaddingTop = UDim.new(0, 7),
						PaddingBottom = UDim.new(0, 7)
					}),
					ClearImage = roact.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						Selectable = false,
						Size = UDim2.fromScale(1, 1),
						Image = assetsModule.Images.ClearIcon,
						ImageColor3 = p4.Theme.IconEmphasis.Color
					})
				})
			})
		end)
	end)
end

function searchBox.render(p6) --[[ line: 173 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p7) --[[ line: 174 ]]
		-- upvalues: p6 (ref)
		return p6:renderWithSelectionCursor(p7)
	end)
end

return searchBox