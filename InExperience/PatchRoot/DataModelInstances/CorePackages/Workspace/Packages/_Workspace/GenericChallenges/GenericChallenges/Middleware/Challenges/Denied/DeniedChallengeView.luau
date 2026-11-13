local Parent = script:FindFirstAncestor("GenericChallenges").Parent
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
local DeniedPrompt = require(script.Parent.DeniedMetadata).DeniedPrompt
local config = {
	[DeniedPrompt.WasmGameJoinRedirect] = {
		title = "Feature.Denied.Denied.Wasm.GameJoin.Header",
		body = "Feature.Denied.Denied.Wasm.GameJoin.Body"
	},
	[DeniedPrompt.WasmInExpDeny] = {
		title = "Feature.Denied.Denied.Wasm.InExperienceFeature.Header",
		body = "Feature.Denied.Denied.Wasm.InExperienceFeature.Body"
	}
}

local function getCopy(Prompt, UseMemoResult)
	-- upvalues: config (copy)
	local Entry = if Prompt then config[Prompt] else nil
	
	return if Entry then {
		title = UseMemoResult:Format(Entry.title),
		body = UseMemoResult:Format(Entry.body)
	} else {
		title = UseMemoResult:Format("Feature.Denied.Denied.Header"),
		body = UseMemoResult:Format("Feature.Denied.Denied.Body")
	}
end

local function DialogContent(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), InExperienceLocalesModule (copy), LocalizationService (copy), getCopy (copy), NormalizeFontFaceFunction (copy), TextService (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: InExperienceLocalesModule (upval), LocalizationService (upval)
		return InExperienceLocalesModule.Localization.new(LocalizationService.RobloxLocaleId)
	end, {})
	local Copy = getCopy(p1.prompt, UseMemoResult)
	local Title = Copy.title
	local Body = Copy.body
	local FeatureDeniedDeniedAction = UseMemoResult:Format("Feature.Denied.Denied.Action")
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local XLarge = UseTokensResult.Padding.XLarge
	local Smallest = math.min((if UseStateResult.X > 1 then UseStateResult.X else 390) - (XLarge + UseTokensResult.Padding.Medium) * 2, 480)
	local HeadingMedium = UseTokensResult.Typography.HeadingMedium
	local BodyMedium = UseTokensResult.Typography.BodyMedium
	local LabelMedium = UseTokensResult.Typography.LabelMedium
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: NormalizeFontFaceFunction (upval), HeadingMedium (copy)
		return NormalizeFontFaceFunction(HeadingMedium.Font)
	end, { HeadingMedium.Font })
	local UseMemoResult11 = ReactModule.useMemo(function()
		-- upvalues: NormalizeFontFaceFunction (upval), BodyMedium (copy)
		return NormalizeFontFaceFunction(BodyMedium.Font)
	end, { BodyMedium.Font })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: NormalizeFontFaceFunction (upval), LabelMedium (copy)
		return NormalizeFontFaceFunction(LabelMedium.Font)
	end, { LabelMedium.Font })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy), UseMemoResult1 (copy), HeadingMedium (copy), Title (copy), UseMemoResult11 (copy), BodyMedium (copy), Body (copy), UseMemoResult2 (copy), LabelMedium (copy), FeatureDeniedDeniedAction (copy), TextService (upval)
		local Flag = false
		
		local function markReady()
			-- upvalues: Flag (ref), UseStateResult2_1 (upval)
			if not Flag then
				UseStateResult2_1(true)
			end
		end
		
		local list = {
			{
				font = UseMemoResult1,
				size = HeadingMedium.FontSize,
				text = Title
			},
			{
				font = UseMemoResult11,
				size = BodyMedium.FontSize,
				text = Body
			},
			{
				font = UseMemoResult2,
				size = LabelMedium.FontSize,
				text = FeatureDeniedDeniedAction
			}
		}
		task.spawn(function()
			-- upvalues: list (copy), TextService (upval), Flag (ref), UseStateResult2_1 (upval)
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
				UseStateResult2_1(true)
			end
		end)
		task.delay(1.5, markReady)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {
		UseMemoResult1, UseMemoResult11, UseMemoResult2, Title, Body,
		FeatureDeniedDeniedAction, HeadingMedium.FontSize, BodyMedium.FontSize,
		LabelMedium.FontSize
	})
	local Surface100 = UseTokensResult.Color.Surface.Surface_100
	local ActionEmphasis = UseTokensResult.Color.ActionEmphasis
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Backdrop = ReactModule.createElement("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = UseTokensResult.Color.Common.Backdrop.Color3,
			BackgroundTransparency = if p1.opaqueBackdrop then 0 else UseTokensResult.Color.Common.Backdrop.Transparency,
			BorderSizePixel = 0,
			ZIndex = 1,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(Frame.AbsoluteSize)
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
			BackgroundTransparency = if UseStateResult1 then Surface100.Transparency else 1
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, UseTokensResult.Radius.Large) }),
			Stroke = ReactModule.createElement("UIStroke", {
				Thickness = 1,
				Color = UseTokensResult.Color.Stroke.Default.Color3,
				Transparency = if UseStateResult1 then UseTokensResult.Color.Stroke.Default.Transparency else 1
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
				Text = Title,
				TextColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
				TextTransparency = if UseStateResult1 then 0 else 1,
				TextSize = HeadingMedium.FontSize,
				FontFace = UseMemoResult1,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Body = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Text = Body,
				TextColor3 = UseTokensResult.Color.Content.Default.Color3,
				TextTransparency = if UseStateResult1 then 0 else 1,
				TextSize = BodyMedium.FontSize,
				FontFace = UseMemoResult11,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Footer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1000)
			}, {
				OkButton = ReactModule.createElement("TextButton", {
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = ActionEmphasis.Background.Color3,
					BackgroundTransparency = if UseStateResult1 then ActionEmphasis.Background.Transparency else 1,
					AutoButtonColor = true,
					Text = FeatureDeniedDeniedAction,
					TextColor3 = ActionEmphasis.Foreground.Color3,
					TextTransparency = if UseStateResult1 then 0 else 1,
					TextSize = LabelMedium.FontSize,
					FontFace = UseMemoResult2,
					BorderSizePixel = 0,
					[ReactModule.Event.Activated] = p1.onAcknowledge
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
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactFocusNavigationModule (upval)
		return ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult:teardown()
		end
	end, { UseMemoResult })
	
	return ReactModule.createElement("ScreenGui", {
		DisplayOrder = 200,
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		FoundationRoot = ReactModule.createElement(FoundationProvider, { colorMode = ColorMode.Dark }, {
			FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = UseMemoResult }, {
				FocusNavigationRegistryProvider = ReactModule.createElement(FocusNavigableSurfaceRegistry.Provider, nil, {
					FocusNavigableSurface = ReactModule.createElement(FocusRoot, {
						isIsolated = true,
						isAutoFocusRoot = true,
						surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ModerationOverlay
					}, {
						Content = ReactModule.createElement(DialogContent, {
							prompt = p2.prompt,
							onAcknowledge = p2.onAcknowledge,
							opaqueBackdrop = p2.opaqueBackdrop
						})
					})
				})
			})
		})
	})
end