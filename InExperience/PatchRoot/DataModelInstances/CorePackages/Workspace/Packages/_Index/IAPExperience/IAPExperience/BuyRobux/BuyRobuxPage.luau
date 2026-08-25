local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local localizationService = game:GetService("LocalizationService")
local guiService = game:GetService("GuiService")
local roactModule = require(parent_2.Roact)
local roactGamepadModule = require(parent_2.RoactGamepad)
local cryoModule = require(parent_2.Cryo)
local UIBloxModule = require(parent_2.UIBlox)
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local images = UIBloxModule.App.ImageSet.Images
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local withStyle = UIBloxModule.Core.Style.withStyle
local useStyleMetadata = UIBloxModule.Core.Style.useStyleMetadata
local colorMode = require(parent_2.Foundation).Enums.ColorMode
local roactFitComponentsModule = require(parent_2.RoactFitComponents)
local fitFrameHorizontal = roactFitComponentsModule.FitFrameHorizontal
local fitTextLabel = roactFitComponentsModule.FitTextLabel
local fullscreenFrame = require(parent_2.AppBlox).FullscreenFrame
local multiTextLocalizerModule = require(parent_1.Locale.MultiTextLocalizer)
local formatNumberModule = require(parent_1.Utility.formatNumber)
local animatorModule = require(parent_1.Generic.Animator)
local getEnableCompensatingScrollingFrameModule = require(parent_1.Flags.getEnableCompensatingScrollingFrame)
local getUserInputEventDataModule = require(parent_1.Utility.getUserInputEventData)
local robuxPackageModule = require(parent.RobuxPackage)
local fFlagEnableLeftNavOnConsole = require(parent_2.SharedFlags).FFlagEnableLeftNavOnConsole
local name = roactModule.Component:extend(script.Name)
local goldrobux = images["icons/common/goldrobux"]
local block = images["icons/logo/block"]
local list = {
	images["icons/graphic/robuxcoin1_xxlarge"],
	images["icons/graphic/robuxcoin2_xxlarge"],
	images["icons/graphic/robuxcoin3_xxlarge"],
	images["icons/graphic/robuxcoin4_xxlarge"],
	images["icons/graphic/robuxcoin5_xxlarge"],
	images["icons/graphic/robuxcoin6_xxlarge"]
}
local close = images["icons/navigation/close"]

function name.init(p0)
	-- upvalues: roactGamepadModule (ref), roactModule (ref), guiService (ref)
	p0.state = { selectedPackage = nil, showMessageBanner = false }
	p0.buttonRefs = roactGamepadModule.createRefCache()
	p0.scrollingFrameRef = roactModule.createRef()
	
	function p0.getGamepadNextSelectionLeft(p1)
		-- upvalues: p0 (ref)
		return if p1 > 1 then p0.buttonRefs[p1 - 1] else nil
	end
	
	function p0.getGamepadNextSelectionRight(p2)
		-- upvalues: p0 (ref)
		return if p2 < #p0.buttonRefs then p0.buttonRefs[p2 + 1] else nil
	end
	
	function p0.initSelectionChangedListener()
		-- upvalues: p0 (ref), guiService (copy)
		if p0.selectionListener ~= nil then
			p0.selectionListener:Disconnect()
			p0.selectionListener = nil
		end
		if p0.selectionListener ~= nil then
			p0.selectionListener:Disconnect()
			p0.selectionListener = nil
		end
		p0.selectionListener = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: p0 (copy), guiService (copy)
			if p0.state.selectedPackage == nil or guiService.SelectedCoreObject == nil or p0.state.selectedPackage ~= guiService.SelectedCoreObject then
				p0:setState({ selectedPackage = guiService.SelectedCoreObject })
			end
		end)
	end
end

function name.didMount(p3)
	p3.initSelectionChangedListener()
end

function name.didUpdate(p4, p5, _)
	local props = p4.props
	
	if p5.hasNativePurchaseSucceeded ~= props.hasNativePurchaseSucceeded and props.hasNativePurchaseSucceeded then
		p4:setState({ showMessageBanner = true })
		task.delay(3, function()
			-- upvalues: p4 (ref)
			p4:setState({ showMessageBanner = false })
		end)
	end
