local Parent = script:FindFirstAncestor("SocialToast").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local Images = UIBloxModule.App.ImageSet.Images
local IconSize = UIBloxModule.App.Constant.IconSize
local Toast = UIBloxModule.App.Dialog.Toast

return function()
	-- upvalues: ReactModule (copy), UseNavigationFunction (copy), UseNavigationPropsFunction (copy), Images (copy), IconSize (copy), Toast (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseNavigationResult = UseNavigationFunction()
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p1)
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
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseNavigationPropsResult (copy), Images (upval), IconSize (upval), UseRefResult (copy), UseNavigationResult (copy)
		return {
			toastTitle = UseNavigationPropsResult.toastContent.toastTitle or "",
			toastSubtitle = UseNavigationPropsResult.toastContent.toastSubtitle,
			iconColorStyle = UseNavigationPropsResult.toastContent.iconColorStyle,
			iconImage = if UseNavigationPropsResult.toastContent.shouldHideIcon then nil else UseNavigationPropsResult.toastContent.iconImage or Images["icons/status/alert"],
			iconSize = if UseNavigationPropsResult.toastContent.shouldHideIcon then nil else UseNavigationPropsResult.toastContent.iconSize or Vector2.new(IconSize.Regular, IconSize.Regular),
			swipeUpDismiss = UseNavigationPropsResult.toastContent.swipeUpDismiss,
			onAppeared = function()
				-- upvalues: UseNavigationPropsResult (upval), UseRefResult (upval)
				if UseNavigationPropsResult.toastContent.onAppeared then
					UseNavigationPropsResult.toastContent.onAppeared()
				end
				UseRefResult.current = false
			end,
			onActivated = UseNavigationPropsResult.toastContent.onActivated,
			onDismissed = function()
				-- upvalues: UseNavigationPropsResult (upval), UseRefResult (upval), UseNavigationResult (upval)
				if UseNavigationPropsResult.toastContent.onDismissed then
					UseNavigationPropsResult.toastContent.onDismissed()
				end
				if not UseRefResult.current then
					UseNavigationResult.goBack()
				end
			end
		}
	end, { UseNavigationPropsResult.toastContent })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = true
	end)
	
	return ReactModule.createElement(Toast, {
		toastContent = UseMemoResult,
		anchorPoint = UseNavigationPropsResult.anchorPoint,
		duration = UseNavigationPropsResult.duration or 2,
		layoutOrder = UseNavigationPropsResult.layoutOrder,
		position = UseNavigationPropsResult.position,
		size = UseNavigationPropsResult.size,
		show = UseNavigationPropsResult.show
	})
end