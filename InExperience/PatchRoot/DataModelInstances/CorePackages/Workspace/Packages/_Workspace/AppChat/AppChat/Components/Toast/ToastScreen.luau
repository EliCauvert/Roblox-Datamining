local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local IconSize = UIBloxModule.App.Constant.IconSize
local Toast = UIBloxModule.App.Dialog.Toast
local LoggerModule = require(script.Parent.Logger)
local ToastScreen = RoactModule.PureComponent:extend("ToastScreen")
ToastScreen.defaultProps = { navigation = nil }

function ToastScreen.init(p1)
	-- upvalues: Images (copy), IconSize (copy)
	p1.hasToastChanged = false
	
	function p1.getToastProps(ToastProps)
		-- upvalues: Images (upval), IconSize (upval), p1 (copy)
		local ToastContent = ToastProps.toastContent
		
		return {
			toastContent = {
				toastTitle = ToastContent.toastTitle,
				toastSubtitle = ToastContent.toastSubtitle,
				iconColorStyle = ToastContent.iconColorStyle,
				iconImage = if ToastProps.shouldHideIcon then nil else ToastContent.iconImage or Images["icons/status/alert"],
				iconSize = ToastContent.iconSize or Vector2.new(IconSize.Regular, IconSize.Regular),
				swipeUpDismiss = ToastContent.swipeUpDismiss,
				onAppeared = function()
					-- upvalues: ToastContent (copy), p1 (upval)
					if ToastContent.onAppeared then
						ToastContent.onAppeared()
					end
					p1.hasToastChanged = false
				end,
				onActivated = ToastContent.onActivated,
				onDismissed = function()
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

function ToastScreen.render(p1)
	-- upvalues: RoactModule (copy), Toast (copy)
	assert(type(p1.props.navigation) ~= "nil", "ToastScreen should be wrapped with Roact Navigation")
	
	return RoactModule.createElement(Toast, (p1.getToastProps(p1.props.navigation.getParam("toastProps", {}))))
end

function ToastScreen.didUpdate(p1, _, _)
	p1.hasToastChanged = true
end

function ToastScreen:didMount()
	-- upvalues: LoggerModule (copy)
	LoggerModule:info("{screen} mounted")
end

return ToastScreen