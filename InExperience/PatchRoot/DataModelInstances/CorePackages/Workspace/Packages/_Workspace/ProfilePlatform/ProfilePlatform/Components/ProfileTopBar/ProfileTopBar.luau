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
local var7 = constantsModule.USER_PROFILE_HEADER_HEIGHT + constantsModule.CTA_BUTTON_HEIGHT + constantsModule.PAGE_PADDING

return function(p0) --[[ line: 34 ]]
	-- upvalues: useLastInputMode (ref), useStyle (ref), useProfileScrollContextModule (ref), reactModule (ref), fFlagProfilePlatformNewProfileHeader (ref), var7 (ref), view (ref), imageSetLabel (ref), close (ref), divider (ref)
	local isFocus = useLastInputMode() == "Focus"
	local var9 = useStyle()
	local var10 = useProfileScrollContextModule()
	local var11 = if var10 then var10.scrollY else 0
	local var12 = reactModule.useCallback(function() --[[ line: 42 ]]
		-- upvalues: p0 (ref)
		p0.navigateBack()
	end, { p0.navigateBack })
	local var13 = reactModule.useMemo(function() --[[ line: 48 ]]
		-- upvalues: p0 (ref), var7 (copy), var11 (ref)
		if p0.backgroundTransparency ~= nil then
			return p0.backgroundTransparency
		end
		local var14 = var7 - 50
		
		return if var11 < var14 then 1 elseif var7 <= var11 then 0 else 1 - (var11 - var14) / 50
	end, { p0.backgroundTransparency, var11 })
	
	return reactModule.createElement(view, {
		tag = "bg-surface-0 position-top-left size-full-full",
		ZIndex = 100,
		backgroundStyle = { Transparency = var13 }
	}, {
		LeftNavigationButton = if not isFocus then reactModule.createElement(view, {
			tag = "bg-over-media-0 radius-circle",
			AnchorPoint = if fFlagProfilePlatformNewProfileHeader then Vector2.new(0, 0.5) else nil,
			Position = if fFlagProfilePlatformNewProfileHeader then UDim2.new(0, 10, 0.5, 0) else UDim2.new(0, 10, 0, if fFlagProfilePlatformNewProfileHeader then nil else 10),
			Size = UDim2.new(0, 36, 0, 36),
			onActivated = var12,
			backgroundStyle = { Transparency = 1 - var13 }
		}, {
			InnerButton = reactModule.createElement("ImageButton", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				[reactModule.Event.Activated] = var12
			}, {
				CloseButtonImage = reactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = close,
					ImageColor3 = var9.Theme.IconEmphasis.Color,
					ImageTransparency = var9.Theme.IconEmphasis.Transparency
				})
			})
		}) else nil,
		BottomDivider = reactModule.createElement(divider, {
			Position = UDim2.new(0, 0, 1, -1),
			Size = UDim2.new(1, 0, 0, 1),
			Visible = var13 < 1
		})
	})
end