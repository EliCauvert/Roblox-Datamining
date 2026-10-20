local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local UseProfileScrollContextModule = require(ProfilePlatform.Contexts.ProfileScrollContext.useProfileScrollContext)
local FFlagProfilePlatformNewProfileHeader = require(Parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Divider = FoundationModule.Divider
local IconsNavigationClose = UIBloxModule.App.ImageSet.Images["icons/navigation/close"]
local NewUSERPROFILEHEADERHEIGHT = ConstantsModule.USER_PROFILE_HEADER_HEIGHT + ConstantsModule.CTA_BUTTON_HEIGHT + ConstantsModule.PAGE_PADDING

return function(p1)
	-- upvalues: UseLastInputModeFunction (copy), UseStyleFunction (copy), UseProfileScrollContextModule (copy), ReactModule (copy), FFlagProfilePlatformNewProfileHeader (copy), NewUSERPROFILEHEADERHEIGHT (copy), View (copy), ImageSetLabel (copy), IconsNavigationClose (copy), Divider (copy)
	local IsFocus = UseLastInputModeFunction() == "Focus"
	local UseStyleResult = UseStyleFunction()
	local UseProfileScrollContextModuleResult = UseProfileScrollContextModule()
	local ScrollY = if UseProfileScrollContextModuleResult then UseProfileScrollContextModuleResult.scrollY else 0
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.navigateBack()
	end, { p1.navigateBack })
	local YOffset = if FFlagProfilePlatformNewProfileHeader then nil else 10
	local UseMemoResult: number = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), NewUSERPROFILEHEADERHEIGHT (upval), ScrollY (copy)
		if p1.backgroundTransparency == nil then
			local NewUSERPROFILEHEADERHEIGHTDelta = NewUSERPROFILEHEADERHEIGHT - 50
			
			return if ScrollY < NewUSERPROFILEHEADERHEIGHTDelta then 1 elseif NewUSERPROFILEHEADERHEIGHT <= ScrollY then 0 else 1 - (ScrollY - NewUSERPROFILEHEADERHEIGHTDelta) / 50
		else
			return p1.backgroundTransparency
		end
	end, { p1.backgroundTransparency, ScrollY })
	
	return (ReactModule.createElement(View, {
		tag = "bg-surface-0 position-top-left size-full-full",
		ZIndex = 100,
		backgroundStyle = { Transparency = UseMemoResult }
	}, {
		LeftNavigationButton = if IsFocus then nil else ReactModule.createElement(View, {
			tag = "bg-over-media-0 radius-circle",
			AnchorPoint = if FFlagProfilePlatformNewProfileHeader then Vector2.new(0, 0.5) else nil,
			Position = if FFlagProfilePlatformNewProfileHeader then UDim2.new(0, 10, 0.5, 0) else UDim2.new(0, 10, 0, YOffset),
			Size = UDim2.new(0, 36, 0, 36),
			onActivated = UseResult,
			backgroundStyle = { Transparency = 1 - UseMemoResult }
		}, {
			InnerButton = ReactModule.createElement("ImageButton", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				[ReactModule.Event.Activated] = UseResult
			}, {
				CloseButtonImage = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = IconsNavigationClose,
					ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
					ImageTransparency = UseStyleResult.Theme.IconEmphasis.Transparency
				})
			})
		}),
		BottomDivider = ReactModule.createElement(Divider, {
			Position = UDim2.new(0, 0, 1, -1),
			Size = UDim2.new(1, 0, 0, 1),
			Visible = UseMemoResult < 1
		})
	}))
end