end

function name.willUnmount(p6)
	if p6.selectionListener ~= nil then
		p6.selectionListener:Disconnect()
		p6.selectionListener = nil
	end
end

function name.getScale(p7)
	return if p7.props.isConsoleSize then 1 else 0.65
end

function name.render(p8)
	-- upvalues: roactModule (ref), multiTextLocalizerModule (ref), withSelectionCursorProvider (ref)
	return roactModule.createElement(multiTextLocalizerModule, {
		keys = {
			BannerText = { key = "IAPExperience.BuyRobux.Banner.Text" },
			BannerTitle = { key = "IAPExperience.BuyRobux.Banner.Title" },
			SuccessfulMessage = { key = "IAPExperience.BuyRobux.Alert.SuccessfulMessage" }
		},
		render = function(p9)
			-- upvalues: withSelectionCursorProvider (copy), p8 (ref)
			return withSelectionCursorProvider(function(p10)
				-- upvalues: p8 (copy), p9 (ref)
				return p8:renderWithLocale(p9, p10)
			end)
		end
	})
end

function name.movePackageToAttentionArea(p11, p12)
	-- upvalues: getEnableCompensatingScrollingFrameModule (ref)
	if not getEnableCompensatingScrollingFrameModule() then return end
	local current = p11.scrollingFrameRef.current
	
	if current == nil or p12 == nil then return end
	local x = current.AbsoluteSize.X
	local var15 = 48 * p11:getScale()
	local var16 = p12.AbsolutePosition.X - var15
	
	if var16 < 0 then
		current.CanvasPosition = Vector2.new(var16, 0)
		p11:reportScrollingFrameCompensationHappened()
		
		return
	elseif x < p12.AbsolutePosition.X + p12.AbsoluteSize.X + var15 then
		current.CanvasPosition = Vector2.new(var16, 0)
		p11:reportScrollingFrameCompensationHappened()
		
		return
	end
end

function name.reportScrollingFrameCompensationHappened(p13)
	-- upvalues: getUserInputEventDataModule (ref)
	local props = p13.props
	
	if props.onAnalyticEvent then
		props.onAnalyticEvent("UserPurchaseFlow", getUserInputEventDataModule(props.analyticId, "", "BuyRobux", "ScrollingFrame", "Compensated"))
		
		return
	end
end

