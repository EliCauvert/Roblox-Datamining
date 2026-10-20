local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local FullscreenPageWithSafeAreaModule = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
local LandingPageVideoModule = require(Modules.LuaApp.Components.Authentication.LandingPageVideo)
local ReactModule = require(CorePackages.Packages.React)
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor

return function(p1)
	-- upvalues: ReactModule (copy), GetSafeAreaSizeFunction (copy), UseLocalizationFunction (copy), UseDesignTokensFunction (copy), FormFactor (copy), LandingPageVideoModule (copy), FullscreenPageWithSafeAreaModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	
	local function v10(Frame: Frame)
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
		if UseStateResult ~= Frame.AbsoluteSize.Y then
			UseStateResult2(Frame.AbsoluteSize.Y)
		end
	end
	
	local function v11(Frame: Frame)
		-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy)
		if UseStateResult1 ~= Frame.AbsoluteSize.Y then
			UseStateResult2_1(Frame.AbsoluteSize.Y)
		end
	end
	
	local Frame = {
		LogoPositionYScale = 0.08,
		BodyPositionYScale = 0.3,
		Position = UDim2.new(0.5, 0, 1, 0),
		AnchorPoint = Vector2.new(0.5, 1)
	}
	local OffsetDelta = GetSafeAreaSizeFunction(p1.screenSize, p1.globalGuiInset).Y.Offset - p1.statusBarHeight
	local YOffset = OffsetDelta * 0.3
	local ScaledOffsetDelta = OffsetDelta * Frame.LogoPositionYScale
	local UseLocalizationResult = UseLocalizationFunction({ sloganText = "Feature.Landing.Heading.LandingSlogan" })
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement(FullscreenPageWithSafeAreaModule, {
		includeStatusBar = true,
		renderFullscreenBackground = function(_)
			-- upvalues: ReactModule (upval), LandingPageVideoModule (upval), p1 (copy), UseStateResult (copy), UseStateResult1 (copy)
			return ReactModule.createElement(LandingPageVideoModule, {
				screenSize = p1.screenSize,
				landingVideoAsset = p1.landingVideoAsset,
				videoBottomOffsetGradientHeight = 3 * UseStateResult,
				videoBottomOffsetHeight = UseStateResult1 + p1.globalGuiInset.bottom + 16
			})
		end,
		buttonRef = p1.containerRef
	}, {
		Contents = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			{
				Logo = ReactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_1x.png",
					ZIndex = 1,
					Position = UDim2.new(0.5, 0, 0, ScaledOffsetDelta),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.new(0.7, 0, 0.7, 0)
				}, {
					UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(150, 25.951557093425606) }),
					UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", {
						AspectRatio = 5.78,
						AspectType = Enum.AspectType.FitWithinMaxSize
					})
				}),
				ContentContainer = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Position = UDim2.new(0.5, 0, 0, YOffset),
					Size = UDim2.new(1, 0, 1, -YOffset),
					AnchorPoint = Vector2.new(0.5, 0)
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						Padding = UDim.new(0, 16),
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Bottom
					}),
					Text = ReactModule.createElement("TextLabel", {
						Size = UDim2.new(1, -40, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Text = UseLocalizationResult.sloganText,
						TextColor3 = UseDesignTokensResult.Color.Content.Emphasis.Color3,
						TextSize = UseDesignTokensResult.Typography.HeadingLarge.FontSize,
						Font = UseDesignTokensResult.Typography.HeadingLarge.Font,
						TextXAlignment = if p1.formFactor == FormFactor.COMPACT then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
						TextYAlignment = Enum.TextYAlignment.Bottom,
						TextWrapped = true,
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						[ReactModule.Change.AbsoluteSize] = v10
					}, {
						UISizeConstraint = if p1.formFactor == FormFactor.COMPACT then ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(360, 1e999) }) else nil
					}),
					Content = ReactModule.createElement("Frame", {
						Position = Frame.Position,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						AnchorPoint = Frame.AnchorPoint,
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						[ReactModule.Change.AbsoluteSize] = v11
					}, { p1.children })
				})
			}
		})
	})
end