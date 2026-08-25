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
	local var2 = reactModule.useRef(false)
	local var3 = useNavigation()
	local var4 = useNavigationProps(function(_, p0)
		return {
			toastContent = p0.toastContent,
			anchorPoint = p0.anchorPoint,
			duration = p0.duration,
			layoutOrder = p0.layoutOrder,
			position = p0.position,
			size = p0.size,
			show = p0.show
		}
	end)
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), images (copy), iconSize (copy), var2 (ref), var3 (ref)
		return {
			toastTitle = var4.toastContent.toastTitle or "",
			toastSubtitle = var4.toastContent.toastSubtitle,
			iconColorStyle = var4.toastContent.iconColorStyle,
			iconImage = if not var4.toastContent.shouldHideIcon then var4.toastContent.iconImage or images["icons/status/alert"] else nil,
			iconSize = if not var4.toastContent.shouldHideIcon then var4.toastContent.iconSize or Vector2.new(iconSize.Regular, iconSize.Regular) else nil,
			swipeUpDismiss = var4.toastContent.swipeUpDismiss,
			onAppeared = function()
				-- upvalues: var4 (copy), var2 (copy)
				if var4.toastContent.onAppeared then
					var4.toastContent.onAppeared()
				end
				var2.current = false
			end,
			onActivated = var4.toastContent.onActivated,
			onDismissed = function()
				-- upvalues: var4 (copy), var2 (copy), var3 (copy)
				if var4.toastContent.onDismissed then
					var4.toastContent.onDismissed()
				end
				if not var2.current then
					var3.goBack()
				end
			end
		}
	end, { var4.toastContent })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		var2.current = true
	end)
	
	return reactModule.createElement(toast, {
		toastContent = var5,
		anchorPoint = var4.anchorPoint,
		duration = var4.duration or 2,
		layoutOrder = var4.layoutOrder,
		position = var4.position,
		size = var4.size,
		show = var4.show
	})
end