function name.renderWithLocale(p14, p15, p16)
	-- upvalues: withStyle (ref), roactModule (ref), robuxPackageModule (ref), list (ref), fFlagEnableLeftNavOnConsole (ref), fullscreenFrame (ref), roactGamepadModule (ref), colorMode (ref), imageSetButton (ref), close (ref), cursorKind (ref), animatorModule (ref), imageSetLabel (ref), block (ref), fitTextLabel (ref), fitFrameHorizontal (ref), goldrobux (ref), formatNumberModule (ref), localizationService (ref)
	local props = p14.props
	
	return withStyle(function(p17)
		-- upvalues: props (ref), p14 (ref), roactModule (copy), robuxPackageModule (copy), list (copy), fFlagEnableLeftNavOnConsole (copy), fullscreenFrame (copy), roactGamepadModule (copy), colorMode (copy), imageSetButton (copy), close (copy), p16 (ref), cursorKind (copy), animatorModule (copy), imageSetLabel (copy), block (copy), fitTextLabel (copy), p15 (ref), fitFrameHorizontal (copy), goldrobux (copy), formatNumberModule (copy), localizationService (copy)
		local theme = p17.Theme
		local font = p17.Font
		local var17 = props.robuxPackages ~= nil
		local var18 = if props.robuxPackages ~= nil then 6 else #props.robuxPackages
		local var19 = 32 * p14:getScale()
		local t = {
			LeadingPadding = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(0, 80 * p14:getScale(), 0, 1)
			}),
			RobuxPackageChildren = roactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 16 * p14:getScale())
			}),
			TrailingPadding = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = var18 + 1,
				Size = UDim2.new(0, 80 * p14:getScale(), 0, 1)
			})
		}
		
		for i = 1, var18 do
			t[i + 1] = roactModule.createElement(robuxPackageModule, {
				layoutOrder = i,
				scale = p14:getScale(),
				selected = p14.state.selectedPackage ~= nil and p14.state.selectedPackage == p14.buttonRefs[i]:getValue(),
				packageId = if var17 then props.robuxPackages[i].packageId else tostring(i),
				robuxAmount = if var17 then props.robuxPackages[i].robuxAmount else nil,
				currencyAmountStr = if var17 then props.robuxPackages[i].currencyAmountStr else nil,
				robuxMoreAmount = if var17 then props.robuxPackages[i].robuxMoreAmount else nil,
				robuxImage = list[i],
				forwardRef = p14.buttonRefs[i],
				nextSelectionLeft = p14.getGamepadNextSelectionLeft(i),
				nextSelectionRight = p14.getGamepadNextSelectionRight(i),
				onActivated = function(p18)
					-- upvalues: props (copy)
					props.robuxPackageActivated(p18)
				end,
				onSelect = function(p19)
					-- upvalues: p14 (copy)
					p14:movePackageToAttentionArea(p19:getValue())
				end,
				onHover = function(p20, p21)
					-- upvalues: p14 (copy)
					if p21 then
						if p14.state.selectedPackage == p20:getValue() then
							return
						else
							p14:setState({ selectedPackage = p20:getValue() })
							
							return
						end
					else
						p14:setState({ selectedPackage = "" })
					end
				end
			})
		end
		return roactModule.createElement(if fFlagEnableLeftNavOnConsole then fullscreenFrame else roactGamepadModule.Focusable.Frame, {
			BackgroundColor3 = theme.BackgroundDefault.Color,
			BackgroundTransparency = if fFlagEnableLeftNavOnConsole then 0 else 0.8,
			Size = if fFlagEnableLeftNavOnConsole then nil else UDim2.new(1, 0, 1, 0)
		}, {
			BuyRobuxPageBackground = roactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				ZIndex = 0,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				Visible = p14.props.showBackground
			}, {
				BackgroundImage = roactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Image = if props.themeName == colorMode.Dark then "rbxasset://textures/AvatarEditorImages/AvatarEditor.png" else "rbxasset://textures/AvatarEditorImages/AvatarEditor_LightTheme.png",
					Size = UDim2.new(1, 0, 1, 0)
				}),
				Backdrop = roactModule.createElement("Frame", {
					BackgroundTransparency = if props.themeName == colorMode.Dark then 0.5 else 0.7,
					BackgroundColor3 = Color3.new(0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0)
				})
			}),
			CloseButton = roactModule.createElement(imageSetButton, {
				Position = UDim2.new(0, 48 * p14:getScale(), 0, 48 * p14:getScale()),
				AnchorPoint = Vector2.new(0, 0),
				Size = UDim2.new(0, 36, 0, 36),
				Image = close,
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 0.7,
				BorderSizePixel = 0,
				SelectionImageObject = p16(cursorKind.RoundedRect),
				Visible = p14.props.showCloseButton,
				[roactModule.Event.Activated] = props.onPageClose
			}, {
				UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 16 * p14:getScale()) })
			}),
			MessageBannerAnimator = roactModule.createElement(animatorModule, {
				animateDown = true,
				ZIndex = 10,
				shouldAnimate = props.shouldAnimate,
				shouldShow = p14.state.showMessageBanner,
				renderChildren = function()
					-- upvalues: roactModule (copy), props (copy), colorMode (copy), p14 (copy), var19 (ref), imageSetLabel (copy), block (copy), theme (ref), fitTextLabel (copy), p15 (copy), font (ref)
					return roactModule.createElement("Frame", {
						BackgroundTransparency = 0,
						AnchorPoint = Vector2.new(0, 0),
						BackgroundColor3 = if props.themeName == colorMode.Dark then Color3.fromRGB(17, 18, 20) else Color3.fromRGB(198, 203, 206),
						Position = UDim2.fromOffset(48 * p14:getScale(), 40 * p14:getScale()),
						Size = UDim2.new(1, -96 * p14:getScale(), 0, var19 * 2)
					}, {
						UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 16 * p14:getScale()) }),
						Icon = roactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							ImageTransparency = 0,
							AnchorPoint = Vector2.new(0, 0.5),
							Image = block,
							ImageColor3 = theme.TextEmphasis.Color,
							Position = UDim2.fromOffset(24 * p14:getScale(), var19),
							Size = UDim2.fromOffset(36 * p14:getScale(), 36 * p14:getScale())
						}),
						AlertMessage = roactModule.createElement(fitTextLabel, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							AnchorPoint = Vector2.new(0, 0.5),
							Position = UDim2.fromOffset(80 * p14:getScale(), var19),
							width = fitTextLabel.Width.FitToText,
							Text = p15.SuccessfulMessage,
							Font = font.Header1.Font,
							TextColor3 = theme.TextEmphasis.Color,
							TextTransparency = theme.TextEmphasis.Transparency,
							TextSize = var19,
							TextXAlignment = Enum.TextXAlignment.Left
						})
					})
				end
			}),
			RobuxBalanceFrame = roactModule.createElement(fitFrameHorizontal, {
				BackgroundTransparency = 1,
				Position = UDim2.new(1, -96 * p14:getScale(), 0, 48 * p14:getScale()),
				AnchorPoint = Vector2.new(1, 0),
				height = UDim.new(0, var19),
				contentPadding = UDim.new(0, 4),
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}, {
				Icon = roactModule.createElement(imageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Size = UDim2.fromOffset(var19 + 15 * p14:getScale(), var19 + 15 * p14:getScale()),
					Image = goldrobux
				}),
				BalanceText = roactModule.createElement(fitTextLabel, {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					width = fitTextLabel.Width.FitToText,
					Text = if props.robuxBalance then formatNumberModule(localizationService.RobloxLocaleId, props.robuxBalance) else "",
					Font = font.Header1.Font,
					TextColor3 = if props.showBackground then Color3.new(255, 255, 255) else theme.TextEmphasis.Color,
					TextTransparency = theme.TextEmphasis.Transparency,
					TextSize = var19
				})
			}),
			BannerFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 96 * p14:getScale(), 0, 146 * p14:getScale()),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				roactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 36 * p14:getScale())
				}),
				BannerTitle = roactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = font.Title.Font,
					Text = p15.BannerTitle,
					TextSize = 46 * p14:getScale(),
					TextColor3 = if props.showBackground then Color3.new(255, 255, 255) else theme.TextEmphasis.Color
				}),
				BannerText = roactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = font.Header1.Font,
					Text = p15.BannerText,
					TextSize = 38 * p14:getScale(),
					TextColor3 = if props.showBackground then Color3.new(255, 255, 255) else theme.TextEmphasis.Color
				})
			}),
			RobuxPackageTilesFrame = roactModule.createElement("ScrollingFrame", {
				Position = UDim2.new(0, 0, 0, 310 * p14:getScale()),
				Size = UDim2.new(1, 0, 0, 615 * p14:getScale()),
				AutomaticSize = Enum.AutomaticSize.None,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				ScrollingEnabled = var17,
				ScrollingDirection = Enum.ScrollingDirection.X,
				ScrollBarImageTransparency = 1,
				ScrollBarThickness = 0,
				Selectable = false,
				BackgroundTransparency = 1,
				[roactModule.Ref] = p14.scrollingFrameRef
			}, t)
		})
	end)
end

return function(p22)
	-- upvalues: useStyleMetadata (ref), roactModule (ref), name (ref), cryoModule (ref)
	return roactModule.createElement(name, cryoModule.Dictionary.join(p22, { themeName = useStyleMetadata().ThemeName }))
end