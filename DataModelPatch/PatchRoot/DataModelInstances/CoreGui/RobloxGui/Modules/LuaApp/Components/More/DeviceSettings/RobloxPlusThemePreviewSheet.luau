local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local RobloxSubscriptionPurchaseAppModule = require(CorePackages.Workspace.Packages.RobloxSubscriptionPurchaseApp)
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext
local RobloxPlusThemeModule = require(Modules.LuaApp.Themes.RobloxPlusTheme)
local GetRobloxPlusThemeStoreModule = require(Modules.LuaApp.Themes.Stores.GetRobloxPlusThemeStore)
local Sheet = FoundationModule.Sheet
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local Enums = FoundationModule.Enums
local DialogSize = Enums.DialogSize
local ButtonVariant = Enums.ButtonVariant
local FillBehavior = Enums.FillBehavior
local IconName = Enums.IconName
local _Color3 = Color3.fromRGB(120, 120, 120)
local Order = RobloxPlusThemeModule.Order

local function resolveSwatchColor(UseTokensResult, ThemeKey)
	-- upvalues: RobloxPlusThemeModule (copy), _Color3 (copy)
	if ThemeKey == RobloxPlusThemeModule.Default then
		local Extended = UseTokensResult.Color and UseTokensResult.Color.Extended
		local Gray = Extended and Extended.Gray
		local Gray700 = Gray and Gray.Gray_700
		
		return if Gray700 and typeof(Gray700.Color3) == "Color3" then Gray700.Color3 else _Color3
	end
	local PaletteByThemeEntry = RobloxPlusThemeModule.PaletteByTheme[ThemeKey]
	
	if PaletteByThemeEntry then
		local Extended = UseTokensResult.Color and UseTokensResult.Color.Extended
		local ExtendedEntry = Extended and Extended[PaletteByThemeEntry]
		local ExtendedEntry1 = ExtendedEntry and ExtendedEntry[`{PaletteByThemeEntry}_1300`]
		
		return if ExtendedEntry1 and typeof(ExtendedEntry1.Color3) == "Color3" then ExtendedEntry1.Color3 else _Color3
	else
		return _Color3
	end
end

local function ThemeRow(Frame)
	-- upvalues: ReactModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		tag = {
			["row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-y-small radius-small"] = true,
			["stroke-standard stroke-emphasis bg-shift-200"] = Frame.isSelected
		},
		onActivated = Frame.onActivated,
		testId = `RobloxPlusThemePreviewSheet--option-{Frame.themeKey}`
	}, {
		Swatch = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "radius-circle",
			Size = UDim2.fromOffset(16, 16),
			backgroundStyle = { Transparency = 0, Color3 = Frame.swatchColor }
		}),
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			Text = Frame.label,
			tag = {
				["fill auto-y text-body-medium text-align-x-left"] = true,
				["content-emphasis"] = Frame.isSelected,
				["content-default"] = not Frame.isSelected
			}
		})
	})
end

return function(p1)
	-- upvalues: GetRobloxPlusThemeStoreModule (copy), FoundationModule (copy), UseSignalStateFunction (copy), ReactModule (copy), RobloxSubscriptionPurchaseAppModule (copy), SurfaceName (copy), SurfaceContext (copy), Order (copy), RobloxPlusThemeModule (copy), ThemeRow (copy), resolveSwatchColor (copy), Sheet (copy), DialogSize (copy), View (copy), Text (copy), GetIconRichTextFunction (copy), IconName (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local RobloxPlusThemeStoreModule = GetRobloxPlusThemeStoreModule(false)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseSignalStateResult = UseSignalStateFunction(RobloxPlusThemeStoreModule.getPreviewColorThemeKey)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: RobloxPlusThemeStoreModule (copy)
		RobloxPlusThemeStoreModule.setPreviewColorThemeKey(nil)
	end, { RobloxPlusThemeStoreModule })
	ReactModule.useEffect(function()
		-- upvalues: RobloxPlusThemeStoreModule (copy)
		return function()
			-- upvalues: RobloxPlusThemeStoreModule (upval)
			RobloxPlusThemeStoreModule.setPreviewColorThemeKey(nil)
		end
	end, { RobloxPlusThemeStoreModule })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), RobloxPlusThemeStoreModule (copy)
		if not p1.isOpen then
			RobloxPlusThemeStoreModule.setPreviewColorThemeKey(nil)
		end
	end, { p1.isOpen, RobloxPlusThemeStoreModule })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), p1 (copy)
		UseResult()
		p1.onClose()
	end, { UseResult, p1.onClose })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: RobloxSubscriptionPurchaseAppModule (upval), SurfaceName (upval), SurfaceContext (upval), UseResult (copy), p1 (copy)
		RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase(nil, nil, nil, SurfaceName.Unspecified, SurfaceContext.InApp)
		UseResult()
		p1.onClose()
	end, { UseResult, p1.onClose })
	
	if not p1.isOpen then
		return nil
	end
	local Elements = {}
	
	for LayoutOrder, ThemeKey in Order do
		local ThemeLabels = p1.themeLabels
		Elements[`Option-{ThemeKey}`] = ReactModule.createElement(ThemeRow, {
			LayoutOrder = LayoutOrder,
			themeKey = ThemeKey,
			label = ThemeLabels and ThemeLabels[ThemeKey] or ThemeKey,
			swatchColor = resolveSwatchColor(UseTokensResult, ThemeKey),
			isSelected = if UseSignalStateResult == nil then ThemeKey == RobloxPlusThemeModule.Default else UseSignalStateResult == ThemeKey,
			onActivated = function()
				-- upvalues: ThemeKey (copy), RobloxPlusThemeModule (upval), RobloxPlusThemeStoreModule (copy)
				if ThemeKey == RobloxPlusThemeModule.Default then
					RobloxPlusThemeStoreModule.setPreviewColorThemeKey(nil)
					
					return
				else
					RobloxPlusThemeStoreModule.setPreviewColorThemeKey(ThemeKey)
				end
			end
		})
	end
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		testId = "RobloxPlusThemePreviewSheet",
		onClose = UseResult1,
		size = DialogSize.Medium
	}, {
		Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
			TitleContainer = ReactModule.createElement(View, { LayoutOrder = 1, tag = "row gap-small auto-xy" }, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-heading-small text-align-x-center content-emphasis",
					RichText = true,
					Text = `{GetIconRichTextFunction(IconName.RobloxPlus)} {p1.title}`
				})
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
			ContentContainer = ReactModule.createElement(View, { tag = "col gap-large size-full-0 auto-y" }, {
				Description = ReactModule.createElement(Text, {
					LayoutOrder = 0,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
					Text = p1.description
				}),
				Options = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "col gap-xsmall size-full-0 auto-y"
				}, Elements)
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			ActionsContainer = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row wrap align-x-center gap-medium size-full-0 auto-xy"
			}, {
				SubscribeButton = ReactModule.createElement(Button, {
					LayoutOrder = 1,
					testId = "RobloxPlusThemePreviewSheet--subscribe",
					text = p1.subscribeText,
					onActivated = UseResult2,
					variant = ButtonVariant.Emphasis,
					fillBehavior = FillBehavior.Fill
				})
			})
		})
	})
end