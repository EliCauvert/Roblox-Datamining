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

function name.init(p1)
	-- upvalues: roactGamepadModule (ref), roactModule (ref), guiService (ref)
	p1.state = { selectedPackage = nil, showMessageBanner = false }
	p1.buttonRefs = roactGamepadModule.createRefCache()
	p1.scrollingFrameRef = roactModule.createRef()
	
	function p0.getGamepadNextSelectionLeft(p2)
		-- upvalues: p1 (ref)
		return if p2 > 1 then p1.buttonRefs[p2 - 1] else nil
	end
	
	function p0.getGamepadNextSelectionRight(p2)
		-- upvalues: p1 (ref)
		return if p2 < #p1.buttonRefs then p1.buttonRefs[p2 + 1] else nil
	end
	
	function p0.initSelectionChangedListener()
		-- upvalues: p1 (ref), guiService (copy)
		if p1.selectionListener ~= nil then
			p1.selectionListener:Disconnect()
			p1.selectionListener = nil
		end
		if p1.selectionListener ~= nil then
			p1.selectionListener:Disconnect()
			p1.selectionListener = nil
		end
		p1.selectionListener = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: p1 (copy), guiService (copy)
			if p1.state.selectedPackage == nil or guiService.SelectedCoreObject == nil or p1.state.selectedPackage ~= guiService.SelectedCoreObject then
				p1:setState({ selectedPackage = guiService.SelectedCoreObject })
			end
		end)
	end
end

function name.didMount(p1)
	p1.initSelectionChangedListener()
end

function name.didUpdate(p1, p2, _)
	local props = p1.props
	
	if p2.hasNativePurchaseSucceeded ~= props.hasNativePurchaseSucceeded and props.hasNativePurchaseSucceeded then
		p1:setState({ showMessageBanner = true })
		task.delay(3, function()
			-- upvalues: p1 (ref)
			p1:setState({ showMessageBanner = false })
		end)
	end
end

function name.willUnmount(p1)
	if p1.selectionListener ~= nil then
		p1.selectionListener:Disconnect()
		p1.selectionListener = nil
	end
end

function name.getScale(p1)
	return if p1.props.isConsoleSize then 1 else 0.65
end

function name.render(p1)
	-- upvalues: roactModule (ref), multiTextLocalizerModule (ref), withSelectionCursorProvider (ref)
	return roactModule.createElement(multiTextLocalizerModule, {
		keys = {
			BannerText = { key = "IAPExperience.BuyRobux.Banner.Text" },
			BannerTitle = { key = "IAPExperience.BuyRobux.Banner.Title" },
			SuccessfulMessage = { key = "IAPExperience.BuyRobux.Alert.SuccessfulMessage" }
		},
		render = function(p2)
			-- upvalues: withSelectionCursorProvider (copy), p1 (ref)
			return withSelectionCursorProvider(function(p3)
				-- upvalues: p1 (copy), p2 (ref)
				return p1:renderWithLocale(p2, p3)
			end)
		end
	})
end

function name.movePackageToAttentionArea(p1, p2)
	-- upvalues: getEnableCompensatingScrollingFrameModule (ref)
	if not getEnableCompensatingScrollingFrameModule() then return end
	local current = p1.scrollingFrameRef.current
	
	if current == nil or p2 == nil then return end
	local x = current.AbsoluteSize.X
	local var1 = 48 * p1:getScale()
	local var2 = p2.AbsolutePosition.X - var1
	
	if var2 < 0 then
		current.CanvasPosition = Vector2.new(var2, 0)
		p1:reportScrollingFrameCompensationHappened()
		
		return
	elseif x < p2.AbsolutePosition.X + p2.AbsoluteSize.X + var1 then
		current.CanvasPosition = Vector2.new(var2, 0)
		p1:reportScrollingFrameCompensationHappened()
		
		return
	end
end

function name.reportScrollingFrameCompensationHappened(p1)
	-- upvalues: getUserInputEventDataModule (ref)
	local props = p1.props
	
	if props.onAnalyticEvent then
		props.onAnalyticEvent("UserPurchaseFlow", getUserInputEventDataModule(props.analyticId, "", "BuyRobux", "ScrollingFrame", "Compensated"))
		
		return
	end
