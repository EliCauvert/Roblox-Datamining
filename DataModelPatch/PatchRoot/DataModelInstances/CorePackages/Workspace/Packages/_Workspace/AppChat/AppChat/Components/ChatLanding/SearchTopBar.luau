local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Text = require(Parent.AppCommonLib).Text
local MemoizeFunction = require(Parent.AppCommonLib).memoize
local TextButton = UIBloxModule.App.Button.TextButton
local Images = UIBloxModule.App.ImageSet.Images
local IconSize = UIBloxModule.App.Constant.IconSize
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationService = ReactFocusNavigationModule.FocusNavigationService
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local CoreGui = ReactFocusNavigationModule.EngineInterface.CoreGui
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local CallbackInputBox = require(AppChat.SocialLibraries).Components.CallbackInputBox
local IconsCommonSearch = Images["icons/common/search"]
local IconsActionsEditClearSmall = Images["icons/actions/edit/clear_small"]
local config = {
	Image = Images["squircles/fill"],
	SliceCenter = Rect.new(8, 8, 9, 9)
}
local SearchTopBar = RoactModule.PureComponent:extend("SearchTopBar")
SearchTopBar.defaultProps = {
	cancelText = "CancelPlaceholder",
	searchPlaceholderText = "PlaceholderText",
	initialInputText = nil,
	filterBoxPaddingTop = 6,
	filterBoxPaddingBottom = 6,
	filterBoxPaddingLeft = 0,
	filterBoxPaddingRight = 0,
	captureFocusOnMount = false,
	cancelCallback = nil,
	shouldShowCancel = true,
	textChangedCallback = nil,
	LayoutOrder = 1,
	containerRef = nil,
	inputBoxRef = nil,
	focusNavigationEventHandlerRef = nil,
	resetOnMount = function() end,
	onSelectCallback = function() end
}

function SearchTopBar.init(p1)
	-- upvalues: RoactModule (copy), MemoizeFunction (copy), Text (copy)
	p1.focusNavigationService = p1.props.focusNavigationService
	p1.inputBoxRef = p1.props.inputBoxRef or RoactModule.createRef()
	p1.containerRef = p1.props.containerRef or RoactModule.createRef()
	p1.props.onSelectCallback()
	
	function p1.focusInputBox()
		-- upvalues: p1 (copy)
		if p1.inputBoxRef and p1.inputBoxRef.current then
			p1.inputBoxRef.current:CaptureFocus()
		end
	end
	
	p1.getTextWidth = MemoizeFunction(function(p2, p3, p4)
		-- upvalues: Text (upval)
		return Text.GetTextWidth(p2, p3, p4)
	end)
end

function SearchTopBar.didMount(DefaultProps)
	if DefaultProps.props.captureFocusOnMount and DefaultProps.containerRef.current and DefaultProps.focusNavigationService and DefaultProps.focusNavigationService.focusedGuiObject:getValue() ~= nil then
		DefaultProps.focusNavigationService:focusGuiObject(DefaultProps.containerRef.current)
	end
	if DefaultProps.inputBoxRef.current then
		DefaultProps.inputBoxRef.current.Selectable = false
	end
	DefaultProps.props.resetOnMount()
end

function SearchTopBar.willUnmount(p1)
	if p1.focusNavigationService then
		p1.focusNavigationService:teardown()
	end
end

