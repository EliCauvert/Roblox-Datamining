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

function searchTopBar.init(p0)
	-- upvalues: roactModule (ref), memoize (ref), text (ref)
	p0.focusNavigationService = p0.props.focusNavigationService
	p0.inputBoxRef = p0.props.inputBoxRef or roactModule.createRef()
	p0.containerRef = p0.props.containerRef or roactModule.createRef()
	p0.props.onSelectCallback()
	
	function p0.focusInputBox()
		-- upvalues: p0 (ref)
		if p0.inputBoxRef and p0.inputBoxRef.current then
			p0.inputBoxRef.current:CaptureFocus()
		end
	end
	
	p0.getTextWidth = memoize(function(p1, p2, p3)
		-- upvalues: text (copy)
		return text.GetTextWidth(p1, p2, p3)
	end)
end

function searchTopBar.didMount(p4)
	if p4.props.captureFocusOnMount and p4.containerRef.current and (p4.focusNavigationService and p4.focusNavigationService.focusedGuiObject:getValue() ~= nil) then
		p4.focusNavigationService:focusGuiObject(p4.containerRef.current)
	end
	if p4.inputBoxRef.current then
		p4.inputBoxRef.current.Selectable = false
	end
	p4.props.resetOnMount()
end

function searchTopBar.willUnmount(p5)
	if p5.focusNavigationService then
		p5.focusNavigationService:teardown()
	end
end

function searchTopBar.render(p6)
	-- upvalues: UIBloxModule (ref), roactModule (ref), textButton (ref), withSelectionCursorProvider (ref), foundationModule (ref), cursorKind (ref), imageSetLabel (ref), t (ref), iconSize (ref), search (ref), callbackInputBox (ref), clearSmall (ref)
	local var10 = function(p7)
		-- upvalues: p6 (ref)
		if (not p7 or #p7 <= 0) and p6.focusNavigationService and p6.inputBoxRef.current then
			if p6.focusNavigationService.focusedGuiObject:getValue() == nil then
				p6.focusNavigationService:focusGuiObject(p6.inputBoxRef.current)
			else
				p6.focusNavigationService:focusGuiObject(p6.containerRef.current)
				p6.focusInputBox()
			end
		end
		if p6.props.textChangedCallback then
			p6.props.textChangedCallback(p7)
		end
	end
	
	return UIBloxModule.Style.withStyle(function(p8)
		-- upvalues: p6 (ref), roactModule (copy), textButton (copy), withSelectionCursorProvider (copy), foundationModule (copy), cursorKind (copy), imageSetLabel (copy), t (copy), iconSize (copy), search (copy), callbackInputBox (copy), clearSmall (copy), var10 (ref)
		local cancelText = p6.props.cancelText
		local header2 = p8.Font.Header2
		local textWidth = p6.getTextWidth(cancelText, header2.Font, p8.Font.BaseSize * header2.RelativeSize)
		local left = Enum.HorizontalAlignment.Left
		local uDim = UDim.new(0, 4)
		local var13 = if p6.props.shouldShowCancel then UDim2.new(1, (-textWidth) - 12, 1, 0) else UDim2.new(1, 0, 1, 0)
		local body = p8.Font.Body
		local var14 = p8.Font.BaseSize * body.RelativeSize
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = p8.Tokens.Color.None.Transparency,
			BackgroundColor3 = p8.Theme.BackgroundDefault.Color,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			LayoutOrder = p6.props.LayoutOrder,
			[roactModule.Ref] = p6.props.focusNavigationEventHandlerRef
		}, {
			layout = roactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = left,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = uDim
			}),
			padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, p6.props.filterBoxPaddingTop),
				PaddingBottom = UDim.new(0, p6.props.filterBoxPaddingBottom),
				PaddingLeft = UDim.new(0, p6.props.filterBoxPaddingLeft),
				PaddingRight = UDim.new(0, p6.props.filterBoxPaddingRight)
			}),
			cancel = if p6.props.shouldShowCancel then roactModule.createElement(textButton, {
				layoutOrder = 2,
				text = cancelText,
				onActivated = p6.props.cancelCallback
			}) else nil,
			filterBoxContainer = withSelectionCursorProvider(function(p9)
				-- upvalues: roactModule (copy), foundationModule (copy), var13 (write), cursorKind (copy), p6 (copy), imageSetLabel (copy), t (copy), p8 (ref), iconSize (copy), search (copy), callbackInputBox (copy), body (ref), var14 (ref), clearSmall (copy), var10 (copy)
				return roactModule.createElement(foundationModule.View, {
					LayoutOrder = 1,
					Size = var13,
					selection = {
						Selectable = true,
						SelectionImageObject = p9(cursorKind.RoundedRect)
					},
					onActivated = p6.focusInputBox,
					ref = p6.containerRef
				}, {
					filterBoxBackground = roactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Selectable = false,
						Size = UDim2.fromScale(1, 1),
						Image = t.Image,
						ImageColor3 = p8.Theme.UIDefault.Color,
						ImageTransparency = p8.Theme.UIDefault.Transparency,
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
							ImageColor3 = p8.Theme.IconEmphasis.Color,
							ImageTransparency = p8.Theme.IconEmphasis.Transparency
						}),
						filterBoxContainer = roactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Size = UDim2.new(1, -(iconSize.Small + 4), 1, 0)
						}, {
							filterBox = roactModule.createElement(callbackInputBox, {
								clearButtonDisabled = false,
								initialInputText = p6.props.initialInputText,
								inputTextColor3 = p8.Theme.TextEmphasis.Color,
								inputTextFont = body.Font,
								inputTextSize = var14,
								inputTextTransparency = p8.Theme.TextEmphasis.Transparency,
								inputTextXAlignment = Enum.TextXAlignment.Left,
								placeholderText = p6.props.searchPlaceholderText,
								placeholderTextColor3 = p8.Theme.TextDefault.Color,
								placeholderTextTransparency = p8.Theme.TextDefault.Transparency,
								captureFocusOnMount = p6.props.captureFocusOnMount,
								clearIcon = clearSmall,
								clearIconColor3 = p8.Theme.IconEmphasis.Color,
								clearIconTransparency = p8.Theme.IconEmphasis.Transparency,
								clearButtonSize = iconSize.Small,
								textChangedCallback = var10,
								onSelectCallback = p6.props.onSelectCallback,
								inputBoxRef = p6.inputBoxRef,
								clearButtonSelectionImageObject = p9(cursorKind.RoundedRect)
							})
						})
					})
				})
			end)
		})
	end)
end

function FocusableSearchTopBar(p10)
	-- upvalues: reactModule (ref), focusNavigationService (ref), coreGui (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), roactModule (ref), searchTopBar (ref), cryoModule (ref)
	local var15 = reactModule.useRef(nil)
	local var16 = reactModule.useRef(nil)
	local var17 = focusNavigationService.new(coreGui)
	local cancelCallback = p10.cancelCallback
	
	return roactModule.createElement(searchTopBar, cryoModule.Dictionary.join({
		inputBoxRef = var16,
		containerRef = var15,
		focusNavigationEventHandlerRef = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, function(p11)
			-- upvalues: var17 (ref), var15 (ref), cancelCallback (ref)
			if p11.eventData and var17.focusedGuiObject:getValue() == var15.current and p11.eventData.KeyCode ~= Enum.KeyCode.None then
				p11:cancel()
				
				if cancelCallback then
					cancelCallback()
				end
			end
		end, "Bubble", nil),
		focusNavigationService = var17
	}, p10))
end

return FocusableSearchTopBar