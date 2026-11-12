local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), UserInputService (copy), WithSelectionCursorProviderFunction (copy), WithStyleFunction (copy), CursorKind (copy), FoundationModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), LoadableImage (copy)
	local UseTokensResult = UseTokensFunction()
	local IsIsRich = p1.isRich == true
	local v1 = (p1.layoutOrder or 1) > 1
	local Size1600 = if IsIsRich then UseTokensResult.Size.Size_1600 else UseTokensResult.Size.Size_1400
	local Size1100 = UseTokensResult.Size.Size_1100
	local Size900 = UseTokensResult.Size.Size_900
	local Size600 = UseTokensResult.Size.Size_600
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseLocalizationResult = UseLocalizationFunction({ category = "Feature.GameBadges.Label.Experience" })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UserInputService (upval), UseStateResult2 (copy)
		if not UseStateResult then return end
		local InputEndedConnection = UserInputService.InputEnded:Connect(function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
		
		return function()
			-- upvalues: InputEndedConnection (copy)
			InputEndedConnection:Disconnect()
		end
	end, { UseStateResult })
	
	local function onInputBegan(_, Input)
		-- upvalues: UseStateResult2 (copy)
		if (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) and Input.UserInputState == Enum.UserInputState.Begin then
			UseStateResult2(true)
		end
	end
	
	return WithSelectionCursorProviderFunction(function(Callback)
		-- upvalues: WithStyleFunction (upval), ReactModule (upval), UseStateResult (copy), Size1600 (copy), p1 (copy), CursorKind (upval), onInputBegan (copy), UseStateResult2 (copy), v1 (copy), UseTokensResult (copy), FoundationModule (upval), Size600 (copy), Size1100 (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), IsIsRich (copy), UseLocalizationResult (copy), Size900 (copy), LoadableImage (upval)
		return WithStyleFunction(function(p2)
			-- upvalues: ReactModule (upval), UseStateResult (upval), Size1600 (upval), p1 (upval), Callback (copy), CursorKind (upval), onInputBegan (upval), UseStateResult2 (upval), v1 (upval), UseTokensResult (upval), FoundationModule (upval), Size600 (upval), Size1100 (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), IsIsRich (upval), UseLocalizationResult (upval), Size900 (upval), LoadableImage (upval)
			return ReactModule.createElement("ImageButton", {
				Image = "",
				BackgroundColor3 = if UseStateResult then p2.Theme.BackgroundOnPress.Color else p2.Theme.BackgroundDefault.Color,
				BackgroundTransparency = if UseStateResult then p2.Theme.BackgroundOnPress.Transparency else 1,
				AutoButtonColor = false,
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Size = UDim2.new(1, 0, 0, Size1600),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = p1.layoutOrder,
				Selectable = true,
				Active = true,
				SelectionImageObject = Callback(CursorKind.RoundedRectNoInset),
				[ReactModule.Event.Activated] = function()
					-- upvalues: p1 (upval)
					if p1.onActivated then
						p1.onActivated()
					end
				end,
				[ReactModule.Event.InputBegan] = onInputBegan,
				[ReactModule.Event.InputEnded] = function()
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(false)
				end,
				[ReactModule.Tag] = "data-testid=--sdui-autocomplete-suggestion"
			}, {
				Divider = if v1 then ReactModule.createElement("Frame", {
					BackgroundColor3 = p2.Theme.Divider.Color,
					BackgroundTransparency = p2.Theme.Divider.Transparency,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, UseTokensResult.Stroke.Standard),
					[ReactModule.Tag] = "data-testid=--sdui-autocomplete-divider"
				}) else nil,
				Container = ReactModule.createElement("Frame", {
					Position = if v1 then UDim2.fromOffset(0, UseTokensResult.Stroke.Standard) else nil,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					[ReactModule.Tag] = "data-testid=--sdui-autocomplete-container"
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, 9)
					}),
					LeftSpacing = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 1,
						Size = UDim2.new(0, 0, 0, Size1600)
					}),
					SearchIcon = ReactModule.createElement(FoundationModule.Icon, {
						name = "magnifying-glass",
						LayoutOrder = 2,
						testId = "--sdui-autocomplete-search-icon",
						size = Size600,
						style = {
							Color3 = p2.Theme.IconDefault.Color,
							Transparency = p2.Theme.IconDefault.Transparency
						}
					}),
					Content = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 3,
						Size = UDim2.new(1, -(Size600 + Size1100 + 36 + UseTokensResult.Padding.Small), 1, 0)
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							Padding = UDim.new(0, 5)
						}),
						Title = ReactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							Text = p1.title,
							Font = if FoundationFontFaceMigration then nil else p2.Font.Body.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodyLarge.Font) else nil,
							TextSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize,
							TextColor3 = p2.Theme.TextDefault.Color,
							TextTransparency = p2.Theme.TextDefault.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							TextWrapped = true,
							[ReactModule.Tag] = "data-testid=--sdui-autocomplete-title"
						}),
						Category = if IsIsRich then ReactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							BorderSizePixel = 0,
							LayoutOrder = 2,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							Text = UseLocalizationResult.category,
							Font = if FoundationFontFaceMigration then nil else p2.Font.CaptionBody.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.BodySmall.Font) else nil,
							TextSize = p2.Font.BaseSize * p2.Font.CaptionBody.RelativeSize,
							TextColor3 = p2.Theme.TextMuted.Color,
							TextTransparency = p2.Theme.TextMuted.Transparency,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							TextWrapped = true,
							[ReactModule.Tag] = "data-testid=--sdui-autocomplete-category"
						}) else nil
					}),
					RichIcon = if IsIsRich and p1.richIcon ~= nil then ReactModule.createElement("Frame", {
						Size = UDim2.fromOffset(Size1100, Size1100),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 4,
						[ReactModule.Tag] = "data-testid=--sdui-autocomplete-rich-icon-container"
					}, {
						Shadow = ReactModule.createElement("Frame", {
							BorderSizePixel = 0,
							ZIndex = 10,
							Size = UDim2.fromOffset(Size900, Size900),
							Position = UDim2.fromOffset(UseTokensResult.Size.Size_200, 0),
							BackgroundColor3 = p2.Theme.BackgroundOnHover.Color,
							BackgroundTransparency = p2.Theme.BackgroundOnHover.Transparency
						}),
						Border = ReactModule.createElement("Frame", {
							BorderSizePixel = 0,
							ZIndex = 11,
							Size = UDim2.fromOffset(Size900, Size900),
							Position = UDim2.fromOffset(UseTokensResult.Size.Size_50, UseTokensResult.Size.Size_150),
							BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
							BackgroundTransparency = p2.Theme.BackgroundDefault.Transparency
						}),
						GameIcon = ReactModule.createElement(LoadableImage, {
							BackgroundTransparency = 1,
							useShimmerAnimationWhileLoading = true,
							ZIndex = 12,
							Size = UDim2.fromOffset(Size900, Size900),
							Position = UDim2.fromOffset(0, UseTokensResult.Size.Size_200),
							Image = p1.richIcon
						})
					}) else nil
				})
			})
		end)
	end)
end)