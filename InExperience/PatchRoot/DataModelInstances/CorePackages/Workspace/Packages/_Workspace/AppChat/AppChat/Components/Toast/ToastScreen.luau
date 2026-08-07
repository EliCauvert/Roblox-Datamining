local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local iconSize = UIBloxModule.App.Constant.IconSize
local toast = UIBloxModule.App.Dialog.Toast
local loggerModule = require(script.Parent.Logger)
local toastScreen = roactModule.PureComponent:extend("ToastScreen")
toastScreen.defaultProps = { navigation = nil }

function toastScreen.init(p0) --[[ line: 17 ]]
	-- upvalues: images (ref), iconSize (ref)
	p0.hasToastChanged = false
	
	function p0.getToastProps(p1) --[[ line: 20 ]]
		-- upvalues: images (copy), iconSize (copy), p0 (ref)
		local toastContent = p1.toastContent
		
		return {
			toastContent = {
				toastTitle = toastContent.toastTitle,
				toastSubtitle = toastContent.toastSubtitle,
				iconColorStyle = toastContent.iconColorStyle,
				iconImage = if p1.shouldHideIcon then nil else toastContent.iconImage or images["icons/status/alert"],
				iconSize = toastContent.iconSize or Vector2.new(iconSize.Regular, iconSize.Regular),
				swipeUpDismiss = toastContent.swipeUpDismiss,
				onAppeared = function() --[[ line: 33 ]]
					-- upvalues: toastContent (ref), p0 (copy)
					if toastContent.onAppeared then
						toastContent.onAppeared()
					end
					p0.hasToastChanged = false
				end,
				onActivated = toastContent.onActivated,
				onDismissed = function() --[[ line: 40 ]]
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

function toastScreen.render(p2) --[[ line: 61 ]]
	-- upvalues: roactModule (ref), toast (ref)
	assert(type(p2.props.navigation) ~= "nil", "ToastScreen should be wrapped with Roact Navigation")
	
	return roactModule.createElement(toast, p2.getToastProps(p2.props.navigation.getParam("toastProps", {})))
end

function toastScreen.didUpdate(p3, _, _) --[[ line: 69 ]]
	p3.hasToastChanged = true
end

function toastScreen.didMount(_) --[[ line: 73 ]]
	-- upvalues: loggerModule (ref)
	loggerModule:info("{screen} mounted")
end

return toastScreen