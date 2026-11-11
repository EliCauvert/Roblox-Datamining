local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local FitFrameModule = require(CorePackages.Packages.FitFrame)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local FitFrameVertical = FitFrameModule.FitFrameVertical
local FitTextLabel = FitFrameModule.FitTextLabel
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local FFlagAXMigrateSaveOutfitPromptFromRoactGamepad = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateSaveOutfitPromptFromRoactGamepad
local ComponentAssetsCircle17Stroke1 = UIBloxModule.App.ImageSet.Images["component_assets/circle_17_stroke_1"]
local _Rect = Rect.new(8, 8, 8, 8)
local OutfitNameTextBox = RoactModule.PureComponent:extend("OutfitNameTextBox")
OutfitNameTextBox.validateProps = TModule.strictInterface({ onOutfitNameUpdated = TModule.callback })

local function _(Text, p1): boolean
	local Length = utf8.len(Text)
	
	return Length == nil or Length > p1 and p1 < utf8.len(utf8.nfcnormalize(Text))
end

function OutfitNameTextBox.init(p1)
	-- upvalues: RoactModule (copy)
	p1:setState({
		lastValidName = "",
		isNameInvalid = true,
		outfitName = ""
	})
	p1.textBoxRef = RoactModule.createRef()
	p1.wasInitiallyFocused = false
	
	function p1.tryFocusTextBox()
		-- upvalues: p1 (copy)
		if p1.wasInitiallyFocused then return end
		local Value = p1.textBoxRef:getValue()
		
		if Value and Value:IsDescendantOf(game) then
			Value:CaptureFocus()
			p1.wasInitiallyFocused = true
		end
	end
	
	function p1.onTextChanged(p2)
		-- upvalues: p1 (copy)
		local Text = p2.Text
		local Length = utf8.len(Text)
		
		if Length == nil or Length > 99 and utf8.len(utf8.nfcnormalize(Text)) > 99 then
			Text = p1.state.lastValidName
			p2.Text = Text
		end
		local Inverted = not string.match(Text, "^[0-9a-zA-Z%s]+$")
		p1:setState({
			lastValidName = if Inverted then p1.state.lastValidName else p2.Text,
			isNameInvalid = Inverted,
			outfitName = Text
		})
		p1.props.onOutfitNameUpdated(Text, Inverted)
	end
end

function OutfitNameTextBox.renderWithProviders(p1, p2, p3, Callback)
	-- upvalues: RoactModule (copy), FitFrameVertical (copy), ImageSetLabel (copy), ComponentAssetsCircle17Stroke1 (copy), _Rect (copy), FFlagAXMigrateSaveOutfitPromptFromRoactGamepad (copy), Focusable (copy), CursorKind (copy), FitTextLabel (copy)
	local _Font = p3.Font
	local Theme = p3.Theme
	
	return RoactModule.createElement(FitFrameVertical, { BackgroundTransparency = 1, width = UDim.new(1, 0) }, {
		TextboxContainer = RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = ComponentAssetsCircle17Stroke1,
			ImageColor3 = Theme.UIDefault.Color,
			ImageTransparency = Theme.UIDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 30),
			SliceCenter = _Rect
		}, {
			Textbox = RoactModule.createElement(if FFlagAXMigrateSaveOutfitPromptFromRoactGamepad then "TextBox" else Focusable.TextBox, {
				Text = "",
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				Font = _Font.Header2.Font,
				TextSize = _Font.BaseSize * _Font.CaptionBody.RelativeSize,
				PlaceholderColor3 = Theme.PlaceHolder.Color,
				PlaceholderText = p2.placeholderText,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, -12, 1, 0),
				TextColor3 = Theme.TextDefault.Color,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				OverlayNativeInput = true,
				Selectable = true,
				[RoactModule.Change.Text] = p1.onTextChanged,
				SelectionImageObject = Callback(CursorKind.InputFields),
				[RoactModule.Ref] = p1.textBoxRef,
				[RoactModule.Event.AncestryChanged] = p1.tryFocusTextBox
			})
		}),
		WarningText = p1.state.isNameInvalid and p1.state.outfitName ~= "" and RoactModule.createElement(FitTextLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = true,
			width = UDim.new(1, 0),
			Text = p2.warningText,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, 0, 0, 20),
			TextColor3 = Theme.Alert.Color,
			Font = _Font.Body.Font,
			TextSize = _Font.Body.RelativeSize * _Font.BaseSize
		})
	})
end

function OutfitNameTextBox.render(p1)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy)
	return WithLocalizationFunction({
		placeholderText = "Feature.Avatar.Label.Name",
		warningText = "Feature.Avatar.Label.CostumeWarning"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), WithSelectionCursorProviderFunction (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: WithSelectionCursorProviderFunction (upval), p1 (upval), p2 (copy)
			return WithSelectionCursorProviderFunction(function(p4)
				-- upvalues: p1 (upval), p2 (upval), p3 (copy)
				return p1:renderWithProviders(p2, p3, p4)
			end)
		end)
	end)
end

function OutfitNameTextBox.didMount(p1)
	p1.tryFocusTextBox()
end

return OutfitNameTextBox