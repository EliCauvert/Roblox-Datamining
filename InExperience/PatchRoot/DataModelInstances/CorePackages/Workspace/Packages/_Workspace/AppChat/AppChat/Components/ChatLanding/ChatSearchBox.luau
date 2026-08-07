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

local var5 = function() --[[ line: 32 ]] end

return function(p0) --[[ line: 34 ]]
	-- upvalues: cryoModule (ref), t (ref), useLocalization (ref), reactModule (ref), searchTopBarModule (ref), var5 (ref)
	local var6 = cryoModule.Dictionary.union(t, p0)
	local var7 = useLocalization({
		searchPlaceholderText = "Feature.Chat.Label.SearchWord",
		cancelText = "Feature.Chat.Action.Cancel"
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var6.height - var6.paddingBottom - var6.paddingTop),
		LayoutOrder = var6.layoutOrder
	}, {
		filterBox = reactModule.createElement(searchTopBarModule, {
			shouldShowCancel = false,
			captureFocusOnMount = false,
			initialInputText = var6.initialText or "",
			cancelText = var7.cancelText,
			searchPlaceholderText = var7.searchPlaceholderText,
			cancelCallback = var5,
			filterBoxPaddingTop = var6.paddingTop,
			filterBoxPaddingBottom = var6.paddingBottom,
			filterBoxPaddingLeft = var6.paddingLeft,
			filterBoxPaddingRight = var6.paddingRight,
			textChangedCallback = var6.onFilter
		}),
		heightFlexOverride = reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.None })
	})
end