local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local iconSize = UIBloxModule.App.Constant.IconSize
local toast = UIBloxModule.App.Dialog.Toast
local loggerModule = require(script.Parent.Logger)
local toastScreen = roactModule.PureComponent:extend("ToastScreen")
toastScreen.defaultProps = { navigation = nil }

function toastScreen.init(p1)
	-- upvalues: images (ref), iconSize (ref)
	p1.hasToastChanged = false
	
	function p0.getToastProps(p2)
		-- upvalues: images (copy), iconSize (copy), p1 (ref)
		local toastContent = p2.toastContent
		
		return {
			toastContent = {
				toastTitle = toastContent.toastTitle,
				toastSubtitle = toastContent.toastSubtitle,
				iconColorStyle = toastContent.iconColorStyle,
				iconImage = if p2.shouldHideIcon then nil else toastContent.iconImage or images["icons/status/alert"],
				iconSize = toastContent.iconSize or Vector2.new(iconSize.Regular, iconSize.Regular),
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
	-- upvalues: roactModule (ref), toast (ref)
	assert(type(p1.props.navigation) ~= "nil", "ToastScreen should be wrapped with Roact Navigation")
	
	return roactModule.createElement(toast, p1.getToastProps(p1.props.navigation.getParam("toastProps", {})))
end

function toastScreen.didUpdate(p1, _, _)
	p1.hasToastChanged = true
end

function toastScreen.didMount(_)
	-- upvalues: loggerModule (ref)
	loggerModule:info("{screen} mounted")
end

return toastScreen