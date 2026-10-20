local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local UtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Utils)
local TextButton = UIBloxModule.App.Button.TextButton
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local WithStyleFunction = UIBloxModule.Style.withStyle
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Interactable = UIBloxModule.Core.Control.Interactable
local IconsActionsTruncationExpand = UIBloxModule.App.ImageSet.Images["icons/actions/truncationExpand"]
local config = {
	[Enum.KeyCode.ButtonA] = FocusNavigationEventNameEnum.ActivateTitleDropDown
}

local function useTitleDropDownFocusNavigationBindings(p1, UseResult)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult (copy)
		return {
			[FocusNavigationEventNameEnum.ActivateTitleDropDown] = { handler = InputHandlersModule.onRelease(UseResult) }
		}
	end, { UseResult }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

local TitleDropDown = RoactModule.PureComponent:extend("TitleDropDown")
TitleDropDown.validateProps = TModule.strictInterface({
	onActivated = TModule.callback,
	Text = TModule.string,
	NextSelectionRight = TModule.optional(TModule.table),
	forwardRef = TModule.optional(TModule.table),
	inputBindings = TModule.optional(TModule.table)
})

function TitleDropDown.init(p1)
	-- upvalues: RoactModule (copy), ControlState (copy)
	p1:setState({ wrappingFrameAbsoluteSizeX = 0 })
	
	function p1.absoluteSizeChanged(Frame)
		-- upvalues: p1 (copy)
		p1:setState({ wrappingFrameAbsoluteSizeX = Frame.AbsoluteSize.X })
	end
	
	p1.wrappingFrameRef = RoactModule.createRef()
	p1.useBackgroundTransparency, p1.updateUseBackgroundTransparency = RoactModule.createBinding(false)
	
	function p1:onStateChanged(Hover)
		-- upvalues: ControlState (upval), p1 (copy)
		if Hover == ControlState.Pressed or Hover == ControlState.Hover then
			p1.updateUseBackgroundTransparency(true)
			
			return
		else
			p1.updateUseBackgroundTransparency(false)
		end
	end
end

function TitleDropDown.render(p1)
	-- upvalues: WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithSelectionCursorProviderFunction (upval), p1 (copy)
		return WithSelectionCursorProviderFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function TitleDropDown.renderLabel(p1, _, _)
	-- upvalues: RoactModule (copy), TextButton (copy)
	return RoactModule.createElement(TextButton, {
		layoutOrder = 1,
		fontStyle = "Header1",
		size = UDim2.fromScale(0, 1),
		onActivated = p1.props.onActivated,
		text = p1.props.Text
	})
end

function TitleDropDown.renderButton(p1, Theme, p2)
	-- upvalues: UtilsModule (copy), RoactModule (copy), ImageSetLabel (copy), IconsActionsTruncationExpand (copy), Interactable (copy)
	local Text = p1.props.Text
	local TextEmphasis = Theme.TextEmphasis
	local Header1 = p2.Header1
	local ScaledRelativeSize = 28 * Header1.RelativeSize
	local Color = Theme.BackgroundOnHover.Color
	local WrappingFrameAbsoluteSizeX: number = p1.state.wrappingFrameAbsoluteSizeX
	local IsWrappingFrameAbsoluteSizeXAbove = WrappingFrameAbsoluteSizeX > 0
	local LargestPossibleOneLineTextSize, LargestPossibleOneLineTextSize2 = UtilsModule.getLargestPossibleOneLineTextSize(Text, p2.BaseSize * Header1.RelativeSize, Header1, (math.max(WrappingFrameAbsoluteSizeX - ScaledRelativeSize, 0)))
	
	if LargestPossibleOneLineTextSize == nil then
		return nil
	else
		local _UDim2 = UDim2.fromOffset(LargestPossibleOneLineTextSize.X, LargestPossibleOneLineTextSize.Y)
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			[RoactModule.Change.AbsoluteSize] = p1.absoluteSizeChanged,
			[RoactModule.Ref] = p1.wrappingFrameRef
		}, {
			Interactable = RoactModule.createElement(Interactable, {
				onStateChanged = p1.onStateChanged,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				[RoactModule.Event.Activated] = p1.props.onActivated,
				Size = UDim2.fromScale(1, 1)
			}, {
				ButtonContentFrame = RoactModule.createElement("Frame", {
					BackgroundColor3 = Color,
					BackgroundTransparency = p1.useBackgroundTransparency:map(function(p3)
						-- upvalues: Theme (copy)
						return if p3 then Theme.BackgroundOnHover.Transparency else 1
					end),
					AutomaticSize = Enum.AutomaticSize.XY,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				}, if IsWrappingFrameAbsoluteSizeXAbove then {
					{
						Padding = RoactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, 8),
							PaddingRight = UDim.new(0, 8)
						}),
						Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
						UIListLayout = RoactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						TextLabel = RoactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							TextWrapped = 1,
							BackgroundTransparency = 1,
							TextColor3 = TextEmphasis.Color,
							TextTransparency = TextEmphasis.Transparency,
							Font = Header1.Font,
							Text = Text,
							TextXAlignment = Enum.TextXAlignment.Center,
							TextYAlignment = Enum.TextYAlignment.Center,
							Size = _UDim2,
							TextSize = LargestPossibleOneLineTextSize2
						}),
						Icon = RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							LayoutOrder = 2,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Image = IconsActionsTruncationExpand,
							ImageColor3 = TextEmphasis.Color,
							Position = UDim2.fromScale(0.5, 0.5),
							Size = UDim2.fromOffset(ScaledRelativeSize, ScaledRelativeSize)
						})
					}
				} else {})
			})
		})
	end
end

function TitleDropDown.didUpdate(p1)
	if p1.wrappingFrameRef.current then
		local _ = p1.wrappingFrameRef.current.AbsoluteSize
	end
end

function TitleDropDown.renderWithProviders(p1, p2, Callback)
	-- upvalues: RoactModule (copy), CursorKind (copy)
	return RoactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		SelectionImageObject = Callback(CursorKind.RoundedRectNoInset),
		NextSelectionRight = p1.props.NextSelectionRight,
		[RoactModule.Ref] = p1.props.forwardRef
	}, {
		Padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 2),
			PaddingRight = UDim.new(0, 8)
		}),
		Button = p1:renderButton(p2.Theme, p2.Font)
	})
end

return RoactModule.forwardRef(function(p1, p2)
	-- upvalues: ReactModule (copy), useTitleDropDownFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), RoactModule (copy), TitleDropDown (copy), CryoModule (copy)
	return RoactModule.createElement(TitleDropDown, CryoModule.Dictionary.join(p1, {
		forwardRef = UseTableWrappedCallbackRefFunction((useTitleDropDownFocusNavigationBindings(p2, (ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			p1.onActivated()
		end, { p1.onActivated })))))
	}))
end)