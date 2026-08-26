local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local roact = dependenciesModule.Roact
local UIBlox = dependenciesModule.UIBlox
local t = dependenciesModule.t
local images = UIBlox.App.ImageSet.Images
local iconSize = UIBlox.App.Constant.IconSize
local toast = UIBlox.App.Dialog.Toast
local validateColorInfo = UIBlox.Style.Validator.validateColorInfo
local toastScreen = roact.PureComponent:extend("ToastScreen")
toastScreen.defaultProps = { navigation = nil }
local var1 = t.strictInterface({
	toastTitle = t.optional(t.string),
	toastSubtitle = t.optional(t.string),
	iconColorStyle = t.optional(validateColorInfo),
	iconImage = t.optional(t.union(t.table, t.string)),
	iconSize = t.optional(t.Vector2),
	swipeUpDismiss = t.optional(t.boolean),
	onAppeared = t.optional(t.callback),
	onActivated = t.optional(t.callback),
	onDismissed = t.optional(t.callback),
	hideIcon = t.optional(t.boolean)
})
local var2 = t.strictInterface({
	toastContent = t.optional(t.table),
	anchorPoint = t.optional(t.Vector2),
	duration = t.optional(t.integer),
	layoutOrder = t.optional(t.integer),
	position = t.optional(t.UDim2),
	size = t.optional(t.UDim2),
	show = t.optional(t.boolean)
})

function toastScreen.init(p1)
	-- upvalues: var2 (ref), var1 (ref), images (ref), iconSize (ref)
	p1.hasToastChanged = false
	
	function p0.getToastProps(p2)
		-- upvalues: var2 (copy), var1 (copy), images (copy), iconSize (copy), p1 (ref)
		local toastContent = p2.toastContent or {}
		assert(var2(p2))
		assert(var1(toastContent))
		
		return {
			toastContent = {
				toastTitle = toastContent.toastTitle or "",
				toastSubtitle = toastContent.toastSubtitle,
				iconColorStyle = toastContent.iconColorStyle,
				iconImage = if not toastContent.hideIcon then toastContent.iconImage or images["icons/status/alert"] else nil,
				iconSize = if not toastContent.hideIcon then toastContent.iconSize or Vector2.new(iconSize.Regular, iconSize.Regular) else nil,
				swipeUpDismiss = toastContent.swipeUpDismiss,
				onAppeared = function()
					-- upvalues: toastContent (ref), p1 (copy)
					if toastContent.onAppeared then
						toastContent.onAppeared()
					end
					p1.hasToastChanged = false
				end,
				onActivated = toastContent.onActivated,
				onDismissed = function()
					-- upvalues: toastContent (ref), p1 (copy)
					if toastContent.onDismissed then
						toastContent.onDismissed()
					end
					if not p1.hasToastChanged then
						p1.props.navigation.goBack()
					end
				end
			},
			anchorPoint = p2.anchorPoint,
			duration = p2.duration or 2,
			layoutOrder = p2.layoutOrder,
			position = p2.position,
			size = p2.size,
			show = p2.show
		}
	end
end

function toastScreen.render(p1)
	-- upvalues: roact (ref), toast (ref)
	assert(type(p1.props.navigation) ~= "nil", "ToastScreen should be wrapped with Roact Navigation")
	
	return roact.createElement(toast, p1.getToastProps(p1.props.navigation.getParam("toastProps", {})))
end

function toastScreen.didUpdate(p1, _, _)
	p1.hasToastChanged = true
end

return toastScreen