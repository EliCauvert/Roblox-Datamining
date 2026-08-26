local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local socialLibrariesModule = require(appChat.SocialLibraries)
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local text = require(parent.AppCommonLib).Text
local memoize = require(parent.AppCommonLib).memoize
local textButton = UIBloxModule.App.Button.TextButton
local images = UIBloxModule.App.ImageSet.Images
local iconSize = UIBloxModule.App.Constant.IconSize
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationService = reactFocusNavigationModule.FocusNavigationService
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local coreGui = reactFocusNavigationModule.EngineInterface.CoreGui
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local callbackInputBox = socialLibrariesModule.Components.CallbackInputBox
local search = images["icons/common/search"]
local clearSmall = images["icons/actions/edit/clear_small"]
local t = {
	Image = images["squircles/fill"],
	SliceCenter = Rect.new(8, 8, 9, 9)
}
local searchTopBar = roactModule.PureComponent:extend("SearchTopBar")
searchTopBar.defaultProps = {
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

function searchTopBar.init(p1)
	-- upvalues: roactModule (ref), memoize (ref), text (ref)
	p1.focusNavigationService = p1.props.focusNavigationService
	p1.inputBoxRef = p1.props.inputBoxRef or roactModule.createRef()
	p1.containerRef = p1.props.containerRef or roactModule.createRef()
	p1.props.onSelectCallback()
	
	function p0.focusInputBox()
		-- upvalues: p1 (ref)
		if p1.inputBoxRef and p1.inputBoxRef.current then
			p1.inputBoxRef.current:CaptureFocus()
		end
	end
	
	p1.getTextWidth = memoize(function(p2, p3, p4)
		-- upvalues: text (copy)
		return text.GetTextWidth(p2, p3, p4)
	end)
end

function searchTopBar.didMount(p1)
	if p1.props.captureFocusOnMount and p1.containerRef.current and (p1.focusNavigationService and p1.focusNavigationService.focusedGuiObject:getValue() ~= nil) then
		p1.focusNavigationService:focusGuiObject(p1.containerRef.current)
	end
	if p1.inputBoxRef.current then
		p1.inputBoxRef.current.Selectable = false
	end
	p1.props.resetOnMount()
end

function searchTopBar.willUnmount(p1)
	if p1.focusNavigationService then
		p1.focusNavigationService:teardown()
	end
end

function searchTopBar.render(p1)
	-- upvalues: UIBloxModule (ref), roactModule (ref), textButton (ref), withSelectionCursorProvider (ref), foundationModule (ref), cursorKind (ref), imageSetLabel (ref), t (ref), iconSize (ref), search (ref), callbackInputBox (ref), clearSmall (ref)
	local var1 = function(p2)
		-- upvalues: p1 (ref)
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
		-- upvalues: p1 (ref), roactModule (copy), textButton (copy), withSelectionCursorProvider (copy), foundationModule (copy), cursorKind (copy), imageSetLabel (copy), t (copy), iconSize (copy), search (copy), callbackInputBox (copy), clearSmall (copy), var1 (ref)
		local cancelText = p1.props.cancelText
		local header2 = p2.Font.Header2
		local textWidth = p1.getTextWidth(cancelText, header2.Font, p2.Font.BaseSize * header2.RelativeSize)
		local left = Enum.HorizontalAlignment.Left
		local uDim = UDim.new(0, 4)
		local var2 = if p1.props.shouldShowCancel then UDim2.new(1, (-textWidth) - 12, 1, 0) else UDim2.new(1, 0, 1, 0)
		local body = p2.Font.Body
		local var3 = p2.Font.BaseSize * body.RelativeSize
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = p2.Tokens.Color.None.Transparency,
			BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			LayoutOrder = p1.props.LayoutOrder,
			[roactModule.Ref] = p1.props.focusNavigationEventHandlerRef
		}, {
			layout = roactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = left,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = uDim
			}),
			padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, p1.props.filterBoxPaddingTop),
				PaddingBottom = UDim.new(0, p1.props.filterBoxPaddingBottom),
				PaddingLeft = UDim.new(0, p1.props.filterBoxPaddingLeft),
				PaddingRight = UDim.new(0, p1.props.filterBoxPaddingRight)
			}),
			cancel = if p1.props.shouldShowCancel then roactModule.createElement(textButton, {
				layoutOrder = 2,
				text = cancelText,
				onActivated = p1.props.cancelCallback
			}) else nil,
			filterBoxContainer = withSelectionCursorProvider(function(p3)
				-- upvalues: roactModule (copy), foundationModule (copy), var2 (write), cursorKind (copy), p1 (copy), imageSetLabel (copy), t (copy), p2 (ref), iconSize (copy), search (copy), callbackInputBox (copy), body (ref), var3 (ref), clearSmall (copy), var1 (copy)
				return roactModule.createElement(foundationModule.View, {
					LayoutOrder = 1,
					Size = var2,
					selection = {
						Selectable = true,
						SelectionImageObject = p3(cursorKind.RoundedRect)
					},
					onActivated = p1.focusInputBox,
					ref = p1.containerRef
				}, {
					filterBoxBackground = roactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Selectable = false,
						Size = UDim2.fromScale(1, 1),
						Image = t.Image,
						ImageColor3 = p2.Theme.UIDefault.Color,
						ImageTransparency = p2.Theme.UIDefault.Transparency,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = t.SliceCenter
					}, {
						layout = roactModule.createElement("UIListLayout", {
							VerticalAlignment = Enum.VerticalAlignment.Center,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							FillDirection = Enum.FillDirection.Horizontal,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 4)
						}),
						padding = roactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12)
						}),
						filterBoxIcon = roactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Size = UDim2.new(0, iconSize.Small, 0, iconSize.Small),
							Image = search,
							ImageColor3 = p2.Theme.IconEmphasis.Color,
							ImageTransparency = p2.Theme.IconEmphasis.Transparency
						}),
						filterBoxContainer = roactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Size = UDim2.new(1, -(iconSize.Small + 4), 1, 0)
						}, {
							filterBox = roactModule.createElement(callbackInputBox, {
								clearButtonDisabled = false,
								initialInputText = p1.props.initialInputText,
								inputTextColor3 = p2.Theme.TextEmphasis.Color,
								inputTextFont = body.Font,
								inputTextSize = var3,
								inputTextTransparency = p2.Theme.TextEmphasis.Transparency,
								inputTextXAlignment = Enum.TextXAlignment.Left,
								placeholderText = p1.props.searchPlaceholderText,
								placeholderTextColor3 = p2.Theme.TextDefault.Color,
								placeholderTextTransparency = p2.Theme.TextDefault.Transparency,
								captureFocusOnMount = p1.props.captureFocusOnMount,
								clearIcon = clearSmall,
								clearIconColor3 = p2.Theme.IconEmphasis.Color,
								clearIconTransparency = p2.Theme.IconEmphasis.Transparency,
								clearButtonSize = iconSize.Small,
								textChangedCallback = var1,
								onSelectCallback = p1.props.onSelectCallback,
								inputBoxRef = p1.inputBoxRef,
								clearButtonSelectionImageObject = p3(cursorKind.RoundedRect)
							})
						})
					})
				})
			end)
		})
	end)
end

function FocusableSearchTopBar(p1)
	-- upvalues: reactModule (ref), focusNavigationService (ref), coreGui (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), roactModule (ref), searchTopBar (ref), cryoModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = focusNavigationService.new(coreGui)
	local cancelCallback = p1.cancelCallback
	
	return roactModule.createElement(searchTopBar, cryoModule.Dictionary.join({
		inputBoxRef = var2,
		containerRef = var1,
		focusNavigationEventHandlerRef = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, function(p2)
			-- upvalues: var3 (ref), var1 (ref), cancelCallback (ref)
			if p2.eventData and var3.focusedGuiObject:getValue() == var1.current and p2.eventData.KeyCode ~= Enum.KeyCode.None then
				p2:cancel()
				
				if cancelCallback then
					cancelCallback()
				end
			end
		end, "Bubble", nil),
		focusNavigationService = var3
	}, p1))
end

return FocusableSearchTopBar