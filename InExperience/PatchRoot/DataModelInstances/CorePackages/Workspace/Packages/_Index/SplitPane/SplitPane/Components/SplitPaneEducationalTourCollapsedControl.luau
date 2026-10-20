local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Divider = FoundationModule.Divider
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local Orientation = FoundationModule.Enums.Orientation
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IsSplitPaneEducationalTourGuiObjectVisibleModule = require(script.Parent.isSplitPaneEducationalTourGuiObjectVisible)
local UseTrackedRectModule = require(script.Parent.useTrackedRect)
local GetSplitPaneEducationalTourStoreModule = require(script.Parent.Parent.Stores.getSplitPaneEducationalTourStore)

local function _(p1): boolean
	-- upvalues: IsSplitPaneEducationalTourGuiObjectVisibleModule (copy)
	if IsSplitPaneEducationalTourGuiObjectVisibleModule(p1) then
		local Parent = p1.Parent
		
		return Parent ~= nil and (Parent:IsA("GuiObject") and (Parent.AbsoluteSize.X > 0 and Parent.AbsoluteSize.Y > 0))
	else
		return false
	end
end

return function()
	-- upvalues: ReactModule (copy), UseTrackedRectModule (copy), GetSplitPaneEducationalTourStoreModule (copy), IsSplitPaneEducationalTourGuiObjectVisibleModule (copy), UseTokensFunction (copy), View (copy), Divider (copy), Orientation (copy), Icon (copy), IconName (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseTrackedRectModuleResult = UseTrackedRectModule(UseStateResult)
	local SplitPaneEducationalTourStoreModule = GetSplitPaneEducationalTourStoreModule(false)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult (copy), SplitPaneEducationalTourStoreModule (copy)
		if UseStateResult == nil then return end
		return function()
			-- upvalues: SplitPaneEducationalTourStoreModule (upval), UseStateResult (upval)
			if SplitPaneEducationalTourStoreModule.getCollapsedExpandButtonInstance(false) == UseStateResult then
				SplitPaneEducationalTourStoreModule.setCollapsedExpandButtonRect(nil)
				SplitPaneEducationalTourStoreModule.setCollapsedExpandButtonInstance(nil)
			end
		end
	end, { UseStateResult, SplitPaneEducationalTourStoreModule })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult (copy), IsSplitPaneEducationalTourGuiObjectVisibleModule (upval), UseTrackedRectModuleResult (copy), SplitPaneEducationalTourStoreModule (copy)
		if UseStateResult == nil then return end
		local IsYAbove = nil
		if IsSplitPaneEducationalTourGuiObjectVisibleModule(UseStateResult) then
			local Parent = UseStateResult.Parent
			IsYAbove = Parent ~= nil and (Parent:IsA("GuiObject") and (Parent.AbsoluteSize.X > 0 and Parent.AbsoluteSize.Y > 0))
		else
			IsYAbove = false
		end
		if IsYAbove and UseTrackedRectModuleResult ~= nil then
			SplitPaneEducationalTourStoreModule.setCollapsedExpandButtonInstance(UseStateResult)
			SplitPaneEducationalTourStoreModule.setCollapsedExpandButtonRect(UseTrackedRectModuleResult)
			
			return
		end
		if SplitPaneEducationalTourStoreModule.getCollapsedExpandButtonInstance(false) == UseStateResult then
			SplitPaneEducationalTourStoreModule.setCollapsedExpandButtonRect(nil)
		end
	end, {
		UseStateResult,
		UseTrackedRectModuleResult,
		SplitPaneEducationalTourStoreModule
	})
	local UseTokensResult = UseTokensFunction()
	local ActionUtility = UseTokensResult.Color.ActionUtility
	
	return ReactModule.createElement(View, {
		tag = "row align-y-center size-0-full auto-x padding-left-xsmall"
	}, {
		DividerContainer = ReactModule.createElement(View, { tag = "size-0-600 auto-x", LayoutOrder = 1 }, {
			Divider = ReactModule.createElement(Divider, { orientation = Orientation.Vertical })
		}),
		ButtonSlot = ReactModule.createElement(View, {
			tag = "size-1000-1000 padding-left-xsmall",
			LayoutOrder = 2
		}, {
			Button = ReactModule.createElement(View, {
				tag = "row align-x-center align-y-center",
				testId = "split-pane-educational-tour--expand",
				ref = UseStateResult2,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_1000, UseTokensResult.Size.Size_1000),
				padding = UDim.new(0, UseTokensResult.Size.Size_250),
				cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
				backgroundStyle = ActionUtility.Background,
				stroke = if ActionUtility.Border == nil then nil else {
					Color = ActionUtility.Border.Color3,
					Transparency = ActionUtility.Border.Transparency
				}
			}, {
				Icon = ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					name = IconName.RectangleRightPaneChevronLeft,
					size = UseTokensResult.Size.Size_600,
					style = ActionUtility.Foreground
				})
			})
		})
	})
end