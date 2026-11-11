local TenFootUiGlobalNav = script:FindFirstAncestor("TenFootUiGlobalNav")
local Parent = TenFootUiGlobalNav.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local GlobalNavOptionGroupModule = require(TenFootUiGlobalNav.Components.GlobalNavOptionGroup)
local EraseKeysModule = require(TenFootUiGlobalNav.Components.utils.eraseKeys)
local IconTabGroup = require(Parent.UIBlox).App.Navigation.PrimaryNavBar.IconTabGroup
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local GetVirtualResolutionScaleFunction = require(Parent.Responsive).getVirtualResolutionScale
local ForwardRefResult = ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: EraseKeysModule (copy), ReactModule (copy), GetVirtualResolutionScaleFunction (copy), CryoModule (copy)
	return ReactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		GroupTransparency = p1.GroupTransparency,
		ResolutionScale = GetVirtualResolutionScaleFunction(),
		ref = Ref
	}, ReactModule.createElement("Frame", CryoModule.Dictionary.join({
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Position = UDim2.new(0, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0, 0.5)
	}, (EraseKeysModule({ "children", "GroupTransparency" }, p1))), p1.children))
end)

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseDesignTokensFunction (copy), EraseKeysModule (copy), ReactModule (copy), ForwardRefResult (copy), IconTabGroup (copy), GlobalNavOptionGroupModule (copy), CryoModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(function(p2)
		return p2.Size.Size_1600
	end)
	local UseDesignTokensResult1 = UseDesignTokensFunction(function(p2)
		return p2.Size.Size_200
	end)
	local EraseKeysModuleResult = EraseKeysModule({ "optionGroupProps", "tabGroupProps", "animationProps" }, p1)
	local Element = nil
	local Element1 = nil
	
	if p1.tabGroupProps then
		Element = ReactModule.createElement(ForwardRefResult, {
			GroupTransparency = p1.animationProps.tabGroupTransparency,
			ref = p1.animationProps.tabGroupRef
		}, ReactModule.createElement(IconTabGroup, p1.tabGroupProps))
	end
	if p1.optionGroupProps then
		Element1 = ReactModule.createElement(ForwardRefResult, {
			Position = UDim2.new(1, 0, 0.5, 0),
			AnchorPoint = Vector2.new(1, 0.5),
			GroupTransparency = p1.animationProps.optionGroupTransparency,
			ref = p1.animationProps.optionGroupRef
		}, ReactModule.createElement(GlobalNavOptionGroupModule, CryoModule.Dictionary.join(p1.optionGroupProps, {
			AnchorPoint = Vector2.new(1, 0),
			spacing = UseDesignTokensResult1
		})))
	end
	return ReactModule.createElement("Frame", CryoModule.Dictionary.join({
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ref = Ref
	}, EraseKeysModuleResult), ReactModule.createElement("UIPadding", {
		PaddingRight = UDim.new(0, UseDesignTokensResult),
		PaddingLeft = UDim.new(0, UseDesignTokensResult)
	}), { TabGroup = Element, OptionGroup = Element1 })
end))