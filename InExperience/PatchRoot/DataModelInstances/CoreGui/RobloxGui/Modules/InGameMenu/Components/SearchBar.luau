local userInputService = game:GetService("UserInputService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local withStyle = UIBlox.Core.Style.withStyle
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local images = UIBlox.App.ImageSet.Images
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

function searchBar.init(p0) --[[ line: 46 ]]
	-- upvalues: roact (ref)
	p0.textboxRef = roact.createRef()
	
	function p0.onAbsoluteSizeChanged(p1) --[[ line: 49 ]]
		-- upvalues: p0 (ref)
		local var4 = false
		
		if p0.width ~= p1.AbsoluteSize.X then
			p0.width = p1.AbsoluteSize.X
			var4 = true
		end
		if p0.height ~= p1.AbsoluteSize.Y then
			p0.height = p1.AbsoluteSize.Y
			var4 = true
		end
		if var4 then
			p0:setState({ width = p0.width - 2, height = p0.height - 2 })
		end
	end
	
	function p0.searchTextChanged(p2) --[[ line: 70 ]]
		-- upvalues: p0 (ref)
		if p0.props.onTextChanged then
			p0.props.onTextChanged(p2.Text)
		end
	end
	
	function p0.searchBoxFocused(_) --[[ line: 76 ]]
		-- upvalues: p0 (ref)
		if p0.props.onFocused then
			p0.props.onFocused()
		end
	end
	
	function p0.searchCancel() --[[ line: 82 ]]
		-- upvalues: p0 (ref)
		if p0.props.onCancelled then
			p0.props.onCancelled()
		end
	end
	
	function p0.onFocusLost() --[[ line: 88 ]]
		-- upvalues: p0 (ref)
		if p0.props.onFocusLost then
			p0.props.onFocusLost()
		end
	end
	
	function p0.onTextboxTouchTap() --[[ line: 94 ]]
		-- upvalues: p0 (ref)
		if p0.props.onTextboxTouchTap then
			p0.props.onTextboxTouchTap()
		end
	end
end

function searchBar.willUpdate(p3, p4) --[[ line: 101 ]]
	if p3.props.autoCaptureFocus and p3.props.visible == false and p4.visible then
		p3:focus()
	end
end

function searchBar.didMount(p5) --[[ line: 107 ]]
	if p5.props.autoCaptureFocus and p5.props.visible then
		p5:focus()
	end
end

function searchBar.focus(p6) --[[ line: 113 ]]
	if p6.textboxRef then
		p6.textboxRef.current:CaptureFocus()
	end
end

function searchBar.render(p7) --[[ line: 119 ]]
	-- upvalues: withStyle (ref), withLocalizationModule (ref), roact (ref), userInputService (ref), imageSetLabel (ref), images (ref)
	return withStyle(function(p8) --[[ line: 120 ]]
		-- upvalues: withLocalizationModule (copy), p7 (ref), roact (copy), userInputService (copy), imageSetLabel (copy), images (copy)
		return withLocalizationModule({
			search = "CoreScripts.InGameMenu.InviteFriends.Search",
			cancel = "CoreScripts.InGameMenu.Cancel"
		})(function(p9) --[[ line: 124 ]]
			-- upvalues: p8 (ref), p7 (copy), roact (copy), userInputService (copy), imageSetLabel (copy), images (copy)
			local body = p8.Font.Body
			local body_1 = p8.Font.Body
			
			return roact.createElement("CanvasGroup", {
				BackgroundTransparency = 1,
				GroupTransparency = 0.5,
				Size = p7.props.size,
				ZIndex = p7.props.zIndex,
				Visible = p7.props.visible,
				[roact.Ref] = p7.props.forwardRef or roact.createRef()
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
					[roact.Change.AbsoluteSize] = p7.onAbsoluteSizeChanged
				}, {
					BorderRadius = roact.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
					SearchContainer = roact.createElement("Frame", {
						BackgroundTransparency = 0,
						Size = UDim2.fromOffset(p7.state.width, p7.state.height),
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
						SearchImage = roact.createElement(imageSetLabel, {
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
							Text = p7.props.text or "",
							TextInputType = if userInputService:GetPlatform() == Enum.Platform.Android then Enum.TextInputType.PasswordShown else Enum.TextInputType.NoSuggestions,
							TextSize = p8.Font.BaseSize * body_1.RelativeSize,
							TextColor3 = p8.Theme.TextEmphasis.Color,
							TextXAlignment = Enum.TextXAlignment.Left,
							PlaceholderText = p9.search,
							PlaceholderColor3 = p8.Theme.TextDefault.Color,
							ClearTextOnFocus = false,
							ClipsDescendants = true,
							[roact.Change.Text] = p7.searchTextChanged,
							[roact.Event.Focused] = p7.searchBoxFocused,
							[roact.Event.FocusLost] = p7.onFocusLost,
							[roact.Ref] = p7.textboxRef,
							[roact.Event.TouchTap] = p7.onTextboxTouchTap
						})
					})
				}),
				CancelButton = roact.createElement("TextButton", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(57, 20),
					Font = body.Font,
					TextSize = p8.Font.BaseSize * body.RelativeSize,
					Text = p9.cancel,
					TextColor3 = p8.Theme.TextEmphasis.Color,
					[roact.Event.Activated] = p7.searchCancel
				})
			})
		end)
	end)
end

return roact.forwardRef(function(p10, p11) --[[ line: 236 ]]
	-- upvalues: roact (ref), searchBar (ref), cryo (ref)
	return roact.createElement(searchBar, cryo.Dictionary.join(p10, { forwardRef = p11 }))
end)