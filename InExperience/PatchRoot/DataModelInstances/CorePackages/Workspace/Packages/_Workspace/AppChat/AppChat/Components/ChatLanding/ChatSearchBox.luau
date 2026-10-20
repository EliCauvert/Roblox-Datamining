local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SearchTopBarModule = require(AppChat.Components.ChatLanding.SearchTopBar)
local config = {
	paddingTop = 0,
	paddingBottom = 6,
	paddingLeft = 12,
	paddingRight = 12,
	layoutOrder = -1
}

local function CancelCallback() end

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseLocalizationFunction (copy), ReactModule (copy), SearchTopBarModule (copy), CancelCallback (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseLocalizationResult = UseLocalizationFunction({
		searchPlaceholderText = "Feature.Chat.Label.SearchWord",
		cancelText = "Feature.Chat.Action.Cancel"
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, UnionResult.height - UnionResult.paddingBottom - UnionResult.paddingTop),
		LayoutOrder = UnionResult.layoutOrder
	}, {
		filterBox = ReactModule.createElement(SearchTopBarModule, {
			shouldShowCancel = false,
			captureFocusOnMount = false,
			initialInputText = UnionResult.initialText or "",
			cancelText = UseLocalizationResult.cancelText,
			searchPlaceholderText = UseLocalizationResult.searchPlaceholderText,
			cancelCallback = CancelCallback,
			filterBoxPaddingTop = UnionResult.paddingTop,
			filterBoxPaddingBottom = UnionResult.paddingBottom,
			filterBoxPaddingLeft = UnionResult.paddingLeft,
			filterBoxPaddingRight = UnionResult.paddingRight,
			textChangedCallback = UnionResult.onFilter
		}),
		heightFlexOverride = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.None })
	})
end