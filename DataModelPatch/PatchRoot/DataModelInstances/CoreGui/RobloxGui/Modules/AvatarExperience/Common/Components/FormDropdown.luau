local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local FillBehavior = FoundationModule.Enums.FillBehavior
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), StateLayerAffordance (copy), FillBehavior (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({ apply = "CommonUI.Messages.Action.Apply" })
	local _UDim2: UDim2 = if p1.dropdownPosition then UDim2.fromOffset(p1.dropdownPosition.X, p1.dropdownPosition.Y) else UDim2.fromScale(0.5, 0.5)
	local _Vector2: Vector2 = if p1.dropdownPosition then Vector2.new() else Vector2.new(0.5, 0.5)
	local UseResult = ReactModule.useCallback(function(p2): UDim2
		-- upvalues: p1 (copy), UseTokensResult (copy)
		return UDim2.fromOffset(p2.contentSize.X, (math.min(p2.contentSize.Y, (math.max(p2.scrimSize.Y - (if p1.dropdownPosition then p1.dropdownPosition.Y else 0) - p2.headerHeight - p2.bottomBarHeight - UseTokensResult.Gap.Medium, 0)))))
	end, { p1.dropdownPosition })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new())
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(Vector2.new())
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(0)
	local UseBindingResult4, UseBindingResult2_3 = ReactModule.useBinding(0)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full",
		backgroundStyle = UseTokensResult.Color.Common.Scrim,
		stateLayer = { affordance = StateLayerAffordance.None },
		onActivated = p1.onClose,
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(Frame.AbsoluteSize)
		end
	}, {
		Dropdown = ReactModule.createElement(FoundationModule.View, {
			tag = "bg-surface-100 radius-medium auto-xy col",
			selectionGroup = true,
			Position = _UDim2,
			AnchorPoint = _Vector2,
			onActivated = function() end,
			stateLayer = { affordance = StateLayerAffordance.None },
			selection = { Selectable = false },
			ref = Ref
		}, {
			HeaderContainer = ReactModule.createElement(FoundationModule.View, {
				tag = "auto-y size-full-0 padding-xlarge",
				LayoutOrder = 1,
				onAbsoluteSizeChanged = function(Frame)
					-- upvalues: UseBindingResult2_2 (copy)
					UseBindingResult2_2(Frame.AbsoluteSize.Y)
				end
			}, {
				Header = p1.headerText and ReactModule.createElement(FoundationModule.Text, { tag = "auto-xy text-title-large", Text = p1.headerText }),
				CloseButton = p1.onClose and ReactModule.createElement(FoundationModule.IconButton, {
					icon = "icons/navigation/close",
					LayoutOrder = 2,
					size = FoundationModule.Enums.IconSize.Small,
					onActivated = p1.onClose,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.fromScale(1, 0.5)
				})
			}),
			ScrollView = ReactModule.createElement(FoundationModule.ScrollView, {
				LayoutOrder = 2,
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.fromScale(1, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					scrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility.None
				},
				Size = ReactModule.joinBindings({
					scrimSize = UseBindingResult,
					contentSize = UseBindingResult1,
					bottomBarHeight = UseBindingResult4,
					headerHeight = UseBindingResult3
				}):map(UseResult),
				selection = { Selectable = false }
			}, {
				ChildrenContainer = ReactModule.createElement(FoundationModule.View, {
					tag = "auto-xy padding-x-xlarge",
					onAbsoluteSizeChanged = function(Frame: Frame)
						-- upvalues: UseBindingResult2_1 (copy)
						UseBindingResult2_1(Vector2.new(math.max(300, Frame.AbsoluteSize.X), Frame.AbsoluteSize.Y))
					end
				}, p1.children)
			}),
			ButtonContainer = p1.onApply and ReactModule.createElement(FoundationModule.View, {
				tag = "auto-y padding-xlarge",
				LayoutOrder = 3,
				onAbsoluteSizeChanged = function(Frame)
					-- upvalues: UseBindingResult2_3 (copy)
					UseBindingResult2_3(Frame.AbsoluteSize.Y)
				end,
				Size = UseBindingResult1:map(function(p2): UDim2
					return UDim2.fromOffset(p2.X, 0)
				end)
			}, {
				ApplyButton = ReactModule.createElement(FoundationModule.Button, {
					text = UseLocalizationResult.apply,
					fillBehavior = FillBehavior.Fill,
					variant = ButtonVariant.Emphasis,
					isDisabled = not p1.canApply,
					onActivated = p1.onApply
				})
			})
		})
	})
end)