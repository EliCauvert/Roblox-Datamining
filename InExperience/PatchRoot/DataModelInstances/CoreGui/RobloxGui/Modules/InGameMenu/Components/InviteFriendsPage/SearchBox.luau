local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local withLocalizationModule = require(parent.Localization.withLocalization)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local image = foundationModule.Image
local searchBox = roact.PureComponent:extend("SearchBox")
searchBox.validateProps = t.strictInterface({
	Size = t.UDim2,
	Position = t.UDim2,
	AnchorPoint = t.Vector2,
	searchUpdated = t.callback,
	searchCleared = t.callback,
	itemRef = t.optional(t.table)
})

function searchBox.init(p1)
	p1.state = { searchText = "" }
end

function searchBox.renderWithSelectionCursor(p1, p2)
	-- upvalues: withLocalizationModule (ref), withFoundationOrUIBloxStyle (ref), roact (ref), var2 (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), assetsModule (ref), imageSetLabel (ref), themedTextLabelModule (ref)
	return withLocalizationModule({
		searchPlaceholder = "CoreScripts.InGameMenu.InviteFriends.Search"
	})(function(p3)
		-- upvalues: withFoundationOrUIBloxStyle (copy), p1 (ref), roact (copy), p2 (ref), var2 (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), imageSetLabel (copy), themedTextLabelModule (copy)
		return withFoundationOrUIBloxStyle(function(p4)
			return {
				Theme = {
					TextEmphasis = {
						Color = p4.Color.Content.Emphasis.Color3,
						Transparency = p4.Color.Content.Emphasis.Transparency
					},
					IconEmphasis = {
						Color = p4.Color.Content.Emphasis.Color3,
						Transparency = p4.Color.Content.Emphasis.Transparency
					},
					BackgroundUIContrast = {
						Color = p4.Color.OverMedia.OverMedia_0.Color3,
						Transparency = p4.Color.OverMedia.OverMedia_0.Transparency
					},
					Divider = {
						Color = p4.Color.Stroke.Emphasis.Color3,
						Transparency = p4.Color.Stroke.Emphasis.Transparency
					}
				},
				Font = {
					BaseSize = 1,
					Body = {
						Font = p4.Typography.BodyLarge.Font,
						RelativeSize = p4.Typography.BodyLarge.FontSize
					}
				}
			}
		end, function(p4)
			-- upvalues: p1 (copy), roact (copy), p2 (copy), var2 (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), imageSetLabel (copy), themedTextLabelModule (copy), p3 (ref)
			local textEmphasis = p4.Theme.TextEmphasis
			local body = p4.Font.Body
			local _ = nil
			local _ = nil
			local var3 = p1.state.searchText ~= ""
			local var4 = 49
			
			if var3 then
				var4 += 46
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
				SearchIcon = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
					Size = UDim2.new(0, 16, 0, 16),
					Position = UDim2.new(0, 22, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = assetsModule.Images.SearchIcon.Image,
					imageRect = {
						offset = assetsModule.Images.SearchIcon.ImageRectOffset,
						size = assetsModule.Images.SearchIcon.ImageRectSize
					},
					imageStyle = { Transparency = 0, Color3 = p4.Theme.IconEmphasis.Color }
				}) else roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 16, 0, 16),
					Position = UDim2.new(0, 22, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = assetsModule.Images.SearchIcon,
					ImageColor3 = p4.Theme.IconEmphasis.Color
				}),
				TextBox = roact.createElement("TextBox", {
					Size = UDim2.new(1, -var4, 1, 0),
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
					SelectionImageObject = p2(var2.InputFields),
					[roact.Change.Text] = function(p5)
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
					Visible = var3,
					SelectionImageObject = p2(var2.SmallPill),
					Selectable = true,
					[roact.Event.Activated] = function()
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
					ClearImage = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
						Size = UDim2.fromScale(1, 1),
						Image = assetsModule.Images.ClearIcon.Image,
						imageRect = {
							offset = assetsModule.Images.ClearIcon.ImageRectOffset,
							size = assetsModule.Images.ClearIcon.ImageRectSize
						},
						imageStyle = { Transparency = 0, Color3 = p4.Theme.IconEmphasis.Color }
					}) else roact.createElement(imageSetLabel, {
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

function searchBox.render(p1)
	-- upvalues: var1 (ref)
	return var1(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return searchBox