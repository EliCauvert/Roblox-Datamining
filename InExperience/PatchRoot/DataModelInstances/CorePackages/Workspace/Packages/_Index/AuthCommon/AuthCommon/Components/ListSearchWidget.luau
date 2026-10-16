local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local AppFonts = require(Parent.Style).AppFonts
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoactServices = require(Parent.RoactServices).RoactServices
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UIBloxModule = require(Parent.UIBlox)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local SearchBarModule = require(AuthCommon.Components.SearchBar)
local WindowedListFrameModule = require(AuthCommon.Components.WindowedListFrame)
local Colors = require(Parent.Style).Colors
local OtterModule = require(Parent.Otter)
local ListSearchWidget = RoactModule.PureComponent:extend("ListSearchWidget")
local Flint = Colors.Flint
local Obsidian = Colors.Obsidian
local White = Colors.White

function ListSearchWidget.init(p1) --[[ Line: 40 ]]
	-- upvalues: RoactModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy), Flint (copy), ImageSetButton (copy)
	p1.state = {
		fullLoad = false,
		visible = false,
		filteredList = p1.props.List
	}
	p1.visibility = 0
	p1.visibilityTarget = 0
	p1.baseFrameRef = RoactModule.createRef()
	
	function p1.getWidgetPosition(): UDim2 --[[ Line: 51 ]]
		-- upvalues: p1 (copy)
		return UDim2.new(0.5, 0, 2 - p1.visibility, 10)
	end
	
	function p1.searchTextChanged(p2) --[[ Line: 55 ]]
		-- upvalues: p1 (copy)
		local Lowered = string.lower(p2.Text)
		
		if Lowered ~= "" then
			local FilteredList = {}
			
			for _, value in ipairs(p1.props.List) do
				if string.find(string.lower(value.localizedName), Lowered, 1, true) then
					table.insert(FilteredList, value)
				end
			end
			p1:setState({ filteredList = FilteredList })
		elseif p1.state.filteredList ~= p1.props.List then
			p1:setState({ filteredList = p1.props.List })
			
			return
		end
	end
	
	function p1.renderWidgetBackground(p3) --[[ Line: 76 ]]
		-- upvalues: RoactModule (upval), ImageSetLabel (upval), GetImageDataFunction (upval), Flint (upval), p1 (copy), ImageSetButton (upval)
		local ScaledCloseButtonSize = 1.4 * p3.closeButtonSize
		
		if p3.isWideScreen then
			return RoactModule.createElement(ImageSetLabel, {
				Size = UDim2.new(1, 0, 1, -ScaledCloseButtonSize + 10),
				Position = p3.Position,
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundTransparency = 1,
				Image = GetImageDataFunction("LuaApp/buttons/buttonFill") or "LuaApp/buttons/buttonFill",
				ImageColor3 = Flint,
				BorderSizePixel = 0,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 9, 9),
				Visible = p3.Visible,
				[RoactModule.Ref] = p1.baseFrameRef
			}, {
				CloseButton = RoactModule.createElement(ImageSetButton, {
					Size = UDim2.new(0, p3.closeButtonSize, 0, p3.closeButtonSize),
					AnchorPoint = Vector2.new(0, 1),
					Image = GetImageDataFunction("LuaApp/icons/GameDetails/navigation/close") or "LuaApp/icons/GameDetails/navigation/close",
					BackgroundTransparency = 1,
					[RoactModule.Event.Activated] = p3.CloseCallback
				}),
				UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(600, 1e999) }),
				ContentWrapper = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -80, 1, -50),
					Position = UDim2.new(0, 40, 0, 40)
				}, p3.contents)
			})
		else
			local NewCloseButtonSize = p3.closeButtonSize + 20
			
			return RoactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 10),
				Position = p3.Position,
				AnchorPoint = Vector2.new(0.5, 1),
				BackgroundColor3 = Flint,
				Visible = p3.Visible,
				[RoactModule.Ref] = p1.baseFrameRef
			}, {
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 40),
					PaddingLeft = UDim.new(0, 20),
					PaddingRight = UDim.new(0, 20),
					PaddingBottom = UDim.new(0, 10)
				}),
				CloseButton = RoactModule.createElement(ImageSetButton, {
					Size = UDim2.new(0, p3.closeButtonSize, 0, p3.closeButtonSize),
					Image = GetImageDataFunction("LuaApp/icons/GameDetails/navigation/close") or "LuaApp/icons/GameDetails/navigation/close",
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.21, 0),
					[RoactModule.Event.Activated] = p3.CloseCallback
				}),
				ContentWrapper = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, -NewCloseButtonSize),
					Position = UDim2.new(0, 0, 0, NewCloseButtonSize)
				}, p3.contents)
			})
		end
	end
end

