local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(RobloxGui.Modules.Settings.Pages.ShareGame.Constants)
local SearchBox = RoactModule.Component:extend("SearchBox")
local ShareGameIconsModule = require(RobloxGui.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons)
local ImagePath = ShareGameIconsModule:GetImagePath()
local SearchBorderFrame = ShareGameIconsModule:GetFrame("search_border")
local _Rect = Rect.new(3, 3, 4, 4)
local SearchSmallFrame = ShareGameIconsModule:GetFrame("search_small")
local ClearFrame = ShareGameIconsModule:GetFrame("clear")
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local Translator = require(RobloxGui.Modules.Settings.Pages.ShareGame.getTranslator)()

function SearchBox.init(p1)
	p1.state = { isTextWritten = false }
	p1.searchField = nil
end

function SearchBox.render(p1)
	-- upvalues: RoactModule (copy), ImagePath (copy), SearchBorderFrame (copy), _Rect (copy), ImagePath (copy), SearchSmallFrame (copy), ConstantsModule (copy), Translator (copy), ThemeModule (copy), ImagePath (copy), ClearFrame (copy)
	local OnTextBoxFocusLostFunction = p1.props.onTextBoxFocusLost
	local OnTextBoxFocusedFunction = p1.props.onTextBoxFocused
	local SearchFieldRefFunction = p1.props.searchFieldRef
	local ZIndex = p1.props.zIndex
	
	return RoactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		AnchorPoint = p1.props.anchorPoint,
		Position = p1.props.position,
		Size = p1.props.size,
		Visible = p1.props.visible,
		Image = ImagePath,
		ImageRectOffset = SearchBorderFrame.offset,
		ImageRectSize = SearchBorderFrame.size,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = _Rect,
		ZIndex = ZIndex
	}, {
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6)
		}),
		SearchIcon = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = ImagePath,
			ImageRectOffset = SearchSmallFrame.offset,
			ImageRectSize = SearchSmallFrame.size,
			Size = UDim2.new(0, 16, 0, 16),
			ZIndex = ZIndex
		}),
		SearchField = RoactModule.createElement("TextBox", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 28, 0.5, 0),
			Size = UDim2.new(1, -56, 1, 0),
			ClearTextOnFocus = false,
			PlaceholderColor3 = ConstantsModule.Color.GRAY3,
			PlaceholderText = Translator:FormatByKey("Feature.SettingsHub.Label.SearchForFriendsPlaceholder.FriendsRename"),
			Text = "",
			TextColor3 = ConstantsModule.Color.WHITE,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = ThemeModule.textSize(16),
			Font = ThemeModule.font(Enum.Font.SourceSans),
			ZIndex = ZIndex,
			[RoactModule.Ref] = function(SearchField)
				-- upvalues: p1 (copy), SearchFieldRefFunction (copy)
				p1.searchField = SearchField
				
				if SearchFieldRefFunction then
					SearchFieldRefFunction(SearchField)
				end
			end,
			[RoactModule.Event.Focused] = function()
				-- upvalues: OnTextBoxFocusedFunction (copy)
				if OnTextBoxFocusedFunction then
					OnTextBoxFocusedFunction()
				end
			end,
			[RoactModule.Event.FocusLost] = function(p2)
				-- upvalues: OnTextBoxFocusLostFunction (copy)
				if OnTextBoxFocusLostFunction then
					OnTextBoxFocusLostFunction(p2.Text)
				end
			end
		}),
		ClearButton = RoactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, 0, 0, 0),
			Size = UDim2.new(0, 16, 0, 16),
			Image = ImagePath,
			ImageRectOffset = ClearFrame.offset,
			ImageRectSize = ClearFrame.size,
			ZIndex = ZIndex,
			Visible = p1.state.isTextWritten,
			[RoactModule.Event.Activated] = function()
				-- upvalues: p1 (copy)
				if p1.searchField then
					p1.searchField.Text = ""
					p1.searchField:CaptureFocus()
				end
			end
		})
	})
end

function SearchBox.didMount(p1)
	local SearchField = p1.searchField
	local OnTextChangedFunction = p1.props.onTextChanged
	
	if SearchField then
		p1.textBoxChangedConnection = SearchField:GetPropertyChangedSignal("Text"):Connect(function()
			-- upvalues: SearchField (copy), p1 (copy), OnTextChangedFunction (copy)
			local Text = SearchField.Text
			p1:setState({ isTextWritten = Text:len() > 0 })
			OnTextChangedFunction(Text)
		end)
	end
end

function SearchBox.willUnmount(p1)
	if p1.textBoxChangedConnection then
		p1.textBoxChangedConnection:Disconnect()
	end
end

return SearchBox