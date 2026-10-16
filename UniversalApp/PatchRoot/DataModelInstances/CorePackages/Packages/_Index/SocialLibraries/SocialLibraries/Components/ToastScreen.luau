local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local T = DependenciesModule.t
local Images = UIBlox.App.ImageSet.Images
local IconSize = UIBlox.App.Constant.IconSize
local Toast = UIBlox.App.Dialog.Toast
local ValidateColorInfo = UIBlox.Style.Validator.validateColorInfo
local ToastScreen = Roact.PureComponent:extend("ToastScreen")
ToastScreen.defaultProps = { navigation = nil }
local StrictInterfaceResult = T.strictInterface({
	toastTitle = T.optional(T.string),
	toastSubtitle = T.optional(T.string),
	iconColorStyle = T.optional(ValidateColorInfo),
	iconImage = T.optional(T.union(T.table, T.string)),
	iconSize = T.optional(T.Vector2),
	swipeUpDismiss = T.optional(T.boolean),
	onAppeared = T.optional(T.callback),
	onActivated = T.optional(T.callback),
	onDismissed = T.optional(T.callback),
	hideIcon = T.optional(T.boolean)
})
local StrictInterfaceResult1 = T.strictInterface({
	toastContent = T.optional(T.table),
	anchorPoint = T.optional(T.Vector2),
	duration = T.optional(T.integer),
	layoutOrder = T.optional(T.integer),
	position = T.optional(T.UDim2),
	size = T.optional(T.UDim2),
	show = T.optional(T.boolean)
})

function ToastScreen.init(p1) --[[ Line: 41 ]]
	-- upvalues: StrictInterfaceResult1 (copy), StrictInterfaceResult (copy), Images (copy), IconSize (copy)
	p1.hasToastChanged = false
	
	function p1.getToastProps(ToastProps) --[[ Line: 44 ]]
		-- upvalues: StrictInterfaceResult1 (upval), StrictInterfaceResult (upval), Images (upval), IconSize (upval), p1 (copy)
		local ToastContent = ToastProps.toastContent or {}
		assert(StrictInterfaceResult1(ToastProps))
		assert(StrictInterfaceResult(ToastContent))
		
		return {
			toastContent = {
				toastTitle = ToastContent.toastTitle or "",
				toastSubtitle = ToastContent.toastSubtitle,
				iconColorStyle = ToastContent.iconColorStyle,
				iconImage = if ToastContent.hideIcon then nil else ToastContent.iconImage or Images["icons/status/alert"],
				iconSize = if ToastContent.hideIcon then nil else ToastContent.iconSize or Vector2.new(IconSize.Regular, IconSize.Regular),
				swipeUpDismiss = ToastContent.swipeUpDismiss,
				onAppeared = function() --[[ Line: 62 ]]
					-- upvalues: ToastContent (copy), p1 (upval)
					if ToastContent.onAppeared then
						ToastContent.onAppeared()
					end
					p1.hasToastChanged = false
				end,
				onActivated = ToastContent.onActivated,
				onDismissed = function() --[[ Line: 69 ]]
					-- upvalues: ToastContent (copy), p1 (upval)
					if ToastContent.onDismissed then
						ToastContent.onDismissed()
					end
					if not p1.hasToastChanged then
						p1.props.navigation.goBack()
					end
				end
			},
			anchorPoint = ToastProps.anchorPoint,
			duration = ToastProps.duration or 2,
			layoutOrder = ToastProps.layoutOrder,
			position = ToastProps.position,
			size = ToastProps.size,
			show = ToastProps.show
		}
	end
end

function ToastScreen.render(p1) --[[ Line: 90 ]]
	-- upvalues: Roact (copy), Toast (copy)
	assert(type(p1.props.navigation) ~= "nil", "ToastScreen should be wrapped with Roact Navigation")
	
	return Roact.createElement(Toast, (p1.getToastProps(p1.props.navigation.getParam("toastProps", {}))))
end

function ToastScreen.didUpdate(p1, _, _) --[[ Line: 98 ]]
	p1.hasToastChanged = true
end

return ToastScreen