function ListSearchWidget.didMount(p2) --[[ Line: 141 ]]
	-- upvalues: OtterModule (copy)
	p2.motor = OtterModule.createSingleMotor(p2.visibility)
	p2.motor:onStep(function(Visibility) --[[ Line: 143 ]]
		-- upvalues: p2 (copy)
		p2.visibility = Visibility
		
		if p2.baseFrameRef.current then
			p2.baseFrameRef.current.Position = p2.getWidgetPosition()
			p2.baseFrameRef.current.Parent.BackgroundTransparency = 1 - 0.5 * p2.visibility
		end
		if Visibility == 0 and p2.state.visible then
			p2:setState({ visible = false })
			
			return
		end
		if Visibility == 1 and not p2.state.fullLoad then
			p2:setState({ fullLoad = true })
		end
	end)
end

function ListSearchWidget.willUnmount(p2) --[[ Line: 162 ]]
	if p2.motor then
		p2.motor:destroy()
	end
end

ListSearchWidget.defaultProps = { SearchPlaceholder = "Feature.Chat.Label.SearchWord" }

function ListSearchWidget.render(p2) --[[ Line: 172 ]]
	-- upvalues: FormFactor (copy), WithLocalizationFunction (copy), RoactModule (copy), AppFonts (copy), White (copy), SearchBarModule (copy), Obsidian (copy), Flint (copy), WindowedListFrameModule (copy)
	local IsFormFactorMatch = p2.props.formFactor == FormFactor.WIDE
	local CloseButtonSize = 27
	local TextSize = 14
	local IconSize = 24
	local YOffset = 24
	local NewTextSize = TextSize + 36
	
	if IsFormFactorMatch then
		CloseButtonSize = 48
		TextSize = 18
		IconSize = 30
		YOffset = 24
		NewTextSize = TextSize + 48
	end
	local YOffset1 = TextSize * 2.4
	local NewYOffset = YOffset1 + 40 + YOffset
	local IsVisibilityTargetMatch = p2.props.VisibilityTarget == 1
	
	return WithLocalizationFunction({
		heading = p2.props.Heading,
		search = p2.props.SearchPlaceholder
	})(function(p3) --[[ Line: 197 ]]
		-- upvalues: IsVisibilityTargetMatch (copy), RoactModule (upval), p2 (copy), IsFormFactorMatch (copy), CloseButtonSize (ref), YOffset (ref), AppFonts (upval), White (upval), SearchBarModule (upval), YOffset1 (copy), Obsidian (upval), Flint (upval), IconSize (ref), TextSize (ref), WindowedListFrameModule (upval), NewYOffset (copy), NewTextSize (ref)
		return RoactModule.createElement(if IsVisibilityTargetMatch then "TextButton" else "Frame", {
			BorderSizePixel = 0,
			AutoButtonColor = not IsVisibilityTargetMatch and nil,
			Text = if IsVisibilityTargetMatch then "" else nil,
			BackgroundColor3 = Color3.new(0, 0, 0),
			BackgroundTransparency = 1 - 0.5 * p2.visibility,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			RoactModule.createElement(p2.renderWidgetBackground, {
				isWideScreen = IsFormFactorMatch,
				closeButtonSize = CloseButtonSize,
				Position = p2.getWidgetPosition(),
				CloseCallback = p2.props.CloseCallback,
				Visible = p2.state.visible,
				contents = {
					Heading = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = p3.heading,
						Size = UDim2.new(1, 0, 0, YOffset),
						TextSize = YOffset,
						Font = AppFonts.default:getBold(),
						TextColor3 = White,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					SearchBar = RoactModule.createElement(SearchBarModule, {
						Text = "",
						Size = UDim2.new(1, 0, 0, YOffset1),
						Position = UDim2.new(0, 0, 0, YOffset + 20),
						ImageColor3 = Obsidian,
						PlaceholderText = p3.search,
						PlaceholderColor3 = Flint,
						IconSize = IconSize,
						TextSize = TextSize,
						TextColor3 = White,
						TextChanged = p2.searchTextChanged
					}),
					ListFrame = RoactModule.createElement(WindowedListFrameModule, {
						List = p2.state.filteredList,
						ScrollingFrameOffset = NewYOffset,
						TextSize = TextSize,
						ButtonSizeY = NewTextSize,
						ListButton = p2.props.ListButton,
						ListButtonProps = {
							TextSize = TextSize,
							SelectionCallback = p2.props.SelectionCallback
						}
					})
				}
			})
		})
	end)
end

function ListSearchWidget.didUpdate(p2, p3) --[[ Line: 255 ]]
	-- upvalues: OtterModule (copy)
	if p2.visibilityTarget ~= p2.props.VisibilityTarget and p2.motor then
		p2.visibilityTarget = p2.props.VisibilityTarget
		p2.motor:setGoal(OtterModule.spring(p2.visibilityTarget), { frequency = 3 })
		
		if p2.visibilityTarget > 0 and not p2.state.visible then
			p2:setState({ visible = true })
		end
	end
	if p3.List ~= p2.props.List or p2.props.VisibilityTarget == 1 and p3.VisibilityTarget ~= 1 then
		p2:setState({ filteredList = p2.props.List })
	end
end

return RoactServices.connect({ networking = RoactNetworking })((RoactRoduxModule.connect(function(p2, _) --[[ Line: 277 ]]
	return { formFactor = p2.FormFactor }
end)(ListSearchWidget)))