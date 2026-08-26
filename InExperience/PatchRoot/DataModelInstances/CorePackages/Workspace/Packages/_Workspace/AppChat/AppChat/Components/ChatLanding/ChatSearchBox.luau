local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local searchTopBarModule = require(appChat.Components.ChatLanding.SearchTopBar)
local t = {
	paddingTop = 0,
	paddingBottom = 6,
	paddingLeft = 12,
	paddingRight = 12,
	layoutOrder = -1
}

local var1 = function() end

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useLocalization (ref), reactModule (ref), searchTopBarModule (ref), var1 (ref)
	local var2 = cryoModule.Dictionary.union(t, p1)
	local var3 = useLocalization({
		searchPlaceholderText = "Feature.Chat.Label.SearchWord",
		cancelText = "Feature.Chat.Action.Cancel"
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var2.height - var2.paddingBottom - var2.paddingTop),
		LayoutOrder = var2.layoutOrder
	}, {
		filterBox = reactModule.createElement(searchTopBarModule, {
			shouldShowCancel = false,
			captureFocusOnMount = false,
			initialInputText = var2.initialText or "",
			cancelText = var3.cancelText,
			searchPlaceholderText = var3.searchPlaceholderText,
			cancelCallback = var1,
			filterBoxPaddingTop = var2.paddingTop,
			filterBoxPaddingBottom = var2.paddingBottom,
			filterBoxPaddingLeft = var2.paddingLeft,
			filterBoxPaddingRight = var2.paddingRight,
			textChangedCallback = var2.onFilter
		}),
		heightFlexOverride = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.None })
	})
end