local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
local constantsModule = require(profilePlatform.Common.Constants)
local useProfileScrollContextModule = require(profilePlatform.Contexts.ProfileScrollContext.useProfileScrollContext)
local fFlagProfilePlatformNewProfileHeader = require(parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local divider = foundationModule.Divider
local close = images["icons/navigation/close"]
local var1 = constantsModule.USER_PROFILE_HEADER_HEIGHT + constantsModule.CTA_BUTTON_HEIGHT + constantsModule.PAGE_PADDING

return function(p1)
	-- upvalues: useLastInputMode (ref), useStyle (ref), useProfileScrollContextModule (ref), reactModule (ref), fFlagProfilePlatformNewProfileHeader (ref), var1 (ref), view (ref), imageSetLabel (ref), close (ref), divider (ref)
	local isFocus = useLastInputMode() == "Focus"
	local var2 = useStyle()
	local var3 = useProfileScrollContextModule()
	local var4 = if var3 then var3.scrollY else 0
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.navigateBack()
	end, { p1.navigateBack })
	local var6 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var1 (copy), var4 (ref)
		if p1.backgroundTransparency ~= nil then
			return p1.backgroundTransparency
		end
		local var7 = var1 - 50
		
		return if var4 < var7 then 1 elseif var1 <= var4 then 0 else 1 - (var4 - var7) / 50
	end, { p1.backgroundTransparency, var4 })
	
	return reactModule.createElement(view, {
		tag = "bg-surface-0 position-top-left size-full-full",
		ZIndex = 100,
		backgroundStyle = { Transparency = var6 }
	}, {
		LeftNavigationButton = if isFocus or p1.hideNavigationButton then nil else reactModule.createElement(view, {
			tag = "bg-over-media-0 radius-circle",
			AnchorPoint = if fFlagProfilePlatformNewProfileHeader then Vector2.new(0, 0.5) else nil,
			Position = if fFlagProfilePlatformNewProfileHeader then UDim2.new(0, 10, 0.5, 0) else UDim2.new(0, 10, 0, if fFlagProfilePlatformNewProfileHeader then nil else 10),
			Size = UDim2.new(0, 36, 0, 36),
			onActivated = var5,
			backgroundStyle = { Transparency = 1 - var6 }
		}, {
			InnerButton = reactModule.createElement("ImageButton", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				[reactModule.Event.Activated] = var5
			}, {
				CloseButtonImage = reactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = close,
					ImageColor3 = var2.Theme.IconEmphasis.Color,
					ImageTransparency = var2.Theme.IconEmphasis.Transparency
				})
			})
		}),
		BottomDivider = reactModule.createElement(divider, {
			Position = UDim2.new(0, 0, 1, -1),
			Size = UDim2.new(1, 0, 0, 1),
			Visible = var6 < 1
		})
	})
end