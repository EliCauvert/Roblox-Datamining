local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local UIBlox = InGameMenuDependenciesModule.UIBlox
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorType = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local Parent = script.Parent.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Image = FoundationModule.Image
local SearchBox = Roact.PureComponent:extend("SearchBox")
SearchBox.validateProps = T.strictInterface({
	Size = T.UDim2,
	Position = T.UDim2,
	AnchorPoint = T.Vector2,
	searchUpdated = T.callback,
	searchCleared = T.callback,
	itemRef = T.optional(T.table)
})

function SearchBox.init(p1)
	p1.state = { searchText = "" }
end

function SearchBox.renderWithSelectionCursor(p1, Callback)
	-- upvalues: WithLocalizationModule (copy), WithFoundationOrUIBloxStyleFunction (copy), FoundationFontFaceMigration (copy), Roact (copy), CursorType (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), AssetsModule (copy), ImageSetLabel (copy), NormalizeFontFaceFunction (copy), ThemedTextLabelModule (copy)
	return WithLocalizationModule({
		searchPlaceholder = "CoreScripts.InGameMenu.InviteFriends.Search"
	})(function(p2)
		-- upvalues: WithFoundationOrUIBloxStyleFunction (upval), FoundationFontFaceMigration (upval), p1 (copy), Roact (upval), Callback (copy), CursorType (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Image (upval), AssetsModule (upval), ImageSetLabel (upval), NormalizeFontFaceFunction (upval), ThemedTextLabelModule (upval)
		return WithFoundationOrUIBloxStyleFunction(function(p3)
			-- upvalues: FoundationFontFaceMigration (upval)
			return {
				Tokens = if FoundationFontFaceMigration then p3 else nil,
				Theme = {
					TextEmphasis = {
						Color = p3.Color.Content.Emphasis.Color3,
						Transparency = p3.Color.Content.Emphasis.Transparency
					},
					IconEmphasis = {
						Color = p3.Color.Content.Emphasis.Color3,
						Transparency = p3.Color.Content.Emphasis.Transparency
					},
					BackgroundUIContrast = {
						Color = p3.Color.OverMedia.OverMedia_0.Color3,
						Transparency = p3.Color.OverMedia.OverMedia_0.Transparency
					},
					Divider = {
						Color = p3.Color.Stroke.Emphasis.Color3,
						Transparency = p3.Color.Stroke.Emphasis.Transparency
					}
				},
				Font = {
					BaseSize = 1,
					Body = {
						Font = p3.Typography.BodyLarge.Font,
						RelativeSize = p3.Typography.BodyLarge.FontSize
					}
				}
			}
		end, function(p3)
			-- upvalues: p1 (upval), Roact (upval), Callback (upval), CursorType (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Image (upval), AssetsModule (upval), ImageSetLabel (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), ThemedTextLabelModule (upval), p2 (copy)
			local TextEmphasis = p3.Theme.TextEmphasis
			local Body = p3.Font.Body
			local IsNotSearchTextMatch = p1.state.searchText ~= ""
			local Count = 49
			
			if IsNotSearchTextMatch then
				Count += 46
			end
			return Roact.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Size = p1.props.Size,
				Position = p1.props.Position,
				AnchorPoint = p1.props.AnchorPoint,
				Image = AssetsModule.Images.RoundedRect.Image,
				ImageColor3 = p3.Theme.BackgroundUIContrast.Color,
				ImageTransparency = p3.Theme.BackgroundUIContrast.Transparency,
				ScaleType = AssetsModule.Images.RoundedRect.ScaleType,
				SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter
			}, {
				Border = Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Image = AssetsModule.Images.RoundedRectBorder.Image,
					SliceCenter = AssetsModule.Images.RoundedRectBorder.SliceCenter,
					ScaleType = AssetsModule.Images.RoundedRectBorder.ScaleType,
					ImageColor3 = p3.Theme.Divider.Color,
					ImageTransparency = p3.Theme.Divider.Transparency
				}),
				SearchIcon = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
					Size = UDim2.new(0, 16, 0, 16),
					Position = UDim2.new(0, 22, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = AssetsModule.Images.SearchIcon.Image,
					imageRect = {
						offset = AssetsModule.Images.SearchIcon.ImageRectOffset,
						size = AssetsModule.Images.SearchIcon.ImageRectSize
					},
					imageStyle = { Transparency = 0, Color3 = p3.Theme.IconEmphasis.Color }
				}) else Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 16, 0, 16),
					Position = UDim2.new(0, 22, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = AssetsModule.Images.SearchIcon,
					ImageColor3 = p3.Theme.IconEmphasis.Color
				}),
				TextBox = Roact.createElement("TextBox", {
					Size = UDim2.new(1, -Count, 1, 0),
					Position = UDim2.new(0, 44, 0, 0),
					PlaceholderText = "",
					Text = p1.state.searchText,
					ClearTextOnFocus = false,
					BackgroundTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextColor3 = TextEmphasis.Color,
					TextTransparency = TextEmphasis.Transparency,
					Font = if FoundationFontFaceMigration then nil else Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p3.Tokens.Typography.BodyLarge.Font) else nil,
					TextSize = Body.RelativeSize * p3.Font.BaseSize,
					TextWrapped = false,
					SelectionImageObject = Callback(CursorType.InputFields),
					[Roact.Change.Text] = function(p4)
						-- upvalues: p1 (upval)
						if p1.state.searchText ~= p4.Text then
							p1:setState({ searchText = p4.Text })
							p1.props.searchUpdated(p4.Text)
						end
					end,
					[Roact.Ref] = p1.props.itemRef
				}),
				PlaceholderText = Roact.createElement(ThemedTextLabelModule, {
					themeKey = "TextEmphasis",
					fontKey = "Body",
					TextTransparency = 0.5,
					ZIndex = 2,
					Text = p2.searchPlaceholder,
					Size = UDim2.new(1, -44, 1, 0),
					Position = UDim2.new(0, 44, 0, 0),
					TextXAlignment = Enum.TextXAlignment.Left,
					Visible = p1.state.searchText == ""
				}),
				ClearButton = Roact.createElement("TextButton", {
					Size = UDim2.fromOffset(32, 32),
					Position = UDim2.new(1, -7, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundTransparency = 1,
					Visible = IsNotSearchTextMatch,
					SelectionImageObject = Callback(CursorType.SmallPill),
					Selectable = true,
					[Roact.Event.Activated] = function()
						-- upvalues: p1 (upval)
						p1:setState({ searchText = "" })
						p1.props.searchCleared()
					end
				}, {
					UIPadding = Roact.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, 7),
						PaddingRight = UDim.new(0, 7),
						PaddingTop = UDim.new(0, 7),
						PaddingBottom = UDim.new(0, 7)
					}),
					ClearImage = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
						Size = UDim2.fromScale(1, 1),
						Image = AssetsModule.Images.ClearIcon.Image,
						imageRect = {
							offset = AssetsModule.Images.ClearIcon.ImageRectOffset,
							size = AssetsModule.Images.ClearIcon.ImageRectSize
						},
						imageStyle = { Transparency = 0, Color3 = p3.Theme.IconEmphasis.Color }
					}) else Roact.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						Selectable = false,
						Size = UDim2.fromScale(1, 1),
						Image = AssetsModule.Images.ClearIcon,
						ImageColor3 = p3.Theme.IconEmphasis.Color
					})
				})
			})
		end)
	end)
end

function SearchBox.render(p1)
	-- upvalues: WithCursorMigration (copy)
	return WithCursorMigration(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return SearchBox