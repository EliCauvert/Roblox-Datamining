local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local parent = sduiSharedUtilities.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local iconButton = foundationModule.IconButton
local builderIconsModule = require(parent.BuilderIcons)
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
local signalsReactModule = require(parent.SignalsReact)
local getDisplayStore = require(parent.Display).GetDisplayStore
local appHeaderBarModule = require(parent.AppHeaderBar)
local navButtonType = require(sduiSharedUtilities.SduiIntegrationTypes).NavButtonType
local useScrollAwayHeaderPositionModule = require(sduiSharedUtilities.useScrollAwayHeaderPosition)
local fFlagLuaAppSduiPageEntryScrollAway = require(parent.SharedFlags).FFlagLuaAppSduiPageEntryScrollAway
local fFlagLuaAppSduiStickyHeaderScrollAway = require(parent.SharedFlags).FFlagLuaAppSduiStickyHeaderScrollAway

local function calculateSize(p0)
	-- upvalues: getDisplayStore (ref)
	local var9 = getDisplayStore(p0)
	
	return UDim2.new(1, 0, 0, var9.getTopBarHeight(p0) - var9.getGuiInset(p0).top or 0)
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), usePreferredInput (ref), responsiveModule (ref), signalsReactModule (ref), calculateSize (ref), reactModule (ref), navButtonType (ref), iconButton (ref), foundationModule (ref), builderIconsModule (ref), appHeaderBarModule (ref), fFlagLuaAppSduiPageEntryScrollAway (ref), useScrollAwayHeaderPositionModule (ref), fFlagLuaAppSduiStickyHeaderScrollAway (ref)
	local closeCallback = p1.closeCallback
	local var10 = useTokens()
	local var11 = usePreferredInput() == responsiveModule.Input.Directional
	local var12 = signalsReactModule.useSignalBinding(calculateSize)
	local var13 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), closeCallback (ref), p1 (ref), navButtonType (copy), reactModule (copy), var10 (ref), iconButton (copy), foundationModule (copy), builderIconsModule (copy)
		return if var11 or not closeCallback or p1.navButtonType ~= navButtonType.back and p1.navButtonType ~= navButtonType.close then nil else function()
			-- upvalues: reactModule (copy), var10 (copy), iconButton (copy), closeCallback (copy), foundationModule (copy), p1 (copy), navButtonType (copy), builderIconsModule (copy)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(0, var10.Size.Size_1400, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIPadding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, -var10.Size.Size_250) }),
				IconButton = reactModule.createElement(iconButton, {
					SelectionOrder = 10,
					isCircular = true,
					onActivated = closeCallback,
					size = foundationModule.Enums.InputSize.Large,
					icon = {
						name = if p1.navButtonType == navButtonType.close then builderIconsModule.Icon.X else builderIconsModule.Icon.ChevronLargeLeft,
						variant = foundationModule.Enums.IconVariant.Regular
					}
				})
			})
		end
	end, { var11, p1.navButtonType, closeCallback })
	local t = {
		AppHeaderBarLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		}),
		AppHeaderBar = reactModule.createElement(appHeaderBarModule.AppHeaderBar, {
			automaticHeight = true,
			shouldRenderTitle = true,
			onMedia = false,
			renderNavigation = var13,
			title = p1.title,
			renderUtilities = p1.renderUtilities,
			paddingLeft = UDim.new(0, 0),
			paddingRight = UDim.new(0, 0),
			isTitleCentered = p1.navButtonType ~= navButtonType.back
		})
	}
	
	return if fFlagLuaAppSduiPageEntryScrollAway then reactModule.createElement("Frame", {
		[reactModule.Tag] = p1.contentTag,
		Size = var12,
		LayoutOrder = p1.layoutOrder or -1,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = if var13 then Enum.AutomaticSize.Y else nil,
		ZIndex = 2,
		ClipsDescendants = false
	}, {
		Content = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = var10.Color.Surface.Surface_0.Color3,
			Size = var12,
			Position = useScrollAwayHeaderPositionModule({
				sizeBinding = if fFlagLuaAppSduiStickyHeaderScrollAway then nil else var12,
				enabled = p1.scrollAwayHeader,
				scrollAwayHeight = if fFlagLuaAppSduiStickyHeaderScrollAway and p1.scrollAwayHeader then var12:getValue().Y.Offset else nil
			}),
			AutomaticSize = if var13 then Enum.AutomaticSize.Y else nil
		}, t)
	}) else reactModule.createElement("Frame", {
		[reactModule.Tag] = p1.contentTag,
		BackgroundColor3 = var10.Color.Surface.Surface_0.Color3,
		Size = var12,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder or -1,
		AutomaticSize = if var13 then Enum.AutomaticSize.Y else nil
	}, t)
end)