end

function name.renderWithLocale(p1, p2, p3)
	-- upvalues: withStyle (ref), roactModule (ref), robuxPackageModule (ref), list (ref), fFlagEnableLeftNavOnConsole (ref), fullscreenFrame (ref), roactGamepadModule (ref), colorMode (ref), imageSetButton (ref), close (ref), cursorKind (ref), animatorModule (ref), imageSetLabel (ref), block (ref), fitTextLabel (ref), fitFrameHorizontal (ref), goldrobux (ref), formatNumberModule (ref), localizationService (ref)
	local props = p1.props
	
	return withStyle(function(p4)
		-- upvalues: props (ref), p1 (ref), roactModule (copy), robuxPackageModule (copy), list (copy), fFlagEnableLeftNavOnConsole (copy), fullscreenFrame (copy), roactGamepadModule (copy), colorMode (copy), imageSetButton (copy), close (copy), p3 (ref), cursorKind (copy), animatorModule (copy), imageSetLabel (copy), block (copy), fitTextLabel (copy), p2 (ref), fitFrameHorizontal (copy), goldrobux (copy), formatNumberModule (copy), localizationService (copy)
		local theme = p4.Theme
		local font = p4.Font
		local var1 = props.robuxPackages ~= nil
		local var2 = if props.robuxPackages ~= nil then 6 else #props.robuxPackages
		local var3 = 32 * p1:getScale()
		local t = {
			LeadingPadding = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(0, 80 * p1:getScale(), 0, 1)
			}),
			RobuxPackageChildren = roactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 16 * p1:getScale())
			}),
			TrailingPadding = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = var2 + 1,
				Size = UDim2.new(0, 80 * p1:getScale(), 0, 1)
			})
		}
		
		for i = 1, var2 do
			t[i + 1] = roactModule.createElement(robuxPackageModule, {
				layoutOrder = i,
				scale = p1:getScale(),
				selected = p1.state.selectedPackage ~= nil and p1.state.selectedPackage == p1.buttonRefs[i]:getValue(),
				packageId = if var1 then props.robuxPackages[i].packageId else tostring(i),
				robuxAmount = if var1 then props.robuxPackages[i].robuxAmount else nil,
				currencyAmountStr = if var1 then props.robuxPackages[i].currencyAmountStr else nil,
				robuxMoreAmount = if var1 then props.robuxPackages[i].robuxMoreAmount else nil,
				robuxImage = list[i],
				forwardRef = p1.buttonRefs[i],
				nextSelectionLeft = p1.getGamepadNextSelectionLeft(i),
				nextSelectionRight = p1.getGamepadNextSelectionRight(i),
				onActivated = function(p5)
					-- upvalues: props (copy)
					props.robuxPackageActivated(p5)
				end,
				onSelect = function(p5)
					-- upvalues: p1 (copy)
					p1:movePackageToAttentionArea(p5:getValue())
				end,
				onHover = function(p5, p6)
					-- upvalues: p1 (copy)
					if p6 then
						if p1.state.selectedPackage == p5:getValue() then
							return
						else
							p1:setState({ selectedPackage = p5:getValue() })
							
							return
						end
					else
						p1:setState({ selectedPackage = "" })
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
				Visible = p1.props.showBackground
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
				Position = UDim2.new(0, 48 * p1:getScale(), 0, 48 * p1:getScale()),
				AnchorPoint = Vector2.new(0, 0),
				Size = UDim2.new(0, 36, 0, 36),
				Image = close,
				BackgroundColor3 = Color3.new(0, 0, 0),
				BackgroundTransparency = 0.7,
				BorderSizePixel = 0,
				SelectionImageObject = p3(cursorKind.RoundedRect),
				Visible = p1.props.showCloseButton,
				[roactModule.Event.Activated] = props.onPageClose
			}, {
				UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 16 * p1:getScale()) })
			}),
			MessageBannerAnimator = roactModule.createElement(animatorModule, {
				animateDown = true,
				ZIndex = 10,
				shouldAnimate = props.shouldAnimate,
				shouldShow = p1.state.showMessageBanner,
				renderChildren = function()
					-- upvalues: roactModule (copy), props (copy), colorMode (copy), p1 (copy), var3 (ref), imageSetLabel (copy), block (copy), theme (ref), fitTextLabel (copy), p2 (copy), font (ref)
					return roactModule.createElement("Frame", {
						BackgroundTransparency = 0,
						AnchorPoint = Vector2.new(0, 0),
						BackgroundColor3 = if props.themeName == colorMode.Dark then Color3.fromRGB(17, 18, 20) else Color3.fromRGB(198, 203, 206),
						Position = UDim2.fromOffset(48 * p1:getScale(), 40 * p1:getScale()),
						Size = UDim2.new(1, -96 * p1:getScale(), 0, var3 * 2)
					}, {
						UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 16 * p1:getScale()) }),
						Icon = roactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							ImageTransparency = 0,
							AnchorPoint = Vector2.new(0, 0.5),
							Image = block,
							ImageColor3 = theme.TextEmphasis.Color,
							Position = UDim2.fromOffset(24 * p1:getScale(), var3),
							Size = UDim2.fromOffset(36 * p1:getScale(), 36 * p1:getScale())
						}),
						AlertMessage = roactModule.createElement(fitTextLabel, {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							AnchorPoint = Vector2.new(0, 0.5),
							Position = UDim2.fromOffset(80 * p1:getScale(), var3),
							width = fitTextLabel.Width.FitToText,
							Text = p2.SuccessfulMessage,
							Font = font.Header1.Font,
							TextColor3 = theme.TextEmphasis.Color,
							TextTransparency = theme.TextEmphasis.Transparency,
							TextSize = var3,
							TextXAlignment = Enum.TextXAlignment.Left
						})
					})
				end
			}),
			RobuxBalanceFrame = roactModule.createElement(fitFrameHorizontal, {
				BackgroundTransparency = 1,
				Position = UDim2.new(1, -96 * p1:getScale(), 0, 48 * p1:getScale()),
				AnchorPoint = Vector2.new(1, 0),
				height = UDim.new(0, var3),
				contentPadding = UDim.new(0, 4),
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}, {
				Icon = roactModule.createElement(imageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					ImageTransparency = 0,
					Size = UDim2.fromOffset(var3 + 15 * p1:getScale(), var3 + 15 * p1:getScale()),
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
					TextSize = var3
				})
			}),
			BannerFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 96 * p1:getScale(), 0, 146 * p1:getScale()),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				roactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 36 * p1:getScale())
				}),
				BannerTitle = roactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = font.Title.Font,
					Text = p2.BannerTitle,
					TextSize = 46 * p1:getScale(),
					TextColor3 = if props.showBackground then Color3.new(255, 255, 255) else theme.TextEmphasis.Color
				}),
				BannerText = roactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					Font = font.Header1.Font,
					Text = p2.BannerText,
					TextSize = 38 * p1:getScale(),
					TextColor3 = if props.showBackground then Color3.new(255, 255, 255) else theme.TextEmphasis.Color
				})
			}),
			RobuxPackageTilesFrame = roactModule.createElement("ScrollingFrame", {
				Position = UDim2.new(0, 0, 0, 310 * p1:getScale()),
				Size = UDim2.new(1, 0, 0, 615 * p1:getScale()),
				AutomaticSize = Enum.AutomaticSize.None,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				ScrollingEnabled = var1,
				ScrollingDirection = Enum.ScrollingDirection.X,
				ScrollBarImageTransparency = 1,
				ScrollBarThickness = 0,
				Selectable = false,
				BackgroundTransparency = 1,
				[roactModule.Ref] = p1.scrollingFrameRef
			}, t)
		})
	end)
end

return function(p4)
	-- upvalues: useStyleMetadata (ref), roactModule (ref), name (ref), cryoModule (ref)
	return roactModule.createElement(name, cryoModule.Dictionary.join(p4, { themeName = useStyleMetadata().ThemeName }))
end