local parent = script:FindFirstAncestor("SocialToast").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useNavigation = require(parent.Navigation).useNavigation
local useNavigationProps = require(parent.RobloxAppNavigation).useNavigationProps
local images = UIBloxModule.App.ImageSet.Images
local iconSize = UIBloxModule.App.Constant.IconSize
local toast = UIBloxModule.App.Dialog.Toast

return function()
	-- upvalues: reactModule (ref), useNavigation (ref), useNavigationProps (ref), images (ref), iconSize (ref), toast (ref)
	local var1 = reactModule.useRef(false)
	local var2 = useNavigation()
	local var3 = useNavigationProps(function(_, p1)
		return {
			toastContent = p1.toastContent,
			anchorPoint = p1.anchorPoint,
			duration = p1.duration,
			layoutOrder = p1.layoutOrder,
			position = p1.position,
			size = p1.size,
			show = p1.show
		}
	end)
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), images (copy), iconSize (copy), var1 (ref), var2 (ref)
		return {
			toastTitle = var3.toastContent.toastTitle or "",
			toastSubtitle = var3.toastContent.toastSubtitle,
			iconColorStyle = var3.toastContent.iconColorStyle,
			iconImage = if not var3.toastContent.shouldHideIcon then var3.toastContent.iconImage or images["icons/status/alert"] else nil,
			iconSize = if not var3.toastContent.shouldHideIcon then var3.toastContent.iconSize or Vector2.new(iconSize.Regular, iconSize.Regular) else nil,
			swipeUpDismiss = var3.toastContent.swipeUpDismiss,
			onAppeared = function()
				-- upvalues: var3 (copy), var1 (copy)
				if var3.toastContent.onAppeared then
					var3.toastContent.onAppeared()
				end
				var1.current = false
			end,
			onActivated = var3.toastContent.onActivated,
			onDismissed = function()
				-- upvalues: var3 (copy), var1 (copy), var2 (copy)
				if var3.toastContent.onDismissed then
					var3.toastContent.onDismissed()
				end
				if not var1.current then
					var2.goBack()
				end
			end
		}
	end, { var3.toastContent })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		var1.current = true
	end)
	
	return reactModule.createElement(toast, {
		toastContent = var4,
		anchorPoint = var3.anchorPoint,
		duration = var3.duration or 2,
		layoutOrder = var3.layoutOrder,
		position = var3.position,
		size = var3.size,
		show = var3.show
	})
end