function SearchTopBar.render(p1)
	-- upvalues: UIBloxModule (copy), RoactModule (copy), TextButton (copy), WithSelectionCursorProviderFunction (copy), FoundationModule (copy), CursorKind (copy), ImageSetLabel (copy), config (copy), IconSize (copy), IconsCommonSearch (copy), CallbackInputBox (copy), IconsActionsEditClearSmall (copy)
	local function TextChangedCallback(p2)
		-- upvalues: p1 (copy)
		if (not p2 or #p2 <= 0) and p1.focusNavigationService and p1.inputBoxRef.current then
			if p1.focusNavigationService.focusedGuiObject:getValue() == nil then
				p1.focusNavigationService:focusGuiObject(p1.inputBoxRef.current)
			else
				p1.focusNavigationService:focusGuiObject(p1.containerRef.current)
				p1.focusInputBox()
			end
		end
		if p1.props.textChangedCallback then
			p1.props.textChangedCallback(p2)
		end
	end
	
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), TextButton (upval), WithSelectionCursorProviderFunction (upval), FoundationModule (upval), CursorKind (upval), ImageSetLabel (upval), config (upval), IconSize (upval), IconsCommonSearch (upval), CallbackInputBox (upval), IconsActionsEditClearSmall (upval), TextChangedCallback (copy)
		local CancelText = p1.props.cancelText
		local Header2 = p2.Font.Header2
		local TextWidth = p1.getTextWidth(CancelText, Header2.Font, p2.Font.BaseSize * Header2.RelativeSize)
		local _UDim2: UDim2 = if p1.props.shouldShowCancel then UDim2.new(1, -TextWidth - 12, 1, 0) else UDim2.new(1, 0, 1, 0)
		local Body = p2.Font.Body
		local ScaledBaseSize = p2.Font.BaseSize * Body.RelativeSize
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = p2.Tokens.Color.None.Transparency,
			BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			LayoutOrder = p1.props.LayoutOrder,
			[RoactModule.Ref] = p1.props.focusNavigationEventHandlerRef
		}, {
			layout = RoactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			padding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, p1.props.filterBoxPaddingTop),
				PaddingBottom = UDim.new(0, p1.props.filterBoxPaddingBottom),
				PaddingLeft = UDim.new(0, p1.props.filterBoxPaddingLeft),
				PaddingRight = UDim.new(0, p1.props.filterBoxPaddingRight)
			}),
			cancel = if p1.props.shouldShowCancel then RoactModule.createElement(TextButton, {
				layoutOrder = 2,
				text = CancelText,
				onActivated = p1.props.cancelCallback
			}) else nil,
			filterBoxContainer = WithSelectionCursorProviderFunction(function(Callback)
				-- upvalues: RoactModule (upval), FoundationModule (upval), _UDim2 (ref), CursorKind (upval), p1 (upval), ImageSetLabel (upval), config (upval), p2 (copy), IconSize (upval), IconsCommonSearch (upval), CallbackInputBox (upval), Body (copy), ScaledBaseSize (copy), IconsActionsEditClearSmall (upval), TextChangedCallback (upval)
				return RoactModule.createElement(FoundationModule.View, {
					LayoutOrder = 1,
					Size = _UDim2,
					selection = {
						Selectable = true,
						SelectionImageObject = Callback(CursorKind.RoundedRect)
					},
					onActivated = p1.focusInputBox,
					ref = p1.containerRef
				}, {
					filterBoxBackground = RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Selectable = false,
						Size = UDim2.fromScale(1, 1),
						Image = config.Image,
						ImageColor3 = p2.Theme.UIDefault.Color,
						ImageTransparency = p2.Theme.UIDefault.Transparency,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = config.SliceCenter
					}, {
						layout = RoactModule.createElement("UIListLayout", {
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							FillDirection = Enum.FillDirection.Horizontal,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 4)
						}),
						padding = RoactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12)
						}),
						filterBoxIcon = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Size = UDim2.new(0, IconSize.Small, 0, IconSize.Small),
							Image = IconsCommonSearch,
							ImageColor3 = p2.Theme.IconEmphasis.Color,
							ImageTransparency = p2.Theme.IconEmphasis.Transparency
						}),
						filterBoxContainer = RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Size = UDim2.new(1, -(IconSize.Small + 4), 1, 0)
						}, {
							filterBox = RoactModule.createElement(CallbackInputBox, {
								clearButtonDisabled = false,
								initialInputText = p1.props.initialInputText,
								inputTextColor3 = p2.Theme.TextEmphasis.Color,
								inputTextFont = Body.Font,
								inputTextSize = ScaledBaseSize,
								inputTextTransparency = p2.Theme.TextEmphasis.Transparency,
								inputTextXAlignment = Enum.TextXAlignment.Left,
								placeholderText = p1.props.searchPlaceholderText,
								placeholderTextColor3 = p2.Theme.TextDefault.Color,
								placeholderTextTransparency = p2.Theme.TextDefault.Transparency,
								captureFocusOnMount = p1.props.captureFocusOnMount,
								clearIcon = IconsActionsEditClearSmall,
								clearIconColor3 = p2.Theme.IconEmphasis.Color,
								clearIconTransparency = p2.Theme.IconEmphasis.Transparency,
								clearButtonSize = IconSize.Small,
								textChangedCallback = TextChangedCallback,
								onSelectCallback = p1.props.onSelectCallback,
								inputBoxRef = p1.inputBoxRef,
								clearButtonSelectionImageObject = Callback(CursorKind.RoundedRect)
							})
						})
					})
				})
			end)
		})
	end)
end

function FocusableSearchTopBar(p1)
	-- upvalues: ReactModule (copy), FocusNavigationService (copy), CoreGui (copy), ReactFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy), RoactModule (copy), SearchTopBar (copy), CryoModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local NewFocusNavigationService = FocusNavigationService.new(CoreGui)
	local CancelCallbackFunction = p1.cancelCallback
	
	return RoactModule.createElement(SearchTopBar, CryoModule.Dictionary.join({
		inputBoxRef = ReactModule.useRef(nil),
		containerRef = UseRefResult,
		focusNavigationEventHandlerRef = ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, function(p2)
			-- upvalues: NewFocusNavigationService (copy), UseRefResult (copy), CancelCallbackFunction (copy)
			if p2.eventData and NewFocusNavigationService.focusedGuiObject:getValue() == UseRefResult.current and p2.eventData.KeyCode ~= Enum.KeyCode.Unknown then
				p2:cancel()
				
				if CancelCallbackFunction then
					CancelCallbackFunction()
				end
			end
		end, "Bubble", nil),
		focusNavigationService = NewFocusNavigationService
	}, p1))
end

return FocusableSearchTopBar