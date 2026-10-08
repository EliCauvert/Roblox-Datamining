local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local divider = foundationModule.Divider
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local orientation = foundationModule.Enums.Orientation
local useTokens = foundationModule.Hooks.useTokens
local isSplitPaneEducationalTourGuiObjectVisibleModule = require(script.Parent.isSplitPaneEducationalTourGuiObjectVisible)
local useTrackedRectModule = require(script.Parent.useTrackedRect)
local getSplitPaneEducationalTourStoreModule = require(script.Parent.Parent.Stores.getSplitPaneEducationalTourStore)

local function _(p1)
	-- upvalues: isSplitPaneEducationalTourGuiObjectVisibleModule (ref)
	if not isSplitPaneEducationalTourGuiObjectVisibleModule(p1) then
		return false
	end
	local parent = p1.Parent
	
	return parent ~= nil and (parent:IsA("GuiObject") and (parent.AbsoluteSize.X > 0 and parent.AbsoluteSize.Y > 0))
end

return function()
	-- upvalues: reactModule (ref), useTrackedRectModule (ref), getSplitPaneEducationalTourStoreModule (ref), isSplitPaneEducationalTourGuiObjectVisibleModule (ref), useTokens (ref), view (ref), divider (ref), orientation (ref), icon (ref), iconName (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = useTrackedRectModule(var1)
	local var4 = getSplitPaneEducationalTourStoreModule(false)
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), var4 (ref)
		if var1 == nil then
			return
		end
		return function()
			-- upvalues: var4 (copy), var1 (copy)
			if var4.getCollapsedExpandButtonInstance(false) == var1 then
				var4.setCollapsedExpandButtonRect(nil)
				var4.setCollapsedExpandButtonInstance(nil)
			end
		end
	end, { var1, var4 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), isSplitPaneEducationalTourGuiObjectVisibleModule (copy), var3 (ref), var4 (ref)
		if var1 == nil then return end
		local var5
		local var6 = var1
		
		if isSplitPaneEducationalTourGuiObjectVisibleModule(var6) then
			local parent = var6.Parent
			var5 = parent ~= nil and (parent:IsA("GuiObject") and (parent.AbsoluteSize.X > 0 and parent.AbsoluteSize.Y > 0))
		else
			var5 = false
		end
		if var5 and var3 ~= nil then
			var4.setCollapsedExpandButtonInstance(var1)
			var4.setCollapsedExpandButtonRect(var3)
			
			return
		elseif var4.getCollapsedExpandButtonInstance(false) == var1 then
			var4.setCollapsedExpandButtonRect(nil)
		end
	end, { var1, var3, var4 })
	local var5 = useTokens()
	local actionUtility = var5.Color.ActionUtility
	
	return reactModule.createElement(view, {
		tag = "row align-y-center size-0-full auto-x padding-left-xsmall"
	}, {
		DividerContainer = reactModule.createElement(view, { tag = "size-0-600 auto-x", LayoutOrder = 1 }, {
			Divider = reactModule.createElement(divider, { orientation = orientation.Vertical })
		}),
		ButtonSlot = reactModule.createElement(view, {
			tag = "size-1000-1000 padding-left-xsmall",
			LayoutOrder = 2
		}, {
			Button = reactModule.createElement(view, {
				tag = "row align-x-center align-y-center",
				testId = "split-pane-educational-tour--expand",
				ref = var2,
				Size = UDim2.fromOffset(var5.Size.Size_1000, var5.Size.Size_1000),
				padding = UDim.new(0, var5.Size.Size_250),
				cornerRadius = UDim.new(0, var5.Radius.Medium),
				backgroundStyle = actionUtility.Background,
				stroke = if actionUtility.Border ~= nil then nil else {
					Color = actionUtility.Border.Color3,
					Transparency = actionUtility.Border.Transparency
				}
			}, {
				Icon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = iconName.RectangleRightPaneChevronLeft,
					size = var5.Size.Size_600,
					style = actionUtility.Foreground
				})
			})
		})
	})
end