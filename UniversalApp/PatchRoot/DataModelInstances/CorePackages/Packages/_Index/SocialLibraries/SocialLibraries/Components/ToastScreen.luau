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
local var2 = t.strictInterface({
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
local var3 = t.strictInterface({
	toastContent = t.optional(t.table),
	anchorPoint = t.optional(t.Vector2),
	duration = t.optional(t.integer),
	layoutOrder = t.optional(t.integer),
	position = t.optional(t.UDim2),
	size = t.optional(t.UDim2),
	show = t.optional(t.boolean)
})

function toastScreen.init(p0)
	-- upvalues: var3 (ref), var2 (ref), images (ref), iconSize (ref)
	p0.hasToastChanged = false
	
	function p0.getToastProps(p1)
		-- upvalues: var3 (copy), var2 (copy), images (copy), iconSize (copy), p0 (ref)
		local toastContent = p1.toastContent or {}
		assert(var3(p1))
		assert(var2(toastContent))
		
		return {
			toastContent = {
				toastTitle = toastContent.toastTitle or "",
				toastSubtitle = toastContent.toastSubtitle,
				iconColorStyle = toastContent.iconColorStyle,
				iconImage = if not toastContent.hideIcon then toastContent.iconImage or images["icons/status/alert"] else nil,
				iconSize = if not toastContent.hideIcon then toastContent.iconSize or Vector2.new(iconSize.Regular, iconSize.Regular) else nil,
				swipeUpDismiss = toastContent.swipeUpDismiss,
				onAppeared = function()
					-- upvalues: toastContent (ref), p0 (copy)
					if toastContent.onAppeared then
						toastContent.onAppeared()
					end
					p0.hasToastChanged = false
				end,
				onActivated = toastContent.onActivated,
				onDismissed = function()
					-- upvalues: toastContent (ref), p0 (copy)
					if toastContent.onDismissed then
						toastContent.onDismissed()
					end
					if not p0.hasToastChanged then
						p0.props.navigation.goBack()
					end
				end
			},
			anchorPoint = p1.anchorPoint,
			duration = p1.duration or 2,
			layoutOrder = p1.layoutOrder,
			position = p1.position,
			size = p1.size,
			show = p1.show
		}
	end
end

function toastScreen.render(p2)
	-- upvalues: roact (ref), toast (ref)
	assert(type(p2.props.navigation) ~= "nil", "ToastScreen should be wrapped with Roact Navigation")
	
	return roact.createElement(toast, p2.getToastProps(p2.props.navigation.getParam("toastProps", {})))
end

function toastScreen.didUpdate(p3, _, _)
	p3.hasToastChanged = true
end

return toastScreen