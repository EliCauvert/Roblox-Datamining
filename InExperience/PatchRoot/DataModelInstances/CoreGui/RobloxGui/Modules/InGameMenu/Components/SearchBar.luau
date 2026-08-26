local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local images = UIBlox.App.ImageSet.Images
local foundationModule = require(corePackagesService.Packages.Foundation)
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local withLocalizationModule = require(script.Parent.Parent.Localization.withLocalization)
local searchBar = roact.PureComponent:extend("SearchBar")
searchBar.validateProps = t.interface({
	size = t.UDim2,
	text = t.optional(t.string),
	onTextChanged = t.optional(t.callback),
	onFocused = t.optional(t.callback),
	onCancelled = t.optional(t.callback),
	onFocusLost = t.optional(t.callback),
	autoCaptureFocus = t.optional(t.boolean),
	zIndex = t.optional(t.number),
	visible = t.optional(t.boolean)
})
searchBar.defaultProps = {
	autoCaptureFocus = false,
	visible = true,
	size = UDim2.fromScale(1, 1)
}

function searchBar.init(p1)
	-- upvalues: roact (ref)
	p1.textboxRef = roact.createRef()
	
	function p0.onAbsoluteSizeChanged(p2)
		-- upvalues: p1 (ref)
		local var1 = false
		
		if p1.width ~= p2.AbsoluteSize.X then
			p1.width = p2.AbsoluteSize.X
			var1 = true
		end
		if p1.height ~= p2.AbsoluteSize.Y then
			p1.height = p2.AbsoluteSize.Y
			var1 = true
		end
		if var1 then
			p1:setState({ width = p1.width - 2, height = p1.height - 2 })
		end
	end
	
	function p0.searchTextChanged(p2)
		-- upvalues: p1 (ref)
		if p1.props.onTextChanged then
			p1.props.onTextChanged(p2.Text)
		end
	end
	
	function p0.searchBoxFocused(_)
		-- upvalues: p1 (ref)
		if p1.props.onFocused then
			p1.props.onFocused()
		end
	end
	
	function p0.searchCancel()
		-- upvalues: p1 (ref)
		if p1.props.onCancelled then
			p1.props.onCancelled()
		end
	end
	
	function p0.onFocusLost()
		-- upvalues: p1 (ref)
		if p1.props.onFocusLost then
			p1.props.onFocusLost()
		end
	end
	
	function p0.onTextboxTouchTap()
		-- upvalues: p1 (ref)
		if p1.props.onTextboxTouchTap then
			p1.props.onTextboxTouchTap()
		end
	end
end

function searchBar.willUpdate(p1, p2)
	if p1.props.autoCaptureFocus and p1.props.visible == false and p2.visible then
		p1:focus()
	end
end

function searchBar.didMount(p1)
	if p1.props.autoCaptureFocus and p1.props.visible then
		p1:focus()
	end
end

function searchBar.focus(p1)
	if p1.textboxRef then
		p1.textboxRef.current:CaptureFocus()
	end
end

function searchBar.render(p1)
	-- upvalues: withFoundationOrUIBloxStyle (ref), withLocalizationModule (ref), roact (ref), userInputService (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), icon (ref), iconSize (ref), imageSetLabel (ref), images (ref)
	return withFoundationOrUIBloxStyle(function(p2)
		return {
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
		-- upvalues: withLocalizationModule (copy), p1 (ref), roact (copy), userInputService (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), icon (copy), iconSize (copy), imageSetLabel (copy), images (copy)
		return withLocalizationModule({
			search = "CoreScripts.InGameMenu.InviteFriends.Search",
			cancel = "CoreScripts.InGameMenu.Cancel"
		})(function(p3)
			-- upvalues: p2 (ref), p1 (copy), roact (copy), userInputService (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), icon (copy), iconSize (copy), imageSetLabel (copy), images (copy)
			local body = p2.Font.Body
			local body_1 = p2.Font.Body
			
			return roact.createElement("CanvasGroup", {
				BackgroundTransparency = 1,
				GroupTransparency = 0.5,
				Size = p1.props.size,
				ZIndex = p1.props.zIndex,
				Visible = p1.props.visible,
				[roact.Ref] = p1.props.forwardRef or roact.createRef()
			}, {
				SearchPanelLayout = roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 9)
				}),
				SearchBorder = roact.createElement("Frame", {
					Size = UDim2.new(1, -66, 0, 38),
					BackgroundColor3 = Color3.new(136, 136, 136),
					BackgroundTransparency = 0.8,
					[roact.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged
				}, {
					BorderRadius = roact.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
					SearchContainer = roact.createElement("Frame", {
						BackgroundTransparency = 0,
						Size = UDim2.fromOffset(p1.state.width, p1.state.height),
						BackgroundColor3 = Color3.new(0, 0, 0),
						Position = UDim2.fromOffset(1, 1)
					}, {
						SearchContainerLayout = roact.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							Padding = UDim.new(0, 10)
						}),
						Padding = roact.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12)
						}),
						BorderRadius = roact.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
						SearchImage = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(icon, {
							name = "icons/common/search_small",
							LayoutOrder = 1,
							size = iconSize.Medium
						}) else roact.createElement(imageSetLabel, {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							Image = images["icons/common/search_small"],
							Size = UDim2.fromOffset(18, 18)
						}),
						SearchInput = roact.createElement("TextBox", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Size = UDim2.new(1, -28, 0, 20),
							Font = body_1.Font,
							Text = p1.props.text or "",
							TextInputType = if userInputService:GetPlatform() == Enum.Platform.Android then Enum.TextInputType.PasswordShown else Enum.TextInputType.NoSuggestions,
							TextSize = p2.Font.BaseSize * body_1.RelativeSize,
							TextColor3 = p2.Theme.TextEmphasis.Color,
							TextXAlignment = Enum.TextXAlignment.Left,
							PlaceholderText = p3.search,
							PlaceholderColor3 = p2.Theme.TextDefault.Color,
							ClearTextOnFocus = false,
							ClipsDescendants = true,
							[roact.Change.Text] = p1.searchTextChanged,
							[roact.Event.Focused] = p1.searchBoxFocused,
							[roact.Event.FocusLost] = p1.onFocusLost,
							[roact.Ref] = p1.textboxRef,
							[roact.Event.TouchTap] = p1.onTextboxTouchTap
						})
					})
				}),
				CancelButton = roact.createElement("TextButton", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(57, 20),
					Font = body.Font,
					TextSize = p2.Font.BaseSize * body.RelativeSize,
					Text = p3.cancel,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					[roact.Event.Activated] = p1.searchCancel
				})
			})
		end)
	end)
end

return roact.forwardRef(function(p1, p2)
	-- upvalues: roact (ref), searchBar (ref), cryo (ref)
	return roact.createElement(searchBar, cryo.Dictionary.join(p1, { forwardRef = p2 }))
end)