local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local UIBlox = InGameMenuDependenciesModule.UIBlox
local Cryo = InGameMenuDependenciesModule.Cryo
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Images = UIBlox.App.ImageSet.Images
local FoundationModule = require(CorePackages.Packages.Foundation)
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithLocalizationModule = require(script.Parent.Parent.Localization.withLocalization)
local SearchBar = Roact.PureComponent:extend("SearchBar")
SearchBar.validateProps = T.interface({
	size = T.UDim2,
	text = T.optional(T.string),
	onTextChanged = T.optional(T.callback),
	onFocused = T.optional(T.callback),
	onCancelled = T.optional(T.callback),
	onFocusLost = T.optional(T.callback),
	autoCaptureFocus = T.optional(T.boolean),
	zIndex = T.optional(T.number),
	visible = T.optional(T.boolean)
})
SearchBar.defaultProps = {
	autoCaptureFocus = false,
	visible = true,
	size = UDim2.fromScale(1, 1)
}

function SearchBar.init(p1)
	-- upvalues: Roact (copy)
	p1.textboxRef = Roact.createRef()
	
	function p1.onAbsoluteSizeChanged(Frame: Frame)
		-- upvalues: p1 (copy)
		local Flag = false
		
		if p1.width ~= Frame.AbsoluteSize.X then
			p1.width = Frame.AbsoluteSize.X
			Flag = true
		end
		if p1.height ~= Frame.AbsoluteSize.Y then
			p1.height = Frame.AbsoluteSize.Y
			Flag = true
		end
		if Flag then
			p1:setState({ width = p1.width - 2, height = p1.height - 2 })
		end
	end
	
	function p1.searchTextChanged(p2)
		-- upvalues: p1 (copy)
		if p1.props.onTextChanged then
			p1.props.onTextChanged(p2.Text)
		end
	end
	
	function p1:searchBoxFocused()
		-- upvalues: p1 (copy)
		if p1.props.onFocused then
			p1.props.onFocused()
		end
	end
	
	function p1.searchCancel()
		-- upvalues: p1 (copy)
		if p1.props.onCancelled then
			p1.props.onCancelled()
		end
	end
	
	function p1.onFocusLost()
		-- upvalues: p1 (copy)
		if p1.props.onFocusLost then
			p1.props.onFocusLost()
		end
	end
	
	function p1.onTextboxTouchTap()
		-- upvalues: p1 (copy)
		if p1.props.onTextboxTouchTap then
			p1.props.onTextboxTouchTap()
		end
	end
end

function SearchBar.willUpdate(p1, p2)
	if p1.props.autoCaptureFocus and p1.props.visible == false and p2.visible then
		p1:focus()
	end
end

function SearchBar.didMount(p1)
	if p1.props.autoCaptureFocus and p1.props.visible then
		p1:focus()
	end
end

function SearchBar.focus(p1)
	if p1.textboxRef then
		p1.textboxRef.current:CaptureFocus()
	end
end

function SearchBar.render(p1)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), FoundationFontFaceMigration (copy), WithLocalizationModule (copy), Roact (copy), UserInputService (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Icon (copy), IconSize (copy), ImageSetLabel (copy), Images (copy), NormalizeFontFaceFunction (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		-- upvalues: FoundationFontFaceMigration (upval)
		return {
			Tokens = if FoundationFontFaceMigration then p2 else nil,
			Theme = {
				TextEmphasis = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				},
				TextDefault = {
					Color = p2.Color.Content.Default.Color3,
					Transparency = p2.Color.Content.Default.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Body = {
					Font = p2.Typography.BodyLarge.Font,
					RelativeSize = p2.Typography.BodyLarge.FontSize
				}
			}
		}
	end, function(p2)
		-- upvalues: WithLocalizationModule (upval), p1 (copy), Roact (upval), UserInputService (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Icon (upval), IconSize (upval), ImageSetLabel (upval), Images (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		return WithLocalizationModule({
			search = "CoreScripts.InGameMenu.InviteFriends.Search",
			cancel = "CoreScripts.InGameMenu.Cancel"
		})(function(p3)
			-- upvalues: p2 (copy), p1 (upval), Roact (upval), UserInputService (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Icon (upval), IconSize (upval), ImageSetLabel (upval), Images (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
			local Body = p2.Font.Body
			local Body1 = p2.Font.Body
			
			return Roact.createElement("CanvasGroup", {
				BackgroundTransparency = 1,
				GroupTransparency = 0.5,
				Size = p1.props.size,
				ZIndex = p1.props.zIndex,
				Visible = p1.props.visible,
				[Roact.Ref] = p1.props.forwardRef or Roact.createRef()
			}, {
				SearchPanelLayout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 9)
				}),
				SearchBorder = Roact.createElement("Frame", {
					Size = UDim2.new(1, -66, 0, 38),
					BackgroundColor3 = Color3.new(136, 136, 136),
					BackgroundTransparency = 0.8,
					[Roact.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged
				}, {
					BorderRadius = Roact.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
					SearchContainer = Roact.createElement("Frame", {
						BackgroundTransparency = 0,
						Size = UDim2.fromOffset(p1.state.width, p1.state.height),
						BackgroundColor3 = Color3.new(0, 0, 0),
						Position = UDim2.fromOffset(1, 1)
					}, {
						SearchContainerLayout = Roact.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							Padding = UDim.new(0, 10)
						}),
						Padding = Roact.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12)
						}),
						BorderRadius = Roact.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
						SearchImage = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Icon, {
							name = "icons/common/search_small",
							LayoutOrder = 1,
							size = IconSize.Medium
						}) else Roact.createElement(ImageSetLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							Image = Images["icons/common/search_small"],
							Size = UDim2.fromOffset(18, 18)
						}),
						SearchInput = Roact.createElement("TextBox", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, -28, 0, 20),
							Font = if FoundationFontFaceMigration then nil else Body1.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
							Text = p1.props.text or "",
							TextInputType = if UserInputService:GetPlatform() == Enum.Platform.Android then Enum.TextInputType.PasswordShown else Enum.TextInputType.NoSuggestions,
							TextSize = p2.Font.BaseSize * Body1.RelativeSize,
							TextColor3 = p2.Theme.TextEmphasis.Color,
							TextXAlignment = Enum.TextXAlignment.Left,
							PlaceholderText = p3.search,
							PlaceholderColor3 = p2.Theme.TextDefault.Color,
							ClearTextOnFocus = false,
							ClipsDescendants = true,
							[Roact.Change.Text] = p1.searchTextChanged,
							[Roact.Event.Focused] = p1.searchBoxFocused,
							[Roact.Event.FocusLost] = p1.onFocusLost,
							[Roact.Ref] = p1.textboxRef,
							[Roact.Event.TouchTap] = p1.onTextboxTouchTap
						})
					})
				}),
				CancelButton = Roact.createElement("TextButton", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(57, 20),
					Font = if FoundationFontFaceMigration then nil else Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
					TextSize = p2.Font.BaseSize * Body.RelativeSize,
					Text = p3.cancel,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					[Roact.Event.Activated] = p1.searchCancel
				})
			})
		end)
	end)
end

return Roact.forwardRef(function(p1, ForwardRef)
	-- upvalues: Roact (copy), SearchBar (copy), Cryo (copy)
	return Roact.createElement(SearchBar, Cryo.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)