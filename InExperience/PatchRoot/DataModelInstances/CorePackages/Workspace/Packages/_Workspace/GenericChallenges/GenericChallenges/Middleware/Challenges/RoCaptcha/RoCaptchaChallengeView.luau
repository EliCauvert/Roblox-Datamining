local Parent = script:FindFirstAncestor("GenericChallenges").Parent
local RunService = game:GetService("RunService")
local LocalizationService = game:GetService("LocalizationService")
local TextService = game:GetService("TextService")
local ReactModule = require(Parent.React)
local InExperienceLocalesModule = require(Parent.InExperienceLocales)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceRegistry = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
game:DefineFastInt("RoCaptchaLoadingStatePaintFrames", 5)

local function DialogContent(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), InExperienceLocalesModule (copy), LocalizationService (copy), RunService (copy), NormalizeFontFaceFunction (copy), TextService (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: InExperienceLocalesModule (upval), LocalizationService (upval)
		return InExperienceLocalesModule.Localization.new(LocalizationService.RobloxLocaleId)
	end, {})
	local FeatureRoCaptchaChallengeTitleChallenge = UseMemoResult:Format("Feature.RoCaptchaChallenge.Title.Challenge")
	local FeatureRoCaptchaChallengeContentJoinChallenge = UseMemoResult:Format("Feature.RoCaptchaChallenge.Content.JoinChallenge")
	local FeatureRoCaptchaChallengeActionPlay = UseMemoResult:Format("Feature.RoCaptchaChallenge.Action.Play")
	local FeatureRoCaptchaChallengeActionCancel = UseMemoResult:Format("Feature.RoCaptchaChallenge.Action.Cancel")
	local RoCaptchaLoadingStatePaintFramesFastInt = game:GetFastInt("RoCaptchaLoadingStatePaintFrames")
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), RoCaptchaLoadingStatePaintFramesFastInt (copy), RunService (upval)
		return p1.waitForFrame or function()
			-- upvalues: RoCaptchaLoadingStatePaintFramesFastInt (upval), RunService (upval)
			for _ = 1, RoCaptchaLoadingStatePaintFramesFastInt do
				RunService.Heartbeat:Wait()
			end
		end
	end, { p1.waitForFrame, RoCaptchaLoadingStatePaintFramesFastInt })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(p1.onJoin)
	UseRefResult.current = p1.onJoin
	local UseRefResult1 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult1 (copy), RoCaptchaLoadingStatePaintFramesFastInt (copy), UseRefResult (copy), UseMemoResult1 (copy)
		if not UseStateResult or UseRefResult1.current then return end
		if RoCaptchaLoadingStatePaintFramesFastInt == 0 then
			UseRefResult1.current = true
			UseRefResult.current()
			
			return
		end
		local Flag = false
		task.spawn(function()
			-- upvalues: UseMemoResult1 (upval), Flag (ref), UseRefResult1 (upval), UseRefResult (upval)
			UseMemoResult1()
			
			if not Flag and not UseRefResult1.current then
				UseRefResult1.current = true
				UseRefResult.current()
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {
		UseStateResult,
		UseMemoResult1,
		RoCaptchaLoadingStatePaintFramesFastInt
	})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.zero)
	local XLarge = UseTokensResult.Padding.XLarge
	local Smallest = math.min((if UseStateResult1.X > 1 then UseStateResult1.X else 390) - (XLarge + UseTokensResult.Padding.Medium) * 2, 480)
	local HeadingMedium = UseTokensResult.Typography.HeadingMedium
	local BodyMedium = UseTokensResult.Typography.BodyMedium
	local LabelMedium = UseTokensResult.Typography.LabelMedium
	local UseMemoResult11 = ReactModule.useMemo(function()
		-- upvalues: NormalizeFontFaceFunction (upval), HeadingMedium (copy)
		return NormalizeFontFaceFunction(HeadingMedium.Font)
	end, { HeadingMedium.Font })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: NormalizeFontFaceFunction (upval), BodyMedium (copy)
		return NormalizeFontFaceFunction(BodyMedium.Font)
	end, { BodyMedium.Font })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: NormalizeFontFaceFunction (upval), LabelMedium (copy)
		return NormalizeFontFaceFunction(LabelMedium.Font)
	end, { LabelMedium.Font })
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_2 (copy), UseMemoResult11 (copy), HeadingMedium (copy), FeatureRoCaptchaChallengeTitleChallenge (copy), UseMemoResult2 (copy), BodyMedium (copy), FeatureRoCaptchaChallengeContentJoinChallenge (copy), UseMemoResult3 (copy), LabelMedium (copy), FeatureRoCaptchaChallengeActionPlay (copy), TextService (upval)
		local Flag = false
		
		local function markReady()
			-- upvalues: Flag (ref), UseStateResult2_2 (upval)
			if not Flag then
				UseStateResult2_2(true)
			end
		end
		
		local list = {
			{
				font = UseMemoResult11,
				size = HeadingMedium.FontSize,
				text = FeatureRoCaptchaChallengeTitleChallenge
			},
			{
				font = UseMemoResult2,
				size = BodyMedium.FontSize,
				text = FeatureRoCaptchaChallengeContentJoinChallenge
			},
			{
				font = UseMemoResult3,
				size = LabelMedium.FontSize,
				text = FeatureRoCaptchaChallengeActionPlay
			}
		}
		task.spawn(function()
			-- upvalues: list (copy), TextService (upval), Flag (ref), UseStateResult2_2 (upval)
			pcall(function()
				-- upvalues: list (upval), TextService (upval)
				for _, value in list do
					if typeof(value.font) == "Font" then
						local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
						GetTextBoundsParams.Text = value.text
						GetTextBoundsParams.Font = value.font
						GetTextBoundsParams.Size = value.size
						GetTextBoundsParams.Width = 480
						TextService:GetTextBoundsAsync(GetTextBoundsParams)
					end
				end
			end)
			
			if not Flag then
				UseStateResult2_2(true)
			end
		end)
		task.delay(1.5, markReady)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {
		UseMemoResult11, UseMemoResult2, UseMemoResult3,
		FeatureRoCaptchaChallengeTitleChallenge,
		FeatureRoCaptchaChallengeContentJoinChallenge,
		FeatureRoCaptchaChallengeActionPlay, HeadingMedium.FontSize,
		BodyMedium.FontSize, LabelMedium.FontSize
	})
	local Surface100 = UseTokensResult.Color.Surface.Surface_100
	local ActionEmphasis = UseTokensResult.Color.ActionEmphasis
	local ActionStandard = UseTokensResult.Color.ActionStandard
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Backdrop = ReactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = UseTokensResult.Color.Common.Backdrop.Color3,
			BackgroundTransparency = UseTokensResult.Color.Common.Backdrop.Transparency,
			BorderSizePixel = 0,
			ZIndex = 1,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UseStateResult2_1 (copy)
				UseStateResult2_1(Frame.AbsoluteSize)
			end
		}),
		Card = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.new(0, Smallest, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundColor3 = Surface100.Color3,
			BackgroundTransparency = if UseStateResult3 then Surface100.Transparency else 1
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, UseTokensResult.Radius.Large) }),
			Stroke = ReactModule.createElement("UIStroke", {
				Thickness = 1,
				Color = UseTokensResult.Color.Stroke.Default.Color3,
				Transparency = if UseStateResult3 then UseTokensResult.Color.Stroke.Default.Transparency else 1
			}),
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, XLarge),
				PaddingBottom = UDim.new(0, XLarge),
				PaddingLeft = UDim.new(0, XLarge),
				PaddingRight = UDim.new(0, XLarge)
			}),
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, UseTokensResult.Padding.Large),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Title = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = FeatureRoCaptchaChallengeTitleChallenge,
				TextColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
				TextTransparency = if UseStateResult3 then 0 else 1,
				TextSize = HeadingMedium.FontSize,
				FontFace = UseMemoResult11,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Body = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = FeatureRoCaptchaChallengeContentJoinChallenge,
				TextColor3 = UseTokensResult.Color.Content.Default.Color3,
				TextTransparency = if UseStateResult3 then 0 else 1,
				TextSize = BodyMedium.FontSize,
				FontFace = UseMemoResult2,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Footer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1000)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 8),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				CancelButton = ReactModule.createElement("TextButton", {
					Size = UDim2.new(0.5, -4, 1, 0),
					BackgroundColor3 = ActionStandard.Background.Color3,
					BackgroundTransparency = if UseStateResult3 then ActionStandard.Background.Transparency else 1,
					AutoButtonColor = true,
					Text = FeatureRoCaptchaChallengeActionCancel,
					TextColor3 = ActionStandard.Foreground.Color3,
					TextTransparency = if UseStateResult3 then 0 else 1,
					TextSize = LabelMedium.FontSize,
					FontFace = UseMemoResult3,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					[ReactModule.Event.Activated] = p1.onAbandon
				}, {
					Corner = ReactModule.createElement("UICorner", {
						CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
					})
				}),
				JoinButton = ReactModule.createElement("TextButton", {
					Size = UDim2.new(0.5, -4, 1, 0),
					BackgroundColor3 = ActionEmphasis.Background.Color3,
					BackgroundTransparency = if UseStateResult3 then if UseStateResult then 0.5 else ActionEmphasis.Background.Transparency else 1,
					AutoButtonColor = not UseStateResult,
					Active = not UseStateResult,
					Text = FeatureRoCaptchaChallengeActionPlay,
					TextColor3 = ActionEmphasis.Foreground.Color3,
					TextTransparency = if UseStateResult3 then if UseStateResult then 0.5 else 0 else 1,
					TextSize = LabelMedium.FontSize,
					FontFace = UseMemoResult3,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					[ReactModule.Event.Activated] = function()
						-- upvalues: UseStateResult (copy), UseResult (copy)
						if not UseStateResult then
							UseResult()
						end
					end
				}, {
					Corner = ReactModule.createElement("UICorner", {
						CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
					})
				})
			})
		})
	})
end

return function(p2)
	-- upvalues: ReactModule (copy), ReactFocusNavigationModule (copy), FoundationProvider (copy), ColorMode (copy), FocusNavigableSurfaceRegistry (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), DialogContent (copy)
	return ReactModule.createElement("ScreenGui", {
		DisplayOrder = 200,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		FoundationRoot = ReactModule.createElement(FoundationProvider, { colorMode = ColorMode.Dark }, {
			FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, {
				value = ReactModule.useMemo(function()
					-- upvalues: ReactFocusNavigationModule (upval)
					return ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
				end, {})
			}, {
				FocusNavigationRegistryProvider = ReactModule.createElement(FocusNavigableSurfaceRegistry.Provider, nil, {
					FocusNavigableSurface = ReactModule.createElement(FocusRoot, {
						isIsolated = true,
						isAutoFocusRoot = true,
						surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ModerationOverlay
					}, {
						Content = ReactModule.createElement(DialogContent, {
							onJoin = p2.onJoin,
							onAbandon = p2.onAbandon,
							waitForFrame = p2.waitForFrame
						})
					})
				})
			})
		})
	})
end